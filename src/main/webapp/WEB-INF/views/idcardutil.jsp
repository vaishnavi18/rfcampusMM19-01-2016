<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Id Card Util | RF-Campus</title>

<jsp:include page="../views/authentication/script.jsp" />

<script type="text/javascript"
	src="<c:url value="/resources/plugins/datetimepicker/jquery.datetimepicker.full.js"/>"></script>
<link
	href="<c:url value="/resources/plugins/datetimepicker/jquery.datetimepicker.css"/>"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="<c:url value="/resources/plugins/multiselect/jquery.multiselect.js"/>"></script>


<link
	href="<c:url value="/resources/plugins/multiselect/jquery.multiselect.css"/>"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						if ("${message}" != "") {
							notifysuccess('${message}');
						}

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '' && value != '0');
						}, "");
						var validator = $("#add-edit-form").validate({
							// Specify the validation rules
							rules : {
								acadamicSessionId : {
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
								}
							},

							// Specify the validation error messages
							messages : {
								acadamicSessionId : {
									required : "",
									selectcheck : ""
								},
								degreeId : {
									required : "",
									selectcheck : ""
								},
								branchId : {
									required : "",
									selectcheck : ""
								},
								semesterId : {
									required : "",
									selectcheck : ""
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
							$("#branchId").val('0');
							$("#semesterId").val('0');

						});

						$("#print_roll_list_button")
								.click(
										function() {
											var flag = $("#add-edit-form")
													.valid();
											if (flag) {
												//alert("report roll list");
												var degreeId = $('#degreeId')
														.val();
												var branchId = $('#branchId')
														.val();
												var semesterId = $(
														'#semesterId').val();
												//var batchId =$('//#bat')

												/* var genderSymbol = $('#gender_name')
														.val(); */
												/*  */

												var genderSymbol = $(
														"input[name=symbol]:checked")
														.val();

												var url2 = ('./rollNumberReport?genderSymbol='
														+ genderSymbol
														+ '&degreeId='
														+ degreeId
														+ '&branchId='
														+ branchId
														+ '&semesterId=' + semesterId);
												window.open(url2, '_blank');
												resetAllFields();
											}
										});

						$("#print_idcard_button")
								.click(
										function() {
											var flag = $("#add-edit-form")
													.valid();
											if (flag) {
												var degreeId = $('#degreeId')
														.val();
												var branchId = $('#branchId')
														.val();
												var semesterId = $(
														'#semesterId').val();
												//validator.resetForm();
												var url1 = ('./idCardReport?degreeId='
														+ degreeId
														+ '&branchId='
														+ branchId
														+ '&semesterId=' + semesterId);
												window.open(url1, '_blank');
												resetAllFields();
											}
										});

						$("#show_button")
								.click(
										function() {
											var valid = $("#add-edit-form")
													.valid();
											if (valid == true) {
												var degreeId = $('#degreeId')
														.val();
												var branchId = $('#branchId')
														.val();
												var semesterId = $(
														'#semesterId').val();
												$
														.ajax({
															async : false,
															url : "./academic/student/info1",
															data : {
																"degreeId" : degreeId,
																"branchId" : branchId,
																"semesterId" : semesterId
															},
															type : "POST",
															success : function(
																	response) {
																//alert(JSON.stringify(response)); 
																var standardFees = JSON
																		.parse(JSON
																				.stringify(response));
																var text = '';

																if (JSON
																		.stringify(response) != '[]') {
																	enrollmentIds = '';
																	$
																			.each(
																					standardFees,
																					function(
																							index,
																							student) {

																						text += " <tr class=\"odd\">"
																								+ "	<td><input class=\"enrollment-number-class\" type=\"checkbox\" id=\"\" checked=\"checked\" value=\""+student.enrollmentNumber+"\"></td>"
																								+ "<td class=\" \">"
																								+ student.enrollmentNumber
																								+ "</td>"
																								+ "				<td class=\" \">"
																								+ student.registrationNumber
																								+ "</td>"
																								+ "				<td class=\" \">"
																								+ student.rollNumber
																								+ "</td>"
																								+ "				<td class=\" \">"
																								+ student.studentFirstName
																								+ " "
																								+ student.studentMiddleName
																								+ " "
																								+ student.studentLastName
																								+ "</td>"
																								+ "				<td class=\" \">"
																								+ student.branchShortName
																								+ "</td>"
																								+ "				<td class=\" \">"
																								+ student.genderName
																								+ "</td>"
																								+ "				<td class=\" \">"
																								+ student.semesterName
																								+ "</td>"
																								+ "	</tr>";

																					});

																	$(
																			'#student-list')
																			.empty()
																			.html(
																					text);
																	$(
																			'#demandtable')
																			.dataTable()
																			.fnDestroy();
																	$(
																			'#demandtable')
																			.dataTable(
																					{
																						"bDestroy" : true,
																						"ajax" : "data.json"
																					});
																}
																/* $('#feeHeadBody').empty(); */

															}
														});
												/*$/* ("#create-selected-demand-btn")
														.attr("style", "");
												 *///}
												/* show address list */
												$("#print_address_list")
														.click(
																function() {

																	var degreeId = $(
																			'#degreeId')
																			.val();
																	var branchId = $(
																			'#branchId')
																			.val();
																	var semesterId = $(
																			'#semesterId')
																			.val();
																	var name = $(
																			"input[name=Name]:checked")
																			.val();
																	var address = $(
																			"input[name=Address]:checked")
																			.val()
																	//$("input[name=Address]:checked").val()
																	//$("input[name=Name]:checked").val()
																	var url3 = ('./addressReport?degreeId='
																			+ degreeId
																			+ '&branchId='
																			+ branchId
																			+ '&semesterId='
																			+ semesterId
																			+ '&name='
																			+ name
																			+ '&address=' + address);
																	window
																			.open(
																					url3,
																					'_blank');
																	resetAllFields();

																});

											}
										});

						$("#print_admission_register")
								.click(
										function() {
											var flag = $("#add-edit-form")
													.valid();//alert("hi");
											if (flag) {
												var degreeId = $('#degreeId')
														.val();
												var branchId = $('#branchId')
														.val();
												var semesterId = $(
														'#semesterId').val();
												var reportType = $(
														"input[name=addReg]:checked")
														.val();
												//var addressRegister = $("input[name=addReg]:checked").val();

												var url = ('./horizontalRegistrationReport?degreeId='
														+ degreeId
														+ '&branchId='
														+ branchId
														+ '&semesterId='
														+ semesterId
														+ '&reportType=' + reportType);
												//alert(url);
												window.open(url, '_blank');
												resetAllFields();
											}
										});

						//vertical report
						$("#print_admission_register")
								.click(
										function() {
											//alert("hi");
											var flag = $("#add-edit-form")
													.valid();
											if (flag) {
												var degreeId = $('#degreeId')
														.val();
												var branchId = $('#branchId')
														.val();
												var semesterId = $(
														'#semesterId').val();

												var addressRegister = $(
														"input[name=addReg]:checked")
														.val();

												var url = ('./verticalRegistrationReport?degreeId='
														+ degreeId
														+ '&branchId='
														+ branchId
														+ '&semesterId=' + semesterId);
												//alert(url);
												window.open(url, '_blank');
												resetAllFields();
											}
										});

						//end of it

						$("#degreeId")
								.change(
										function() {
											//$("#loading-image").show();
											var degreeId = $(this).val();

											if (degreeId != 0) {
												$
														.ajax({
															async : false,
															url : "./branch/getBranchByDegree",
															type : "POST",
															data : {
																"degreeId" : ""
																		+ degreeId
															},
															success : function(
																	response) {
																//alert(response);
																var jsonOb = JSON
																		.parse(JSON
																				.stringify(response))
																var text = "<option selected=\"selected\" value=\"0\">Please Select Branch</option>";
																$
																		.each(
																				jsonOb,
																				function(
																						index,
																						branch) {
																					text += "<option value=\""+branch.id+"\">"
																							+ branch.branchShortName
																							+ "</option>";
																				});
																$("#branchId")
																		.empty()
																		.html(
																				text);
															},
															error : function() {
																alert('error1...');
															},
														});
											} else {
												$("#branchId").find(
														"option:gt(0)")
														.remove();
											}
											$("#loading-image").hide();
										});
						$("#loading-image").hide();

					});

	function resetAllFields() {
		$("#acadamicSessionId, #degreeId, #branchId, #semesterId").val(0);
		$('#student-list').empty();
	}

	function showList() {
		var degreeId = $("#degreeId").val();
		var branchId = $("#branchId").val();
		var semesterId = $("#semesterId").val();
		var acadamicSessionId = $("#acadamicSessionId").val();

		var formData = new FormData();
		formData.append("degreeId", degreeId);
		formData.append("branchId", branchId);
		formData.append("semesterId", semesterId);
		formData.append("acadamicSessionId", acadamicSessionId);

		$.ajax({
			async : false,
			url : "./studentinfo?util=idcard",
			type : "GET",
			data : formData,
			processData : false,
			contentType : false,
			success : function(response) {
				//alert(response);
				if (response != 0) {
					if (demandForflag == 1) {
						alert(' All Student');
					} else {
						alert('No List');
					}
				}
			},
			error : function() {
				notifyerror('error...');
			},
		});
		$("#loading-image").hide();
	}
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
				<form action="" method="" id="add-edit-form">
					<input type="hidden" id="id" name="id" value="0" />
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="grid box-filters">
								<div class="table-header">
									<div class="row">
										<div class="create_project_tbl">
											<div class="grid-header text">Students Utility</div>

											<div class="form-group">
												<div class="col-sm-12 ">
													<div class="col-sm-3">
														Note <b>:</b> <span style="color: #FF0000">* Marked
															Is Mandatory !</span>
													</div>
												</div>
											</div>

											<!-- jaskirat code start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">
														<br>
														<div class="col-sm-12" id="degree-list">
															<div class="col-sm-6">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Admission Batch<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-6">
																<select name="acadamicSessionId" id="acadamicSessionId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Batch</option>
																	<c:forEach items="${academicSessionList}" var="session">
																		<option value="${session.id}">${session.sessionName}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-6">
																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Degree<span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-6">
																<select name="degreeId" id="degreeId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Degree</option>
																	<c:forEach items="${degreeList}" var="degree">
																		<option value="${degree.id}">${degree.degreeName}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</div>

												</div>
												<!-- form-horizontal code ends here-->
											</div>
											<!-- col-md-6 code ends here-->

											<!-- col-md-6 code starts here-->
											<div class="col-md-6" style="padding-right: 50px">
												<div class="form-horizontal">
													<br>
													<div class="form-group">
														<div class="col-sm-12" id="degree-list">
															<div class="col-sm-6">
																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Branch<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-6">
																<select name="branchId" id="branchId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Branch</option>
																</select>
															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12" id="degree-list">
															<div class="col-sm-6">
																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Semester<span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-6">
																<select name="semesterId" id="semesterId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Student</option>
																	<c:forEach items="${semesterList}" var="semester">
																		<option value="${semester.id}">${semester.semesterName}</option>
																	</c:forEach>
																</select>
															</div>
														</div>
													</div>

												</div>
											</div>
											<!-- col-md-6 code ends here-->


											<!-- checkbox button code starts here-->
											<div class="">
												<div class="row">
													<div class="col-sm-12" style="text-align: center">

														<div class="form-group">


															<!-- checkbox code ends here -->
															<br>
															<!-- button code starts here-->
															<button type="button" title="Show Students"
																id="show_button" class="btn btn-xl btn-success font13">
																Show Student</button>





															<button id="reset-general-information-btn" type="reset"
																title="Reset"
																class="btn btn-xl btn-default button-submit font13">
																Reset</button>


															<!-- button code ends here-->

														</div>
													</div>
												</div>

												<c:if test="${utilityType == 'idcard'}">
													<div>
														<div class="grid-header text">ID Card</div>
														<br>

														<button type="button" title="Print_Icards"
															id="print_idcard_button"
															class="btn btn-xl btn-success font13">Print
															ID-Card</button>

													</div>
												</c:if>

												<c:if test="${utilityType == 'roll-list'}">
													<div>
														<div class="grid-header text">Roll List</div>
														<br>
														<div class="col-sm-6" style="">
															<input type="radio" name="symbol" value="1"
																id="gender_name1" class="btn btn-xl btn-success font13">
															<span><b>* <input type="radio" name="symbol"
																	value="2" id="gender_name2"
																	class="btn btn-xl btn-success font13"> #
															</b></span> <br> <br>Select */# to identify the female
															students! <br> <br>

															<button type="button" title="Print_Roll_List"
																id="print_roll_list_button"
																class="btn btn-xl btn-success font13">Print
																Roll List</button>

															<br>



														</div>
													</div>
												</c:if>





												<c:if test="${utilityType == 'addresslist'}">
													<div>
														<div class="grid-header text">Address List Criteria</div>
														<div class="col-sm-12">
															<div class="col-sm-3"></div>
															<div class="col-sm-3">
																<div class="btn-group">
																	<input type="radio" name="Name" value="1"
																		id="student_name"> <span class="control-label">Student
																		Name</span><br>
																	<br> <input type="radio" name="Name" value="2"
																		id="father_name"> <span class="control-label">Father
																		Name</span><br>
																	<br> <input type="radio" name="Name" value="3"
																		id="guardian_name"> <span
																		class="control-label">Guardian Name</span><br>
																</div>
															</div>
															<div class="col-sm-3">
																<div class="btn-group">
																	<input type="radio" name="Address"
																		id="student_local_address" value="1"> <span
																		class="control-label">Local Address</span> <br> <br>
																	<input type="radio" name="Address"
																		id="permanent_address" value="2"> <span
																		class="control-label">Permanent Address</span> <br>
																	<br> <input type="radio" name="Address"
																		id="guardian_name" value="3"> <span
																		class="control-label">Guardian Address</span><br>
																</div>
															</div>
															<div class="col-sm-3"></div>
														</div>
														<br>
														<div class="col-sm-12" style="text-align: center">
															<br> <br>
															<button type="button" title="Address List"
																id="print_address_list"
																class="btn btn-xl btn-success font13">Print
																Address List</button>
														</div>
													</div>
													<br>
												</c:if>

												<c:if test="${utilityType == 'admissionregister'}">
													<div>

														<div class="grid-header text">Admission Register</div>
														<input type="radio" name="addReg" value="1" id="vertical">
														<span><b>Horizontal Report &nbsp;&nbsp;&nbsp; </b></span>

														<input type="radio" name="addReg" value="2" id="vertical">
														<span><b>Vertical Single Report
																&nbsp;&nbsp;&nbsp;</b> <input type="radio" name="addReg"
															value="3" id="horizontal"> <b>Vertical
																Multiple Report </b></span> <br> <br>

														<button type="button" title="Admission_Register"
															id="print_admission_register"
															class="btn btn-xl btn-success font13">Print
															Register</button>
														<%-- <a 
															href="${pageContext.request.contextPath}/horizontalRegistrationReport	"
															type="button" id="print_admission_register"
															title="Admission Register"
															class="btn btn-xl btn-primary button-submit font13">
															Print Register</a> --%>

													</div>
													<br>
													Select the Format for Report Printing<span
																	style="color: #FF0000; font-weight: bold"><b>*</b></span>
												</c:if>
											</div>
											<br>
											<!-- slide down table  -->

											<div class="col-sm-12" id="slidetable" style="padding: 0;">
												<div class="form-horizontal">
													<div class="form-group">
														<br>
														<div class="grid box-filters">
															<div class="grid-title">
																<div class="pull-left">List of Students</div>
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
																		style="height: 234px; position: relative; overflow: auto; max-width: 100%">
																		<table
																			class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
																			id="demandtable"
																			aria-describedby="DataTables_Table_0_info">
																			<thead>
																				<tr role="row">
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1" style="width: 28px;"
																						aria-label="PHOTO: activate to sort column ascending">Select</th>
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="ID: activate to sort column ascending">Enrollment
																						No.</th>


																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="ID: activate to sort column ascending">Registration
																						No.</th>


																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="ID: activate to sort column ascending">Roll
																						No.</th>



																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="First Name: activate to sort column ascending">Name</th>
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="First Name: activate to sort column ascending">Branch</th>
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="First Name: activate to sort column ascending">Gender</th>
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="First Name: activate to sort column ascending">Semester</th>
																				</tr>
																			</thead>

																			<tbody role="alert" aria-live="polite"
																				aria-relevant="all" id="student-list">

																			</tbody>
																		</table>

																	</div>

																</div>

																<!-- Modal dialog -->



																<!-- /.modal -->
															</div>


														</div>
													</div>
												</div>
											</div>

										</div>
										<!-- <hr> -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>




			</div>

			<!--=== Page Content ===-->
		</div>
		<img alt="" src='<c:url value="/resources/loading-gif.gif"/>'
			style="position: absolute; left: 635px; top: 296px; display: none;"
			id="loading-image">
	</div>
	<!-- /.container -->
	<!-- /.container -->
</body>
