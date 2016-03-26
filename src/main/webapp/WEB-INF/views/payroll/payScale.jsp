<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Pay Scale</title>
<style type="text/css">
</style>

<jsp:include page="../authentication/script.jsp" />



<!-- validations -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js "></script> -->

</head>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						
						
						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != "" && value!= 0 && value!='0');
						}, "");
						var validator = $("#employeepayscale").validate({

							rules : {
								scaleNumber : {
									required : true,
									selectcheck : true
								},
								gradePay : {
									required : true,
									selectcheck : true
								},
								ruleNumber : {
									required : true,
									selectcheck : true
								}
							},

							messages : {

								scaleNumber : {
									required : "",
									selectcheck : ""
								},
								gradePay : {
									required : "",
									selectcheck : ""
								},
								ruleNumber : {
									required : "",
									selectcheck : ""
								}
							},

							submitHandler : function(form) {
								form.submit();
							}
						});

					
						
						$("#submit-btn")
								.click(
										function(e) {
							       if ($("#employeepayscale").valid())
								   { 
										add_to_filter();
										$("#submit-btn").attr('action','./add_to_filter');
											var basic1 = $("#basic1").val();
											var basic2 = $("#basic2").val();
											var scale = $("#scale").val();
											var gradePay = $("#gradePay").val();
											var ruleNumber = $("#ruleNumber")
													.val();
											var scaleNumber = $("#scaleNumber")
													.val();
											//* var id = $("#staffCategory").val();   
											$
													.ajax({
														async : false,
														url : "./payroll/getPayScaleDetail",
														type : "POST",
														data : {
															"basic1" : basic1,
															"basic2" : basic2,
															"scale" : scale,
															"gradePay" : gradePay,
															"ruleNumber" : ruleNumber,
															"scaleNumber" : scaleNumber

														},
														success : function(
																response) {
															var text = '';
															var srno = 1;

															if (JSON
																	.stringify(response) != '[]') {
																$
																		.each(
																				jsonOb,
																				function(
																						index,
																						payscale) {

																					text += "<tr class=\"odd\">"
																							+ "	<td>"
																							+ srno
																							+ "</td>"
																							+ "	<td>"
																							+ payscale.scale
																							+ "</td>"
																							+ "	<td>"
																							+ payscale.gradePay
																							+ " </td>"
																							+ "	<td>"
																							+ payscale.ruleNumber
																							+ "</td>"
																							+ "	<td>"
																							+ payscale.scaleNumber
																							+ "</td>"
																							+ "<td style=\"width: 10%\"> "
																							+ "<div class=\"fa-select\" title=\"Edit\" "
																							+ "	onclick=\"setPayscale('${payscale.id}','${payscale.scale}','${payscale.gradePay}','${payscale.ruleNumber}','${payscale.scaleNumber}')\"> "
																							+ "	<span class=\"fa fa-pencil-square\"></span> "
																							+ "</div> "
																						    + "</td> "
																							+ "</tr>";

																					srno++;
																				});

																$("#payscale")
																		.empty();
																$("#payscale")
																		.html(
																				text);
																$('#payscaletable').dataTable().fnDestroy(); 
											  					$('#payscaletable').dataTable( {
											  						"bDestroy":true,
											  					  "ajax": "data.json"
											  					} );
															} else {

															}

														},
														error : function() {
															alert('error...');
														},

													});
								   }
										});//submit-btn function ends here
						
										$("#cancel-btn").click(function(){
											validator.resetForm();
											$("#basic1").val('');
											$("#basic2").val('');
											$("#basic3").val('');
											$("#basic4").val('');
											$("#basic5").val('');
											$("#scaleNumber").val('');
											$("#scale").val('');
											$("#gradePay").val('');
											$("#incrementone").val('0');
											$("#incrementtwo").val('0');
											$("#incrementthree").val('0');
											$("#incrementfour").val('0');
											$("#incrementfive").val('0');
											$("#ruleNumber").val('0');
											$("#submit-btn").html('Save');
											$("#submit-btn").attr('title', 'Save');
											$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
											$("#employeepayscale").attr('action', '../payroll/getPayScaleDetail');
											
												});
						
												
					});
	
	function setPayscale(id, scale, gradePay, ruleNumber, scaleNumber) {
		$("#id").val(id);
		$("#scale").val(scale);
		$("#gradePay").val(gradePay);
		$("#ruleNumber").val(ruleNumber);
		$("#scaleNumber").val(scaleNumber);
		//$("#employeepayscale").validate();

		$("#employeepayscale").validate();
		//$("#employeepayscale").valid();
		$("#employeepayscale").attr('action', '../payscale/update');
		$("#submit-btn").html('Update');
		$("#submit-btn").attr('title', 'Update');
		$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');

	}

	function calculateScale() {
		var basic1 = $("#basic1").val();
		var basic2 = $("#basic2").val();
		var scale = $("#scale").val();
		var gradePay = $("#gradePay").val();

		if (basic1 != '' && basic2 != '' && gradePay != '') {
			$("#scale").val(
					basic1 + '-' + basic2 + '(' + $("#gradePay").val() + ')');
		}

		if (basic1 != '' && basic2 != '' && gradePay == '') {
			$("#scale").val(basic1 + '-' + basic2);
		}

		if (basic1 == '' && basic2 != '') {
			$("#scale").val(basic2);
		}

		if (basic1 != '' && basic2 == '') {
			$("#scale").val(basic1);
		}
	}
