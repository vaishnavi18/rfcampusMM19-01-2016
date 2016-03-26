<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Admission | RFCampus</title>

<jsp:include page="../authentication/script.jsp" />

<script> 
$(document).ready(function(){
    $("#merit").click(function(){
        $("#appId").slideDown("slow");
    });
    $("#excel").click(function(){  
        $("#appId").slideDown("slow");
    });
    $("#direct").click(function(){
        $("#appId").slideUp("slow");
    });
});
</script>

<script type="text/javascript">
var staticContents = {
		"statesLoaded" : false,
		"districtsLoaded" : false,
		"citiesLoaded" : false,
		"stateJson" : {},
		"districtJson" : {},
		"cityJson" : {}
	};
var formData;

$(document).ready(function(){
	$("#applicationIdBtn")
	.click(function(event) {
//if (event.keyCode == 13) {
	var applicationId = $("#applicationId")
	.val();
	//alert(applicationId );
	$
	.ajax({
		async : false,
		url : "../academic/student-registration/information",
		type : "POST",
		data : {
			"applicationId" : ""
					+ applicationId
		},
		success : function(
				response) {
			//alert(response );
			console
					.log(JSON
							.stringify(response));
			var jsonOb = JSON
					.parse(JSON
							.stringify(response))
			if (response != "")
				setStudentData(JSON
						.stringify(response));
			else
				alert('Invalid Application Id');
		},
		error : function() {
			alert('eror...');
		},
	});
	//}
});
	
	
	$("#admission-short-form")
	.on(
			'submit',
			function(e) {
				//alert('submit');
				e.preventDefault();
			
				var valid = $("#admission-short-form").valid();
				
			if(valid == true){
				var gender;
				var admissionType;
				
				$.each($("[name=admission-type]"), function(){
					if ($(this).is(":checked")) {
						admissionType = $(this).val();
					}
					});
				
				$.each($("[name=gender]"), function(){
					if ($(this).is(":checked")) {
						gender = $(this).val();
					}
					});
				
				var registrationNumber = $("#applicationId").val();
				var studentFirstName = $("#studentName").val();
				var studentMiddleName = $("#fatherName").val();
				var studentLastName = $("#lastName").val();
				var fatherName = $("#fatherName").val();
				var motherName = $("#motherName").val();
				//var gender = $("[name=gender] :checked").val();
				var categoryId = $("#categoryId").val();
				var casteId = $("#casteId").val();
				var nationalityId = $("#nationalityId").val();
				var email = $("#emailId").val();
				var studentMobileNumber = $("#mobileNumber").val();
				
				var admissionBatch = $("#admissionBatch").val();
				var degreeId = $("#degreeId").val();
				var branchId = $("#branchId").val();
				var semesterId = $("#semesterId").val();
				var admissionCategoryNumber = $("#admissionCategoryNumber").val();
				var paymentTypeId = $("#paymentTypeId").val();
				
				var stateId = $("#stateId").val();
				var districtId = $("#districtId").val();
				var cityId = $("#cityId").val();
				var pincode = $("#pincode").val();
				var address = $("#address").val();
				var photoLink = $("#photoLink").val();
				var signatureLink = $("#signatureLink").val();
				var studentAdmissionParameters = {
						"registrationNumber" : registrationNumber,
						"studentFirstName" : studentFirstName,
						"studentMiddleName" : studentMiddleName,
						"studentLastName" : studentLastName,
						"fatherName" : fatherName,
						"motherName" : motherName,
						"gender" : gender,
						"categoryId" : categoryId,
						"casteId" : casteId,
						"nationalityId" : nationalityId,
						"email" : email,
						"studentMobileNumber" : studentMobileNumber,
						"admissionBatch" : admissionBatch,
						"degreeId" : degreeId,
						"branchNumber" : branchId,
						"semesterId" : semesterId,
						"admissionCategoryNumber" : admissionCategoryNumber,
						"paymentType" : paymentTypeId,
						"studentPhoto" : photoLink,
						"studentSignature" : signatureLink
						
					};
				
				var studentAddressParameters = {
						"registrationNumber" : registrationNumber,

						"localCity" : cityId,
						"localDistrictId" : districtId,
						"localPINCode" : pincode,
						"localStateId" : stateId,
						"localAddress": address
					};
				
				formData = new FormData();
				
				formData.append("studentAdmissionParameters",  JSON
						.stringify(studentAdmissionParameters));
				formData.append("studentAddressParameters",  JSON
						.stringify(studentAddressParameters));
				formData.append("admission-type", admissionType);
				//alert(JSON.stringify(studentAdmissionParameters));
				$
				.ajax({
					async : false,
					url : "../academic/admission",
					type : "POST",
					data : formData,
					processData: false,
			        contentType: false,
					success : function(
							response) {
						//alert(response);
						if(response != 0){
							window.location="../academic/admission-successful";
						}
					},
					error : function() {
						alert('error...');
					},
				});
			}	
				
			});
	
	jQuery.validator.addMethod('selectcheck', function(
			value) {
		return (value != '0');
	}, "");
	jQuery.validator.addMethod("letterswithbasicpunc", function(value, element) {
		return this.optional(element) || /^[a-z\-.,()'"\s]+$/i.test(value);
	}, "Letters or punctuation only please");
	
	jQuery.validator.addMethod("lettersonly", function(value, element) {
		 return this.optional(element) || /^[a-z," "]+$/i.test(value);
	}, "Numbers or Special Characters not Allowed");
	
	jQuery.validator.addMethod("email", function(value, element, param) {
		return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(value);
	}, jQuery.validator.messages.email);
	
	$("#admission-short-form")
	.validate(
			{

				rules : {
					studentName : {
						required : true,
						lettersonly : true,
					},
					fatherName : {
						required : true,
						lettersonly : true,
					//,
					},
					lastName : {
						required : true,
						lettersonly : true,
					//,
					},
					studentMiddleName : {
						required : true,
						lettersonly : true,
					//,
					},
					motherName : {
						required : true,
						lettersonly : true,
					//,
					},
					categoryId : {
						required : true,
						selectcheck : true
					},
					casteId : {
						required : true,
						selectcheck : true
					},
					nationalityId : {
						required : true,
						selectcheck : true
					},
					admissionBatch : {
						required : true,
						selectcheck : true
					},
					degreeId : {
						required : true,
						selectcheck : true
					},
					branchId : {
						required : true,
						selectcheck : true
					},
					semesterId : {
						required : true,
						selectcheck : true
					},
					feetype : {
						required : true,
						selectcheck : true
					},
					admissionCategoryNumber : {
						selectcheck : true
					},
					mobileNumber : {
						required : true,
						number : true,
						minlength : 10,
						maxlength : 12
					//,
					},
					email : {
						required : true
					//,
					},
					countryId : {
						required : true,
						selectcheck : true
					},
					paymentTypeId : {
						required : true,
						selectcheck : true
					},
					stateId : {
						required : true,
						selectcheck : true
					},
					districtId : {
						selectcheck : true
					},
					cityId : {
						selectcheck : true
					},
					pincode : {
						required : true,
						minlength : 6,
						maxlength : 6
					
					//,
					},
					address : {
						required : true,
					//,
					}
				},

				messages : {

					studentName : {
						required : ""
					},
					fatherName : {
						required : ""
					//,
					},
					lastName : {
						required : ""
					//,
					},
					studentMiddleName : {
						required : ""
					//,
					},
					motherName : {
						required : ""
					//,
					},
					categoryId : {
						required : "",
						selectcheck : ""
					},
					casteId : {
						required : "",
						selectcheck : ""
					},
					nationalityId : {
						required : "",
						selectcheck : ""
					},
					admissionBatch : {
						required : "",
						selectcheck : ""
					},
					degreeId : {
						required : "",
						selectcheck : ""
					},
					paymentTypeId : {
						required : ""
					//,
					},
					branchId : {
						required : "",
						selectcheck : ""
					},
					semesterId : {
						required : "",
						selectcheck : ""
					},
					feetype : {
						required : "",
						selectcheck : ""
					},
					admissionCategoryNumber : {
						required : "",
						selectcheck : ""
					},
					mobileNumber : {
						required : ""
					//,
					},
					email : {
						required : ""
					//,
					},
					countryId : {
						required : "",
						selectcheck : ""
					},
					stateId : {
						required : "",
						selectcheck : ""
					},
					districtId : {
						required : "",
						selectcheck : ""
					},
					cityId : {
						required : "",
						selectcheck : ""
					},
					pincode : {
						required : ""
					//,
					},
					address : {
						required : ""
					//,
					}
				},

				submitHandler : function(form) {
					//form.submit();
				}
			});
	
	$(
	"#degreeId")
	.change(
			function() {
				var degreeId = $(this).val();
				 
				if (degreeId != 0) {
					$
					.ajax({
						async : false,
						url : "../academic/master/branch",
						type : "POST",
						data : {
							"degree-id" : ""
									+ degreeId
						},
						success : function(
								response) {
							var jsonOb = JSON
									.parse(JSON
											.stringify(response))
							var text = "<option selected=\"selected\" value=\"0\">Please Select</option>";
							$.each(jsonOb, function(index, branch){
								text += "<option value=\""+branch.id+"\">"
								+ branch.branchShortName
								+ "</option>";
							});
							$("#branchId").empty().html(text);
						},
						error : function() {
							alert('eror...');
						},
					});
				} else {
					$("#branchId").find(
					"option:gt(0)")
					.remove();	
				}
			});
	
	/*$(
	"#categoryId")
	.change(
			function() {
				var categoryId = $(this).val();
				
				if (categoryId != 0) {
					$
					.ajax({
						async : false,
						url : "../academic/master/caste",
						type : "POST",
						data : {
							"category-id" : ""
									+ categoryId
						},
						success : function(
								response) {
							var jsonOb = JSON
									.parse(JSON
											.stringify(response))
							var text = "<option selected=\"selected\" value=\"0\">Please Select Caste</option>";
							$.each(jsonOb, function(index, caste){
								text += "<option value=\""+caste.id+"\">"
								+ caste.caste
								+ "</option>";
							});
							$("#casteId").empty().html(text);
						},
						error : function() {
							alert('eror...');
						},
					});
				} else {
					$("#casteId").find(
					"option:gt(0)")
					.remove();	
				}
			});*/
	
			$("#stateId").change(function() {
				
				var stateId = $(this).val();
				
				$
				.ajax({
					async : false,
					url : "../master/district?stateId="+stateId,
					type : "GET",
					success : function(response) {
						var jsonOb = JSON.parse(JSON
								.stringify(response));
						var text = "<option  value=\"0\">Please Select</option>";
						$
								.each(
										jsonOb,
										function(index, districtOb) {
											text += "<option value=\""+districtOb.id+"\">"
													+ districtOb.name
													+ "</option>";
										});
						$("#districtId").empty().html(text);
					},
					error : function() {
					},
				});
				
			});

			$("#districtId").change(function() {
				
				var district = $(this).val();
				
				$
				.ajax({
					async : false,
					url : "../master/city?districtId="+district,
					type : "GET",
					success : function(response) {
						var jsonOb = JSON.parse(JSON
								.stringify(response));
						var text = "<option  value=\"0\">Please Select</option>";
						$
								.each(
										jsonOb,
										function(index, cityOb) {
											text += "<option value=\""+cityOb.id+"\">"
													+ cityOb.name
													+ "</option>";
										});
						$("#cityId").empty().html(text);
					},
					error : function() {
					},
				});
			
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
					},
				});

	}

	return text;
}

