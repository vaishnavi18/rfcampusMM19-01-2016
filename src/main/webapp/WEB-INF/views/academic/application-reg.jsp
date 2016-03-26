<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Registration | RF-Campus</title>

<jsp:include page="../authentication/script.jsp" />

<!-- tab code link start here -->
<link 
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>

<script>
$(document).ready(function() {
	

	/*  Date and time picker start here */
	$(function() {
		$(".datepicker").datepicker({
			showOn : "both",
			/* buttonImage : "image.jpg", */
			dateFormat : "dd/mm/yy",
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
		/* maxDate : +0 */
		// you do not want to show next day. 
		});

		/**
		 *  Commented by Rohit, can't understand the need of this ajax request in document.ready as degree list is 
		 *  populated in jsp (It was generating error)
		 *
		 *		
		 */
		
		
// 		$
// 				.ajax({
// 					async : false,
// 					url : "../academic/admission-notification/active-degrees",
// 					type : "POST",
// 					success : function(response) {
// 						//alert(JSON.stringify(response));
// 						var jsonOb = JSON.parse(JSON.stringify(response));
// 						var text = "<option selected=\"selected\" value=\"0\">Please Select Degree Type</option>";
// 						$.each(jsonOb, function(index, degree) {  
// 							alert()
// 							text += "<option value=\""+degree.id+"\">"
// 									+ degree.degreeName + "</option>";
// 						});
// 						$("#degreeId").empty().html(text);
// 						$("#degreeId").val(0).change();
// 						//	alert(text);
// 						//staticContents.statesLoaded = true;
// 						//staticContents.stateJson = jsonOb; 
// 					},
// 					error : function() {
// 					},
// 				});  

		$("form").submit(function() {
// 			$("#loading-image").show();
		});

		jQuery.validator.addMethod('selectcheck', function(value) {
			return (value != "0");
		}, "");
		jQuery.validator.addMethod("letterswithbasicpunc", function(value,
				element) {
			return this.optional(element) || /^[a-z\-.,()'"\s]+$/i.test(value);
		}, "Letters or punctuation only please");

		jQuery.validator.addMethod("lettersonly", function(value, element) {
			return this.optional(element) || /^[a-z," "]+$/i.test(value);
		}, "Numbers or Special Characters not Allowed");
		jQuery.validator
				.addMethod(
						"email",
						function(value, element, param) {
							return this.optional(element)
									|| /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i
											.test(value);
						}, jQuery.validator.messages.email);

		var validator = $("#application-form").validate({
			// Specify the validation rules
			rules : {
				studentName : {  
					required : true,
					lettersonly : true
				},
				fatherName : {
					required : true,
					lettersonly : true
				},
				lastName : {
					required : true,
					lettersonly : true
				},
				dob : {
					required : true,
					date : true
				},
				emailId : {
					required : true,
					email : true
				},
				mobileNumber : {
					required : true,
					number : true,
					minlength : 10,
					maxlength : 12
				},
				degreeId : {
					required : true,
					selectcheck: true
				},
				gender : {
					required : true,
				},
				categoryId : {
					required : true,
					selectcheck: true
				}

			},

			// Specify the validation error messages
			messages : {
				studentName : {
					required : "Please enter name",
					lettersonly : "Please enter valid name",
				},
				fatherName : {
					required : "Please enter fathers name",
					lettersonly : "Please enter valid name",
				},
				lastName : {
					required : "Please enter last name",
					lettersonly : "Please enter valid name"
				},
				dob : {
					required : "Please enter date of birth",
					date : "Please enter valid date"

				},
				emailId : {
					email : "Please enter valid email address"
				},
				mobileNumber : {
					required : "Please enter mobile number",
					number : "Please enter valid number",
					minlength : "Please enter valid number",
					maxlength : "Please enter valid number"
				},
				degreeId : {
					required : "",
				},
				gender : {
					required : "",
				},
				categoryId : {
					required : "",
				}
			},

			submitHandler : function(form) {
				form.submit();
			}
		});

	});
});
	/*  Date and time picker end here  */
</script>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/css/select2.js"></script>
<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<%-- <jsp:include page="header.jsp" /> --%>
	<div class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand" href="index.html"> <img
				src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png"
				alt="logo" />

			</a>
		</div>
	</div>
	<!-- /.header -->

	<div id="container" class="fixed-header">

		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<%-- <jsp:include page="page-header.jsp" /> --%>
				<!-- /Page Header -->
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">

								<div class="grid-header text">Registration for Application</div>


							</div>
							<!-- jaskirat code start here -->
							<form id="application-form" action="../academic/application-registration"
								method="post" class="form-horizontal"
								enctype="multipart/form-data">
								<div class="box-header" style="top: 5px;">
									<div class="box-name">
										<i class="fa fa-table"></i> <span>Basic Information</span>
									</div>


								</div>
								<div class="row my-bg-success">
									<!--left div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">
											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-sm-4">
														<span id="ContentPlaceHolder1_lblModule"
															class="control-label">First Name <span
															style="color: #FF0000; font-weight: bold">*</span>
														</span>
													</div>
													<div class="col-sm-7">
														<input name="studentName" required type="text"
															maxlength="40" id="studentName" tabindex="3"
															class="form-control" placeholder="First Name " />
													</div>
													<!-- <div class="col-sm-8">
													<input name="registrationNumber" required type="text"
														maxlength="40" id="registrationNumber" tabindex="3"
														class="form-control" placeholder="First Name " />
												</div> -->

												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Middle Name<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<input name="fatherName" required type="text"
															maxlength="40" id="fatherName" tabindex="3"
															class="form-control" placeholder="Middle Name " />
													</div>
													<!-- <div class="col-sm-8">
													<input name="registrationNumber" required type="text"
														maxlength="40" id="registrationNumber" tabindex="3"
														class="form-control" placeholder="Middle Name " />
												</div> -->
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">

														<span id="ContentPlaceHolder1_lblMenuName"
															class="control-label">Last Name<span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<input name="lastName" required type="text" value=""
															maxlength="40" id="lastName" tabindex="3"
															class="form-control" placeholder="Last Name"> <span
															id="ContentPlaceHolder1_rfvmenu" style=""></span>
													</div>
													<!-- <div class="col-sm-8">
													<input name="dateOfBirthString" required type="text"
														value="" maxlength="40" id="dateOfBirthString"
														tabindex="3" class="form-control" placeholder="Last Name">
													<span id="ContentPlaceHolder1_rfvmenu" style=""></span>
												</div> -->
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Date of Birth<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<input name="dob" type="text" maxlength="100" id="dob"
															tabindex="4" class="form-control datepicker"
															placeholder="Date of Birth">


													</div>
													<!-- <div class="col-sm-8">
													<input name="identityMark1" type="text" maxlength="100"
														id="identityMark1" tabindex="4"
														class="form-control datepicker"
														placeholder="Date of Birth">


												</div> -->
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">
														<span id="ContentPlaceHolder1_lblMenuToolTip"
															class="control-label">Email<span
															style="color: #FF0000; font-weight: bold">*</span></span>
													</div>
													<div class="col-sm-7">
														<input name="emailId" type="text" maxlength="40"
															id="emailId" tabindex="5" class="form-control"
															placeholder="Email">
													</div>
													<!-- <div class="col-sm-8">
													<input name="fatherName" type="text" maxlength="40"
														id="fatherName" tabindex="5" class="form-control"
														placeholder="Email">
												</div> -->
												</div>
											</div>

  
										</div>

									</div>


									<!--left div end here -->

									<!--right div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">


											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-sm-4">

														<span id="ContentPlaceHolder1_lblModule"
															class="control-label">Mobile <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<input name="mobileNumber" required type="text"
															maxlength="40" id="mobileNumber" tabindex="3"
															class="form-control" placeholder="Mobile" /> <span
															id="ContentPlaceHolder1_rfvmodule" style=""></span>
													</div>
													<!-- <div class="col-sm-8">
													<input name="enrollmentNumber" required type="text"
														maxlength="40" id="enrollmentNumber" tabindex="3"
														class="form-control" placeholder="Mobile" /> <span
														id="ContentPlaceHolder1_rfvmodule" style=""></span>
												</div> -->
												</div>
											</div>

											<div class="form-group">

												<div class="row">
													<div class="col-sm-4">

														<span id="ContentPlaceHolder1_lblModule"
															class="control-label">Degree <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<select name="degreeId" data-toggle="modal"
															data-original-title="Add to Project" id="degreeId"
															class="form-control">
															<option value="0">Please Select Degree</option>
															<c:forEach items="${DEGREE_LIST}" var="degree">
																<option value="${degree.degreeId}">${degree.degreeName}</option>
															</c:forEach>
														</select>
													</div>  
													<!-- <div class="col-sm-8">
													<input name="enrollmentNumber" required type="text"
														maxlength="40" id="enrollmentNumber" tabindex="3"
														class="form-control" placeholder="Degree" /> <span
														id="ContentPlaceHolder1_rfvmodule" style=""></span>
												</div> -->
												</div>
											</div>

											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Gender</span>

													</div>
													<div class="col-sm-7">
														<input type="radio" required name="gender" id="gender"
															value="1" /> <label>Male</label> <input type="radio"
															name="gender" id="gender" value="2" /> <label>Female</label>
														<input type="radio" name="gender" id="gender" value="3" />
														<label>Transgender</label>
													</div>
													<!-- <div class="col-sm-8">
													<input type="radio" required name="gender" id="gender-1"
														value="1" /> <label>Male</label> <input type="radio"
														name="gender" id="gender-2" value="2" /> <label>Female</label>
													<input type="radio" name="gender" id="gender-3" value="3" />
													<label>Transgender</label>
												</div> -->
												</div>
											</div>
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">

														<span id="ContentPlaceHolder1_lblMenuName"
															class="control-label">Category <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<select name="categoryId" data-toggle="modal"
															data-original-title="Add to Project" id="categoryId"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${CATEGORY_LIST}" var="category">
																<option value="${category.id}">${category.name}</option>
															</c:forEach>
														</select>

													</div>
													<!-- <div class="col-sm-8">
													<select name="title" data-toggle="modal"
														data-original-title="Add to Project" id="title"
														class="form-control">
														<option selected="selected" value="0">Please
															Select</option>

													</select>

												</div> -->
												</div>
											</div>





										</div>

										<!--right div end here -->


									</div>
									<div class="col-md-12">
										<div class="form-group action-btn-group">
											<div class="controls2">
												<span class="left-margin-remove"> <a href="#">
														<button type="submit" id="save-general-information-btn"
															name="submit_create_edit_team" title="Save"
															class="btn btn-xl btn-primary button-submit font13">
															<span><span class="" id="submit_button">Save
															</span></span>
														</button>
												</a>
												</span>
												<!-- <a href="#"> -->


												<button id="reset-general-information-btn" type="reset"
													title="Clear"
													class="btn btn-xl btn-default button-submit font13">
													<span><span class="">Clear</span></span>
												</button>
												<!-- </a>  -->
											</div>
										</div>
									</div>

								</div>
							</form>
							<!-- jaskirat code end here -->


						</div>

					</div>

				</div>

			</div>
			<img alt="" src='<c:url value="/resources/loading-gif.gif"/>'
				style="position: absolute; left: 687px; top: 226px; display: none;"
				id="loading-image">
			<!--=== Page Content ===-->
		</div>

	</div>


	<!-- /.container -->
	<!-- /.container -->
</body>

