<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>User Creation | RFCampus</title>

<jsp:include page="script.jsp" />

<script type="text/javascript">
var validator;

	function getUserInformation(userId) {
		$.ajax({
			async : false,
			url : "./user-creation/" + userId,
			type : "POST",
			success : function(response) {
				//setter for college info
				var jsonOb = JSON.parse(JSON.stringify(response));
				//alert(jsonOb.collegeLogo);
				$("[type='radio']").removeAttr("checked");

				$("#userId").val(jsonOb.userId);
				$("#name").val(jsonOb.name);
				$("#username").val(jsonOb.username);
				$("#password").val(jsonOb.password);
				$("#password1").val(jsonOb.password);
				$("#oldUserPhoto").val(jsonOb.userPhoto);//
				$("#Image2").attr('src', './images/' + jsonOb.userPhoto);
				$("#counter").val(jsonOb.counter);
				$("#mobileNumber").val(jsonOb.mobileNumber);
				$("#emailid").val(jsonOb.emailid);

				if (jsonOb.setWorkingDate == 1) {
					$("#setWorkingDate").prop("checked", "checked");
					$("#setWorkingDate").val(1);
				} else {
					$("#setWorkingDate").removeAttr("checked");
					$("#setWorkingDate").val(0);
				}

				if (jsonOb.active == 1) {
					$("#active").prop("checked", "checked");
					$("#active").val(1);
				} else {
					$("#active").removeAttr("checked");
					$("#active").val(0);
				}

				if (jsonOb.roleIds != null) {
					$.each(jsonOb.roleIds.split(","), function(index, roleId) {
						$("#role-" + roleId).prop("checked", "checked");
					});
				}

				$("#add-update-btn").html('Update');
				$("#add-update-btn").attr("title", "Update");
				$("#add-update-btn").attr("class",
						"btn btn-xl btn-warning button-submit font13");
				$("#user-add-edit-form").prop("action",
						"./user-creation/update");
				$("#user-add-edit-form").valid();

				$("#close-dialog-box").click();
			},
			error : function() {
				notifyerror('Error Occured');
			}
		});
	}

	/* function showImage() {
		var src = document.getElementById("collegeLogo");
		var target = document.getElementById("");

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

	function resetModelDialogBox() {
		$("#searchByUserName").prop("checked", "checked");
		$("#searchText").val('');
		$("#table-body").empty();
	}

	$(document)
			.ready(
					function() {

						$('#userImage')
								.change(
										function(event) {
											var tmppath = URL
													.createObjectURL(event.target.files[0]);
											$('#Image2').fadeIn("slow").attr(
													'src', tmppath);
										});

						if ("${message}" == "add") {
							notifysuccess('User Created Successfully!!');
						}

						else if ("${message}" == "update") {
							notifyupdate('User Updated Successfully!!');
						}

						$("#search-btn")
								.click(
										function() {
											if (($("#myModalBox").valid()) == true) {
												$("#table-body").empty();

												var searchBy = $(
														'input[name=searchBy]:checked')
														.val();
												var searchText = $(
														"#searchText").val();

												//alert(searchBy  + " - " + searchText );
												$
														.ajax({
															async : false,
															url : "./user-creation/search",
															type : "POST",
															data : {
																"searchBy" : searchBy,
																"searchText" : searchText
															},
															success : function(
																	response) {
																//setter for college info
																var jsonOb = JSON
																		.parse(JSON
																				.stringify(response));
																var text = '';

																$
																		.each(
																				response,
																				function(
																						index,
																						user) {
																					text += "<tr class=\"customers\">"
																							+ "<td style=\"width: 20%;\"><a "
																							+ "id=\"ContentPlaceHolder1_lsvSearchResult_lnkRecpt_0\" "
																							+ "href=\"javascript:getUserInformation("
																							+ user.userId
																							+ ")\">"
																							+ user.userId
																							+ "</a>"
																							+ "</td>"
																							+ "<td style=\"width: 40%;\"><a "
																							+ "id=\"ContentPlaceHolder1_lsvSearchResult_lnkName_0\""
																							+ "href=\"javascript:getUserInformation("
																							+ user.userId
																							+ ")\">"
																							+ user.name
																							+ "</a>"
																							+ "</td>"
																							+ "<td style=\"width: 40%;\"><a "
																							+ "id=\"ContentPlaceHolder1_lsvSearchResult_lnkId_0\""
																							+ "href=\"javascript:getUserInformation("
																							+ user.userId
																							+ ")\">"
																							+ user.username
																							+ "</a>"
																							+ "</td>"
																							+ "</tr>";
																				});

																$("#table-body")
																		.empty()
																		.html(
																				text);
																//alert(jsonOb.collegeLogo);
																/* $("#collegeId").val(jsonOb.collegeId);
																$("#collegeName").val(jsonOb.collegeName);
																$("#collegeCode").val(jsonOb.collegeCode); */

																//alert(JSON.stringify(response));
															},
															error : function() {
																notifyerror('Error Occured');
															}
														});
											}
										});

						$("#reset-dialog").click(function() {
							$("#searchByUserName").prop("checked", "checked");
							$("#searchText").val('');
							$("#table-body").empty();
						});

						$("#reset")
								.click(
										function() {
											validator.resetForm();
											$("#name").val('');
											$("#username").val('');
											$("#password").val('');
											$("#password1").val('');
											$("#oldUserPhoto").val('');//
											$("#counter").val('');
											$("#mobileNumber").val('');
											$("#emailid").val('');
											$("#setWorkingDate").prop(
													"checked", false);
											$("#setWorkingDate").val(0);
											$("#active").prop("checked", false);
											$("#active").val(0);
											$("[name='roleIds']").prop(
													"checked", false);
											$("[name='roleIds']").val(0);

											$("#Image2")
													.attr('src',
															'./resources/No_image_available.svg');
											$("#user-add-edit-form").prop(
													"action",
													"./user-creation/add");
											$("#add-update-btn").html('Save');
											$("#add-update-btn").attr("title",
													"Save");
											$("#add-update-btn")
													.attr("class",
															"btn btn-xl btn-success button-submit font13");
											
											$("#user-add-edit-form").validate().resetForm();
										});

						$(".setWorkingDate_n_statuc").change(function() {
							if ($(this).is(":checked")) {

								$(this).val(1);
							}
						});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value == $("#password").val());
						}, "");

						jQuery.validator.addMethod("lettersonly", function(
								value, element) {
							return this.optional(element)
									|| /^[a-z," "]+$/i.test(value);
						}, "Numbers or Special Characters not Allowed");

						jQuery.validator.addMethod('selectcheck1', function(
								value) {
							return (value != '');
						}, "");

						jQuery.validator.addMethod("mobileNL", function(value,
								element) {
							return this.optional(element)
									|| /^([\+]?([0-9]*))$/.test(value);
						}, "Please specify a valid mobile number");

						jQuery.validator.addMethod("nowhitespace", function(
								value, element) {
							return this.optional(element)
									|| /^\S+$/i.test(value);
						}, "No white space please");

						jQuery.validator.addMethod("alphanumeric", function(
								value, element) {
							return this.optional(element)
									|| /^\w+$/i.test(value);
						}, "Letters, numbers, and underscores only please");

						jQuery.validator
								.addMethod(
										"email",
										function(value, element, param) {
											return this.optional(element)
													|| /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i
															.test(value);
										}, jQuery.validator.messages.email);

						validator = $("#user-add-edit-form")
								.validate(
										{
											// Specify the validation rules
											rules : {
												name : {
													required : true,
													lettersonly : true

												},
												username : {
													required : true,
													nowhitespace : true,
													alphanumeric : true

												},
												password : {
													required : true

												},
												password1 : {
													required : true,
													selectcheck : true
												},
												emailid : {
													required : true,
													email : true
												},
												mobileNumber : {
													required : false,
													mobileNL : true,
													minlength : 8,
													maxlength : 13
												},
												counter : {
													required : false,
													number : true
												}
											},

											// Specify the validation error messages
											messages : {
												name : {
													required : ""
												},
												username : {
													required : "",
													nowhitespace : "User Name should not have any spaces"
												},
												password : {
													required : ""
												},
												password1 : {
													required : "",
													selectcheck1 : "Entered Password Dosent Match"
												}
											},

											submitHandler : function(form) {
												form.submit();
											}
										});

						var validator1 = $("#myModalBox").validate({
							// Specify the validation rules
							rules : {
								ctl00$ContentPlaceHolder1$txtNameSearch : {
									required : true
								}
							},

							// Specify the validation error messages
							messages : {
								ctl00$ContentPlaceHolder1$txtNameSearch : {
									required : ""
								}
							},

							submitHandler : function(form) {
								form.submit();
							}

						});

					});
