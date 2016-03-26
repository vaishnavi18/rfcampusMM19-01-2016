<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Fee Refund | RF-Campus</title>
<!-- VAISHNAVI CODE HERE-->
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

<style>
.table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
	padding: 8px 4px 0px 4px;
	font-size: 13px;
	line-height: 18px;
	vertical-align: middle;
	border-top: hidden;
}

#student-info span {
	font-weight: bold;
	float: left;
	text-align: left;
}
</style>

<script type="text/javascript">
	$(document).ready(
			
					function() {

						$('body').on('click', '.save_buttons', function(){
							//alert('click : ' + $(this).attr('for'));
							
							var formId = $(this).attr('for');
								
							$.ajax({
								async : false,
								url : "./fees-refund/get-info?"+$("#refund-form-"+formId).serialize(),
								type : "GET",
								success : function(response) {						
									
									//alert(JSON.stringify(response.refundRule));
									setStudentDeatils(JSON.stringify(response.studentInfo));
									$("#totalRefundAmount").val(response.refundableAmount);
									$("#voucherNo").val(response.voucherNumber);
									setRefundableAmountHeads(JSON.stringify(response.refundableAmountHeads), JSON.stringify(response.refundRule));
									$("#dcrMainIds").val(response.dcrMainIds);
									
									$("#close_receipt_dialog").click()
									$("#student-info").slideDown(1000);
								     $("#receipt-info").slideDown(1000);
								     $("#btngroup").slideDown(1000);
								     $("#feetbldiv").slideDown(1000);

								}
							});
							
						});
						
						/* $(".save_buttons").click(function(){
							alert('click : ' + $(this).attr('for'));
						}); */
						
						
						$("#show_button")
						.click(
								function() {
									 //alert("qwertyui")
									 
										var enrollmentId = $('#enrollno').val();
										var semesterId = $('#semester2').val();
								
										$("#tbldiv").modal({
											backdrop : 'static'
										});
										$.ajax({
													async : false,
													url : "./fees-refund/show-receipts",
													data : {
														"enrollmentNumber" : enrollmentId//, 
														//"semesterId" : semesterId	
													},
													type : "GET",
													success : function(response) {						
														/*var studentInfo=response.studentInfo[0];
														var studentDemand=response.studentDemand;
														alert(JSON.stringify(response));
														setStudentDeatils(JSON.stringify(studentInfo));
														$("#voucherNumber").val(response.voucherNumber);
														setReceiptDetailsDeatils(JSON.stringify(response.allReceipts));*/
														//alert(JSON.stringify(response));
														setStudentReceipts(JSON.stringify(response));
														
																																									       

													}
												});

								});//submit_button click block
								
							function setRefundableAmountHeads(heads, refundRule){
									var text = '';
									var srno = 1;
									var index = 0;
									var refundAmount;
									//alert(JSON.stringify(heads));
									heads = JSON.parse(heads);
									refundRule = JSON.parse(refundRule);
									
									
								$.each(heads, function(index, head){
									text +="<tr class=\"odd\">"+
									"	<td style=\"width: 20%\">"+srno+"<span><input type=\"hidden\" name=\"refundFeeHeads["+index+"].feeHeadId\" value=\""+head.feeheadId+"\"/></span></td>"+
									"	<td style=\"width: 30%\">"+head.feeheadName+"</td>"+
									"	<td style=\"width: 20%\"><input type=\"text\" "+
									"		class=\"form-control\" value=\""+head.amount+"\" readonly=\"readonly\"/></td>";
									
									$.each(refundRule, function(index, rule){
										if(rule.feeHeadId == head.feeheadId){
											
											if(head.amount > 0){
												if(rule.calculative == true){
													refundAmount = head.amount * rule.percentageOrAmount / 100;
												}else{
													refundAmount = rule.percentageOrAmount;
												}	
											}else{
												refundAmount = 0;
											}
											
										}
									});
									text+="	<td style=\"width: 20%\"><input type=\"text\" name=\"refundFeeHeads["+index+"].amount\""+
									"		class=\"form-control\" value=\""+refundAmount+"\" readonly=\"readonly\" id=\"feeHead-"+head.feeheadId+"\"/></td>"+
									"</tr>";
									
									srno++;
									index++;
								});
								
								$("#refundableHeadList").empty().html(text);
								
								}	
								
								function setStudentReceipts(receiptDetails)
								{
									var enrollmentNumber = $("#enrollno").val();
									var text="";
									var srno=1;
									receiptDetails=JSON.parse(receiptDetails);
									$.each(receiptDetails, function(index, mainReceipt){
										
										text +=
											"<form action=\"./fees-refund/get-info\" id=\"refund-form-"+srno+"\">"+
											"<div class=\"grid-header\" style=\"background-color: #127575;\">"+mainReceipt.receipt+"</div>"+
											"<input type=\"hidden\" id=\"enrollmentNumber"+srno+"\" name=\"enrollmentNumber\" value=\""+enrollmentNumber+"\">"+
											"<input type=\"hidden\" name=\"receiptTypeId\" value=\""+mainReceipt.receiptTypeId+"\">"+
											"<div class=\"grid-content\">"+
										"	<div id=\"DataTables_Table_0_wrapper\""+
										"		class=\"dataTables_wrapper form-inline\" role=\"grid\">"+
										"		<div class=\"row\">"+
										"			<div class=\"dataTables_header clearfix\">"+
										"				<div class=\"col-md-6\"></div>"+
										"			</div>"+
										"		</div>"+
										"		<div class=\"dataTables_header\""+
										"			style=\"position: relative; overflow: auto; max-width: 100%\">"+
										"			<table"+
										"				class=\" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable\""+
										"				id=\"DataTables_Table_0\""+
										"				aria-describedby=\"DataTables_Table_0_info\">"+
										"				<thead>"+
										"					<tr role=\"row\">"+
										"						<th style=\"width: 20%\">Select</th>"+
										//"						<th style=\"width: 20%\">Branch</th>"+
										"						<th style=\"width: 10%\">Semester</th>"+
										"						<th style=\"width: 20%\">Payment Cat.</th>"+
										//"						<th style=\"width: 20%\">Rec. Type</th>"+
										"						<th style=\"width: 20%\">Rec. No.</th>"+
										"						<th style=\"width: 10%\">Rec. Amt.</th>"+
										"						<th style=\"width: 10%\">Refunded Amt.</th>"+
										"					</tr>"+
										"				</thead>"+
										""+
										"				<tbody role=\"alert\" aria-live=\"polite\""+
										"					aria-relevant=\"all\">"+
										"";
										
										$.each(mainReceipt.feesReceipts, function(index, subReceipt){
											text+="					<tr class=\"odd\">"+
											"						<td style=\"width: 20%;text-align:center;\"><input type=\"checkbox\" style=\"top:-2px;\""+
											"							id=\"\" name=\"dcrMainId\" value=\""+subReceipt.dcrMainId+"\"/></td>"+
											"						<td style=\"width: 20%\">"+subReceipt.semester+"</td>"+
											"						<td style=\"width: 10%\">"+subReceipt.paymentType+"</td>"+
											"						<td style=\"width: 20%\">"+subReceipt.receiptNumber+"</td>"+
											"						<td style=\"width: 20%\">"+subReceipt.totalPaidAmount+"</td>"+
											"						<td style=\"width: 20%\">"+subReceipt.refundableAmount+"</td>"+
											"					</tr>";
										});
										
										
										
										text+="				</tbody>"+
										"			</table>"+
										"		</div>"+
										"<div class=\"col-sm-12\" style=\"text-align:center\">"+
										"	<br>"+
										"	<button type=\"button\" class=\"btn btn-success save_buttons\" for=\""+srno+"\">Select</button>"+
										""+
										"	</div>"+
										"	</div>"+
										"	<!--  -->"+
										"</div>"+
										"</div>"+
										"</form>";
										
									srno++;
									
									});
									
									$("#multipleReceipts").empty().html(text);
									
								}
								
								
								
								
								function setStudentDeatils(studentInfo)
								{
									studentInfo=JSON.parse(studentInfo);
									
									$("#studentSerialNumber").val(studentInfo.studentId);
									$("#enrollmentNumber").html(studentInfo.enrollmentNumber);
									$("#degreeName").html(studentInfo.degreeName);
									$("#studentName").html(studentInfo.studentName);
									$("#branchShortName").html(studentInfo.branchShortName);
									$("#genderName").html(studentInfo.genderName);
									$("#year").html(studentInfo.year);
									$("#admissionDate").html(studentInfo.admissionDate);
									$("#semesterName").html(studentInfo.semesterName);
									$("#paymentType").html(studentInfo.paymentType);
									$("#admissionBatch").html(studentInfo.admissionBatch);
									
								}
						
						/** Validation by Vaishnavi**/

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0' && value != '');
						}, "");
						var validator = $("#add-edit-feecollection").validate({
							// Specify the validation rules
							rules : {
								enrollno : {
									required : true,
									selectcheck : true

								},
								semester : {
									required : true,
									selectcheck : true
								}
							},

							// Specify the validation error messages
							messages : {
								enrollno : {
									required : "",
									selectcheck : ""
								},
								semester : {
									required : "",
									selectcheck : ""
								}
							},
							submitHandler : function(form) {
								form.submit();
							}

						});
						/** Validation by Vaishnavi ends**/

						$("#show_button").click(function() {
							if ($("#add-edit-feecollection").valid()) {
								$("#student-info").slideDown(1000);
								$("#receipt-info").slideDown(1000);
								$("#btngroup").slideDown(1000);
								$("#feetbldiv").slideDown(1000);
								$("#fessrefundsubmit").slideDown(1000);
							}
						});
						$("#cancel-btn")
								.click(
										function() {
											validator.resetForm();
											$("#enrollno").val(0);
											$("#studentName").text('');
											$("#gender").text('');
											$("#admissionDate").text('');
											$("#paymentType").text('');
											$("#degree").text('');
											$("#branch").text('');
											$("#year").text('');
											$("#semester").text('');
											$("#batch").text('');
											$("#submit-btn").html('Save');
											$("#submit-btn").attr('title',
													'Save');
											$("#submit-btn")
													.attr('class',
															'btn btn-xl btn-success button-submit font13');
										});
						$(".launch-modal").click(function() {
							$("#student-info-modal").modal({
								backdrop : 'static'
							});
						});

						
						
						$("#check_condition").click(function() {
								$("#checkDiv").modal({
									backdrop : 'static'
								});
							});
						
						$("#checkDiv").draggable({
							 handle : ".changemodal"
						 });

					});
	
	
		
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
				<%-- <form action="" id="add-edit-feecollection"> --%>
					<!-- <input type="hidden" id="id" name="id" value="0" /> -->
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="grid box-filters">
								<div class="table-header">
									<div class="row">
										<div class="create_project_tbl">
											<div class="grid-header text">STUDENT FEE REFUND</div>
											<!-- Model Dialog Box -->
											<div id="student-info-modal" class="modal fade launch-modal"
												style="overflow: hidden;">
												<div class="modal-dialog" style="width: 50%">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal"
																aria-hidden="true">&times;</button>
															<h4 class="modal-title">Search Student</h4>
														</div>
														<div class="modal-body" style="padding: 0px 0 0 0">

															<div class="col-sm-12">
																<div class="form-horizontal">
																	<div class="form-group">
																		<div class="col-sm-2">Search By :</div>
																		<div class="col-sm-10">
																			<input id="searchByUserName" type="radio"
																				name="searchBy" value="1" checked="checked">
																			<label for="ContentPlaceHolder1_rblSearchBy_0">NAME</label>&nbsp;&nbsp;&nbsp;
																			<input id="searchByUserId" type="radio"
																				name="searchBy" value="2"> <label
																				for="ContentPlaceHolder1_rblSearchBy_1">ENROLLMENT
																				NO.&nbsp;</label>&nbsp;&nbsp;&nbsp; <input
																				id="searchByLoginId" type="radio" name="searchBy"
																				value="3"> <label
																				for="ContentPlaceHolder1_rblSearchBy_2">ID
																				NO.</label>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-4"></div>
																		<div class="col-sm-4">
																			<input name="ctl00$ContentPlaceHolder1$txtNameSearch"
																				type="text" id="searchText" class="form-control">
																		</div>
																		<div class="col-sm-4"></div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-4">
																					<div class="control-label">Degree</div>
																				</div>
																				<div class="col-sm-8">
																					<select name="degree" id="degree"
																						class="form-control">
																						<option selected="selected" value="">Please
																							Select</option>
																						<c:forEach items="${degreeList}" var="degree">
																							<option value="${degree.id}">${degree.degreeName}</option>
																						</c:forEach>
																					</select>

																				</div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-4">
																					<div class="control-label">Year</div>
																				</div>
																				<div class="col-sm-8">
																					<select name="year" class="form-control" id="year">
																						<option selected="selected" value="0">Please
																							Select</option>
																						<c:forEach items="${degreeList}" var="degree">
																							<option value="${degree.id
																	}">${degree.degreeName}
																							</option>
																						</c:forEach>
																					</select>


																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-4">
																					<div class="control-label">Branch</div>
																				</div>
																				<div class="col-sm-8">
																					<select name="branch" class="form-control"
																						id="branch">
																						<option selected="selected" value="0">Please
																							Select</option>
																						<c:forEach items="${degreeList}" var="degree">
																							<option
																								value="${degree.id
																	                            }">${degree.degreeName}
																							</option>
																						</c:forEach>
																					</select>


																				</div>
																			</div>
																		</div>
																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-4">
																					<div class="control-label">Semester${empsemesterList}</div>
																				</div>
																				<div class="col-sm-8">
																					<select name="semester" class="form-control"
																						id="semester">
																						<option selected="selected" value="0">Please
																							Select</option>
																						<c:forEach items="${semesterList}" var="semester">
																							<option value="${semester.id}">${semester.name}</option>
																						</c:forEach>
																					</select>
																				</div>
																			</div>
																		</div>
																	</div>
																	<div style="text-align: center">
																		<div class="col-sm-12">
																			<input type="button" title="Search" name="search"
																				value="Search" id="search-btn" data-toggle="modal"
																				data-target="#tbldiv" class="btn btn-default">
																			<input type="button" name="cancel" title="Reset"
																				value="Reset" id="reset-dialog"
																				class="btn btn-default">
																		</div>
																	</div>
																	<div class="">
																		<div class="col-sm-12">
																			<div class="table-responsive TabContainer">
																				<table class="table table-hover table-striped">
																					<thead>
																						<tr class="customers">
																							<th style="width: 20%;">ENROLL NO.</th>
																							<th style="width: 40%;">NAME</th>
																							<th style="width: 40%;">IDENTITY NO.</th>
																							<th style="width: 40%;">DEGREE</th>
																							<th style="width: 40%;">BRANCH</th>
																							<th style="width: 40%;">YEAR</th>
																							<th style="width: 40%;">SEMESTER</th>
																						</tr>
																					</thead>
																				</table>

																				<div class=""
																					style="position: relative; width: auto; height: 150px; margin-top: -7px;">
																					<div class="TabScroll"
																						style="width: auto; height: 150px;">
																						<table class="table table-hover table-striped">
																							<tbody id="table-body">
																								<tr>
																									<td style="width: 20%;">100002</td>
																									<td style="width: 40%;">Vaishnavi Gharote</td>
																									<td style="width: 40%;">3029867</td>
																									<td style="width: 40%;">BTECH</td>
																									<td style="width: 40%;">IT</td>
																									<td style="width: 40%;">2010</td>
																									<td style="width: 40%;">I YEAR II SEM</td>
																								</tr>
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
															<button type="button" class="btn btn-default"
																data-dismiss="modal" id="close-dialog-box">Close</button>

														</div>
													</div>
													<!-- /.modal-content -->
												</div>
												<!-- /.modal-dialog -->
											</div>
											<!-- /.modal-dialog -->
											<div class="col-sm-12">
												<!-- left column -->

												<div class="col-sm-6">
													<div class="form-horizontal">
														<div class="form-group">
															<br>
															<div class="col-sm-6">
																<div class="control-label">
																	Enrollment No./Id No. <span
																		style="color: #FF0000; font-weight: bold">*</span>
																</div>

															</div>
															<div class="col-sm-5">
																<input type="text" class="form-control" id="enrollno"
																	name="enrollno">
															</div>
															<div>

																<a href="#student-info-modal" data-backdrop="false"
																	data-toggle="modal" onclick="resetModelDialogBox()"
																	class="fa fa-search" style="padding-top: 5px;"
																	title="Search Student"> </a>
															</div>
														</div>
													</div>
												</div>

												<%-- <div class="col-sm-6">
													<div class="form-horizontal" style="text-align: left">
														<br>
														<div class="form-group">
															<div class="col-sm-5">
																<span class="control-label">Semester <span
																	style="color: #FF0000; font-weight: bold">*</span>
																</span>
															</div>

															<div class="col-sm-7">
																<select name="semester" class="form-control"
																	id="semester2">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${semesterList}" var="semester">
																		<option value="${semester.id}">${semester.name}</option>
																	</c:forEach>
																</select>
															</div>

														</div>
													</div>
												</div> --%>

											</div>
											<div class="col-sm-12" style="text-align: center">
												<div class="form-group">
													<button type="button"
														name="submit_create_edit_feecollection" title="Show"
														class="btn btn-xl btn-primary button-submit font13"
														id="show_button">Show</button>

												</div>
											</div>
											<br>

											<div class="col-sm-12" id="student-info"
												style="display: none">
												<div class="box-header"
													style="top: 5px; background-color: #E2DFDF">
													<div class="box-name">
														<span>Student Information</span>
													</div>
												</div>
												<br>
												<div class="col-sm-12">
													<div class="col-sm-5">
														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Enrollment No.:</div>
															</div>
															<div class="col-sm-8">
																<span id="enrollmentNumber" class="control-label"></span>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Degree:</div>
															</div>
															<div class="col-sm-8">
																<span id="degreeName" class="control-label"></span>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Student's Name:</div>
															</div>
															<div class="col-sm-8">
																<span id="studentName" class="control-label"> </span>
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Branch:</div>
															</div>
															<div class="col-sm-8">
																<span id="branchShortName" class="control-label"></span>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Gender:</div>
															</div>
															<div class="col-sm-8">
																<span id="genderName" class="control-label"></span>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Year:</div>
															</div>
															<div class="col-sm-8">
																<span id="year" class="control-label"></span>
															</div>
														</div>
													</div>
													<div class="col-sm-5">
														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Date of Admission:</div>
															</div>
															<div class="col-sm-8">
																<span id="admissionDate" class="control-label"></span>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Semester:</div>
															</div>
															<div class="col-sm-8">
																<span id="semesterName" class="control-label"></span>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Payment Type:</div>
															</div>
															<div class="col-sm-8">
																<span id="paymentType" class="control-label"></span>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-4">
																<div class="lable-set">Batch:</div>
															</div>
															<div class="col-sm-8">
																<span id="admissionBatch" class="control-label"></span>
															</div>
														</div>
													</div>

												</div>
											</div>

										</div>
										<form action="./fees-refund/refund" method="post">
										<input type="hidden" name="studentSerialNumber" id="studentSerialNumber" value="0">
										<input type="hidden" name="dcrMainIds" id="dcrMainIds" value="">
										<div class="col-sm-12" id="receipt-info" style="display: none">
											<div class="box-header"
												style="top: 5px; background-color: #E2DFDF">
												<div class="box-name">
													<span style="font-weight: bold">Receipt Information</span>
												</div>
											</div>
											<br>
											<div class="col-sm-4 ">
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Voucher No.:</span>
													</div>
													<div class="col-sm-6">
														<input name="voucherNo" type="text" maxlength="5"
															id="voucherNo" class="form-control" readonly> <!-- <input
															type="button" id="check_condition" data-toggle="modal"
															name="checkall" title="Change" value="Change"
															data-target="#checkDiv"> -->
													</div>


												</div>
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Voucher Date:</span>
													</div>
													<div class="col-sm-6">
														<input name="voucherDateString" type="text" id="voucherDate"
															class="form-control datepicker" value="12-12-2015">
													</div>
												</div>
												
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Refundable Amount:</span>
													</div>
													<div class="col-sm-6">
														<input name="totalRefundAmount" type="text" maxlength="5"
															id="totalRefundAmount" placeholder="Please Enter Amount" 
															class="form-control">
													</div>
												</div>
												
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Refund Rule:</span>
													</div>
													<div class="col-sm-6">
														<select name="payType" id="payType" tabindex="1"
															class="form-control">
															<option value="">Please Select</option>
															<option value="1">C</option>
															<option value="2">D</option>
														</select>
													</div>
												</div>
											</div>
											<!-- draftDiv-->
										</div>
										<br>
										<div id="receiptsDiv">
										
										</div>
										<div class="col-sm-12" id="feetbldiv"
											style="display: none; top: 5px">
											<div class="grid-header text" style="font-weight: normal">
												Available Fee Items</div>
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
															class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  ">
															<thead>
																<tr role="row">
																	<th style="width: 20%">Sr. No.</th>
																	<th style="width: 30%">Fee Heads</th>
																	<th style="width: 30%">Refundable Amount</th>
																	<th style="width: 20%">Total Refund Amount</th>
																</tr>
															</thead>
															<tbody role="alert" aria-live="polite"
																aria-relevant="all" id="refundableHeadList">
																<tr class="odd">
																	<td style="width: 20%"></td>
																	<td style="width: 30%"></td>
																	<td style="width: 20%"><input type="text"
																		class="form-control" /></td>
																	<td style="width: 20%"><input type="text"
																		class="form-control" /></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!-- Modal dialog -->
											<!-- /.modal -->
											
										<div class="col-sm-12" style="text-align:center;" id="fessrefundsubmit" >
										<br>
										<br>
										<button type="submit" class="btn btn-success" id="save_buttons">Submit</button>
										<br>
										<br>
										</div>
										</div>
										
										
										</form>
										<div id="tbldiv" class="modal fade in">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal"
															aria-hidden="true">&times;</button>
														<h4 class="modal-title">Existing Fee collections</h4>
													</div>
													<div class="modal-body" id="multipleReceipts">
													<div class="grid-header" style="background-color: #127575;">XYZZZZ</div>
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
																				<th style="width: 20%">Select</th>
																				<th style="width: 20%">Branch</th>
																				<th style="width: 10%">Semester</th>
																				<th style="width: 20%">Payment Cat.</th>
																				<th style="width: 20%">Rec. Type</th>
																				<th style="width: 20%">Rec. No.</th>
																				<th style="width: 10%">Rec. Amt.</th>
																				<th style="width: 10%">Refunded Amt.</th>
																				<th style="width: 10%">Refundable Amt.</th>
																			</tr>
																		</thead>

																		<tbody role="alert" aria-live="polite"
																			aria-relevant="all">

																			<tr class="odd">
																				<td style="width: 20%;text-align:center;"><input type="checkbox" style="top:-2px;"
																					id="" name="" /></td>
																				<td style="width: 20%">Information Tech.</td>
																				<td style="width: 10%">II SEM</td>
																				<td style="width: 20%">GENERAL</td>
																				<td style="width: 20%">C</td>
																				<td style="width: 20%">101</td>
																				<td style="width: 10%">1000</td>
																				<td style="width: 10%">500</td>
																				<td style="width: 10%">500</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
																<div class="col-sm-12" style="text-align:center">
																<br>
																<button type="button" class="btn btn-success">Save</button>
																
																</div>
																
															</div>
															<!--  -->
														</div>

													</div>

													<div class="modal-footer">
													
													<button type="button" class="btn btn-default" data-dismiss="modal" id="close_receipt_dialog">Close</button>
													</div>
												</div>
											</div>
										</div>
										<br>
									</div>
								</div>
								<br>
							</div>
						</div>
					</div>
				<%-- </form> --%>
			</div>
		</div>
	</div>

	<!-- start of checkDiv-->
	<form action="../feeCollection/dcr/setDcr" method="post">
		<div class="modal fade " id="checkDiv" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="overflow: hidden;">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header changemodal">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">Reset Condition</h4>
					</div>
					<div class="modal-body" style="margin: 0px 0px 125px 0px;">
						<div class="col-sm-12">
							<div class="form-group">
								<div class="col-sm-6">
									<div class="control-label">
										Receipt Type<span style="color: #FF0000; font-weight: bold">*</span>
									</div>
								</div>
								<div class="col-sm-6">
									<select name="receiptType" class="form-control"
										id="receiptType">
										<option selected="selected" value="0">Please Select
											Receipt Type</option>
										<c:forEach items="${receiptTypeList}" var="receipt">
											<option value="${receipt.id}">${receipt.receiptTitle}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-6 ">
									<div class="control-label">
										Payment Type: <span style="color: #FF0000; font-weight: bold">*</span>
									</div>
								</div>
								<div class="col-sm-6">
									<select name="paymentMode" class="form-control"
										id="paymentMode">
										<option selected="selected" value="0">Please Select
											Payment Mode</option>
										<c:forEach items="${paymentModeList}" var="paymentMode">
											<option value="${paymentMode.id}">${paymentMode.paymentMode}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<br>
							<!--Button start here -->
							<div style="text-align: center">
								<button type="submit" id="select-btn"
									class="btn btn-xxl btn-primary button-submit font13 "
									title="Select" data-placement="top">Select</button>
							</div>
							<!-- Button  end here -->
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	</form>
	<!-- /.modal -->
	<!-- end of checkdiv -->
</body>
