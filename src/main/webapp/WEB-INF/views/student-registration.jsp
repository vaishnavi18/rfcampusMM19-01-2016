<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Registration | RFCampus</title>

<jsp:include page="../views/authentication/script.jsp" />
<script type="text/javascript">
	var staticContents = {
		"statesLoaded" : false,
		"districtsLoaded" : false,
		"citiesLoaded" : false,
		"stateJson" : {},
		"districtJson" : {},
		"cityJson" : {}
	};

	var branchOptions = '';
	var preferenceCount = 2;
	var numberOfBranches = 0;

	$(document)
			.ready(
					function() {

						//var branches = "${branchList}";
						//alert(branches);

						//alert('ready');
						$
								.ajax({
									async : false,
									url : "../resources/uploads/states.json",
									type : "GET",
									success : function(response) {
										//alert(JSON.stringify(response));
										var jsonOb = JSON.parse(JSON
												.stringify(response));
										var text = "<option selected=\"selected\" value=\"0\">Please Select State</option>";
										$
												.each(
														jsonOb,
														function(index, stateOb) {
															text += "<option value=\""+stateOb.id+"\">"
																	+ stateOb.state
																	+ "</option>";
														});
										$("#stateId").empty().html(text);
										//staticContents.statesLoaded = true;
										//staticContents.stateJson = jsonOb; 
									},
									error : function() {
										notifyerror('Error Occured');
									},
								});

						//entranceExamYear
						var d = new Date();
						var currentYear = d.getFullYear();
						var text = '';
						for (var i = currentYear; i >= currentYear - 10; i--) {
							text += '<option value="'+i+'">' + i + '</option>';
						}
						$("#entranceExamYear").append(text);

						$("#stateId").change(function() {
							var stateId = $(this).val();
							var stateName = $(this).attr("name");
							var districts;
							if (stateId != 0) {
								districts = loadDistricts(stateId);

								$("#districtId").empty().html(districts);
								$("#cityId").find("option:gt(0)").remove();
							} else {
								$("#districtId").find("option:gt(0)").remove();
								$("#cityId").find("option:gt(0)").remove();
							}
						});

						$("#districtId").change(function() {
							var districtId = $(this).val();
							var districtName = $(this).attr("name");
							var cities = '';
							if (districtId != 0) {
								cities = loadCities(districtId);

								$("#cityId").empty().html(cities);
							} else {
								$("#cityId").find("option:gt(0)").remove();
							}
						});

						$("#add-new-preference-btn")
								.click(
										function() {

											if (preferenceCount <= numberOfBranches) {

												$("#add-new-preference-div")
														.append(
																"<div class=\"form-group\">"
																		+ "<div class=\"col-sm-12\">"
																		+ "<div class=\"col-sm-5\">"
																		+ ""
																		+ "<span id=\"ContentPlaceHolder1_lblParent\""+
									"	class=\"control-label\">Student Preference "
																		+ preferenceCount
																		+ "</span>"
																		+ "</div>"
																		+ "<div class=\"col-sm-7\">"
																		+ "<select name=\"preferences\" data-toggle=\"modal\""+
									"	data-original-title=\"Add to Project\" id=\"parentMenu\""+
									"	class=\"form-control branch-preference\">"
																		+ branchOptions
																		+ "</select>"
																		+ "</div>"
																		+ "</div>"
																		+ "</div>");
												preferenceCount++;
											} else {
												notifyupdate('You Already Added Maximum Preferences');
											}

										});

						/* $("select[name=^'pref']").change(function(){
							var selectedBranch = $(this).val();
							alert(selectedBranch );
						}); */

						$('body')
								.on(
										'change',
										'.branch-preference',
										function() {
											var selectedBranch = $(this).val();
											var count = 0;
											//alert('selectedBranch : '+selectedBranch);
											if (selectedBranch != 0) {
												$
														.each(
																$(".branch-preference"),
																function() {
																	if ($(this)
																			.val() == selectedBranch) {
																		count++;
																	}
																});

												if (count > 1) {
													notifyupdate('You have already selected this branch');
													$(this).val('0').change();
												}

											}
										});

					});

	function loadDistricts(stateId) {
		var text = '';

		if (staticContents.districtsLoaded == true) {
			text = "<option selected=\"selected\" value=\"0\">Please Select District</option>";
			$.each(staticContents.districtJson, function(index, districtOb) {
				if (districtOb.stateId == stateId)
					text += "<option value=\""+districtOb.id+"\">"
							+ districtOb.districtName + "</option>";
			});
		} else {
			$
					.ajax({
						async : false,
						url : "../resources/uploads/districts.json",
						type : "GET",
						success : function(response) {
							//alert(JSON.stringify(response));
							var jsonOb = JSON.parse(JSON.stringify(response));
							text = "<option selected=\"selected\" value=\"0\">Please Select District</option>";
							$
									.each(
											jsonOb,
											function(index, districtOb) {
												if (districtOb.stateId == stateId)
													text += "<option value=\""+districtOb.id+"\">"
															+ districtOb.districtName
															+ "</option>";
											});
							staticContents.districtsLoaded = true;
							staticContents.districtJson = jsonOb;
						},
						error : function() {
							notifyerror('Error Occured');
						},
					});

		}

		return text;
	}

	function loadCities(districtId) {
		var text = '';

		if (staticContents.citiesLoaded == true) {
			text = "<option selected=\"selected\" value=\"0\">Please Select City</option>";
			$.each(staticContents.cityJson, function(index, cityOb) {
				if (cityOb.districtId == districtId)
					text += "<option value=\""+cityOb.id+"\">"
							+ cityOb.cityName + "</option>";
			});
		} else {
			$
					.ajax({
						async : false,
						url : "../resources/uploads/cities.json",
						type : "GET",
						success : function(response) {
							//alert(JSON.stringify(response));
							var jsonOb = JSON.parse(JSON.stringify(response));
							text = "<option selected=\"selected\" value=\"0\">Please Select City</option>";
							$.each(jsonOb, function(index, cityOb) {
								if (cityOb.districtId == districtId)
									text += "<option value=\""+cityOb.id+"\">"
											+ cityOb.cityName + "</option>";
							});

							staticContents.citiesLoaded = true;
							staticContents.cityJson = jsonOb;
						},
						error : function() {
							notifyerror('Error Occured');
						},
					});

		}

		return text;
	}
