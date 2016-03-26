<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Create Demand | RF-Campus</title>

<jsp:include page="../authentication/script.jsp" />

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

						$("#overwriteDemand").change(function() {
							if ($("#overwriteDemand").is(":checked") == true) {
								$("#overwriteDemand").val("true");
							} else {
								$("#overwriteDemand").val("false");
							}
						});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0');
						}, "");

						$("#add-edit-form").validate({
							// Specify the validation rules
							rules : {
								receiptId : {
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
								acadamicSessionId : {
									required : true,
									selectcheck : true
								},
								paymentTypeId : {
									required : true,
									selectcheck : true
								},
								semesterId : {
									required : true,
									selectcheck : true
								},
								demandFor : {
									required : true,
									selectcheck : true
								}
							},

							// Specify the validation error messages
							messages : {
								receiptId : {
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
								acadamicSessionId : {
									required : "",
									selectcheck : ""
								},
								paymentTypeId : {
									required : "",
									selectcheck : ""
								},
								semesterId : {
									required : "",
									selectcheck : ""
								},
								demandFor : {
									required : "",
									selectcheck : ""
								}

							},
							submitHandler : function(form) {
								form.submit();
							}

						});

						$("#show_button")
								.click(
										function() {
											var valid = $("#add-edit-form")
													.valid();

											if (valid == true) {
												$("#slidetable").slideDown(
														"slow");

												//$("#loading-image").show(); 
												var degreeId = $('#degreeId')
														.val();
												var branchId = $('#branchId')
														.val();
												//var paymentId=$('#paymentTypeId').val();
												//  var batchId=$('#acadamicSessionId').val();
												var semesterId = $(
														'#semesterId').val();
												$
														.ajax({
															async : false,
															url : "../academic/student/info",
															data : {
																"degreeId" : degreeId,
																"branchId" : branchId,
																"semesterId" : semesterId
															},
															type : "POST",
															success : function(
																	response) {
																/* alert(JSON.stringify(response)); */
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
																						text += "        <tr class=\"odd\">"
																								+ "				<td><input class=\"enrollment-number-class\" type=\"checkbox\" id=\"\" value=\""+student.enrollmentNumber+"\"></td>"
																								+ "				<td class=\" \">"
																								+ student.enrollmentNumber
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
																								+ student.semesterName
																								+ "</td>"
																								+ "		</tr>";
																						enrollmentIds += student.enrollmentNumber
																								+ ",";
																					});
																	
																	$('#student-list').empty().html(text);
																	$('#demandtable').dataTable().fnDestroy(); 
												  					$('#demandtable').dataTable( {
												  						"bDestroy":true,
												  					  "ajax": "data.json"
												  					} );
																	
																}/*else
																  					$('#feeHeadBody').empty();*/

															}
														});
												$("#create-selected-demand-btn")
														.attr("style", "");
											}

										});

						/* $("#create_all_demand_button").click(function(){
							
							alert("Demand sucessfully created for all students.");
						
						}); */

						$("#create_all_demand_button")
								.click(
										function() {
											if (isStandardFeeExist() > 0) {
												demandForflag = 1;
												createDemand();
											} else {
												var flag = confirm('Standard Fee Not defined for Selected Criteria\n\nDo you want to create Standard Fee ?');
												if (flag == true) {
													window.location = "../feeCollection/standardFee";
												}
											}

										});

						$("#create-selected-demand-btn").click(function() {
							//alert("Demand sucessfully created for all students.");
							enrollmentIds = ''
							demandForflag = 2;
							//alert(demandFor);
							$.each($(".enrollment-number-class"), function() {
								if ($(this).is(":checked")) {
									enrollmentIds += $(this).val() + ",";
								}
							});
							createDemand();
						});

						$("#degreeId")
								.change(
										function() {
											//$("#loading-image").show();
											var degreeId = $(this).val();

											if (degreeId != 0) {
												$
														.ajax({
															async : false,
															url : "../branch/getBranchByDegree",
															type : "POST",
															data : {
																"degreeId" : ""
																		+ degreeId
															},
															success : function(
																	response) {
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
																notifyerror('Error Occured...');
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

	function createDemand() {
		//$("#loading-image").show();
		var receiptId = $("#receiptId").val();
		var degreeId = $("#degreeId").val();
		var branchId = $("#branchId").val();
		var paymentTypeId = $("#paymentTypeId").val();
		var semesterId = $("#semesterId").val();
		var demandFor = $("#demandFor").val();
		// var enrollmentIds= $("#").val(); 
		var acadamicSessionId = $("#acadamicSessionId").val();
		var overwriteDemand = $("#overwriteDemand").val();

		var formData = new FormData();
		formData.append("receiptId", receiptId);
		formData.append("degreeId", degreeId);
		formData.append("branchId", branchId);
		formData.append("paymentTypeId", paymentTypeId);
		formData.append("semesterId", semesterId);
		formData.append("demandFor", demandFor);
		formData.append("enrollmentIds", enrollmentIds);
		formData.append("acadamicSessionId", acadamicSessionId);
		formData.append("overwriteDemand", overwriteDemand);

		$.ajax({
			async : false,
			url : "../feeCollection/demand/create",
			type : "POST",
			data : formData,
			processData : false,
			contentType : false,
			success : function(response) {
				//alert(response+' - '+demandFor);
				if (response != 0) {
					if (demandForflag == 1) {
						notifysuccess('Demand Created for All Student');
					} else {
						notifysuccess('Demand Created for Selected Student');
					}
				}
			},
			error : function() {
				notifyerror('Error Occured...');
			},
		});
		$("#loading-image").hide();
	}

	function isStandardFeeExist() {
		//$("#loading-image").show();
		var count = 0;
		var receiptId = $("#receiptId").val();
		var degreeId = $("#degreeId").val();
		var paymentTypeId = $("#paymentTypeId").val();
		var semesterId = $("#demandFor").val();
		// var enrollmentIds= $("#").val(); 
		var acadamicSessionId = $("#acadamicSessionId").val();

		var formData = new FormData();
		formData.append("receiptId", receiptId);
		formData.append("degreeId", degreeId);
		formData.append("paymentTypeId", paymentTypeId);
		formData.append("semesterId", semesterId);
		formData.append("acadamicSessionId", acadamicSessionId);

		$.ajax({
			async : false,
			url : "../feeCollection/standardFee/exist",
			type : "POST",
			data : formData,
			processData : false,
			contentType : false,
			success : function(response) {
				count = response;
			},
			error : function() {
				notifyerror('Error Occured...');
			},
		});
		//$("#loading-image").hide();
		return count;
	}
</script>
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
				<form action="" method="" id="add-edit-form">
					<input type="hidden" id="id" name="id" value="0" />
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="grid box-filters">
								<div class="table-header">
									<div class="row">
										<div class="create_project_tbl">
											<div class="grid-header text">Create Demand</div>

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
																	class="control-label">Batch<span
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

													<div class="form-group">
														<div class="col-sm-12" id="degree-list">
															<div class="col-sm-6">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Select Student of Semester<span
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

													<div class="form-group">
														<div class="col-sm-12" id="degree-list">
															<div class="col-sm-6">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Payment Type<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-6">
																<select name="paymentTypeId" id="paymentTypeId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Payment Type</option>
																	<c:forEach items="${paymentTypeList}" var="paymentType">
																		<option value="${paymentType.id}">${paymentType.paymentType}</option>
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
													<div class="form-group">
														<br>
														<div class="col-sm-12">
															<div class="col-sm-6">
																<span id="ContentPlaceHolder1_lblModule"
																	class="control-label">Receipt Type<span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-6">
																<select id="receiptId" title="module" name="receiptId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Receipt Type</option>
																	<c:forEach items="${receiptTypeList}" var="receipt">
																		<option value="${receipt.id}">${receipt.receiptTitle}</option>
																	</c:forEach>
																</select> <span id="ContentPlaceHolder1_rfvmodule"
																	style="display: none;"></span>
															</div>
														</div>
													</div>

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
																	class="control-label">Create Demand for Semester<span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-6">
																<select name="demandFor" id="demandFor"
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

															<!-- checkbox  code starts here-->
															<div class="label-set">
																<label><input type="checkbox"
																	name="overwriteDemand" id="overwriteDemand"
																	value="false" />Overwrite existing demand?</label>
															</div>

															<!-- checkbox code ends here -->
															<br>
															<!-- button code starts here-->

															<button type="button" title="Show Students"
																id="show_button" class="btn btn-xl btn-success font13">
																Show Student Under Criteria</button>

															<button type="button" title="Create Demand for All"
																id="create_all_demand_button"
																class="btn btn-xl btn-default font13">Create
																Demand for all Students</button>

															<!-- button code ends here-->

														</div>
													</div>
												</div>
												<!-- row code ends here-->
											</div>
											<!--checkbox button div code ends here-->
											<br>
											<div class="box-header" style="top: 5px;">
												<div class="box-name" style="background-color: #d9d9d9;">
													<i class="fa fa-table"></i> <span
														style="font-weight: bold;">Reports</span>
												</div>
											</div>
											<br>
											<form action="qwerty" method="get" id="qwerty">
												<div class="col-sm-12" id="" style="text-align: left">
													<label style="padding-right: 20;"> <input
														type="radio" name="optionsRadios" id="optionsRadios1"
														value="" checked> Detailed Report
													</label> <label style="padding-right: 20;"> <input
														type="radio" name="optionsRadios" id="optionsRadios1"
														value=""> Summary Report
													</label>

													<button type="button" title="Show Reports"
														class="btn btn-xl btn-primary font13"
														id="show_reports_button">Show Reports</button>
												</div>
											</form>


											<!-- slide down table  -->

											<div class="col-sm-12" id="slidetable"
												style="display: none; padding: 0;">
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
																						aria-label="First Name: activate to sort column ascending">Name</th>
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="First Name: activate to sort column ascending">Branch</th>
																					<th class="sorting" role="columnheader"
																						tabindex="0" aria-controls="DataTables_Table_0"
																						rowspan="1" colspan="1"
																						aria-label="First Name: activate to sort column ascending">Semester</th>
																				</tr>
																			</thead>

																			<tbody role="alert" aria-live="polite"
																				aria-relevant="all" id="student-list">

																				<!-- <input type = "button" class = "btn btn-default"  value = "Create Demand For Selected Students"> -->
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



											<div class="" style="text-align: center">
												<div class="col-sm-12">
													<button type="button" title="Create Demand"
														style="display: none;"
														class="btn btn-xl btn-warning button-submit font13"
														id="create-selected-demand-btn">Create Demand For
														Selected Students</button>
												</div>
											</div>


										</div>
										<hr>
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
