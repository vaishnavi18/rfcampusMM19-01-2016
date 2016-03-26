
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Merit List Generation | RFCampus</title>

<jsp:include page="../views/authentication/script.jsp" />

<!-- tab code link start here -->
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>
<style>
.ui-sortable-handle {
	margin-top: 2px;
	margin-bottom: 2px;
}
</style>



<!-- validations -->
<script type="text/javascript">
	$(document).ready(
			function() {
				//if(show_students != 0)
					$('#transfer-btn').attr('disabled', 'disabled');
				/*else
					$('#transfer-btn').attr('enabled', 'enabled');*/
				
				//function resetModelDialogBox(){
				/* $("#transfer-btn").click(){
					$("#meritText").dialog({modal: true});
				});
				 */
				//.dialog({ modal: true });

				if ("${message}" != "") {
					notifysuccess('${message}');
				}
				jQuery.validator.addMethod('selectcheck', function(value) {
					return (value != '0');
				}, "");

				var validator = $("#sessionVal").validate({

					rules : {
						sessionId : {
							required : true,
							selectcheck : true
						},
						degreeId : {
							required : true,
							selectcheck : true
						}
					},

					messages : {

						sessionId : {
							required : "",
							selectcheck : ""
						},
						degreeId : {
							required : "",
							selectcheck : ""
						//,
						}
					},

					submitHandler : function(form) {
						//form.submit();
					}
				});

				$("#submit_button").click(function() {
					if ($("#sessionVal").valid()) {
						add_to_filter();
						$("#submit_button").attr('action', './add_to_filter');
					}

				});

				$("#submit_button").validate({
					// Specify the validation rules
					rules : {

						sessionId : {
							required : true
						//,
						}
					},

					// Specify the validation error messages
					messages : {
						sessionId : {
							required : ""//,
						}
					},

					submitHandler : function(form) {
						form.submit();
					}
				});

				$("#reset-general-information-btn").click(function() {
					validator.resetForm();
					$("#sessionId").val('0');
					$("#degreeId").val('0');
					$("#meritListName").val('');
					$("#conditionId").val('0');
					$("#operatorId").val('');
					$("#conditionValue").val('0');

				});

				$("#sessionId, #degreeId").change(
						function() {
							var sessionId = $("#sessionId").val();
							var degreeId = $("#degreeId").val();

							if (sessionId != 0 && degreeId != 0) {
								var text = 'Merit List For '
										+ $("#degreeId option:selected").text()
										+ ' '
										+ $("#sessionId option:selected")
												.text();
								$("#meritListName").val(text);
							}
						});

			});
</script>