</script>

<!-- tab code link start here -->
<style type="text/css">
.easyWizardSteps {
	list-style: none;
	width: 100%;
	overflow: hidden;
	margin: 0;
	padding: 0;
	border-bottom: 1px solid #ccc;
	margin-bottom: 20px
}

.easyWizardSteps li {
	font-size: 18px;
	display: inline-block;
	padding: 10px;
	color: #B0B1B3;
	margin-right: 20px;
}

.easyWizardSteps li span {
	font-size: 24px
}

.easyWizardSteps li.current {
	color: #000
}

.easyWizardButtons {
	overflow: hidden;
	padding: 10px;
}

.easyWizardButtons button, .easyWizardButtons .submit {
	cursor: pointer;
	padding: 4px 14px
}

.easyWizardButtons .prev {
	float: left
}

.easyWizardButtons .next, .easyWizardButtons .submit {
	float: right;
	padding: 4px 14px
}
</style>
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">



<script
	src="${pageContext.request.contextPath}/resources/plugins/easy-wizard/jquery.easyWizard.js"></script>
<script>
	function pcm_total() {
		var ophysics = parseFloat($('#ophysics').val())
		if (isNaN(ophysics)) {
			ophysics = 0;
		}

		var ochemistry = parseFloat($('#ochemistry').val())
		if (isNaN(ochemistry)) {
			ochemistry = 0;
		}

		var omaths = parseFloat($('#omaths').val())
		if (isNaN(omaths)) {
			omaths = 0;
		}

		var pcm_total = omaths + ochemistry + ophysics;
		$("#my_pcm_total").text(pcm_total);

	}

	function pcm_ttotal() {
		var tphysics = parseFloat($('#tphysics').val())
		if (isNaN(tphysics)) {
			tphysics = 0;
		}

		var tchemistry = parseFloat($('#tchemistry').val())
		if (isNaN(tchemistry)) {
			tchemistry = 0;
		}

		var tmaths = parseFloat($('#tmaths').val())
		if (isNaN(tmaths)) {
			tmaths = 0;
		}

		var pcm_ttotal = tmaths + tchemistry + tphysics;

		$("#my_pcm_ttotal").text(pcm_ttotal);

	}

	$(function() {
		$('#myWizard2').easyWizard({
			buttonsClass : 'btn',
			submitButtonClass : 'btn btn-success',

		});
	});

	$(function() {
		$(".datepicker").datepicker({
			showOn : "both",
			/* buttonImage : "image.jpg", */
			dateFormat : "dd-mm-yy",
			buttonText : "<i  class='icon-calendar my_cal'></i>",
			/* changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			yearRange: 'c-20:c+30',
			maxDate: '@maxDate',
			minDate: '@minDate', */
			buttonImageOnly : false,
			constrainInput : true,
			/*   minDate:+0, //you do not want to show previous date.*/
			maxDate : +0
		// you do not want to show next day. 
		});

	});