</script>
<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="../authentication/page-header.jsp" />
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">
							<div class="grid-header text">PayScale</div>

							<form id="employeepayscale" action="../payroll/getPayScaleDetail"
								method="post" class="form-horizontal"
								enctype="multipart/form-data">

								<input type="hidden" name="id" id="id" value="0">


								<%-- <form id="add-receipt" class="form-inline ng-pristine ng-valid"
										method="post" action="./receipttype/add">
										<input type="hidden" name="id" id="receiptId" value="0">
 											--%>



								<!-- <div class="tab-pane active" id="tab_general"> -->
								<div
									class="two-child-containers clearfixs column-one-contents info-container-page">
									<div class="grid box-filters">
										<div class="table-header">

											<div class="row my-bg-success">
												<!--1st div start here -->
												<div class="col-md-12">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Basic 1</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" placeholder="Basic 1"
																		name="basic1" class="form-control" id="basic1"
																		onkeyup="calculateScale()" /> <input type="hidden"
																		var="pay" name="basic1" value="" />

																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Increment I</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40"
																		class="form-control price" name="branchIntakeRound1"
																		id="incrementone" value="0" />

																</div>
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Basic 2</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" placeholder="Basic 2"
																		name="basic2" class="form-control" id="basic2"
																		onkeyup="calculateScale()" /> <input type="hidden"
																		name="basic2" value="0" />
																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Increment II</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40"
																		class="form-control price" name="branchIntakeRound1"
																		id="incrementtwo" value="0" />

																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Basic 3</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" placeholder="Basic 3"
																		name="basic3" class="form-control" id="basic3" /> <input
																		type="hidden" name="basic3" value="0" />

																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Increment III</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40"
																		class="form-control price" name="branchIntakeRound1"
																		id="incrementthree" value="0" />

																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Basic 4</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" placeholder="Basic 4"
																		name="basic4" class="form-control" id="basic4" /> <input
																		type="hidden" name="basic4" value="0" />
																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Increment IV</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40"
																		class="form-control price" name="branchIntakeRound1"
																		id="incrementfour" value="0" />

																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Basic 5</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" placeholder="Basic 5"
																		name="basic5" class="form-control" id="basic5" /> <input
																		type="hidden" name="basic5" value="0" />
																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Increment V</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40"
																		class="form-control price" name="branchIntakeRound1"
																		id="incrementfive" value="0" />

																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Scale No <span
																style="color: #FF0000; font-weight: bold">*</span></div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40"
																		placeholder="Scale No " name="scaleNumber"
																		class="form-control" id="scaleNumber" />
																		
																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Rule<span
																style="color: #FF0000; font-weight: bold">*</span>
																		${PAYROLL_MASTER_PAYRULE}</div>
																</div>
																<div class="col-sm-7">
																	<select name="ruleNumber" id="ruleNumber"
																		class="form-control">
																		<option selected="selected" value="0">Please
																			Select</option>
																		<c:forEach items="${payruleShortName}" var="payRule">
																			<option value="${payRule.id}">${payRule.name}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Scale</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" placeholder="Scale  "
																		name="scale" class="form-control" id="scale" />
																</div>
															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label"></div>
																</div>
																<div class="col-sm-7"></div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label">Grade Pay<span
																style="color: #FF0000; font-weight: bold">*</span></div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" name="gradePay"
																		placeholder="Grade Pay" class="form-control" value=""
																		id="gradePay" onkeyup="calculateScale()" />
																</div>

															</div>

															<div class="col-sm-6">
																<div class="col-sm-5">
																	<div class="control-label"></div>
																</div>
																<div class="col-sm-7"></div>
															</div>

														</div>
													</div>
												</div>
												<!--1st div end here -->

												<!--2nd div start here -->


												<!--2nd div end here -->


												<!--Button start here -->
												<div class="form-horizontal">
													<div class="" style="text-align: center">

														<div class="col-sm-12">


															<button type="submit" id="submit-btn" title="Save"
																class="btn btn-xl btn-success button-submit font13">Save</button>


															<button type="button" title="Reset"
																class="btn btn-xl btn-cancel button-cancel font13"
																id="cancel-btn">Reset</button>

															<button type="button" title="Report"
																class="btn btn-xl btn-cancel button-submit font13"
																id="report-btn">Report</button>

														</div>
													</div>
												</div>
												<!--Button  end here -->

												<!-- end of all 3 div row-->

											</div>

										</div>
									</div>
								</div>
							</form>
							<!-- </div> -->



							<div class="grid-title">
								<div class="pull-left">Scale Details</div>
								<div class="pull-right"></div>
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
											id="payscaletable"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th style="width: 10%">Sr No</th>
													<th style="width: 40%">Scale</th>
													<th style="width: 20%">Grade pay</th>
													<th style="width: 10%">Rule</th>
													<th style="width: 10%">Scale No</th>
													<th style="width: 10%">Action</th>
												</tr>
											</thead>
											<!-- <tbody id="payscale-record"> -->
											<tbody id="payscale" role="alert" aria-live="polite"
												aria-relevant="all">
												<c:set var="srno" value="1" />
												<c:forEach items="${payscaleList}" var="payscale">
													<tr class="odd">
														<td style="width: 10%">${srno}</td>
														<td style="width: 40%">${payscale.scale}</td>
														<td style="width: 20%">${payscale.gradePay}</td>
														<td style="width: 10%">${payscale.ruleNumber}</td>
														<td style="width: 10%">${payscale.scaleNumber}</td>
														<td style="width: 10%">
															<div class="fa-select" title="Edit"
																onclick="setPayscale('${payscale.id}','${payscale.scale}','${payscale.gradePay}','${payscale.ruleNumber}','${payscale.scaleNumber}')">
																<span class="fa fa-pencil-square"></span>
															</div>
														</td>
													</tr>
													<c:set var="srno" value="${srno + 1}" />
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- /General Information -->
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->
</body>