<script type="text/javascript">
	var studentJsonArrayString = new Array();
	var studentJsonArray = new Array();
	var formData;
	$(document)
			.ready(
					function() {

						var adjustment;

						$("ol.simple_with_animation")
								.sortable(
										{
											group : 'simple_with_animation',
											pullPlaceholder : false,
											// animation on drop
											onDrop : function($item, container,
													_super) {
												alert()
												var $clonedItem = $('<li/>')
														.css({
															height : 0
														});
												$item.before($clonedItem);
												$clonedItem.animate({
													'height' : $item.height()
												});

												$item.animate($clonedItem
														.position(),
														function() {
															$clonedItem
																	.detach();
															_super($item,
																	container);
														});
											},

											// set $item relative to cursor position
											onDragStart : function($item,
													container, _super) {
												var offset = $item.offset(), pointer = container.rootGroup.pointer;

												adjustment = {
													left : pointer.left
															- offset.left,
													top : pointer.top
															- offset.top
												};

												_super($item, container);
											},
											onDrag : function($item, position) {
												$item.css({
													left : position.left
															- adjustment.left,
													top : position.top
															- adjustment.top
												});
											}
										});

						$
								.ajax({
									async : false,
									url : "./academic/admission-notification/active-degrees",
									type : "POST",
									success : function(response) {
										//alert(JSON.stringify(response));
										var jsonOb = JSON.parse(JSON
												.stringify(response));
										var text = "<option selected=\"selected\" value=\"0\">Please Select</option>";
										$
												.each(
														jsonOb,
														function(index, degree) {
															text += "<option value=\""+degree .id+"\">"
																	+ degree.degreeName
																	+ "</option>";
														});
										$("#degreeId").empty().html(text);

									},
									error : function() {
										notifyerror('Error Occured');
									},
								});

						$("#move-record-btn")
								.click(
										function() {
											var groupOne;
											var groupTwo = '';
											var groupOneText;
											var groupTwoText = ' ( ';
											var value;

											$.each($(".group-1-radio"),
													function() {
														if ($(this).is(
																":checked")) {
															groupOne = $(this)
																	.val();
															groupOneText = $(
																	this)
																	.parent()
																	.next()
																	.html();
														}
													});

											$.each($(".group-2-radio"),
													function() {
														if ($(this).is(
																":checked")) {
															groupTwo += $(this)
																	.val()
																	+ '$';
															groupTwoText += $(
																	this)
																	.parent()
																	.next()
																	.html()
																	+ ", ";
														}
													});

											groupTwo = new String(groupTwo);
											groupTwo = groupTwo.substring(0,
													groupTwo.length);
											value = groupOne + "#" + groupTwo;
											var condition_is = groupOneText
													+ ' =  ' + groupTwoText;

											var row3 = ""
													+ "<tr class=\"odd\" > "
													+ " "
													+ "<td><input type=\"hidden\" class=\"all-conditions\""
	    	 + "id=\"restriction\" name=\"restriction\" value='"+value+"' /> "
													+ "<input type=\"hidden\" "
	    	 + "id=\"group_three_value_1\" value='' /> "
													+ ""
													+ condition_is
													+ " "
													+ "</td> "
													+ "																					 "
													+ "<td> "
													+ "<div  class=\"fa-myremove\" title=\"Delete\" onclick=\"remove_this(this)\"> "
													+ "		<i class=\"fa fa-trash-o\"></i>"
													+ "</div> " + "</td> "
													+ " " + "</tr>";
											// 	     }
											//									$('#group3').append(row3);
											var docs = $('#tbodyid').children(
													'tr');
											/* alert(docs); */
											var added = false;
											docs.each(function(i, item) {
												if ($(item).children("td")
														.text() == "") {
													$(item).replaceWith(row3);
													added = true;
													return false;
												}
											});
											if (!added) {
												$("#tbodyid").append(row3);
											}
										});
					});

	/*  Date and time picker start here */
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

		$("#show_students")
				.click(
						function() {

							var valid = $("#sessionVal").valid();

							if (valid == true) {
								var categoryId = $("#categoryId").val();
								//	var religionId = $("#religionId").val();
								var conditions = '';
								var orderedColumns = '';
								$("#student-record").empty();

								$.each($(".all-conditions"), function() {
									conditions += $(this).val() + ",";
								});

								$.each($(".ui-sortable-handle"), function() {
									console.log($(this).attr('role'));
									orderedColumns += $(this).attr('role')
											+ ','

								});

								$
										.ajax({
											async : false,
											url : "./academic/studentMeritList/generate",
											type : "POST",
											data : {
												//"category" : categoryId,
												"restriction" : conditions,
												"orderedColumns" : orderedColumns
											},
											success : function(response) {
												//alert(JSON.stringify(response));
												var jsonOb = JSON.parse(JSON
														.stringify(response));
												var text = '';
												var gender;
												var serialNumber = 1;
												if (JSON.stringify(response) != '[]') {
													$
															.each(
																	jsonOb,
																	function(
																			index,
																			student) {

																		if (student.gender == 1) {
																			gender = 'Male';
																		} else if (student.gender == 2) {
																			gender = 'Female';
																		} else {
																			gender = 'Transgender';
																		}

																		text += "<tr class=\"odd\">"
																				+ ""

																				+ "	<td>"
																				+ serialNumber
																				+ "</td>"
																				+ "	<td>"
																				+ student.applicationId
																				+ "</td>"
																				+ "	<td>"
																				+ student.studentName
																				+ " </td>"
																				+ "	<td>"
																				+ student.fatherName
																				+ "</td>"
																				+ "	<td>"
																				+ student.lastName
																				+ "</td>"
																				+ "	<td>"
																				+ gender
																				+ "</td>"
																				+ "	<td>"
																				+ student.entranceExamRank
																				+ "</td>"
																				+ "	<td>"
																				+ student.category
																				+ "</td>"
																				+ "</tr>";

																		studentJsonArray
																				.push({
																					"studentId" : student.id,
																					"serialNumberMeritlist" : serialNumber
																				});
																		serialNumber++;
																	});

													$("#student-record").empty();
													$("#student-record").html(text);
													
													
													
													$('#transfer-btn').removeAttr('disabled');
													
												} else {
													$('#transfer-btn').attr('disabled', 'disabled');
												}

											},
											error : function() {
												notifyerror('Error Occured');
											}
										});
							} else {

							}

						});

		$("#transfer-btn").click(
				function() {
					alert("hi");
					studentJsonArrayString = new Array();

					$.each(studentJsonArray, function(index, ob) {
						studentJsonArrayString.push(JSON.stringify(ob));

					});

					var sessionId = $("#sessionId").val();
					var degreeId = $("#degreeId").val();
					var meritListName = $("#meritListName").val();
					//var meritListName = $("#meritListName").val();
					var meritListId = "";

					formData = new FormData();
					formData.append("sessionId", sessionId);
					formData.append("degreeId", degreeId);
					formData.append("meritListName", meritListName);
					//formData.append("meritListName", meritListName);
					formData.append("studentList", new String(
							studentJsonArrayString));

					$.ajax({
						async : false,
						url : "./academic/studentMeritList/transfer",
						type : "POST",
						data : formData,
						processData : false,
						contentType : false,
						success : function(response) {
							meritListId = response;
							
							/* if (student-record != null) 
								$("#show_student").attr("disabled", false);
							else
								$("#show_student").attr("disabled", true); */
							
								
							resetAllFields();
							$("#transfer-btn").attr(
									'href',
									"./show-merit-list-report?meritListId="
											+ response);
							
						},
						error : function() {
							notifyerror('Error Occured');
						},
					});
				});

	});
	function resetAllFields(){
		$("#sessionId, #degreeId, #conditionId, #operatorId, #conditionValue").val(0);
		$('#transfer-btn').attr('disabled', 'disabled');
		$("#meritListName").val('');
		$("#menu_table_group2_body, #menu_table_condition_body, #student-record").empty();
		$('#group3').html($("#tbodyid").html('<tr><td style="height: 32px;width: 166px"></td><td></td></tr>'+
											'<tr><td style="height: 32px;width: 166px"></td><td></td></tr>'+
											'<tr><td style="height: 32px;width: 166px"></td><td></td></tr>'+
											'<tr><td style="height: 32px;width: 166px"></td><td></td></tr>'+
											'<tr><td style="height: 32px;width: 166px"></td><td></td></tr>'+
											'<tr><td style="height: 32px;width: 166px"></td><td></td></tr>'+
											'<tr class="emptyRow"><td style="height: 32px;width: 166px"></td><td></td></tr>'));
	}

