<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Menu Management  | RF-Campus</title>

<jsp:include page="script.jsp" />

<script type="text/javascript">
	var validator;
	$(document)
			.ready(
					function() {

						 if ("${message}" == "add")
						 { notifysuccess('Record Saved Successfully!!');} 
						 
						 else if ("${message}" == "update")
						 {
							 notifyupdate('Record Updated Successfully!!');
						 }else{
								$("#error").empty().html("&nbsp;<br> ${message}");    
								document.getElementById("error").style.color = "red";
							} 
						
						// no space in menu link
						$('#menu_link').keypress(function(e) {
							if (e.which === 32)
								return false;
						});
						
						$
								.ajax({
									url : "./modules-list",
									success : function(response) {
										var text = '';
										text += '<option value="0" selected="selected">Select Module</option>'
										$
												.each(
														response,
														function(index, module) {
															text += '<option value="'+module.moduleId+'">'
																	+ module.moduleName
																	+ '</option>'
														});
										$("#module_id").html(text);
										/* $("#module_id").val("${module.id}"); */
									},
									error : function() {
										 notifyerror('Error Occured');
									}
								});
						

						/* DEPARTMENT ON CHANGE  */
						var tempItemId = '';
						$("#parentMenu")
								.change(
										function() {
											var Modulavalue = $("#module_id")
													.val();
											var menuId = $("#parentMenu").val();

											if (menuId != 0) {

												$
														.ajax({
															url : "./get_menu-lists",
															type : "POST",
															data : {
																"module_id" : Modulavalue,
																"parentMenuId" : menuId
															},
															success : function(
																	response) {
																
																var text2 = ''
																if (JSON
																		.stringify(response) != '[]') {
																	$
																			.each(
																					response,
																					function(
																							index,
																							MainMenuEntityList) {
																						text2 += ""
																								+ "<tr class=\"odd\"> "
																								+ "                          <td class=\" \"> "
																								+ "                          	<span href=\"#\" onclick=\"updateMenu("
																								+ MainMenuEntityList.parentMenuId
																								+ ",'"
																								+ MainMenuEntityList.menuId
																								+ "','"
																								+ MainMenuEntityList.menuName
																								+ "','"
																								+ MainMenuEntityList.menuLink
																								+ "','"
																								+ MainMenuEntityList.menuToolTip
																								+ "','"
																								+ MainMenuEntityList.menuSrno
																								+ "','"
																								+ MainMenuEntityList.active
																								+ "')\" data-toggle=\"modal\" title=\"Edit\" class=\"fa-select\"> "
																								+ "                            <span class=\"fa fa-pencil-square\"/> "
																								+ "                            </span> "
																								+ "                          </td> "
																								+ "                          <td class=\" \">"
																								+ MainMenuEntityList.menuSrno
																								+ "</td> "
																								+ "                          <td class=\" \">"
																								+ MainMenuEntityList.menuName
																								+ "</td> "
																								+ "                          <td class=\" \">"
																								+ MainMenuEntityList.menuLink
																								+ "</td> "
																								+ "                        </tr>";

																					});
																}
																$(
																		"#menu_table tr td")
																		.remove();
																 						
																$('#menu_table')
																		.append(
																				text2);
																											},
															error : function() {
																 notifyerror('Error Occured');
															}
														});
											} else {
												$("#menu_table tr td").remove();
											}

										});

						/* DEPARTMENT ON CHANGE ENDS */

						$("#module_id")
								.change(
										function() {
											var Modulavalue = $("#module_id")
													.val();

											$("#parentMenu").empty();

											if (Modulavalue != 0) {
												$
														.ajax({
															url : "./get_menu-lists",
															type : "POST",
															data : {
																"module_id" : Modulavalue
															},
															success : function(
																	response) {
																
																var text = '';
																var text2 = ''
																text += '<option value="0" selected="selected">Select Module</option>';

																if (JSON
																		.stringify(response) != '[]') {
																	$
																			.each(
																					response,
																					function(
																							index,
																							MainMenuEntityList) {
																						text += '<option value="'+MainMenuEntityList.menuId+'">'
																								+ MainMenuEntityList.menuName
																								+ '</option>'
																						text2 += ""
																								+ "<tr class=\"odd\"> "
																								+ "                          <td class=\" \"> "
																								+ "                          	<span href=\"#\" onclick=\"updateMenu('module_id','"
																								+ MainMenuEntityList.menuId
																								+ "','"
																								+ MainMenuEntityList.menuName
																								+ "','"
																								+ MainMenuEntityList.menuLink
																								+ "','"
																								+ MainMenuEntityList.menuToolTip
																								+ "','"
																								+ MainMenuEntityList.menuSrno
																								+ "','"
																								+ MainMenuEntityList.active
																								+ "')\" data-toggle=\"modal\"  title=\"Edit\" class=\"fa-select\"> "
																								+ "                           <span class=\"fa fa-pencil-square\"/> "
																								+ "                            </span> "
																								+ "                          </td> "
																								+ "                          <td class=\" \">"
																								+ MainMenuEntityList.menuSrno
																								+ "</td> "
																								+ "                          <td class=\" \">"
																								+ MainMenuEntityList.menuName
																								+ "</td> "
																								+ "                          <td class=\" \">"
																								+ MainMenuEntityList.menuLink
																								+ "</td> "
																								+ "                        </tr>";

																					});
																}
																$(
																		"#menu_table tr td")
																		.remove();
																$("#parentMenu")
																		.html(
																				text);
																
																$('#menu_table')
																		.append(
																				text2);
																$('#call')
																		.val(
																				'update');
																// 						
																if (tempItemId != '') {
																	$(
																			"#parentMenu")
																			.val(
																					tempItemId);
																}

															},
															error : function() {

															}
														});
											} else {
												$("#parentMenu").empty();
												var text = '';
												text += '<option value="0" selected="selected">Select Module</option>';
												$("#parentMenu").html(text);
												$("#parentMenu").val(0);//.change();
												$("#menu_name").val('');
												$("#menu_link").val('');
												$("#menu_tool_tip").val('');
												$("#menu_srno").val('');
												$('#menu_table  tr td').remove();
											}

										});

						var validator = 	$("#add-edit-form")
								.validate(
										{

											// Specify the validation rules
											rules : {
												ModuleId : {
													required : {
														depends : function(
																element) {
															if ('0' == $("#module_id").val())
															{
																//Set predefined value to blank.
																$('#module_id').val('0');
															}
															return true;
														}
													}

												},

												menuName : {
													required : true
												},
												menuLink : {
													required : true
												},
												menuSerialNumber : {
													required : true
												}
											},

											// Specify the validation error messages
											messages : {
												ModuleId : {
													required : ""//,
												},
												menuName : {
													required : ""//,
												},
												menuLink : {
													required : ""//,
												},
												menuSerialNumber : {
													required : ""//,
												}
											},

											submitHandler : function(form) {
												form.submit();
											}
										});
					});

	function updateMenu(parent, id, menu_name, menulink, menutooltip, menusrno,
			status) {
		//alert(itemId+" - "+itemCode+ " - "+itemName+ " - "+minStock+ " - "+maxStock+ " - "+currentStock+ " - "+itemUnit + " - "+ deptId + " - " + complaintTypeId);

		$("#menuId").val(id);
		$("#parentMenu").val(parent);//.change();
		// 		$("#module_id").val(parent).change();
		//$("#complaintTypeId").val(complaintTypeId).change();
		$("#menu_id").val(parent);
		$("#menu_name").val(menu_name);
		$("#menu_link").val(menulink);
		$("#menu_tool_tip").val(menutooltip);
		$("#menu_srno").val(menusrno);
		// 		if( status.trim()=='1')
		// 		$("#menu_status").prop('checked','checked');
		// 		alert(status)
		$("#submit_button").text('Update');

		if (status.trim() == '1') {
			$("#menu_status").prop('checked', 'checked');
		}
		$("#add-edit-form").attr('action', './update-menu-creation');
		$("form").valid();
	}

	$("#cancel_id").click(function() {
		$("#submit_button").text('Save');
		$("#add-edit-form").attr('action', './add-menu-creation');
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
				<form action="./add-menu-creation" method="post" id="add-edit-form">
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="row">
								<div class="create_project_tbl">

									<div class="grid-header text">MENU MANAGEMENT</div>


									<!-- <div class="form-group">
										<div class="col-sm-12 ">
											<div class="col-sm-3">
												Note <b>:</b> <span style="color: #FF0000">* Marked
													Is Mandatory !</span>
											</div>
										</div>

									</div> -->
									<!-- jaskirat code start here -->

							<div class="grid box-filters">
								<div class="table-header">
                                   <div class="row">
									<div class="col-md-6">


										<input type="hidden" id="call" name="call" value="save" /> <input
											type="hidden" id="menuId" name="menuId" value="0" />

										<div class="form-horizontal">
										<span id="error"></span>
											<div class="form-group">
												<br>
												<div class="col-sm-12">
												
													<div class="col-sm-5">
														<span id="ContentPlaceHolder1_lblModule"
															class="control-label">Module <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<select id="module_id" title="module" name="ModuleId"
															class="form-control" tabindex=1>
													<option selected="selected" value="0">Please
																Select</option>
														</select> <span id="ContentPlaceHolder1_rfvmodule"
															style="display: none;"></span>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Parent</span>

													</div>
													<div class="col-sm-7">
														<select name="parentMenuId" data-toggle="modal"
															data-original-title="Add to Project" id="parentMenu"
															class="form-control" tabindex=2 >
															<option selected="selected" value="0">Please
																Select</option>
														</select>

													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblMenuName"
															class="control-label">Menu Name <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<input name="menuName" type="text" maxlength="40"
															id="menu_name" tabindex="3" class="form-control"
															onkeypress="return CheckAlphaNumeric(event,this)"
															placeholder="Enter Menu Name" tabindex=3 > <span
															id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<span id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Menu Link <span
															style="color: #FF0000; font-weight: bold">*</span></span>

													</div>

													<div class="col-sm-7">
														<input name="menuLink" type="text" maxlength="100"
															id="menu_link" tabindex="4" class="form-control"
															onkeypress="return CheckAlphaNumeric(event,this)"
															placeholder="Enter Menu Link" tabindex=4 > <span
															id="ContentPlaceHolder1_rfvMenuLink"
															style="display: none;"></span>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<span id="ContentPlaceHolder1_lblMenuToolTip"
															class="control-label">Menu ToolTip</span>
													</div>
													<div class="col-sm-7">
														<input name="menuTooltip" type="text" maxlength="40"
															id="menu_tool_tip" tabindex="5" class="form-control"
															onkeypress="return CheckAlphaNumeric(event,this)"
															placeholder="Enter Menu ToolTip " tabindex=5 >



													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<span id="ContentPlaceHolder1_lblMenusrno"
															class="control-label">Menu Sr.No. <span
															style="color: #FF0000; font-weight: bold">*</span></span>


													</div>
													<div class="col-sm-7">
														<input name="menuSerialNumber" type="text" maxlength="10"
															id="menu_srno" tabindex="6" class="form-control"
															onkeypress="return CheckNumeric(event,this)"
															placeholder="Enter  Menu Sr.Number" tabindex=6 > <span
															id="ContentPlaceHolder1_rfvMenusrno"
															style="display: none;"></span>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<span id="ContentPlaceHolder1_Label1"
															class="control-label">Status</span>

													</div>
													<div class="col-sm-7">
														<input id="menu_status" value="1" type="checkbox"
															name="menuStatus" checked="checked" tabindex=7 ><label
															for="ContentPlaceHolder1_chkActive" > Active</label>
													</div>
												</div>
											</div>

										</div>


									</div>


									<div class="col-md-6" style="padding-right: 50px">

										<div class="grid box-filters"
											style="height: 334px; position: relative; overflow: auto">

											<table id="menu_table"
												class="table table-bordered  table-checkable table-responsive  "
												id="DataTables_Table_0"
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Assign to Project: activate to sort column ascending">Select</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="ID: activate to sort column ascending">Srno</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="First Name: activate to sort column ascending">Menu</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Last Name: activate to sort column ascending">Menu
															Link</th>
													</tr>
												</thead>

												<tbody role="alert" aria-live="polite" aria-relevant="all">

												</tbody>
											</table>


										</div>
									</div>

									<!-- jaskirat code end here -->




									<div class="">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group action-btn-group">
													<div class="controls2">
														<span class="left-margin-remove"> 
															
										<button type="submit" name="submit_create_edit_team"
												title="Save" class="btn btn-xl btn-success button-submit font13" tabindex=8 >
															<span><span class="" id="submit_button">Save</span></span>
										</button>
														
														</span>
														
										<button id="cancel_id" type=reset
														title="Reset" class="btn btn-xl btn-default button-submit font13" tabindex=9 >
																	<span><span class="">Reset</span></span>
										</button>
														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<!--=== Page Content ===-->
		</div>

	</div>
	<!-- /.container -->
	<!-- /.container -->
</body>

