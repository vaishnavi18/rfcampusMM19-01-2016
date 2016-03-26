<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Society Details | RF-Campus</title>
<jsp:include page="script.jsp" />
<script>
	$(document).ready(function() {
		$('#societyLogo').change(function(event) {
			var tmppath = URL.createObjectURL(event.target.files[0]);
			$('#Image2').fadeIn("slow").attr('src', tmppath);
		});

	});

	function set_value(socid) {

		if (socid.trim() != '') {
			$.ajax({
				url : "./society/get-society-module-populated",
				type : "POST",
				data : {
					"socId" : socid
				},
				success : function(response) {
					var text = '';
					//alert(JSON.stringify(response));
					var jsonOb = JSON.parse(JSON.stringify(response));
					if (JSON.stringify(response) != '[]') {

						//making the default list to be unchecked all
						$('input[type="checkbox"]').removeAttr("checked");

						$("#socId").val(jsonOb.socId);
						$("#society_code").val(jsonOb.socCode);
						$("#SocietyName").val(jsonOb.socName);
						$("#Image2").attr(
								'src',
								/* './resources/uploads/authorization/society/' */
								'./images/' 
										+ jsonOb.socLogo);
						$("#oldSocietyLogo").val(jsonOb.socLogo);
						$("#RegNo").val(jsonOb.socRegno);
						$("#ChairmanName").val(jsonOb.societyChairman);
						$("#SecretoryName").val(jsonOb.societySecretory);

						$("#City").val(jsonOb.city);
						$("#Address").val(jsonOb.address);
						$("#addId").val(jsonOb.addId);
						$("#Pin").val(jsonOb.pinCode);
						$("#Phone1").val(jsonOb.phone1);
						$("#Phone2").val(jsonOb.phone2);
						$("#Phone3").val(jsonOb.phone3);
						$("#Fax1").val(jsonOb.fax1);
						$("#Fax2").val(jsonOb.fax2);
						$("#Email1").val(jsonOb.email1);
						$("#Email2").val(jsonOb.email2);
						$("#Website").val(jsonOb.website);

						$.each(jsonOb.modules,
								function(index, moduleId) {
									$("#module-" + moduleId).prop("checked",
											"checked");
								});

						$("#society-add-edit-form").valid();
						$("#society-add-edit-form").prop("action",
								"./society/update-society-module");
						$("#add-update-btn").val('Update').attr("class",
								"btn btn-xl btn-warning button-submit font13");
						$("#add-update-btn").attr("title", "Update");

					}
					// 			$("#itemNameId").html(text);
					// 			if(tempItemId != ''){
					// 				$("#society_code").val(socid);
					// 			}

				},
				error : function() {

				}
			});
		}
	}

	$(document)
	.ready(
			function() {
				if ("${message}" == "add") {
					notifysuccess('Record Saved Successfully!!');
				}
				else if ("${message}" == "update") {
					notifyupdate('Record Updated Successfully!!');
				}else if ("${message}" == "isSocietyExist") {
					//notifyupdate('Record Updated Successfully!!');
					
					$("#error").empty().html("&nbsp;&nbsp;&nbsp;&nbsp; Society Code Already Exist");    
					document.getElementById("error").style.color = "red";
				}
				
				

				$("#reset")
						.click(
								function() {
									validator.resetForm();
									$("#Image2").attr('src', '');
									$("#society-add-edit-form")
											.prop("action",
													"./society/add-society-module");
									$("#add-update-btn")
											.val('Save')
											.attr("class",
													"btn btn-xl btn-success button-submit font13");
									$("#add-update-btn").attr("title",
											"Save");
									$("#error").empty();
								});
				$(".active_n_socialcollege").change(function() {
					if ($(this).is(":checked")) {
				

						$(this).val(1);
					}
				});

				jQuery.validator.addMethod('selectcheck', function(
						value) {
					return (value != '');
				}, "");

				jQuery.validator.addMethod("lettersonly", function(
						value, element) {
					return this.optional(element)
							|| /^[a-z," "]+$/i.test(value);
				}, "Numbers or Special Characters not Allowed");
				jQuery.validator.addMethod("alphanumeric", function(
						value, element) {
					return this.optional(element)
							|| /^\w+$/i.test(value);
				}, "Letters, numbers, and underscores only please");

				/* jQuery.validator.addMethod("mobileNL", function(value, element) {
						return this.optional(element) || /^((\+*)((0[-]+)*|(91)*)(\d{12}+|\d{10}+))|\d{5}([-]*)\d{6}$/.test(value);
				}, "Please specify a valid mobile number");
				 */
				jQuery.validator.addMethod("mobileNL", function(value,
						element) {
					return this.optional(element)
							|| /^([\+]?([0-9]*))$/.test(value);
				}, "Please specify a valid mobile number");
				jQuery.validator
						.addMethod(
								"email",
								function(value, element, param) {
									return this.optional(element)
											|| /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i
													.test(value);
								}, jQuery.validator.messages.email);

				jQuery.validator
						.addMethod(
								"url",
								function(value, element, param) {
									return this.optional(element)
											|| /^(https?|s?ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i
													.test(value);
								}, jQuery.validator.messages.url);

				var validator = $("#society-add-edit-form").validate({
					// Specify the validation rules
					rules : {
						socCode : {
							selectcheck : true,
							required : true,
							alphanumeric : true
						},
						socName : {
							selectcheck : true,
							required : true,
							lettersonly : true
						//,
						},
						socRegno : {
							alphanumeric : true
						},
						societyChairman : {
							required : false,
							lettersonly : true
						},
						societySecretory : {
							required : false,
							lettersonly : true
						},
						fax1 : {
							required : false,
							number : true
						},
						fax2 : {
							required : false,
							number : true
						},
						city : {
							required : false,
							lettersonly : true
						},
						pinCode : {
							required : false,
							number : true,
							minlength : 6,
							maxlength : 6
						},
						phone1 : {
							required : false,
							mobileNL : true,
							minlength : 8,
							maxlength : 12
						},
						phone2 : {
							required : false,
							mobileNL : true,
							minlength : 8,
							maxlength : 12
						},
						phone3 : {
							required : false,
							mobileNL : true,
							minlength : 8,
							maxlength : 12
						},
						email1 : {
							required : false,
							email : true
						},
						email2 : {
							required : false,
							email : true
						},
						website : {
							required : false,
							url : true
						}

					},

					// Specify the validation error messages
					messages : {
						socCode : {
							required : "",
							selectcheck : ""
						},
						socName : {
							required : "",
							selectcheck : ""
						},

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


				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class="doc-container column-one clearfixs ">
						<div class="">
							<div class="row">
								<div class="create_project_tbl">
									<!-- jaskirat code start here -->
									<div class="row">
										<form action="./society/add-society-module" method="post"
											id="society-add-edit-form" enctype="multipart/form-data">
											<input type="hidden" id="socId" name="socId" value="0" /> <input
												type="hidden" id="addId" name="addId" value="0" /> <input
												type="hidden" name="oldSocietyLogo" id="oldSocietyLogo"
												value="0">
												
											<div class="col-md-12">
												<fieldset class="scheduler-border">
													<div class="grid-header text">Society</div>

													<div class="grid box-filters">
														<div class="table-header">
															<div class="row">
																<div class="col-md-6">
																	<div class="form-horizontal">

																		<div class="form-group">
																		<span id="error"></span>
																			<div class="col-sm-4">
																				<span class="control-label"> Society Code<span
																					style="color: #FF0000;">*</span></span>

																			</div>
																			<div class="col-sm-8">
																				<input name="socCode" type="text" maxlength="6"
																					id="society_code" class="form-control"
																					placeholder="Please Enter Society Code"> <span
																					id="ContentPlaceHolder1_rfvFaculty"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Society Name<span
																					style="color: #FF0000;">*</span></span>
																			</div>
																			<div class="col-sm-8">
																				<input name="socName" type="text" maxlength="200"
																					id="SocietyName" class="form-control"
																					placeholder="Please Enter Society Name"> <span
																					id="RequiredFieldValidator1" style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Registration No.</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="socRegno" type="text" maxlength="20"
																					id="RegNo" class="form-control"
																					placeholder="Please Enter Society Reg No">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Chairman Name</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="societyChairman" type="text"
																					maxlength="100" id="ChairmanName"
																					class="form-control"
																					placeholder="Please Enter Chairman Name">


																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Secretary Name</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="societySecretory" type="text"
																					maxlength="100" id="SecretoryName"
																					class="form-control" 
																					placeholder="Please Enter Secretory Name">


																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Society Logo</span>
																			</div>
																			<div class="col-sm-8">
																				<input type="file" name="societyLogo"
																					id="societyLogo" title="Please Select Logo"
																					>

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4"></div>
																			<div class="col-sm-8">

																				<img id="Image2" src=""
																					style="height: 75px; width: 75px;">


																			</div>
																		</div>

																		<!-- <div class="form-group">

									<div class="col-sm-4"></div>
									<div class="col-sm-8">
										<input type="submit" name="Upload" value="Upload" id="Upload"
											title="Click To Upload" class="btn btn-default">
									</div>
								</div> -->
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Address</span>
																			</div>
																			<div class="col-sm-8">
																				<textarea name="address" rows="2" cols="20"
																					id="Address" class="form-control" maxlength="250"
																					placeholder="Please Enter Address "></textarea>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> City</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="city" type="text" id="City"
																					class="form-control" maxlength="50"																					placeholder="Please Enter City">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Pin Code</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="pinCode" type="text" maxlength="6"
																					id="Pin" class="form-control"
																					placeholder="Please Enter Pin">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Phone No.1</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="phone1" type="text" maxlength="15"
																					id="Phone1" class="form-control"
																					placeholder="Please Enter Phone No. 1">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Phone No.2</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="phone2" type="text" maxlength="15"
																					id="Phone2" class="form-control"
																					placeholder="Please Enter Phone No. 2">

																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Phone No.3</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="phone3" type="text" maxlength="15"
																					id="Phone3" class="form-control"
																					placeholder="Please Enter phone No. 3">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Fax 1</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="fax1" type="text" maxlength="15"
																					id="Fax1" class="form-control"
																					placeholder="Please Enter Fax No. 1">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Fax 2</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="fax2" type="text" maxlength="15"
																					id="Fax2" class="form-control"
																					placeholder="Please Enter Fax No. 2">

																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Email ID 1</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="email1" type="text" maxlength="100"
																					id="Email1" class="form-control"
																					placeholder="Please Enter Email 1"> <span
																					id="ContentPlaceHolder1_ref1"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Email ID 2</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="email2" type="text" maxlength="100"
																					id="Email2" class="form-control"
																					placeholder="Please Enter Email 2"> <span
																					id="ContentPlaceHolder1_RegularExpressionValidator1"
																					style="display: none;"></span>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-4">
																				<span class="control-label"> Web Site</span>
																			</div>
																			<div class="col-sm-8">
																				<input name="website" type="text" maxlength="100"
																					id="Website" class="form-control"
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
																					<th style="text-align: center; width: 10%">CODE</th>
																					<th style="text-align: center; width: 85%">SOCIETY
																						NAME</th>

																				</tr>
																			<tbody>
																				<c:forEach items="${societyList}" var="society">
																					<tr class="">
																						<td style="width: 16%;">
																							<div class="fa-select" title="Edit"
																								onclick="set_value('${society.societyId}')">
																								<span class="fa fa-pencil-square"> </span>
																							</div>
																						</td>
																						<td style="width: 10%; text-align: center">
																							${society.societyCode}</td>
																						<td style="width: 85%; text-align: left">
																							${society.societyName}</td>

																					</tr>

																				</c:forEach>

																			</tbody>
																		</table>

																	</div>


																	<div class="grid box-filters"
																		style="position: relative; height: 334px; overflow: auto; margin-top: 20px">
																		<table
																			class="table table-bordered  table-checkable table-responsive  "
																			id="DataTables_Table_0"
																			aria-describedby="DataTables_Table_0_info">
																			<thead>
																				<tr role="row" class="customers">
																					<th style="ext-align: center; width: 10%">SELECT</th>
																					<th
																						style="text-align: center; width: 90%; text-align: center">MODULE
																						NAME</th>
																				</tr>
																			</thead>

																			<tbody>

																				<c:forEach items="${allModuleList}" var="module">
																					<tr class="">
																						<td style="width: 16%; padding-left: 14px;"><span
																							title="1"><input
																								id="module-${module.moduleId}" type="checkbox"
																								name="modIds" value="${module.moduleId}"></span>
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
																		<div class="col-sm-12">
																			<div class="col-sm-4"></div>
																			<div class="col-lg-8">
																				<input type="submit" name="update" value="Save"
																					onclick="" id="add-update-btn" title="Save"
																					class="btn btn-xl btn-success button-submit font13">
																				<input type="reset" name="reset" value="Reset"
																					id="reset" title="Reset"
																					class="btn  btn-xl btn-default button-cancel font13">
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
										<!-- jaskirat code end here -->
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
	<!-- /.container -->
</body>

