<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Role Management | RF-Campus</title>
 
<!--=== CSS ===-->

<jsp:include page="script.jsp" />

<script type="text/javascript"
	src="<c:url value="/resources/common/ajax-call.js"/>"></script>




<script type="text/javascript">
	var currentModuleId;
	var dataTableOb = null;
	var text = '';

	$(document)
			.ready(
					function() {						 
						if ("${message}" == "add") {
							notifysuccess('Record Saved Successfully!!');
						}
						else if ("${message}" == "update") {
							notifyupdate('Record Updated Successfully!!');
						}else{
							$("#error").empty().html("&nbsp;<br> ${message}");    
							document.getElementById("error").style.color = "red";
						}

						jQuery.validator.addMethod("lettersonly", function(
								value, element) {
							return this.optional(element)
									|| /^[a-z," "]+$/i.test(value);
						}, "Numbers or Special Characters not Allowed");
						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '' && value != '0');
						}, "");

						var validator = $("#add-edit-module").validate({

							// Specify the validation rules
							rules : {
								userTypeId : {
									selectcheck : true
								},
								roleName : {
									required : true,
									lettersonly : true
								},
								roleDescription : {
									required : true,
									lettersonly : true
								}
							},

							// Specify the validation error messages
							messages : {
								userTypeId : {
									selectcheck : ""
								},
								roleName : {
									required : ""//,
								},
								roleDescription : {
									required : ""
								}
							},

							submitHandler : function(form) {
								form.submit();
							}
						});

						$('#active').change(function() {
							if ($(this).is(":checked")) {

								$("#active").val(1);
							}

						});

						$("#add-edit-btn").click(function() {
							var moduleId = $("#moduleId").val();
							var moduleName = $("#moduleName").val();

							ajaxParams.url = "./modules/exist";
							ajaxParams.data = {
								"moduleId" : moduleId,
								"moduleName" : moduleName
							};
							ajaxParams.formType = "module";

							if ($("#add-edit-module").valid()) {
								
								var flag = ajaxRequest();
								if (flag == true) {
									$("#add-edit-module").submit();
								}

							}
						});

						$("#roleType")
								.change(
										function() {
											var roleTypeId = $(this).val();

											if (roleTypeId != 0) {

												$('.dataTable').dataTable()
														.fnDestroy();

												$
														.ajax({
															async : false,
															url : "./roles/roles-by-type",
															type : "POST",
															data : {
																"roleTypeId" : roleTypeId
															},
															success : function(
																	response) {
																
																var jsonOb = JSON
																		.parse(JSON
																				.stringify(response));
																text = "";
																$
																		.each(
																				jsonOb,
																				function(
																						index,
																						roleOb) {
																					text += "<tr class=\"odd\">"
																							+ "														<td class=\" \">"
																							+ roleOb.roleName
																							+ "</td>"
																							+ "														<td class=\" \">"
																							+ roleOb.roleDescription
																							+ "</td>";
																					if (roleOb.active == 1) {
																						text += "															<td class=\" \">Active</td>";
																					} else {
																						text += "															<td class=\" \">Inactive</td>";
																					}

																					text += "														<td class=\" \">"

																							+ "<div class=\"fa-select\" title=\"Edit\" "
																							+ '														onclick=\"updateModule('
																							+ roleOb.roleId
																							+ ',\''
																							+ roleOb.roleName
																							+ '\',\''
																							+ roleOb.roleDescription
																							+ '\','
																							+ roleOb.active
																							+ ','
																							+ roleOb.userTypeId
																							+ ')\">'
																							+ "<span class=\"fa fa-pencil-square\"/> "
																							+ "</div> "

																							+ "													</tr>";
																				});

																$("#role-table-body").empty().html(text);
																applyDatatable();

															},
															error : function() {
																/* notifyerror('Error Occured!!'); */
															}
														});

												

												$("#roleName").val('');
												$("#roleDescription").val('');
												$("#add-edit-module")
														.attr('action',
																'./roles/add');
												$("#submit-btn").html('Save');
												$("#submit-btn").attr("title",
														"Save");
											} else {

												$("#role-table-body").empty()
														.html('');
												$("#submit-btn").html('Save');
												$("#submit-btn")
														.attr('class',
																'btn btn-xl btn-success button-submit font13');
												$("#submit-btn").attr("title",
														"Save");
												applyDatatable();
											}
										});
						
						$
								.ajax({
									async : false,
									url : "./roles/role-type",
									type : "GET",
									success : function(response) {

										var jsonString = JSON
												.stringify(response);
										var text = '<option selected value="">Select Role Type</option>';
										$
												.each(
														JSON.parse(jsonString),
														function(index,
																roleType) {
															text += '<option value="'+roleType.id+'">'
																	+ roleType.roleTypeName
																	+ '</option>';
														});
										$("#roleType").html(text);
										
									},
									error : function() {
										
									}
								});

						$("#cancel-btn")
								.click(
										function() {
											validator.resetForm();
											$("#roleType").val('');
											$("#roleName").val('');
											$("#roleDescription").val('');
											$("#active").prop("checked", false);
											$("#active").val(0);
											$("#add-edit-module").attr(
													'action', './roles/add');
											$("#submit-btn").html('Save');
											$("#submit-btn")
													.attr("class",
															"btn btn-xl btn-success button-submit font13");
											$("#submit-btn").attr("title",
													"Save");
											$("#error").empty();	
										});
						
						if('${roleTypeId}'!=""){  
							$("#roleType").val('${roleTypeId}').change();		
						} 
					});

	/* ends here document.ready() */
	
	function updateModule(roleId, roleName, roleDescription, active, userTypeId) {
		console.log(currentModuleId);
		$("#roleType").val(userTypeId);
		$("#roleId").val(roleId);
		$("#roleName").val(roleName);
		$("#roleDescription").val(roleDescription);
		if (active == 1) {
			$("#active").prop("checked", true);
			$("#active").val(1);
		} else {
			$("#active").prop("checked", false);
			$("#active").val(0);
		}
		$("#add-edit-module").valid();
		$("#add-edit-module").attr('action', './roles/update');
		$("#submit-btn").html('Update');
		$("#submit-btn").attr("title", "Update");
		$("#submit-btn").attr("class",
				"btn btn-xl btn-warning button-submit font13");
	}

	 function applyDatatable() {
		dataTableOb = $('.dataTable').DataTable({
			"sPaginationType" : "bootstrap",
			"bPaginate" : true,
			"bDestroy" : true,
			"iDisplayLength" : 10,
			"bFilter" : true
		});
	}
