<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>College Creation | RF-Campus</title>

<jsp:include page="script.jsp" />


<script type="text/javascript">
	/* 	$(function() {
	 $(".datepicker").datepicker({
	 showOn : "both",
	 buttonImage : "image.jpg", 
	 dateFormat : "dd-mm-yy",
	 buttonText : "<i  class='icon-calendar my_cal'></i>",
	 changeMonth: true,
	 changeYear: true,
	 showButtonPanel: true,
	 yearRange: 'c-20:c+30',
	 maxDate: '@maxDate',
	 minDate: '@minDate', 
	 buttonImageOnly : false,
	 constrainInput : true,
	 minDate:+0, you do not want to show previous date.
	 maxDate : +0
	 you do not want to show next day. 
	 });

	 }); */

	function getCollegeInformation(collegeId) {
		$.ajax({
			async : false,
			url : "./college/" + collegeId,
			type : "POST",
			success : function(response) {
				//setter for college info
				var jsonOb = JSON.parse(JSON.stringify(response));
				//alert(jsonOb.collegeLogo);
				$("#collegeId").val(jsonOb.collegeId);
				$("#collegeName").val(jsonOb.collegeName);
				$("#collegeCode").val(jsonOb.collegeCode);
				$("#Image2").attr(
						'src',
						'./images/'
								+ jsonOb.collegeLogo);
				$("#oldCollegeLogo").val(jsonOb.collegeLogo);
				$("#panNumber").val(jsonOb.panNumber);
				$("#tinNumber").val(jsonOb.tinNumber);
				$("#tanNumber").val(jsonOb.tanNumber);
				$("#principalName").val(jsonOb.principalName);
				$("#workOrderNumber").val(jsonOb.workOrderNumber);
				$("#workOrderDateString").val(jsonOb.workOrderDate);
				$("#socialCollege").val(jsonOb.socialCollege);
				$("#active").val(jsonOb.active);
				$("#numberOfUsers").val(jsonOb.numberOfUsers);
				$("#societyId").val(jsonOb.societyId);
				$("#universityId").val(jsonOb.universityId);

				if (jsonOb.active == 1) {
					$("#active").prop("checked", "checked");
				} else {
					$("#active").removeAttr("checked");
				}

				if (jsonOb.socialCollege == 1) {
					$("#socialCollege").prop("checked", "checked");
				} else {
					$("#socialCollege").removeAttr("checked");
				}
				//setter for Address info
				$("#addId").val(jsonOb.addId);
				$("#address").val(jsonOb.address);
				$("#city").val(jsonOb.city);
				$("#pinCode").val(jsonOb.pinCode);
				$("#phone1").val(jsonOb.phone1);
				$("#phone2").val(jsonOb.phone2);
				$("#phone3").val(jsonOb.phone3);
				$("#fax1").val(jsonOb.fax1);
				$("#fax2").val(jsonOb.fax2);
				$("#email1").val(jsonOb.email1);
				$("#email2").val(jsonOb.email2);
				$("#website").val(jsonOb.website);
				$("#socId").val(jsonOb.socId);
				$("#collegeIdInAddress").val(jsonOb.collegeIdInAddress);

				$.each(jsonOb.modules, function(index, moduleId) {
					$("#module-" + moduleId).prop("checked", "checked");
				});

				$("#college-add-edit-form").valid();
				$("#college-add-edit-form").prop("action", "./college/update");
				$("#add-update-btn").val('Update').attr("class","btn btn-xl btn-warning button-submit font13");
				$("#add-update-btn").attr("title","Update");
			},
			error : function() {
				//notifyerror('Error Occured');
			}
		});
	}

	/* function showImage() {
		var src = document.getElementById("collegeLogo");
		var target = document.getElementById("Image2");

		var fr = new FileReader();
		// when image is loaded, set the src of the image where you want to display it
		fr.onload = function(e) {
			target.src = this.result;
		};
		src.addEventListener("change", function() {
			// fill fr with image data    
			fr.readAsDataURL(src.files[0]);
		});
	} */

	$(document).ready(function() {
		
		if ("${message}" == "add") {
							notifysuccess('Record Saved Successfully!!');
						}

						else if ("${message}" == "update") {
							notifyupdate('Record Updated Successfully!!');
						}
						
		$('#collegeLogo').change(function(event) {
			var tmppath = URL.createObjectURL(event.target.files[0]);
			$('#Image2').fadeIn("slow").attr('src', tmppath);
		});
		
		$("#reset").click(function() {
			validator.resetForm();
			$("#Image2").attr('src', './resources/No_image_available.svg');
			$("#college-add-edit-form").prop("action", "./college/add");
			$("#add-update-btn").val('Save').attr("class","btn btn-xl btn-success button-submit font13");
			$("#add-update-btn").attr("title","Save");
		});

		$(".active_n_socialcollege").change(function() {
			if ($(this).is(":checked")) {

				$(this).val(1);
			}
		});
		
		/** Message Hiding by Sachinmt**/
		$('#message').delay(2000).fadeOut();
		/**--###--**/

						jQuery.validator.addMethod('selectcheck1', function(value) {
							return (value != '0' && value != '');
						}, "");
						
						jQuery.validator.addMethod('selectcheck', function(value) {
							return (value != "");
						}, "");
						jQuery.validator.addMethod("letterswithbasicpunc", function(value, element) {
							return this.optional(element) || /^[a-z\-.,()'"\s]+$/i.test(value);
						}, "Letters or punctuation only please");
						 jQuery.validator.addMethod("pan", function(value, element)
						{    return this.optional(element) || /^(([a-z]{5}\d{4}[a-z]{1})|([A-Z]{5}\d{4}[A-Z]{1}))$/.test(value);
						}, "Invalid Pan Number"); 
						jQuery.validator.addMethod("mobileNL", function(value, element) {
							return this.optional(element) || /^([\+]?([0-9]*))$/.test(value);
						}, "Please specify a valid mobile number");	 
						 jQuery.validator.addMethod("alphanumeric", function(value, element) {
								return this.optional(element) || /^\w+$/i.test(value);
						}, "Letters, numbers, and underscores only please");
						jQuery.validator.addMethod("lettersonly", function(value, element) {
							 return this.optional(element) || /^[a-z," "]+$/i.test(value);
						}, "Numbers or Special Characters not Allowed");
						jQuery.validator.addMethod("email", function(value, element, param) {
							return this.optional(element) || /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(value);
						}, jQuery.validator.messages.email);
						jQuery.validator.addMethod("url", function(value, element, param) {
							return this.optional(element) || /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(value);
						}, jQuery.validator.messages.url);

						var validator = $("#college-add-edit-form").validate({
							// Specify the validation rules
							rules : {
								societyId : {
									required : true,
									selectcheck1:true	
								},
								universityId : {
									required : true,
									selectcheck1:true	
								},
								collegeName : {
									required : true,
									letterswithbasicpunc : true,
									selectcheck:true
								
								},
								collegeCode : {
									required : true,
									number : true,
									selectcheck:true
								
								},
								panNumber : {
									required : true,
									pan : true, 
									//alphanumeric :true,
									selectcheck:true
								
								},
								tanNumber : {
									required : true,
									alphanumeric: true,
									selectcheck:true
								
								},
								principalName : {
									lettersonly : true					
								},
								tinNumber : {
									number : true
								},
								address : {
									required : true,
									selectcheck:true				
								},
								city : {
									required : true,
									selectcheck:true,
									lettersonly : true				
								},
								pinCode : {
									required : true,
									selectcheck:true,
									number : true,	
									minlength: 6,
								},
								phone1 : {
									required : true,					
									selectcheck:true,
									mobileNL : true,
									minlength: 8,
									maxlength: 12
								},
								phone2 : {
									required : false,
									selectcheck:false,
									mobileNL : true,
									minlength: 8,
									maxlength: 12
								},
								phone3 : {
									required : false,
									selectcheck:false,
									mobileNL : true,
									minlength: 8,
									maxlength: 12
								},
								
								email1 : {
									required : true,
									selectcheck:true,
									email : true
								
								},
								email2 : {
									required : false,					
									email : true				
								},
								
								workOrderDateString : {
									required : true,
									selectcheck:true,
									date : true
								},
								billDateFrom :{
									date : true
								},
								billDateTo :{
									date : true
								},
								fax1 :{
									required : false,
									number: true,
								},
								fax2 :{
									required : false,
									number: true,
								},
								website : {
									required : false,
									url : true					
								},
								numberOfUsers :{
									number : true
								}
								
								
							},

							// Specify the validation error messages
							messages : {
								societyId : {
									required : "",
									selectcheck: ""					
								},
								universityId : {
									required : "",
									selectcheck: ""					
								},
								collegeName : {
									required : "",
									selectcheck: ""
								},
								collegeCode : {
									required : "",
									selectcheck: ""
								},
								panNumber : {
									required : "",
									selectcheck: "",
									//uppercase : "please enter in uppercase letters"
								},
								tanNumber : {
									required : "",
									selectcheck: ""
								},
								address : {
									required : "",
									selectcheck: ""
								},
								city : {
									required : "",
									selectcheck: ""
								},
								pinCode : {
									required : "",
									selectcheck: ""
								},
								phone1 : {
									required : "",
									selectcheck: ""
								},
								email1 : {
									required : "",
									selectcheck: ""
								},
								workOrderDateString : {
									required : "",
									selectcheck:"",
									
								}
								
							},
							
							submitHandler : function(form) {
								form.submit();
							},
							errorPlacement: function(error, element) {
								if ($(element).hasClass('dateElement')) {
									error.insertAfter($(element).parent());
								} else {
									error.insertAfter(element);
								}
							}
						});

		/*$("#societyId").change(function(){
			var societyId = $("#societyId").val();
			
			if(societyId != 0){
				$.ajax({
					async:false,
					url:"./college/by-society",
					data:{"society-id" : societyId},
					type:"POST",
					success:function(response){
						var jsonOb = JSON.parse(JSON.stringify(response));
						var text = '<option value="0">Select Society</option>';
						$.each(response, function(index, collegeOb){
							text += '<option value="'+collegeOb.collegeId+'">'+collegeOb.collegeName+'</option>';
						});
						$("#universityId").empty();
						$("#universityId").html(text);
					},
					error:function(){
						alert('error...');
					}
					
				});	
			}
		});*/
	});
</script>
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">

		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<jsp:include page="page-header.jsp" />
				<!-- /Page Header -->


				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class="doc-container column-one clearfixs ">
						<div class="">
							<div class="row">
								<div class="create_project_tbl">

									<div class="row">

										<form action="./college/add" method="post"
											id="college-add-edit-form" enctype="multipart/form-data">
											<input type="hidden" name="collegeId" id="collegeId"
												value="0"> <input type="hidden" name="addId"
												id="addId" value="0"> <input type="hidden"
												name="collegeIdInAddress" id="collegeIdInAddress" value="0">
											<input type="hidden" name="oldCollegeLogo"
												id="oldCollegeLogo" value="0">
											<div class="col-md-12">
												<fieldset class="scheduler-border">

													<div class="grid-header text">COLLEGE MANAGEMENT</div>


													<!--  <div class="form-group">
														<div class="col-sm-12 ">
															<div class="col-sm-3">
																Note <b>:</b> <span style="color: #FF0000">*
																	Marked Is Mandatory !</span>
															</div>
														</div>

													</div> --> 
								
								 <!--Changes By Sachinmt  -->
<!-- Success Message -->							
<div align="center">
<span id ="message" align =""><font face='verdana' size='2' color='Green'><b>${message}</b></font></span></div>
<!-- Message End -->
<!--**--#--**  -->
													<div class="grid box-filters">
														<div class="table-header">
															<div class="row">
																<div class=" col-md-6 ">
																	<div class="form-horizontal">

																		<div class="form-group">
																			<div class="col-sm-4 ">
																				<span class="control-label"> Society <span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<select name="societyId" id="societyId" tabindex="1"
																					class="form-control">
																					<option value="" >Please Select Society</option>
																					<c:forEach items="${societyList}" var="society">
																						<option value="${society.societyId}">${society.societyName}</option>
																					</c:forEach>
																				</select> <span id="ContentPlaceHolder1_rfvFaculty"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> University <span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<select name="universityId" id="universityId"
																					tabindex="2" class="form-control">
																					<option value="">Please Select University</option>
																					<c:forEach items="${universityList}"
																						var="university">
																						<option value="${university.id}">${university.universityName}</option>
																					</c:forEach>

																				</select> <span id="RequiredFieldValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Name<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="collegeName" type="text"
																					maxlength="200" id="collegeName" tabindex="3"
																					class="form-control"
																					placeholder="Please Enter College Name">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Code<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="collegeCode" type="text"
																					maxlength="16" id="collegeCode" tabindex=4
																					class="form-control"
																					placeholder="Please Enter College Code">


																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> College Logo </span>
																			</div>
																			<div class="col-sm-8">
																				<input type="file" name="collegeLogo"
																					id="collegeLogo" tabindex=5 title="Please Select Logo" 
																					class="btn btn-default" >

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4"></div>
																			<div class="col-sm-8">

																				<img id="Image2"
																					src="./resources/No_image_available.svg"
																					style="height: 75px; width: 75px;">


																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Pan No<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="panNumber" type="text" maxlength="10"
																					id="panNumber"  tabindex=6 class="form-control"
																					placeholder="Please Enter PAN Number">


																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Tan No<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="tanNumber" type="text" maxlength="16"
																					id="tanNumber" tabindex=7 class="form-control"
																					placeholder="Please Enter TAN Number">


																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Tin No</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="tinNumber" type="text" maxlength="16"
																					id="tinNumber" tabindex=8 class="form-control"
																					placeholder="Please Enter TIN Number">


																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Principal Name</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="principalName" type="text"
																					maxlength="100" id="principalName" tabindex=9
																					class="form-control"
																					placeholder="Please Enter Principal Name">


																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Address<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<textarea name="address" rows="2" cols="20" tabindex=10
																					maxlength="200" id="address" class="form-control"
																					placeholder="Please Enter Address "></textarea>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> City<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="city" type="text" maxlength="100"
																					id="city" tabindex=11 class="form-control"
																					placeholder="Please Enter City">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Pin Code<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="pinCode" type="text" maxlength="6"
																					id="pinCode" tabindex=12 class="form-control"
																					placeholder="Please Enter Pin">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Phone No.1<span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-8">
																				<input name="phone1" type="text" maxlength="12"
																					id="phone1" tabindex=13 class="form-control"
																					placeholder="Please Enter Phone No. 1">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Phone No.2</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="phone2" type="text" maxlength="12"
																					id="phone2" class="form-control" tabindex=14
																					placeholder="Please Enter Phone No. 2">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Phone No.3</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="phone3" type="text" maxlength="12"
																					id="phone3" class="form-control" tabindex=15
																					placeholder="Please Enter phone No. 3">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Email Id 1<span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-8">
																				<input name="email1" type="text" maxlength="100"
																					id="email1" class="form-control" tabindex=16 
																					placeholder="Please Enter Email 1"> <span
																					id="ContentPlaceHolder1_ref1"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Email Id 2</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="email2" type="text" maxlength="100"
																					id="email2" class="form-control" tabindex=17
																					placeholder="Please Enter Email 2"> <span
																					id="ContentPlaceHolder1_RegularExpressionValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Status</span>
																			</div>


																			<div class="col-sm-8">
																				<input id="active" type="checkbox" name="active"
																					value="1" checked="checked" tabindex=18
																					class="active_n_socialcollege">
																				<!-- <label for="ContentPlaceHolder1_chkActive"> </label> -->
																				<span
																					id="ContentPlaceHolder1_RegularExpressionValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Society Status</span>
																			</div>


																			<div class="col-sm-8">
																				<input id="socialCollege" type="checkbox" value="1"
																					name="socialCollege" checked="checked" tabindex=19
																					class="active_n_socialcollege">
																				<!-- <label for="ContentPlaceHolder1_chkActive"></label> -->
																				<span
																					id="ContentPlaceHolder1_RegularExpressionValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>





																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Work Order Date<span
																					style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>


																			<div class="col-sm-8">

																				<!--  <input name="WorkOrder" type="text" maxlength="100" id="Email2" class="form-control" placeholder="Please Enter Work Order Date"> -->
																				<div class='input-group date startDate'>
																					<input type="text" name="workOrderDateString"
																						id="workOrderDateString" class="form-control dateElement"  tabindex=20
																						placeholder="Press to Select date"/> <span
																						class="input-group-addon"><span
																						class="glyphicon glyphicon-calendar"></span> </span>
																				</div>

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Bill Date From</span>
																			</div>


																			<div class="col-sm-8">

																				<div class='input-group date startDate'>
																					<input type="text" name="billDateFrom" tabindex=21
																						id="billDateFrom" class="form-control dateElement"
																						placeholder="Press to Select date" /><span
																						class="input-group-addon"><span
																						class="glyphicon glyphicon-calendar"></span> </span>
																				</div>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Bill Date To</span>
																			</div>


																			<div class="col-sm-8">

																				<div class='input-group date endDate'>
																					<input type="text" name="billDateTo" tabindex=22
																						id="billDateTo" class="form-control dateElement"
																						placeholder="Press to Select date" /> <span
																						class="input-group-addon"> <span
																						class="glyphicon glyphicon-calendar"></span>
																					</span>
																				</div>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Work Order No</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="workOrderNumber" type="text"
																					maxlength="50" id="workOrderNumber" tabindex=23
																					class="form-control"
																					placeholder="Please Enter Work Order Number">
																				<span
																					id="ContentPlaceHolder1_RegularExpressionValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>



																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Fax 1</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="fax1" type="text" maxlength="15"
																					id="fax1" class="form-control" tabindex=24
																					placeholder="Please Enter Fax No. 1">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Fax 2</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="fax2" type="text" maxlength="15"
																					id="fax2" class="form-control" tabindex=25
																					placeholder="Please Enter Fax No. 2">

																			</div>
																		</div>


																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Web Site</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="website" type="text" maxlength="100"
																					id="website" class="form-control" tabindex=26
																					placeholder="Please Enter Website URL"> <span
																					id="ContentPlaceHolder1_RegularExpressionValidator4"
																					style="display: none;"></span>

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> No of Users</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="numberOfUsers" type="text"
																					maxlength="10" id="numberOfUsers"
																					class="form-control" tabindex=27 
																					placeholder="Please Enter Website URL"> <span
																					id="ContentPlaceHolder1_RegularExpressionValidator4"
																					style="display: none;"></span>

																			</div>
																		</div>

																	</div>
																</div>

																<div class="col-md-6" style="padding-right: 50px">

																	<div class="grid box-filters"
																		style="height: 334px; position: relative; overflow: auto">

																		<table id=""
																			class="table table-bordered  table-checkable table-responsive  "
																			id="DataTables_Table_0"
																			aria-describedby="DataTables_Table_0_info">
																			<thead>
																				<tr role="row" class="customers">
																					<th style="text-align: center; width: 5%">SELECT</th>
																					<!-- <th style="text-align: center; width: 10%">CODE</th> -->
																					<th style="text-align: center; width: 85%">COLLEGE
																						NAME</th>

																				</tr>
																			</thead>

																			<tbody>
																			<tbody>
																				<c:forEach items="${collegeList}" var="college">
																					<tr class="customers">
																						<td style="width: 16%;">
																							<div class="fa-select" title="Edit"
																								onclick="getCollegeInformation('${college.collegeId}')">
																								<span class="fa fa-pencil-square"> </span>
																							</div>
																						</td>
																						<%-- <td style="width: 10%; text-align: center">
																	${college.collegeId}</td> --%>
																						<td style="width: 85%; text-align: left">
																							${college.collegeName}</td>

																					</tr>

																				</c:forEach>

																			</tbody>

																			</tbody>
																		</table>

																	</div>


																	<div class="row"
																		style="border: solid 1px #CCCCCC; position: relative; height: 300px; overflow: auto; margin-top: 20px">

																		<table
																			class="table table-bordered  table-checkable table-responsive  "
																			id="DataTables_Table_0"
																			aria-describedby="DataTables_Table_0_info">
																			<thead>
																				<tr class="customers">
																					<th style="width: 10%">SELECT</th>
																					<th style="width: 90%; text-align: center">MODULE
																						NAME</th>
																				</tr>
																			</thead>
																			<tbody>

																				<c:forEach items="${allModuleList}" var="module">
																					<tr class="customers">
																						<td style="width: 16%; padding-left: 14px;"><span
																							title="1"><input
																								id="module-${module.moduleId}" type="checkbox"
																								name="moduleIds" value="${module.moduleId}"></span>
																						</td>
																						<td style="width: 90%; text-align: left"><span
																							id="ContentPlaceHolder1_Repeater_Module_lblFields_0">${module.moduleName}</span>
																						</td>


																					</tr>
																				</c:forEach>

																			</tbody>
																		</table>
																		<span id="ContentPlaceHolder1_CustomValidator1"
																			style="display: none;"></span>

																	</div>

																	<br>

																	<div class="form-group">
																		<div class="col-md-12">
																			<div class="col-sm-4"></div>
																			<div class="col-sm-8">
																				<input type="submit" name="update" value="Save"
																					onclick="" id="add-update-btn" title="Save"
																					class="btn btn-xl btn-success button-submit font13">
																				<input type="reset" name="reset" value="Reset"
																					id="reset" title="Reset"
																					class="btn btn-xl btn-default button-cancel font13">
																				<div id="ContentPlaceHolder1_valSave"
																					style="display: none;"></div>
																			</div>

																		</div>

																	</div>

																</div>
															</div>
															<!-- row end here -->

														</div>
													</div>
												</fieldset>
											</div>
										</form>
									</div>


								</div>
							</div>
						</div>
					</div>
					<!--=== Page Content ===-->
				</div>
			</div>

		</div>
	</div>
	<!-- /.container -->
	<script>
		jQuery(function() {
			jQuery(function() {
				$('.startDate').datetimepicker({
					//   useCurrent: false,
					// minDate: moment().add(-1, 'd').toDate(),
 					pickTime : false,
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'MM/DD/YYYY'
				});

				$('.endDate').datetimepicker({
					//useCurrent: false,
					// minDate: moment().add(1, 'd').toDate(),
 					pickTime : false,
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'MM/DD/YYYY'
						
				});

				jQuery('.endDate').data("DateTimePicker").setMinDate(
						moment().toDate());
				jQuery('.startDate').data("DateTimePicker").setMaxDate(
						moment().toDate());
				//jQuery('#startDate').datetimepicker();
				//				jQuery('#endDate').datetimepicker();
				jQuery(".startDate").on(
						"dp.change",
						function(e) {
							jQuery('.endDate').data("DateTimePicker")
									.setMinDate(e.date.add(-1, 'D'));
						});
				jQuery(".endDate").on(
						"dp.change",
						function(e) {
							jQuery('.startDate').data("DateTimePicker")
									.setMaxDate(e.date.add(1, 'D'));
						});

			});

		});
	</script>

	<!-- /.container -->
</body>
</html>