</script>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/css/select2.js"></script>


<!--category function  -->
<script>
	function getgroup2(obj) {
		var tableId = obj.id.trim();
		var db_table = (document.getElementById(tableId).value);
		if (tableId != '') {
			$
					.ajax({
						url : "./getList",
						type : "GET",
						data : {
							"groupId" : tableId,
						},
						success : function(response) {
							//alert(response)
							var text2 = ''
							if (JSON.stringify(response) != '') {

								switch (tableId) {

								case "categoryList": {

									var jsonOb = JSON.parse(JSON
											.stringify(response.categoryList));
									$
											.each(
													response.categoryList,
													function(index,
															categoryList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" class=\"group-2-radio\" value=\""+categoryList.id+"\" name=\"test\" /> <label>Field</label></td> "
																+ "<td>"
																+ categoryList.name
																+ "</td>"
																+ "</tr>";
													});
									break;
								} // case end here

								default: {
									alert('default');
								}

								} // switch end here

								//	alert(text2)
								$('#group2').empty().append(text2);
							}
						},
						error : function() {
							notifyerror('Error Occured');
						}
					});
		} else {
			$("#group2").empty();
		}

	}

	$(function() {
		$("#tabs").tabs();
		$(".js-example-basic-multiple").select2();
	});
</script>
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
						<div class="row">
							<div class="create_project_tbl">
								<div class="grid-header text">STUDENT MERIT LIST</div>
							</div>
							<!-- jaskirat code start here -->
							<!-- 	$('div').filter(function)
							return	parseInt($(this).attr('id')>) -->



							<div class="box-header" style="top: 5px;">
								<div class="box-name">
									<i class="fa fa-table"></i> <span><b>Merit List
											Criteria</b></span>
								</div>
							</div>
							<div class="row my-bg-success">
								<div class="col-sm-12 ">
									<!--left div start here -->
									<div class="col-md-6">
										<div class="form-horizontal">
											<form id="sessionVal">
												<!--for Session Display  -->
												<div class="form-group">
													<br>
													<div class="row">
														<div class="col-sm-4">
															<div id="ContentPlaceHolder1_lblModule"
																class="control-label">
																Session <span style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<select id="sessionId" onkeyup="sync()" title="module"
																name="sessionId" class="form-control"
																style="padding-top: 1.5;">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${sessionList}" var="session">
																	<option value="${session.id}">${session.sessionName}</option>
																</c:forEach>
															</select> <span id="ContentPlaceHolder1_rfvmodule"
																style="display: none;"></span>
														</div>

													</div>
												</div>

												<!--  for Degree Type -->
												<div class="form-group">
													<br>
													<div class="row">
														<div class="col-sm-4">
															<div id="ContentPlaceHolder1_lblModule"
																class="control-label">
																Degree <span style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<select name="degreeId" id="degreeId" tabindex="7"
																class="form-control" style="padding-top: 1.5;">

															</select>
														</div>
													</div>
												</div>
											</form>

											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-sm-4">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">Report Name</div>
													</div>
													<div class="col-sm-7">
														<input name="meritListName" type="text" id="meritListName"
															maxlength="300" id="meritListName" tabindex="5"
															class="form-control" placeholder="Report Name">
													</div>
												</div>
											</div>

											<br>
										</div>
									</div>
									<!--  -->
									<div class="col-md-6">
										<div class="form-horizontal">
											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-sm-4">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">Condition</div>
													</div>
													<div class="col-sm-7">
														<select name="conditionId" id="conditionId" tabindex="7"
															class="form-control" style="padding-top: 1.5;">
															<option selected="selected" value="0">Please
																Select</option>
															<option value="1">10th</option>
															<option value="2">12th</option>
															<option value="3">Number of Student</option>
														</select>
													</div>
												</div>
											</div>

											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-sm-4">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">Operator</div>
													</div>
													<div class="col-sm-7">
														<select name="operatorId" id="operatorId" tabindex="7"
															class="form-control" style="padding-top: 1.5;">
															<option selected="selected" value="0">Please
																Select</option>
															<option value="<"><</option>
															<option value=">">></option>
															<option value="=">=</option>
															<option value="<="><=</option>
															<option value=">=">>=</option>
														</select>
													</div>
												</div>
											</div>

											<div class="form-group">
												<br>
												<div class="row">
													<div class="col-sm-4">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">Value</div>
													</div>
													<div class="col-sm-7">
														<input name="conditionValue" type="text"
															id="conditionValue" maxlength="3" id="marksObtained"
															tabindex="5" class="form-control" placeholder="Value">
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group action-btn-group">
									<div class="controls2">
										<span class="left-margin-remove">
											<button type="button" id="submit_button"
												name="submit_create_edit_team" title="Filter Records"
												class="btn btn-xl btn-warning button-submit font13">
												Filter Records</button>
										</span>
										<button id="reset-general-information-btn" type="reset"
											title="Reset"
											class="btn btn-xl btn-default button-submit font13">
											Reset</button>
									</div>
								</div>
							</div>


							<!-- All shift tabel code start here -->
							<div class="row my-bg-success">
								<div class="col-md-3">
									<!-- TABLE CODE START HERE -->
									<div class="col-md-12">
										<div
											style="border-style: ridge; width: 225px; padding-left: 0px; padding-right: 0px">
											<table id="menu_table"
												style="width: 220px; padding-left: 0px; padding-right: 0px"
												class="table table-bordered  table-checkable table-responsive  "
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th style="width: 85px">Group 1</th>
														<th>Filter Name</th>
													</tr>
												</thead>
											</table>

											<div class=""
												style="height: 227px; position: relative; overflow: auto; width: 220px; margin-top: -5px;">
												<table id="group1"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input
																id="categoryList" type="radio" value='4'
																class="group-1-radio" name='group_one'
																onclick="getgroup2(this);" />
															<td>Category</td>
														</tr>
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input id=""
																type="hidden" value='4' class="group-1-radio"
																name='group_one' onclick="" />
															<td></td>
														</tr>
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input id=""
																type="hidden" value='4' class="group-1-radio"
																name='group_one' onclick="" />
															<td></td>
														</tr>
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input id=""
																type="hidden" value='4' class="group-1-radio"
																name='group_one' onclick="" />
															<td></td>
														</tr>
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input id=""
																type="hidden" value='4' class="group-1-radio"
																name='group_one' onclick="" />
															<td></td>
														</tr>
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input id=""
																type="hidden" value='4' class="group-1-radio"
																name='group_one' onclick="" />
															<td></td>
														</tr>
														<tr class="odd">
															<td style="width: 85px; height: 32px;"><input id=""
																type="hidden" value='4' class="group-1-radio"
																name='group_one' onclick="" />
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<!-- TABLE CODE END HERE -->
								</div>

								<div class="col-md-3">
									<!-- TABLE CODE START HERE -->
									<div class="col-md-12 ">
										<div
											style="border-style: ridge; width: 255px; padding-left: 0px; padding-right: 0px">
											<table id="menu_table_group2"
												style="width: 250px; padding-left: 0px; padding-right: 0px"
												class="table table-bordered  table-checkable table-responsive  "
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th style="width: 120px">Group 2</th>
														<th>Multi Select</th>
													</tr>
												</thead>
												<tbody id="menu_table_group2_body">

												</tbody>
											</table>

											<div class=""
												style="height: 200px; position: relative; overflow: auto; width: 250px; margin-top: -5px;">
												<table id="group2"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<!--checkbox removed  -->
														<!-- <tr class="odd">
														<td style="width: 85px"><input type="checkbox"
														name="group_two" /> <label>1</label></td>
														<td>red</td>
													</tr> -->
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 120px;"></td>
															<td></td>
														</tr>

													</tbody>
												</table>
											</div>

											<p class="signin_btn">
												<button type="button" id="move-record-btn"
													title="Select Condition from Group-1 and Move Record"
													style="position: relative; margin: auto; width: 100%"
													class="  btn btn-xl btn-warning button-submit font13 ">
													Move Record</button>
											</p>
										</div>
									</div>
									<!-- TABLE CODE END HERE -->
								</div>

								<div class="col-md-3">
									<!-- TABLE CODE START HERE -->
									<div class="col-md-12">
										<div
											style="border-style: ridge; width: 255px; padding-right: 0px; padding-left: 0px">
											<table id="menu_table_condition"
												style="width: 250px; padding-right: 0px; padding-left: 0px"
												class="table table-bordered  table-checkable table-responsive  "
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th style="width: 166px">Value</th>
														<th>Delete</th>

													</tr>
												</thead>
												<tbody id="menu_table_condition_body"></tbody>
											</table>

											<div class=""
												style="height: 200px; position: relative; overflow: auto; width: 250px; margin-top: -5px;">
												<table id="group3"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<tbody role="alert" aria-live="polite" aria-relevant="all"
														id="tbodyid">
														<tr>
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
														<tr>
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
														<tr class="emptyRow">
															<td style="height: 32px; width: 166px"></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>

											<p class="signin_btn">
												<button type="button" id="show_students" title="Show Record"
													style="position: relative; margin: auto; width: 100%"
													class="  btn btn-xl btn-primary button-submit font13 ">
													Show Record</button>
											</p>
										</div>
									</div>
									<!-- TABLE CODE END HERE -->
								</div>

								<div class="col-md-3">
									<div class="col-md-12">
										<div
											style="border-style: ridge; width: 120px; padding-left: 0px; padding-right: 0px">
											<table id="menu_table"
												style="padding-left: 0px; padding-right: 0px"
												class="table table-bordered  table-checkable table-responsive  "
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th style="width: 85px">Ordered By</th>
													</tr>
												</thead>
											</table>
											<div class=""
												style="height: 227px; position: relative; overflow: auto; margin-top: -5px;">
												<ol class="simple_with_animation vertical"
													style="padding-top: 0px;">
													<c:forEach items="${orderByList}" var="orderBy">
														<li class="form-control" role="${orderBy.columnName}">${orderBy.displayName}</li>
													</c:forEach>
												</ol>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- Al SHift table end eher -->
							<!--Table list start here -->
							<div class="row my-bg-success">
								<!-- TABLE CODE START HERE -->
								<div class="col-md-12">

									<div class=""
										style="height: 295px; position: relative; overflow: auto; margin-top: 10px; border-style: ridge;">
										<table id="tabletwo"
											class="table table-bordered  table-checkable table-responsive"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th>Sr No</th>
													<th>Application Id</th>
													<th>First Name</th>
													<th>Middle Name</th>
													<th>Last Name</th>
													<th>Gender</th>
													<th>All India Rank</th>
													<th>Category</th>
												</tr>
											</thead>
											<tbody id="student-record">

											</tbody>
										</table>
									</div>
								</div>
								<!-- TABLE CODE END HERE -->

								<div class="col-md-12">
									<div class="form-group action-btn-group">
										<div class="controls2">
											<span class="left-margin-remove"> <!-- <a href="./academic/generate-merit-list"> -->

												<!-- <button type="button" id="transfer-btn" 
														name="submit_create_edit_team" title="Generate Merit List"
														class="btn btn-xl btn-primary button-submit font13">  
															 Generate Merit List</button> --> 
															 <a target="_blank"
												href="${pageContext.request.contextPath}/show-merit-list-report?meritListId= 210 "
												type="button" id="transfer-btn" title="Generate Merit List"
												class="btn btn-xl btn-primary button-submit font13">
													Generate Merit List</a> <%-- <input name="meritListName" type="button" 
														id="meritListName" tabindex="3" class="form-control"
														onkeypress="return CheckAlphaNumeric(event,this)"
														placeholder="Merit List Name" value="${meritListName}"> <span
														id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>
														<span><span class="" id="">Enter Merit List Name </span></span> --%>
												<!-- </a> -->
											</span>
										</div>
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

	<script>
		function add_to_filter() {
			var condition = document.getElementById("conditionId").value;
			var operator = document.getElementById("operatorId").value;
			var conditionValue = document.getElementById("conditionValue").value;
			var value = condition + "#" + operator + "#" + conditionValue;

			var condition_is = $(
					"#conditionId option[value='" + $("#conditionId").val()
							+ "']").text()
					+ ' ' + operator + ' ' + conditionValue;

			/* for duplicate condition checking */

			/*	
			  var reports = $('table#group3 >tr');
			    var tr1 = reports.find('td:not(:contains('+condition_is+'))');
			    if (tr1) {
			        alert('no such condition exists');
			    } else {
			        alert('such condition exists');
			    } 
			    /* end of check-1 */

			/*if(tbl1=='numberof'){
				 condition_is = ' Number of Student ' + ' ' + tbl1 + '  ' + value_is;
			}else{
			
			/* 	condition_is = tbl + '   '+tbl1 + ' ' + value_is ; */
			/* }*/

			/* end of check-2 */

			var row3 = ""
					+ "<tr class=\"odd\" > "
					+ " "
					+ "<td><input type=\"hidden\" class=\"all-conditions\""
		    	 + "id=\"restriction\" name=\"restriction\" value='"+value+"' /> "
					+ "<input type=\"hidden\" "
		    	 + "id=\"group_three_value_1\" value='' /> "
					+ ""
					+ condition_is
					+ " "
					+ "</td> "
					+ "																					 "
					+ "<td> "
					+ "<div  class=\"fa-myremove\" title=\"Delete\" onclick=\"remove_this(this)\"> "
					+ "		<i class=\"fa fa-trash-o\"></i>" + "</div> "
					+ "</td> " + " " + "</tr>";

			var docs = $('#tbodyid').children('tr');
			/* alert(docs); */
			var added = false;
			docs.each(function(i, item) {
				if ($(item).children("td").text() == "") {
					$(item).replaceWith(row3);
					added = true;
					return false;
				}
			});
			if (!added) {
				$("#tbodyid").append(row3);
			}

		}

		/*  $('#group3').append(row3); */

		function remove_this(row) {

			row.closest('tr').remove();
			$("#tbodyid")
					.append(
							'<tr><td style="height: 32px;width: 166px"></td><td></td></tr>');
		}

		/* function add_filter(row)
		{
			row.add()
			return $(this).attr("id")
		}) 
		 */
	</script>
	<!-- /.container -->
	<!-- /.container -->
</body>