function setStudentData(response) {
	var jsonOb = JSON.parse(response);
	
	$("#studentName").val(jsonOb.studentName);
	$("#fatherName").val(jsonOb.fatherName);
	$("#lastName").val(jsonOb.lastName);
	$("#motherName").val(jsonOb.motherName);
	$("#gender-" + jsonOb.gender).attr('checked', 'checked');
	$("#categoryId").val(jsonOb.categoryId).change();
	$("#casteId").val(jsonOb.casteId);
	$("#nationalityId").val(jsonOb.nationalityId);
	$("#stateId").val(jsonOb.stateId).change();
	$("#districtId").val(jsonOb.districtId).change();
	$("#cityId").val(jsonOb.cityId).change();
	$("#pincode").val(jsonOb.pincode);
	$("#address").val(jsonOb.address);
	$("#email").val(jsonOb.emailId);
	$("#mobileNumber").val(jsonOb.mobileNumber);
	$("#photoLink").val(jsonOb.photoLink);
	$("#signatureLink").val(jsonOb.signatureLink);
	alert(1);
	
}
</script>

</head>
<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">

		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<jsp:include page="../authentication/page-header.jsp" />
				<!-- /Page Header -->
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">

								
								<div class="grid-header text">
									Student Admission
								</div>
<div class="text" style="
    position: absolute;
    left: 496px;
    top: 44px;
    color: green;
    font-size: 20;
    font-weight: 500;"  id="message"></div>

							</div>

							<form id="admission-short-form" action="../student-registration/update"
								method="post" class="form-horizontal"
								enctype="multipart/form-data">
								<%-- <input type="hidden" name="id" value="${student.id }" id="id">
								<input type="hidden" name="sessionId" value="2015" id="sessionId">
								<input type="hidden" name="applicationId" value="${student.applicationId }" id="applicationId">
 --%>
								<!--left row 1 1 start here -->
								<!-- General header tab start here -->



								<div class="form-group"
									style="text-align: center; position: relative;">
									<div>
										<label class="radio-inline"> <input type="radio" tabindex="3"
											name="admission-type" value="1" id="direct" checked="checked" /><strong
											style="font-size: 16px;">Direct</strong>
										</label> <label class="radio-inline"> <input type="radio"
											name="admission-type" value="2" id="merit" /><strong
											style="font-size: 16px;"> Merit</strong>
										</label> <label class="radio-inline"> <input type="radio"
											name="admission-type" value="3" id="excel" /><strong
											style="font-size: 16px;"> Excel </strong>
										</label>
									</div>
								</div>

								<div class="form-group" id="appId" style="display: none;">
									<div class="col-sm-12">
										<div class="col-sm-5">

											<span id="ContentPlaceHolder1_lblParent"
												class="control-label">Application Id</span>

										</div>
										<div class="col-sm-3">
											<input title="" name="applicationId" type="text"
												maxlength="40" id="applicationId" tabindex="3"
												class="form-control" placeholder="Application Id" value="">
											<span id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>

										</div>
										<div class="col-sm-4">
											
											<button type="button" tabindex="3"
															class="btn btn-xl btn-cancel button-submit font13" 
															id="applicationIdBtn">Get Information</button>
										</div>
									</div>
								</div>


								<!-- vaishnavi code start here -->
								<div class="box-header" style="top: 5px;">
									<div class="box-name">
										<i class="fa fa-table"></i> <span>Basic Information</span>
									</div>


								</div>
								<div class="row my-bg-success">

									<!--left div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">

											<br>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Student First Name<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<input title="" name="studentName" type="text"
															maxlength="40" id="studentName" tabindex="3"
															class="form-control" placeholder="Student First Name"
															value=""> <span id="ContentPlaceHolder1_rfvmenu"
															style="display: none;"></span>
															<input type="hidden" name="photoLink" id="photoLink" value""/>
															<input type="hidden" name="signatureLink" id="signatureLink" value""/>
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
														<input name="studentMiddleName" type="text" maxlength="40"
															id="studentMiddleName" tabindex="3" class="form-control"
															placeholder="Student Middle Name" value=""> <span
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
															id="lastName" tabindex="3" class="form-control"
															placeholder="Student Last Name" value=""> <span
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
															id="fatherName" tabindex="3" class="form-control"
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
															id="motherName" tabindex="3" class="form-control"
															placeholder="Mother Name" value="">


													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblMenuName"
															class="control-label">Gender <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<input type="radio" name="gender" id="gender-1" value="1" required="required" tabindex="3"/>
														<label>Male</label> <input type="radio" name="gender"
															id="gender-2" value="2" /> <label>Female</label> <input
															type="radio" name="gender" id="gender-3" value="3" /> <label>Transgender</label>
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
														<select name="categoryId" id="categoryId" tabindex="3"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${CATEGORY_LIST}" var="category">
																<option value="${category.id}">${category.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>
											
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Cast <span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>

													<div class="col-sm-7">
														<select name="casteId" id="casteId" class="form-control" tabindex="3">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${CASTE_LIST}" var="cast">
																<option value="${cast.id}">${cast.name}</option>
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
														<select name="nationalityId" id="nationalityId" tabindex="3"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${NATIONALITY_LIST}" var="nationality">
																<option value="${nationality.id}">${nationality.name}</option>
															</c:forEach>

														</select>

													</div>
												</div>
											</div>

										</div>

									</div>


									<!--left div end here -->

									<!--right div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">
											<br>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Admission Batch<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>

													<%-- <div class="col-sm-7">
															<input name="admissionbatch" type="text" maxlength="100"
																id="admissionbatch" tabindex="4" class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Admission Batch" value="${student.motherName}" >

														</div> --%>
													<div class="col-sm-7">
														<select name="admissionBatch" id="admissionBatch" tabindex="3"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${BATCH_LIST}" var="batch">
																<option value="${batch.id}">${batch.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Degree<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<select name="degreeId" id="degreeId" class="form-control" tabindex="3">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${DEGREE_LIST}" var="degree">
																<option value="${degree.id}">${degree.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Branch<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<select name="branchId" id="branchId" class="form-control" tabindex="3">
															<option selected="selected" value="0">Please
																Select</option>

														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Semester<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<select name="semesterId" id="semesterId" tabindex="3"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${SEMESTER_LIST}" var="semester">
																<option value="${semester.id}">${semester.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<!-- <div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Fee Type</span>

													</div>
													<div class="col-sm-7">
														<select name="feetype" id="feetype" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<option value="1">Full Pay</option>
															<option value="2">Half Pay</option>
														</select>

													</div>
												</div>
											</div> -->

											<div class="form-group">
												<div class="col-sm-12" id="degree-list">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Payment Type<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-6">
														<select name="paymentTypeId" id="paymentTypeId" tabindex="3"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${PAYMENT_TYPE_LIST}" var="paymentType">
																<option value="${paymentType.id}">${paymentType.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>
											
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Admission Category<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<select name="admissionCategoryNumber" tabindex="3"
															id="admissionCategoryNumber" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${CATEGORY_LIST}" var="category">
																<option value="${category.id}">${category.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Mobile Number<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<input name="mobileNumber" type="text" maxlength="100"
															id="mobileNumber" tabindex="3" class="form-control"
															placeholder="Mobile Number" value="">

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Email Id<span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>
													<div class="col-sm-7">
														<input name="email" type="email" maxlength="100"
															id="email" tabindex="3" class="form-control"
															placeholder="Email Id" value="">

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


								<!--  General header tab end here -->


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
														<select name="countryId" id="countryId" tabindex="3"
															class="form-control">
															<option selected="selected" value="0">Please Select</option>
																<c:forEach items="${COUNTRY_LIST}" var="country">
																	<option value="${country.id}">${country.name}</option>
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
														<select name="stateId" id="stateId" class="form-control" tabindex="3">
															<option selected="selected" value="0">Please
																Select</option>
																<c:forEach items="${STATE_LIST}" var="state">
																	<option value="${state.id}">${state.name}</option>
																</c:forEach> 
														</select>
													</div>

												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">District<span
															style="color: #FF0000; font-weight: bold">*</span></span>
													</div>
													<div class="col-sm-7">
														<select name="districtId" id="districtId" tabindex="3"
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
															class="control-label">City<span
															style="color: #FF0000; font-weight: bold">*</span></span>
													</div>
													<div class="col-sm-7">
														<select name="cityId" id="cityId" class="form-control" tabindex="3">
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
														<input name="pincode" type="text" maxlength="6" minlength="6" value=""
															id="pincode" tabindex="3" class="form-control"
															onkeypress=""
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
																rows="5" style="resize: none" name="address"
																id="address" tabindex="3">
																			
																			</textarea>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
									<!--right div end here -->
								</div>
								<br>
								<!--Button code start here -->
								<div class="form-horizontal">
									<div class="" style="text-align: center">

										<div class="col-sm-12">


											<button type="submit" title="Save" id="submit-btn" tabindex="3"
												class="btn btn-xl btn-success button-submit font13">Save</button>


											<button type="reset" title="Reset" tabindex="3"
												class="btn btn-xl btn-cancel button-submit font13"
												id="cancel-btn">Reset</button>


										</div>
									</div>
								</div>
								<!--Button code start here -->
								<!-- vaishnavi code end here -->

							</form>

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