</script>

</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="page-header.jsp" />
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->

						<!-- Modal dialog -->
						<!-- /Navigation Vertical -->
						<div id="my_documents_container"
							style="margin-left: 0px; margin: auto; width: 90%"
							class="column-one clearfix">
							<div class="grid-header text">ROLE MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-edit-module"
										class="form-inline ng-pristine ng-valid" method="post"
										action="./roles/add">
										<input type="hidden" name="roleId" id="roleId" value="0">
										<div class="row my-bg-success">
											<!--1st div start here -->											
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">														
														<div class="col-sm-5">
															<div class="control-label lable-set">
																Role Type<span style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
																<select name="userTypeId" id="roleType"
																class="form-control">
															</select>
														</div>														
													</div>
																					
												<!-- checkbox button code starts here-->	
													<div class="form-group">														
														<div class="col-sm-5">
															<div class="control-label">
																Active?&nbsp;
															</div>
														</div>
														<div class="col-sm-7">
															<input type="checkbox" name="active"
																	id="active" value="1" />
														</div>
													</div>
												<!-- checkbox code ends here -->
												</div>	
											</div>
											<!--1st div end here -->
											<!--2nd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">

														<div class="col-sm-5">

															<div class="control-label lable-set">
																Role Name<span style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input name="roleName" type="text" maxlength="50"
																id="roleName" class="form-control"
																placeholder="Please Enter Role Name "><span id="error"></span>

														</div>
													</div>
												</div>

											</div>

											<!--2nd div end here -->
											<!--3rd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">


														<div class="col-sm-5">

															<div class="control-label lable-set">
																Description <span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input name="roleDescription" type="text" maxlength="100"
																id="roleDescription" class="form-control"
																placeholder="Please Enter Description" />

														</div>

													</div>
												</div>
											</div>
											<!--3rd div end here -->
											<!--4th div start here -->
											<!-- <div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">

														<div class="col-sm-12">
															<div class="col-sm-5">

																<div class="control-label">
																	Active?&nbsp;
																</div>
															</div>
															<div class="col-sm-7">
																<input type="checkbox" name="active"
																		id="active" value="1" />
															</div>
														</div>
													</div>
												</div>
											</div> -->
											<!--4th div end here -->
											<!--Button start here -->
											<div class="form-horizontal">
												<div class="" style="text-align: center">

													<div class="col-sm-12">


														<button type="submit" id="submit-btn" title="Save"
															class="btn btn-xl btn-success button-submit font13">Save</button>


														<button type="button" title="Reset"
															class="btn btn-xl btn-cancel button-submit font13"
															id="cancel-btn">Reset</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>

							<div class="grid-title">
								<div class="pull-left">Role List</div>
								<div class="clear"></div>
							</div>
							<div class="grid-content">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper form-inline" role="grid">
									<div class="row">
										<div class="dataTables_header clearfix">
											<div class="col-md-6"></div>
										</div>
									</div>
									<div class="dataTables_header"
										style="position: relative; overflow: auto; max-width: 100%">
										<table
											class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Email ID: activate to sort column ascending">Role
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Job Category: activate to sort column ascending">Role
														Description</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Department: activate to sort column ascending">Status</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Assign to Project: activate to sort column ascending">Edit</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all"
												id="role-table-body">

											</tbody>
										</table>
									</div>
								</div>
								
							</div>
						</div>
					</div>
				
				</div>
				<!--=== Page Content ===-->
				<!--=== Managed Tables ===-->
				<!--=== Horizontal Scrolling ===-->
				<!-- /Horizontal Scrolling -->
				<!-- /Page Content -->
			</div>
			<!-- /.container -->
		</div>
	</div>
</body>
</html>