</script>
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../views/authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">

		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<jsp:include page="../views/authentication/page-header.jsp" />
				<!-- /Page Header -->
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="grid box-filters">
							<div class="table-header">
								<div class="row my-bg-success">
									<div class="create_project_tbl">
										<div class="grid-header text">STUDENT REGISTRATION</div>
									</div>

									<form id="myWizard2" action="./student-registration/add"
										method="post" class="form-horizontal"
										enctype="multipart/form-data">
										<input type="hidden" name="sessionId" value="2015">
										<section class="step" data-step-title="Personal Details">
											<!--left row 1 1 start here -->
											<!-- General header tab start here -->
											<div class="box-header" style="top: 5px;">
												<div class="box-name">
													<i class="fa fa-table"></i> <span>Personal
														Information</span>
												</div>
											</div>
											<!-- General header tab end here -->

											<!--left div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<!-- <div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Identification Number <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-6">
															<input name="menuName" type="text" maxlength="40"
																id="menu_name" tabindex="3" class="form-control"
																readonly="readonly"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Identification Number" />
																<input type="hidden" name="sessionId" value="2015">
														</div>
														<div class="col-sm-1">
															<label style="top: 7px"
																class="glyphicon glyphicon-search" title="search"></label>
														</div>
													</div>
												</div> -->
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">
																<br>
																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Student First Name<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<br>
															<div class="col-sm-7">
																<input title="Email is required !" name="studentName"
																	type="text" maxlength="40" id="menu_name" tabindex="3"
																	class="form-control"
																	onkeypress="return CheckAlphaNumeric(event,this)"
																	placeholder="Student First Name"> <span
																	id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>
																<br>
															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Student Middle Name<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-7">
																<input name="fatherName" type="text" maxlength="40"
																	id="menu_name" tabindex="3" class="form-control"
																	onkeypress="return CheckAlphaNumeric(event,this)"
																	placeholder="Student Middle Name"> <span
																	id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>

															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Student Last Name<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-7">
																<input name="lastName" type="text" maxlength="40"
																	id="menu_name" tabindex="3" class="form-control"
																	onkeypress="return CheckAlphaNumeric(event,this)"
																	placeholder="Student Last Name"> <span
																	id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>

															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblMenuName"
																	class="control-label">Father Name <span
																	style="color: #FF0000; font-weight: bold">*</span></span>


															</div>
															<div class="col-sm-7">
																<input name="fatherName" type="text" maxlength="40"
																	id="menu_name" tabindex="3" class="form-control"
																	onkeypress="return CheckAlphaNumeric(event,this)"
																	placeholder="Father Name"> <span
																	id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Mother Name <span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>

															<div class="col-sm-7">
																<input name="motherName" type="text" maxlength="100"
																	id="menu_link" tabindex="4" class="form-control"
																	onkeypress="return CheckAlphaNumeric(event,this)"
																	placeholder="Mother Name ">


															</div>
														</div>
													</div>

													<!-- photo code state here -->
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Photo</span>
															</div>
															<div class="col-sm-7">
																<input type="file" name="studentPhoto" id="studentPhoto"
																	title="Please Select Photo">
																<!-- onchange="showImage()"> -->

															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-5"></div>
														<div class="col-sm-7">

															<img id="studentImage" style="border: 1px solid #A9E6F9"
																src="./resources/No_image_available.svg"
																style="height: 75px; width: 75px;">
														</div>
													</div>
													<!-- photo end state here -->

												</div>

											</div>


											<!--left div end here -->

											<!--right div start here -->

											<div class="col-md-6">

												<div class="form-horizontal">
													<div class="form-group">
														<br>
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblModule"
																	class="control-label">Mother Tongue <span
																	style="color: #FF0000; font-weight: bold">*</span></span>


															</div>
															<div class="col-sm-7">
																<select name="motherTongueId" data-toggle="modal"
																	data-original-title="Add to Project" id="parentMenu"
																	tabindex="7" class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${motherTongueList}"
																		var="motherTongue">
																		<option value="${motherTongue.id}">${motherTongue.mothertongue}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Date of Birth</span>

															</div>
															<div class="col-sm-7">
																<input name="dob" type="text" maxlength="40" id=""
																	tabindex="7" class="form-control datepicker"
																	onkeypress="return CheckAlphaNumeric(event,this)"
																	placeholder="Date of Birth" />

															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">
																<br>
																<span id="ContentPlaceHolder1_lblMenuName" tabindex="8"
																	class="control-label">Gender <span
																	style="color: #FF0000; font-weight: bold">*</span></span>


															</div>
															<div class="col-sm-7">
																<input type="radio" name="gender" id="gender-1"
																	value="1" /> <label>Male</label> <input type="radio"
																	name="gender" id="gender-2" value="2" /> <label>Female</label>
																<input type="radio" name="gender" id="gender-3"
																	value="3" /> <label>Transgender</label>
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-12">
															<div tabindex="9" class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Cast <span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>

															<div class="col-sm-7">
																<select name="casteId" data-toggle="modal"
																	data-original-title="Add to Project" id="parentMenu"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${castList}" var="cast">
																		<option value="${cast.admCasteId}">${cast.caste}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Category <span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>

															<div class="col-sm-7">
																<select name="categoryId" data-toggle="modal"
																	data-original-title="Add to Project" id="parentMenu"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${categoryList}" var="category">
																		<option value="${category.id}">${category.category}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Nationality <span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>

															<div class="col-sm-7">
																<select name="nationalityId" data-toggle="modal"
																	data-original-title="Add to Project" id="parentMenu"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${nationalityList}" var="nationality">
																		<option value="${nationality.id}">${nationality.nationality}</option>
																	</c:forEach>

																</select>

															</div>
														</div>
													</div>

													<!-- photo code state here -->
													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Signature</span>
															</div>
															<div class="col-sm-7">
																<input type="file" name="signaturePhoto"
																	id="signaturePhoto" title="Please Select Signature">
																<!-- onchange="showImage()"> -->

															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-5"></div>
														<div class="col-sm-7">

															<img id="signatureImage"
																style="border: 1px solid #A9E6F9"
																src="./resources/No_image_available.svg"
																style="height: 75px; width: 75px;">


														</div>
													</div>
													<!-- photo end state here -->


												</div>

											</div>

											<!--right div end here -->
										</section>
									</form>
								</div>

								<section class="step" data-step-title="Contact/Address Details">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->


									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Contact Details</span>
										</div>

									</div>
									<!-- General header tab end here -->
									<div class="row my-bg-success" style="">
										<!--left div start here -->

										<div class="col-md-6">

											<div class="form-horizontal">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Permanent Mobile Number <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<input name="mobileNumber" type="text" maxlength="40"
																id="menu_name" tabindex="3" class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Permanent Mobile Number" />
														</div>

													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">Permanent Landline Number</span>

														</div>
														<div class="col-sm-2">
															<input name="permanentTelephoneStd" type="text"
																maxlength="5" id="permanentTelephoneStd" tabindex="3"
																class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Code">

														</div>
														<div class="col-sm-5">
															<input name="permanentTelephone" type="text"
																maxlength="10" id="permanentTelephone" tabindex="3"
																class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Number">

														</div>
													</div>
												</div>

											</div>

										</div>


										<!--left div end here -->

										<!--right div start here -->

										<div class="col-md-6">

											<div class="form-horizontal" style="top: 5px">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Email <span
																style="color: #FF0000; font-weight: bold">*</span></span>


														</div>
														<div class="col-sm-7">
															<input name="emailId" type="text" maxlength="150"
																id="menu_name" tabindex="3" class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Email ">
														</div>
													</div>
												</div>


											</div>

										</div>

										<!--right div end here -->
									</div>



									<!--left row 1 1 start here -->
									<!-- General header tab start here -->


									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Address Details</span>
										</div>


									</div>


									<!-- General header tab end here -->


									<div class="row my-bg-success" style="">
										<!--left div start here -->

										<div class="col-md-6">

											<div class="form-horizontal">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label"> Country <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<select name="countryId" data-toggle="modal"
																data-original-title="Add to Project" id="countryId"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${countryList}" var="country">
																	<option value="${country.id}">${country.country}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">State<span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<select name="stateId" data-toggle="modal"
																data-original-title="Add to Project" id="stateId"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>

															</select>
														</div>

													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">District</span>
														</div>
														<div class="col-sm-7">
															<select name="districtId" data-toggle="modal"
																data-original-title="Add to Project" id="districtId"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>

															</select>
														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">City</span>
														</div>
														<div class="col-sm-7">
															<select name="cityId" data-toggle="modal"
																data-original-title="Add to Project" id="cityId"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>

															</select>
														</div>
													</div>
												</div>

											</div>
											<!-- country -->


										</div>
										<!--left div end here -->

										<!--right div start here -->
										<div class="col-md-6">

											<div class="form-horizontal" style="top: 5px">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Pincode <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<input name="pincode" type="text" maxlength="10" value=""
																id="menu_name" tabindex="3" class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Pincode ">
														</div>
													</div>
												</div>
											</div>
											<div class="form-horizontal" style="top: 5px">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Address <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<div class="input-group">
																<textarea class="form-control custom-control" cols="40"
																	rows="5" style="resize: none">
																			</textarea>
															</div>
														</div>
													</div>
												</div>
											</div>

										</div>
										<!--right div end here -->
									</div>
								</section>
								<section class="step"
									data-step-title="Education/Documents Details">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->
									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Education/Documents
												Details</span>
										</div>
									</div>
									<!-- General header tab end here -->
									<div class="row my-bg-success">
										<!--left div start here -->

										<!-- TABLE CODE START HERE -->
										<div class="col-md-12">
											<div class=""
												style="height: auto; position: relative; overflow: auto; margin-top: 10px">
												<table id="menu_table"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th>Education</th>
															<th>year</th>
															<th>Subject</th>
															<th>Marks</th>
															<th>Out of</th>
														</tr>
													</thead>
													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<tr class="odd">
															<td>10th</td>
															<td><input name="sscPassingYear" type="text"
																maxlength="10" id="menu_name" tabindex="3"
																class="form-control" placeholder="year of passing "></td>
															<td>Over all</td>
															<td><input name="sscTotal" type="number" value="0"
																maxlength="5" id="menu_name" tabindex="3"
																class="form-control" placeholder="Total Marks"></td>
															<td><input name="sscOutof" type="number" value="0"
																maxlength="5" id="menu_name" tabindex="3"
																class="form-control" placeholder="Out of"></td>
														</tr>
														<tr class="odd">
															<td></td>
															<td></td>
															<td>Maths</td>
															<td><input name="sscMaths" type="number" value="0"
																maxlength="5" id="menu_name" tabindex="3"
																class="form-control" placeholder="Total Marks"></td>
															<td><input name="sscMathsMaximum" type="number"
																value="0" maxlength="5" id="menu_name" tabindex="3"
																class="form-control" placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td>12th</td>
															<td><input name="hscPassingYear" type="text"
																maxlength="5" id="menu_name" tabindex="3"
																class="form-control" placeholder="Year of Passing "></td>
															<td>Total Marks</td>
															<td><input name="hscTotal" type="number" value="0"
																maxlength="5" tabindex="3" class="form-control"
																placeholder="Total Marks"></td>
															<td><input name="hscOutOf" type="number" value="0"
																maxlength="5" tabindex="3" class="form-control"
																placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td></td>
															<td></td>
															<td>Physics</td>
															<td><input name="hscPhysics" type="number" value="0"
																maxlength="5" id="ophysics" tabindex="3"
																class="form-control" onkeyup="pcm_total()"
																onclick="pcm_total()" placeholder="Total Marks"></td>
															<td><input name="hscPhysicsMax" type="number"
																value="0" maxlength="5" id="tphysics" tabindex="3"
																class="form-control" onkeyup="pcm_ttotal()"
																onclick=" pcm_ttotal()" placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td></td>
															<td></td>
															<td>Chemistry</td>
															<td><input name="hscChemestry" type="number"
																value="0" maxlength="5" id="ochemistry" tabindex="3"
																class="form-control" onkeyup=" pcm_total()"
																onclick="pcm_total()" placeholder="Total Marks"></td>
															<td><input name="hscChemestryMax" type="number"
																value="0" maxlength="5" id="tchemistry" tabindex="3"
																class="form-control" onkeyup=" pcm_ttotal()"
																onclick=" pcm_ttotal()" placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td></td>
															<td></td>
															<td>Maths</td>
															<td><input name="hscMaths" type="number" value="0"
																maxlength="5" id=omaths tabindex="3"
																class="form-control" onkeyup=" pcm_total()"
																onclick="pcm_total()" placeholder="Total Marks"></td>
															<td><input name="hscMathsMax" type="number"
																value="0" maxlength="5" id="tmaths" tabindex="3"
																class="form-control" onkeyup=" pcm_ttotal()"
																onclick=" pcm_ttotal()" placeholder="Out of"></td>

														</tr>

														<tr class="even">
															<td></td>
															<td></td>
															<td>PCM Total</td>
															<td style="text-align: left" id="my_pcm_total"></td>
															<td style="text-align: left" id="my_pcm_ttotal"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- table div -->

											<div class=""
												style="height: auto; position: relative; overflow: auto; margin-top: 10px">

												<table id="menu_table"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th>Exam</th>
															<th>Roll Number</th>
															<th>year</th>
															<th>Score</th>
															<th>All India Rank</th>
														</tr>
													</thead>

													<tbody role="alert" aria-live="polite" aria-relevant="all">

														<tr class="odd">
														<tr class="even">
															<td><select name="entranceExamId"
																data-toggle="modal" data-original-title="Add to Project"
																id="entranceExamId" class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${qualifyingExamList}" var="entrance">
																		<c:if test="${entrance.examType == 'e'}">
																			<option value="${entrance.id}">${entrance.qualifyingExam}</option>
																		</c:if>
																	</c:forEach>
															</select></td>
															<td><input name="entranceExamRollNumber" value="0"
																type="text" maxlength="10" id="entranceExamRollNumber"
																tabindex="3" class="form-control"
																placeholder="Roll Number "></td>

															<td><select name="entranceExamYear"
																data-toggle="modal" data-original-title="Add to Project"
																id="entranceExamYear" class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>

															</select></td>
															<td><input name="entranceExamScore" type="text"
																value="0" maxlength="10" id="entranceExamScore"
																tabindex="3" class="form-control" placeholder="Out of"></td>
															<td><input name="entranceExamRank" type="text"
																value="0" maxlength="10" id="entranceExamRank"
																tabindex="3" class="form-control"
																placeholder="All India Rank "></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>

									</div>

									<!--left div end here -->

									<!--right div start here -->

									<div class="col-md-12">

										<div class="form-horizontal">
											<div class="form-group">
												<br>
											</div>

										</div>

										<!--right div end here -->
									</div>
								</section>
								<section class="step" data-step-title="Branch Preference ">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->
									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Branch Preference</span>
										</div>
									</div>
									<!-- General header tab end here -->
									<div class="row my-bg-success">
										<!--left div start here -->

										<!-- TABLE CODE START HERE -->
										<div class="col-md-6" style="" id="add-new-preference-div">
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<br> <span id="ContentPlaceHolder1_lblParent"
															class="control-label"><input type="button"
															value="Add New Preference" id="add-new-preference-btn"></span>
													</div>

												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Student Preference 1</span>
													</div>
													<div class="col-sm-7">

														<c:set var="branchOptions"
															value="<option selected='selected' value='0'>Please Select Branch</option>" />
														<c:set var="count" value="0" />
														<select name="preferences" data-toggle="modal"
															data-original-title="Add to Project" id="parentMenu"
															class="form-control branch-preference">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${branchList}" var="branch">
																<option value="${branch.id}">${branch.branchShortName}</option>
																<c:set var="branchOptions"
																	value="${branchOptions} <option value='${branch.id}'>${branch.branchShortName}</option>" />
																<c:set var="count" value="${count + 1}" />
															</c:forEach>
														</select>

														<script type="text/javascript">
															branchOptions = "${branchOptions}";
															numberOfBranches = "${count}";
														</script>
													</div>
												</div>
											</div>

										</div>
									</div>

								</section>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!--=== Page Content ===-->
	</div>
	<!-- /.container -->
	<!-- /.container -->
</body>