</script>
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


				<form action="./user-creation/add" method="post"
					id="user-add-edit-form" enctype="multipart/form-data">
					<input type="hidden" name="userId" id="userId" value="0"> <input
						type="hidden" name="oldUserPhoto" id="oldUserPhoto" value="0">
					<div class="second-column one-child-container relative ">


						<div id="my_documents_container"
							style="margin-left: 0px; margin: auto; width: 90%"
							class="column-one clearfixs">
							<div class="">

								<div class="grid-header text">User Master</div>
								<div class="row">
									<div class="col-md-12">										

										<fieldset class="scheduler-border">

											<!-- <div class="form-group">
												<div class="col-sm-12 ">
													Note <b>:</b> <span style="color: #FF0000">* Marked
														Is Mandatory !</span>
												</div>

											</div> -->
											<div class="grid box-filters">
												<div class="table-header">
													<div class="row">
														<div class="col-md-8">
															<div class="form-horizontal">

																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label"> User Name <span
																			style="color: #FF0000; font-weight: bold">*</span>
																		</span>
																	</div>
																	<div class="col-sm-6">
																		<div class="input-group">
																			<input name="name" type="text" id="name" tabindex="2"
																				maxlength="100" class="form-control"
																				placeholder="Enter User" tabindex=1> <span
																				id="name" style="display: none;"></span> <span
																				class="input-group-addon"><i><a
																					href="#myModal" data-backdrop="false"
																					data-toggle="modal" onclick="resetModelDialogBox()">
																						<span class="glyphicon glyphicon-search"
																						title="Lookup Existing User"></span>
																				</a></i></span>
																		</div>


																	</div>

																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label">User Photo </span>
																	</div>
																	<div class="col-sm-4">
																		<input type="file" name="userImage" id="userImage"
																			title="Please Select Photo" tabindex=2>

																	</div>

																</div>
																<div class="form-group">
																	<div class="col-sm-4"></div>
																	<div class="col-sm-8">

																		<img id="Image2" src=""
																			style="height: 75px; width: 75px;">
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label"> User Login <span
																			style="color: #FF0000; font-weight: bold">*</span></span>
																	</div>
																	<div class="col-sm-6">
																		<input name="username" type="text" id="username"
																			maxlength="100" class="form-control"
																			placeholder="Enter Username " tabindex=3>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label"> Password <span
																			style="color: #FF0000; font-weight: bold">*</span>
																		</span>
																	</div>
																	<div class="col-sm-6">
																		<!-- disabled="disabled" -->
																		<input name="password" type="password" maxlength="10"
																			id="password" class="form-control"
																			placeholder="Enter Password For New User" tabindex=4>
																		<span id="ContentPlaceHolder1_rfPassword"
																			style="display: none;"></span>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label"> Confirm Password <span
																			style="color: #FF0000; font-weight: bold">*</span>
																		</span>
																	</div>
																	<div class="col-sm-6">
																		<!-- disabled="disabled" -->
																		<input name="password1" type="password" maxlength="10"
																			id="password1" class="form-control"
																			placeholder="Confirm Password For New User"
																			tabindex=5>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label">Counter No. </span>
																	</div>
																	<div class="col-sm-4">
																		<input name="counter" type="text" maxlength="2"
																			id="counter" class="form-control"
																			placeholder="Enter Counter No" tabindex=6> <span
																			id="ContentPlaceHolder1_rgSocity"
																			style="display: none;"></span> <span
																			id="ContentPlaceHolder1_rgCollege"
																			style="display: none;"></span>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label">Allow to Change
																			Working Date? </span>
																	</div>
																	<div class="col-sm-4">
																		<input id="setWorkingDate" type="checkbox"
																			name="setWorkingDate" class="setWorkingDate_n_statuc"
																			value="0" tabindex=7><label
																			for="ContentPlaceHolder1_chkWorkingDate">Yes</label>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label">User is Active?</span>
																	</div>
																	<div class="col-sm-4">
																		<input id="active" type="checkbox" name="active"
																			class="setWorkingDate_n_statuc" value="0" tabindex=8><label
																			for="ContentPlaceHolder1_chkStatus">Yes</label>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label">Mobile No.</span>
																	</div>
																	<div class="col-sm-4">
																		<input name="mobileNumber" type="text" maxlength="15"
																			id="mobileNumber" class="form-control"
																			placeholder="Enter Mobile No" tabindex=9>

																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-4">
																		<span class="control-label">Email ID <span
																			style="color: #FF0000; font-weight: bold">*</span>
																		</span>
																	</div>
																	<div class="col-sm-4">
																		<input name="emailid" type="text" maxlength="100"
																			id="emailid" class="form-control"
																			placeholder="Enter Email Id" tabindex=10>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-md-4"
															style="border: 1px solid black; padding: 10px">
															<div class="form-horizontal">

																<fieldset class="scheduler-border">
																	<legend class="scheduler-border"
																		style="background: #E6E6E6; padding: 5px; color: black">Roles</legend>
																	<div class="form-group">
																		<div class="DocumentList">

																			<div class="col-sm-8 center">
																				<table id="ContentPlaceHolder1_chkRole">
																					<tbody>
																						<c:forEach items="${roleList}" var="role">
																							<tr>
																								<td style="padding-bottom: 5px"><input
																									id="role-${role.roleId}" type="checkbox"
																									name="roleIds" value="${role.roleId}"
																									tabindex=11><label
																									style="padding-left: 10px"
																									for="ContentPlaceHolder1_chkRole_0">${role.roleName}</label></td>
																							</tr>
																						</c:forEach>
																					</tbody>
																				</table>
																				<span id="ContentPlaceHolder1_CustomValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																</fieldset>

															</div>

															<div class="form-group">
																<div class="col-sm-4"></div>
																<div class="col-sm-8">
																	<button type="submit" id="add-update-btn" title="Save"
																		class="btn btn-xl btn-success button-submit font13"
																		tabindex=22>Save</button>
																	<button type="button" title="Reset"
																		class="btn btn-xl btn-cancel button-submit font13"
																		id="reset" tabindex=22>Reset</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</fieldset>
									</div>
								</div>

								<!--           jaskirat code end here -->
							</div>
						</div>
					</div>
				</form>
				<!--=== Page Content ===-->
			</div>
		</div>
	</div>
	<!-- /.container -->
	<!-- /.container -->

	<form id="myModalBox" action="">
		<!-- Model Dialog Box -->
		<div id="myModal" class="modal fade"
			style="position: absolute; top: 0px">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title">Select User</h4>

					</div>
					<div class="modal-body" style="padding: 0px 0px 0px">
						<div class="col-sm-12">
							<div class="form-horizontal">
								<div class="form-group">
									<div class="col-sm-4">Search By</div>
									<div class="col-sm-8">
										<table id="ContentPlaceHolder1_rblSearchBy"
											onclick="RblChange();">
											<tbody>
												<tr>
													<td><input id="searchByUserName" type="radio"
														name="searchBy" value="1" checked="checked"><label
														for="ContentPlaceHolder1_rblSearchBy_0">USER NAME</label></td>
													<td><input id="searchByUserId" type="radio"
														name="searchBy" value="2"><label
														for="ContentPlaceHolder1_rblSearchBy_1">USERID</label></td>
													<td><input id="searchByLoginId" type="radio"
														name="searchBy" value="3"><label
														for="ContentPlaceHolder1_rblSearchBy_2">LOGINID</label></td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4">Search Text</div>
									<div class="col-sm-8">
										<input name="ctl00$ContentPlaceHolder1$txtNameSearch"
											type="text" id="searchText" class="form-control"
											style="width: 100%;">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12 text-center Height35px">
										<input type="button" title="Search" name="search"
											value="Search" id="search-btn" class="btn btn-default">
										<input type="button" name="cancel" title="Reset" value="Reset"
											id="reset-dialog" class="btn btn-default">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-12">

										<div class="table-responsive TabContainer">
											<table class="table table-hover table-striped">
												<thead>
													<tr class="customers">
														<th style="width: 20%;">USER ID</th>
														<th style="width: 40%;">USER NAME</th>
														<th style="width: 40%;">LOGIN ID</th>
													</tr>
												</thead>
											</table>

											<div class=""
												style="position: relative; overflow: auto; width: auto; height: 150px;">
												<div class="TabScroll"
													style="overflow: auto; width: auto; height: 150px;">
													<table class="table table-hover table-striped">
														<tbody id="table-body">
														</tbody>
													</table>

												</div>
												<div class="slimScrollBar"
													style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 93.361px; background: rgb(0, 0, 0);"></div>
												<div class="slimScrollRail"
													style="width: 7px; height: 100%; position: absolute; top: 0px; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; display: none; background: rgb(51, 51, 51);"></div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer" style="margin: 0">
						<button type="button" class="btn btn-default" data-dismiss="modal"
							id="close-dialog-box">Close</button>
						<!-- <button type="button" class="btn btn-primary">Save
							changes</button> -->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal-dialog -->
	</form>
</body>

