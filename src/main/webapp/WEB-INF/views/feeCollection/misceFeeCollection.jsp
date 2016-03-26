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
<title>Miscellaneous Fee Collection | RF-Campus</title>
<!-- VAISHNAVI CODE HERE-->
<jsp:include page="../authentication/script.jsp" />

<script type="text/javascript"
	src="<c:url value="/resources/plugins/datetimepicker/jquery.datetimepicker.full.js"/>"></script>
<link
	href="<c:url value="/resources/plugins/datetimepicker/jquery.datetimepicker.css"/>"
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
	float: left;
	text-align: left;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
}

li {
	display: table-row;
}

#outterDivFeeDetailTable:hover {
	position: absolute;
	width: 100%;
	/* border:1px solid red; */
	background: #f1f1f1;
	min-height: 150px;
	z-index: 40000;
}

.highlight {
	background: #00FFCC;
	color: white;
}

.glyphicon-plus {
	font-size: 20px;
	color: #1D9D74;
	text-shadow: 2px 2px 4px #83878D;
	padding-bottom: 5px;
}
</style>

<script type="text/javascript">
	var ddDetails = new Array();
	var ddSequenceNumber = 0;
	var rowNumber = 0;
	updateOperation = false;

	$(document)
			.ready(
					function() {

						jQuery('#demandDraftDate').datetimepicker({
							timepicker : false,
							format : 'd/m/Y'
						});

						$("#currency").prop("selectedIndex", 2);

						$("#paymentType").change(function() {
							var p = $("#paymentType").val();

							if (p == "CC") {
								$("#draftDiv").hide();
							} else {
								$("#draftDiv").show();
							}
						});

						function setDemandDraft(demandNo) {
							alert(demandNo);
							$("#demand_draft_table").slideUp();
						}

						$("#showdetail").click(function()
						{
                             var enrollNo=$("#enrollno").val();
                             alert(enrollNo);
							$.ajax({
								async : false,
								url : "../feeCollection/dcr/setDcr",
								data : {
									"enrollmentId" : enrollNo
								},
								type : "POST",
								success : function(
										response) {
									alert(JSON.stringify(response));
									var studentInfo=response.studentInfo[0];
									$("#studname").val(studentInfo.studentName);
     
								}
							});
						});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0' && value != '' && value != 0);
						}, "");

						var validator_two = $("#add-edit-feecollection")
								.validate({
									// Specify the validation rules
									rules : {
										enrollno : {
											required : true,
											selectcheck : true

										},
										semester_two : {
											required : true,
											selectcheck : true

										},

										demandDraftNumber : {
											required : true,
											selectcheck : true

										},
										demandDraftAmount : {
											required : true,
											selectcheck : true

										},

										demandDraftDate : {
											required : true,
											selectcheck : true
										},
										locationId : {
											required : true,
											selectcheck : true

										},

										bankId : {
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
										semester_two : {
											required : "",
											selectcheck : ""
										},

										demandDraftNumber : {
											required : "",
											selectcheck : ""
										},
										demandDraftAmount : {
											required : "",
											selectcheck : ""
										},

										demandDraftDate : {
											required : "",
											selectcheck : ""
										},
										locationId : {
											required : "",
											selectcheck : ""
										},

										bankId : {
											required : "",
											selectcheck : ""
										}
									},
									submitHandler : function(form) {
										form.submit();
									}

								});

						$("#cancel-btn")
								.click(
										function() {
											validator_two.resetForm();
											$("#enrollno").val(0);
											$("#studentName").text('');
											$("#gender").text('');
											$("#admissionDate").text('');
											$("#payType").text('');
											$("#hostel").text('');
											$("#degree").text('');
											$("#branch").text('');
											$("#year").text('');
											$("#semester").text('');
											$("#batch").text('');
											$("#transport").text('');
											$("#submit-btn").html('Save');
											$("#submit-btn").attr('title',
													'Save');
											$("#submit-btn")
													.attr('class',
															'btn btn-xl btn-success button-submit font13');
										});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0' && value != '' && value != 0);
						}, "");

						var validator_three = $("#add-edit-feecollection")
								.validate({
									// Specify the validation rules
									rules : {
										enrollno : {
											required : true,
											selectcheck : true

										},
										semester_two : {
											required : true,
											selectcheck : true

										},

										demandDraftNumber : {
											required : true,
											selectcheck : true

										},
										demandDraftAmount : {
											required : true,
											selectcheck : true

										},

										demandDraftDate : {
											required : true,
											selectcheck : true
										},
										locationId : {
											required : true,
											selectcheck : true

										},

										bankId : {
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
										semester_two : {
											required : "",
											selectcheck : ""
										},

										demandDraftNumber : {
											required : "",
											selectcheck : ""
										},
										demandDraftAmount : {
											required : "",
											selectcheck : ""
										},

										demandDraftDate : {
											required : "",
											selectcheck : ""
										},
										locationId : {
											required : "",
											selectcheck : ""
										},

										bankId : {
											required : "",
											selectcheck : ""
										}
									},
									submitHandler : function(form) {
										form.submit();
									}

								});

						$(".launch-modal").click(function() {
							$("#student-info-modal").modal({
								backdrop : 'static',
								keyboard : false
							});
						});

						$("#save-demanddraft-btn")
								.click(
										function() {

											if ($("#add-edit-feecollection")
													.valid()) {
												$("#totalDD")
														.val(
																parseInt($(
																		"#totalDD")
																		.val())
																		+ parseInt($(
																				"#demandDraftAmount")
																				.val()));
												if (parseInt($("#totalDD")
														.val()) >= parseInt($(
														"#amounttopay").val())) {
													$("#totalcash").val(0);

												} else {
													$("#totalcash")
															.val(
																	parseInt($(
																			"#amounttopay")
																			.val())
																			- parseInt($(
																					"#totalDD")
																					.val()));
												}

												calculateExcess();
												$("#demand_draft_table")
														.slideDown(1000);
												text = {
													"demandDraftNumber" : $(
															"#demandDraftNumber")
															.val(),
													"demandDraftDate" : $(
															"#demandDraftDate")
															.val(),
													"locationId" : $(
															"#locationId")
															.val(),
													"bankId" : $("#bankId")
															.val(),
													"demandDraftAmount" : $(
															"#demandDraftAmount")
															.val()
												};
												ddDetails.push(text);

												if (updateOperation == true) {
													remove_this($(
															"#demandDraftNumber")
															.val());
												}

												$("#demanddraftList")
														.append(
																"<tr class=\"odd\" id=\"ddId-"
																		+ $(
																				"#demandDraftNumber")
																				.val()
																		+ "\">"
																		+ "	<td style=\"width: 5%\">*</td>"
																		+ "<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].demandDraftNumber\" value=\""
																		+ $(
																				"#demandDraftNumber")
																				.val()
																		+ "\""
																		+ "></span>"
																		+ $(
																				"#demandDraftNumber")
																				.val()
																		+ "</td>"
																		+ "<td style=\"width: 10%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].demandDraftDate\" value=\""
																		+ $(
																				"#demandDraftDate")
																				.val()
																		+ "\"></span>"
																		+ $(
																				"#demandDraftDate")
																				.val()
																		+ "</td>"
																		+ "<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].locationId\" value=\""
																		+ $(
																				"#locationId")
																				.val()
																		+ "\"></span>"
																		+ $(
																				"#locationId option:selected")
																				.html()
																		+ "</td>"
																		+ "<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].bankId\" value=\""
																		+ $(
																				"#bankId")
																				.val()
																		+ "\"></span>"
																		+ $(
																				"#bankId option:selected")
																				.html()
																		+ "</td>"
																		+ "	<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].demandDraftAmount\" value=\""
																		+ $(
																				"#demandDraftAmount")
																				.val()
																		+ "\"></span>"
																		+ $(
																				"#demandDraftAmount")
																				.val()
																		+ "</td>"
																		+ "	<td style=\"width: 30%\">"
																		+ "	<div class=\"fa-select\" title=\"Edit\""
																		+ "	onclick=\"edit_this('"
																		+ $(
																				"#demandDraftNumber")
																				.val()
																		+ "', '"
																		+ $(
																				"#demandDraftDate")
																				.val()
																		+ "', '"
																		+ $(
																				"#locationId")
																				.val()
																		+ "', '"
																		+ $(
																				"#bankId")
																				.val()
																		+ "', '"
																		+ $(
																				"#demandDraftAmount")
																				.val()
																		+ "')\">"
																		+ "	<i class=\"fa fa-pencil-square\"></i>"
																		+ "	</div>"
																		+ "	<div class=\"fa-myremove\" title=\"Delete\" "
																		+ "	onclick=\"remove_this('"
																		+ $(
																				"#demandDraftNumber")
																				.val()
																		+ "')\">"
																		+ "<i class=\"fa fa-trash-o\"></i>"
																		+ "</div>"
																		+ "</td>"
																		+ "	</tr>");
												ddSequenceNumber++;

												$("#save-demanddraft-btn")
														.html(
																'Save Demand Draft');
											}
										});

						$("#reset-demanddraft-btn").click(
								function() {
									validator_two.resetForm();
									$("#demandDraftNumber").val('');
									$("#demandDraftAmount").val(0);
									$("#demandDraftDate").val('');
									$("#locationId").val('');
									$("#bankId").val('');
									$("#add-edit-feecollection").attr('action',
											'../feeCollection/dcr/addDcr');
								});

						$("#submit-btn").click(function() {

							if ($("#add-edit-feecollection").valid()) {
								$("#add-edit-feecollection").submit();
							}
						});

						$("#amounttopay")
								.focusout(
										function() {

											//alert('focusout');
											/*  $("#totalfeeamt").val($("#amounttopay").val()); */
											$("#totalcash")
													.val(
															parseInt($(
																	"#amounttopay")
																	.val())
																	- parseInt($(
																			"#demandDraftAmount")
																			.val()));
											calculateExcess();
											var amountToBePaid = $(
													"#amounttopay").val();
											var headAmount;
											var amountToBePaidFlag = false;

											$
													.each(
															$(".headAmount"),
															function() {
																headAmount = $(
																		this)
																		.val();
																if (amountToBePaidFlag == false) {
																	if ((amountToBePaid - headAmount) >= 0) {
																		$(this)
																				.val(
																						headAmount);
																		amountToBePaid = amountToBePaid
																				- headAmount;
																	} else if ((amountToBePaid - headAmount) < 0) {
																		$(this)
																				.val(
																						amountToBePaid);
																		amountToBePaidFlag = true;
																	}
																} else {
																	$(this)
																			.val(
																					0);
																}
																//alert('Head Value : '+$(this).val());
															});
										});

						$('#feesDetailTable').dataTable({
							"paging" : false,
							"ordering" : false,
							"info" : false,
							"asSorting" : false
						});

					});

	function edit_this(ddNumber, ddDate, locationId, bank, demandDraftAmount) {
		//alert(demandNo);
		//$("#demand_draft_table").slideUp();
		updateOperation = true;
		//rowNumber
		//var flag = false;
		//$.each(ddDetails, function(index, object) {
		//	if (object.demandDraftNumber == demandNo) {
		$("#demandDraftNumber").val(ddNumber);
		$("#demandDraftDate").val(ddDate);
		$("#locationId").val(locationId);
		$("#bankId").val(bank);
		$("#demandDraftAmount").val(demandDraftAmount);
		$("#save-demanddraft-btn").html('Update Demand Draft');
		//}
		//});
	}
	function remove_this(demandNo) {
		//alert(demandNo);
		//$("#demand_draft_table").slideUp();
		$("#ddId-" + demandNo).remove();
	}

	function calculateSum() {
		var sum = 0;
		//iterate through each textboxes and add the values
		$(".txt").each(function() {
			//add only if the value is number
			if (!isNaN($(this).val()) && $(this).val().length != 0) {
				sum += parseFloat(this.value);

			}
		});

		//.toFixed() method will roundoff the final sum to 2 decimal places
		$("#amounttopay").val(sum);
		$("#totalfeeamt").val(sum);
		var tcash = 0;
		tcash = parseInt($("#amounttopay").val())
				- parseInt($("#totalDD").val());
		if (tcash <= 0) {
			$("#totalcash").val(0);
		} else {
			$("#totalcash").val(tcash);
		}
		calculateExcess();

	}

	function calculateExcess() {
		var diff = 0;
		diff = (parseInt($("#totalcash").val()) + parseInt($("#totalDD").val()))
				- parseInt($("#totalfeeamt").val());
		if (diff > 0) {
			$("#excessAmount").val(diff);
		} else {
			$("#excessAmount").val(0);
		}
	}

	function append_new_row() {

		$('#demandList')
				.append(
						'<tr class=\"odd\">'
								+ '<td style=\"width: 20%\">Sr. No.</td>'
								+ "<td style=\"width: 30%\">"
								+ "<select name=\"\" value=\"\" class=\"form-control\">"
								+ "<option value=\"0\">Please Select</option>"
								+ "<option value=\"1\">Mustard</option>"
								+ "<option value=\"2\">Ketchup</option>"
								+ "<option value=\"3\">Relish</option>"
								+ "</select>"
								+ "</td>"
								+ "<td style=\"width: 20%\"><input type=\"number\" "
				+"class=\"form-control\" style=\"margin-bottom: 5px;\"/></td>"
								+ "</tr>");

	}

	function setHeadsAmount() {
		var amountToBePaid = $("#amounttopay").val();
		var headAmount;
		var amountToBePaidFlag = false;

		$.each($(".headAmount"), function() {
			headAmount = $(this).val();
			if (amountToBePaidFlag == false) {
				if ((amountToBePaid - headAmount) >= 0) {
					$(this).val(headAmount);
				} else if ((amountToBePaid - headAmount) < 0) {
					$(this).val(amountToBePaid);
					amountToBePaidFlag = true;
				}
			} else {
				$(this).val(0);
			}

		});

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
				<form action="../feeCollection/dcr/addDcr"
					id="add-edit-feecollection" method="post">
					<input type="hidden" id="id" name="id" value="0" />
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="grid box-filters">
								<div class="table-header">
									<div class="row">
										<div class="create_project_tbl">
											<div class="grid-header text">MISCELLANEOUS FEE
												COLLECTION</div>
											<div class="col-sm-4">

												<div class="form-group">
													<br>
													<div class="col-sm-6" style="padding-left: 0px;">
														<div class="control-label">
															Student Enrollment No.<span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>
													</div>
													<div class="col-sm-6" style="padding-left: 0px;">
														<input type="text" class="form-control" id="enrollno"
															name="enrollno"> <input type="hidden"
															id="studentId" name="studentSerialNumber" value="0">

													</div>
												</div>
												<div class="form-group">
													<br>
													<div class="col-sm-6" style="padding-left: 0px;">
														<div class="control-label">
															Student Name: <span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>

													</div>
													<div class="col-sm-6" style="padding-left: 0px;">
														<input type="text" class="form-control" id="studname"
															name="studname">
													</div>
												</div>
												<div class="form-group">
													<br>
													<div class="col-sm-6" style="padding-left: 0px;">
														<div class="control-label">
															Cash Book<span style="color: #FF0000; font-weight: bold">*</span>
														</div>
													</div>
													<div class="col-sm-6" style="padding-left: 0px;">
														<select name="semester_two" class="form-control"
															id="semester_two">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${reciptTypeList}" var="receipt">
																<option value="${receipt.id}">${receipt.receiptTitle}
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-6" style="padding-left: 0px;">
														<span class="control-label">Receipt No.:</span>
													</div>
													<div class="col-sm-6" style="padding-left: 0px;">
														<input name="receiptNumber" type="text" id="receiptNumber"
															class="form-control" readonly>
													</div>
												</div>
											</div>
											<div class="col-sm-2">
												<div>
													<a href="#student-info-modal" data-backdrop="false"
														data-toggle="modal" onclick="resetModelDialogBox()"
														class="fa fa-search"
														style="padding-top: 25px; margin-left: -38px;"
														title="Search Student"> </a> &nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-default button-submit"
														id="showdetail" name="showdetail">Show</button>
												</div>
											</div>
											<div class="col-sm-6"
												style="padding-left: 0px; width: 285px;">
												<div class="form-group">
													<br>
													<div class="col-sm-6" style="padding-left: 0px;">
														<div class="control-label">
															Date: <span style="color: #FF0000; font-weight: bold">*</span>
														</div>

													</div>
													<div class="col-sm-6" style="padding-left: 0px;">
														<input type="text" class="form-control" id="ddate"
															name="ddate" readonly>
													</div>
												</div>

											</div>
										</div>

										<div class="col-sm-12" id="feetbldiv" style="top: 5px">
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
														<table id="feehead-list"
															class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  ">
															<thead>
																<tr role="row">
																	<th style="width: 20%">Sr. No.</th>
																	<th style="width: 30%">Fee Heads</th>
																	<th style="width: 20%">Amount</th>
																	<th style="width: 10%">Action</th>
																</tr>
															</thead>

															<tbody role="alert" aria-live="polite"
																aria-relevant="all" id="demandList">

																<tr class="odd">
																	<td style="width: 20%">Sr.No</td>
																	<td style="width: 30%"><select
																		class="form-control">
																			<option value="0">Please Select</option>
																			<option>Mustard</option>
																			<option>Ketchup</option>
																			<option>Relish</option>
																	</select></td>
																	<td style="width: 20%"><input type="number"
																		class="form-control" style="margin-bottom: 5px;" /></td>
																	<td style="width: 10%"><div class="fa-myremove"
																			style="text-align: center" title="Add">
																			<span class="glyphicon glyphicon-plus"
																				onclick="append_new_row()"> </span>
																		</div></td>
																</tr>
															</tbody>
														</table>
														<table id="feehead-list"
															class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  ">

															<tbody role="alert" aria-live="polite"
																aria-relevant="all" id="totalamount">

																<tr class="odd">
																	<td style="width: 20%">#</td>
																	<td style="width: 30%">Total Amount</td>
																	<td style="width: 20%"><input type="number"
																		class="form-control" style="margin-bottom: 5px;"
																		readonly /></td>
																	<td style="width: 10%"></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!-- Modal dialog -->

											<!-- /.modal -->
										</div>

										<div class="col-sm-12">
											<div class="col-sm-4">
												<div class="form-group">
													<div class="col-sm-4" style="padding-left: 0">
														<span id="pt" class="control-label">Payment Type:</span>
													</div>
													<div class="col-sm-6" style="padding-left: 0">
														<select name="paymentMode" id="paymentType" tabindex="1"
															class="form-control">
															<option value="">Please Select</option>
															<%-- <c:forEach items="${paymentTypeList}" var="paymentType"> --%>
															<option value="CC" selected>CC</option>
															<option value="DD">DD</option>
															<%-- </c:forEach> --%>
														</select>
													</div>
												</div>
											</div>
											<div class="col-sm-8" id="draftDiv" style="display: none;">
												<div class="grid box-filters">
													<div class="table-header">
														<div class="row">
															<div class="grid-title">
																<div class="pull-left" style="font-weight: normal">Demand
																	Draft Details</div>
																<div class="clear"></div>
															</div>
															<!--1st div start here -->
															<div class="col-md-6">
																<div class="form-group">

																	<div class="col-sm-6">
																		<div class="control-label">
																			DD/Cheq No<span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<input type="text" name="demandDraftNumber"
																			class="form-control" id="demandDraftNumber"
																			placeholder="DD/Cheque No" />


																	</div>
																</div>

															</div>

															<div class="col-md-6">
																<div class="form-group">

																	<div class="col-sm-6 ">
																		<div class="control-label">
																			Amount: <span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<input type="number" name="demandDraftAmount"
																			class="form-control" id="demandDraftAmount"
																			placeholder="Enter DD Amount" value="0" />


																	</div>


																</div>
															</div>

															<div class="col-md-6">
																<div class="form-group">

																	<div class="col-sm-6">
																		<div class="control-label">
																			Date<span style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<input type="text" name="demandDraftDate"
																			class="form-control datepicker" id="demandDraftDate"
																			value="" placeholder="Select Date" />


																	</div>
																</div>

															</div>

															<div class="col-md-6">
																<div class="form-group">

																	<div class="col-sm-6 ">
																		<div class="control-label">
																			City: <span style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<select name="locationId" id="locationId" tabindex="1"
																			class="form-control">
																			<option value="">City</option>
																			<%-- <c:forEach items="${cityList}" var="cityL"> --%>
																			<%-- <option value="${cityL.id}">${cityL.cityName}</option> --%>
																			<%-- </c:forEach> --%>
																			<option value="1">Wardha</option>
																			<option value="2">Nagpur</option>
																		</select>
																	</div>
																</div>
															</div>


															<div class="col-md-6">
																<div class="form-group">

																	<div class="col-sm-6 ">
																		<div class="control-label">
																			Bank<span style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<select name="bankId" id="bankId" tabindex="1"
																			class="form-control">
																			<option value="">Bank</option>
																			<c:forEach items="${bankList}" var="bank">
																				<option value="${bank.id}">${bank.bankName}</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
															</div>
															<!--1st div end here -->

															<!--2nd div start here -->
															<div class="col-md-12" style="text-align: center">

																<button type="button" id="save-demanddraft-btn"
																	class="btn btn-xl btn-success button-submit font13 "
																	title="Save Demand Draft" data-placement="top">Save
																	Demand Draft</button>
																<button type="button" id="reset-demanddraft-btn"
																	class="btn btn-xl btn-default button-submit font13 "
																	title="Reset Demand Draft" data-placement="top">Reset</button>
																<br> <br>
															</div>
															<!--2nd div end here -->
														</div>
													</div>
												</div>
											</div>


										</div>




										<div class="col-sm-12" id="demand_draft_table"
											style="display: none">
											<div class="grid-header text" style="font-weight: normal">
												Demand Draft Details</div>
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
																	<th style="width: 5%">Sr.No.</th>
																	<th style="width: 20%">Demand Draft No.</th>
																	<th style="width: 10%">Date</th>
																	<th style="width: 20%">City</th>
																	<th style="width: 20%">Bank</th>
																	<th style="width: 20%">Amount</th>
																	<th style="width: 30%">Action</th>
																</tr>
															</thead>

															<tbody role="alert" aria-live="polite"
																aria-relevant="all" id="demanddraftList">


															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<br>

										<div class="col-sm-12" id="summary">
											<br>
											<div class="col-sm-6 ">
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Total Cash Amount: </span>
													</div>
													<div class="col-sm-6">
														<input name="totalcash" type="number" id="totalcash"
															class="form-control" readonly>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Total DD Amount: </span>
													</div>
													<div class="col-sm-6">
														<input name="totalDD" type="number" id="totalDD"
															class="form-control" value="0" readonly />
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Remark: </span>
													</div>
													<div class="col-sm-6">
														<textarea cols="40" rows="5" id="remark" name="remark"
															placeholder="write here..." style="height: initial;"></textarea>
													</div>
												</div>
											</div>
											<div class="col-sm-6 ">
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Total Fee Amount:</span>
													</div>
													<div class="col-sm-6">
														<input name="totalfeeamt" type="number" id="totalfeeamt"
															value="0" placeholder="" class="form-control" readonly>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-4">
														<span class="control-label">Excess Amount :</span>
													</div>
													<div class="col-sm-6">
														<input name="excessAmount" type="number" id="excessAmount"
															value="0" placeholder="" class="form-control" readonly>
													</div>
												</div>
											</div>
										</div>

										<div class="col-sm-12" id="buttons-div">
											<div class="form-horizontal">
												<div class="form-group">
													<!--Button start here -->
													<div style="text-align: center;">
														<button type="button" id="submit-btn"
															class="btn btn-xl btn-success button-submit font13 "
															title="Save" data-placement="top">Save</button>

														<button type="button"
															class="btn btn-xl btn-cancel button-submit font13"
															title="Reset" data-placement="top" id="cancel-btn">Reset</button>
														<button type="button"
															class="btn btn-xl button-submit font13" title="Report"
															data-placement="top" id="report-btn">Report</button>

													</div>
													<!-- Button  end here -->
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
				</form>
			</div>
		</div>
	</div>

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
									<input id="searchByUserName" type="radio" name="searchBy"
										value="1" checked="checked"> <label
										for="ContentPlaceHolder1_rblSearchBy_0">NAME</label>&nbsp;&nbsp;&nbsp;
									<input id="searchByUserId" type="radio" name="searchBy"
										value="2"> <label
										for="ContentPlaceHolder1_rblSearchBy_1">ENROLLMENT
										NO.&nbsp;</label>&nbsp;&nbsp;&nbsp; <input id="searchByLoginId"
										type="radio" name="searchBy" value="3"> <label
										for="ContentPlaceHolder1_rblSearchBy_2">ID NO.</label>
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
											<select name="degree" id="degree" class="form-control">
												<option selected="selected" value="">Please Select</option>
												<c:forEach items="${degreeList}" var="degree">
													<option value="${degree.id}">${degree.name}</option>
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
												<option selected="selected" value="0">Please Select</option>
												<c:forEach items="${degreeList}" var="degree">
													<option value="${degree.id
																	}">${degree.name}
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
											<select name="branch" class="form-control" id="branch">
												<option selected="selected" value="0">Please Select</option>
												<c:forEach items="${degreeList}" var="degree">
													<option value="${degree.id}">${degree.name}</option>
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
											<select name="semester" class="form-control" id="semester">
												<option selected="selected" value="0">Please Select</option>
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
										value="Search" id="search-btn" class="btn btn-default">
									<input type="button" name="cancel" title="Reset" value="Reset"
										id="reset-dialog" class="btn btn-default">
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
											<div class="TabScroll" style="width: auto; height: 150px;">
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
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="close-dialog-box">Close</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal-dialog -->
	<!-- end of checkdiv -->
</body>




