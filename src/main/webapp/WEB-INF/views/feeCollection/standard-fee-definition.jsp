<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Standard Fee Definition | RF-Campus</title>
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
.results tr[visible='false'], .no-result {
	display: none;
}

.results tr[visible='true'] {
	display: table-row;
}

input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    margin: 0; 
}

</style>


<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$(".search")
						.keyup(
								function() {
									var searchTerm = $(".search").val();
									var listItem = $('.results tbody')
											.children('tr');
									var searchSplit = searchTerm
											.replace(/ /g,
													"'):containsi('")

									$.extend($.expr[':'],
													{
														'containsi' : function(
																elem,
																i,
																match,
																array) {
															return (elem.textContent
																	|| elem.innerText || '')
																	.toLowerCase()
																	.indexOf(
																			(match[3] || "")
																					.toLowerCase()) >= 0;
														}
													});

									$(".results tbody tr").not(
											":containsi('"
													+ searchSplit
													+ "')").each(
											function(e) {
												$(this).attr('visible',
														'false');
											});

									$(
											".results tbody tr:containsi('"
													+ searchSplit
													+ "')").each(
											function(e) {
												$(this).attr('visible',
														'true');
											});
								});

						
						 if ("${message}" == "add")
						 {
							 /* callModal('Record Saved Successfully!!', 0, 'green');  */
							 notifysuccess('Record Saved Successfully!!');
							
						 } 

						$("#overwriteDemand").change(function() {
							if ($("#overwriteDemand").is(":checked") == true) {
								$("#overwriteDemand").val("true");
							} else {
								$("#overwriteDemand").val("false");
							}
						});

						

						$("#copy_button").click(function() {
							$("#receiptId_To").val($("#receiptId").val());
							$("#receiptId_To").attr('disabled', 'disabled');
						});

						/** Validation by Vaishnavi**/
						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != "");
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
								}

							},
							submitHandler : function(form) {
								form.submit();
							}

						});
						/** Validation by Vaishnavi ends**/

						$("#copy_form").validate({
							rules : {
								receiptId_To : {
									required : true,
									selectcheck : true
								},
								degreeId_To : {
									required : true,
									selectcheck : true
								},
								acadamicSessionId_To : {
									required : true,

									selectcheck : true
								},
								paymentTypeId_To : {
									required : true,
									selectcheck : true
								},
								semesterId_To : {
									required : true,
									selectcheck : true
								}
							},

							// Specify the validation error messages
							messages : {
								receiptId_To : {
									required : "",
									selectcheck : ""
								},
								degreeId_To : {
									required : "",
									selectcheck : ""
								},
								acadamicSessionId_To : {
									required : "",
									selectcheck : ""
								},
								paymentTypeId_To : {
									required : "",
									selectcheck : ""
								},
								semesterId_To : {
									required : "",
									selectcheck : ""
								}

							},
							submitHandler : function(form) {
								form.submit();
							}
						});

						$(".launch-modal").click(function() {
							$("#myModal").modal({
								backdrop : 'static'
							});
						});

						$("#myModal").draggable({
							handle : ".modal-header"
						});

						$("#submit-button")
								.click(
										function() {
											var reciptId = $('#receiptId')
													.val();
											var degreeId = $('#degreeId').val();
											var paymentId = $('#paymentTypeId')
													.val();
											var batchId = $(
													'#acadamicSessionId').val();
											var semesterId = $('#semesterId')
													.val();
											var feeDiscription = $(
													'#degreeId option:selected')
													.text()
													+ ' '
													+ $(
															'#acadamicSessionId option:selected')
															.text()
													+ ' '
													+ $(
															'#paymentTypeId option:selected')
															.text()
													+ ' '
													+ $(
															'#receiptId option:selected')
															.text()
													+ ' '
													+ $(
															'#semesterId option:selected')
															.text();
											//alert(feeDiscription);
											$('#receiptId1').val(reciptId);
											$('#degreeId1').val(degreeId);
											$('#paymentTypeId1').val(paymentId);
											$('#acadamicSessionId1').val(
													batchId);
											$('#semesterId1').val(semesterId);
											$('#feeDiscription').val(
													feeDiscription);
										});

						//--------------
						$("#copy-std-fee-btn")
								.click(
										function() {

											var valid = $("#copy_form").valid();
											//$("#table2").slideDown("slow");
											if (valid == true) {
												var reciptId = $('#receiptId')
														.val();
												var degreeId = $('#degreeId')
														.val();
												var paymentId = $(
														'#paymentTypeId').val();
												var batchId = $(
														'#acadamicSessionId')
														.val();
												var semesterId = $(
														'#semesterId').val();

												var reciptId_To = $(
														'#receiptId_To').val();
												var degreeId_To = $(
														'#degreeId_To').val();
												var paymentId_To = $(
														'#paymentTypeId_To')
														.val();
												var batchId_To = $(
														'#acadamicSessionId_To')
														.val();
												var semesterId_To = $(
														'#semesterId_To').val();
												var overwriteDemand = $(
														'#overwriteDemand')
														.val();
												var feeDiscription = $(
														'#degreeId_To option:selected')
														.text()
														+ ' '
														+ $(
																'#acadamicSessionId_To option:selected')
																.text()
														+ ' '
														+ $(
																'#paymentTypeId_To option:selected')
																.text()
														+ ' '
														+ $(
																'#receiptId_To option:selected')
																.text()
														+ ' '
														+ $(
																'#semesterId option:selected')
																.text();
												$
														.ajax({
															async : false,
															url : "../feeCollection/standardFee/copy",
															data : {
																"receiptId" : reciptId,
																"degreeId" : degreeId,
																"paymentTypeId" : paymentId,
																"acadamicSessionId" : batchId,
																"semesterId" : semesterId,
																"receiptId_To" : reciptId_To,
																"degreeId_To" : degreeId_To,
																"paymentTypeId_To" : paymentId_To,
																"acadamicSessionId_To" : batchId_To,
																"semesterId_To" : semesterId_To,
																"feeDiscription" : feeDiscription,
																"overwriteDemand" : overwriteDemand
															},
															type : "POST",
															success : function(response) 
															{
																if (response != 0) 
																{
																	$("#myModal").modal('hide').delay(100);
																	notifycopy('Record Copied Successfully!!');
																	setTimeout(function() {
																	location.reload();
																		},4000);
																}
																else 
																{
																	notifyerror('Record Copy Failed!!');
																	setTimeout(function() {
																	location.reload();
																			},
																			4000);
																}

															}
														});

											}
										});

						/*  $("#feeDesecription").click( */
						$(".getfeedescription")
								.click(
										function() {
											var feeDesecription = $(this).html();
											
										 var a= feeDesecription.split(" ")[0];
											$("#degreeId option").filter(function()
											{return this.text==a;}).attr('selected',true);
											
											var b= feeDesecription.split(" ")[1]+" "+feeDesecription.split(" ")[2];
											$("#acadamicSessionId  option").filter(function()
									{return this.text==b;}).attr('selected',true);
											
											var  d= feeDesecription.split(" ")[3];
										$("#paymentTypeId option").filter(function()
										{return this.text==d;}).attr('selected',true);
										
										var e = feeDesecription.split(" ")[4]+" "+feeDesecription.split(" ")[5];
											$("#receiptId option").filter(function()
									{return this.text==e;}).attr('selected',true);
											
									     var c  = feeDesecription.split(" ")[6]+" "+feeDesecription.split(" ")[7];
											$("#semesterId option").filter(function() 
										{  
												return this.text==c;}).attr('selected',true);
											
											
										 
											$
													.ajax({
														async : false,
														url : "../feeCollection/standardFee/standard_fee",
														data : {
															"feeDesecription" : feeDesecription
														},
														type : "POST",
														success : function(
																response) {
															/*  alert(JSON
																	.stringify(response));  */
															var standardFees = JSON
																	.parse(JSON
																			.stringify(response));
															//	alert(JSON.stringify(response));
															if (JSON
																	.stringify(response) != '[]') {
																myfunction(standardFees[0].receiptTypeId);
																$("#table2")
																		.slideDown(
																				"slow");
																$
																		.each(
																				standardFees,
																				function(
																						index,
																						standardFee) {
																					// alert(standardFee.feeHeadId);
																					if (standardFee.feeHeadId != 0) {
																						// alert(standardFee.feeHeadId + ' - ' + standardFee.amount);
																						$(
																								"#fee-head-id-"
																										+ standardFee.feeHeadId)
																								.val(
																										standardFee.amount);
																						calculateSum();
																					}

																				});

															}/*else
																																		       $('#feeHeadBody').empty();*/

														}
													});
										});

						//--------------

						$("#submit_button")
								.click(
										function() {
											 
											var valid = $("#add-edit-form")
													.valid();
											if (valid == true) {
												$("#table2").slideDown("slow");
												var reciptId = $('#receiptId')
														.val();
												var degreeId = $('#degreeId')
														.val();
												var paymentId = $(
														'#paymentTypeId').val();
												var batchId = $(
														'#acadamicSessionId')
														.val();
												var semesterId = $(
														'#semesterId').val();
												myfunction(reciptId);
												$
														.ajax({
															async : false,
															url : "../feeCollection/standardFee/fee",
															data : {
																"receiptId" : reciptId,
																"degreeId" : degreeId,
																"paymentTypeId" : paymentId,
																"acadamicSessionId" : batchId,
																"semesterId" : semesterId
															},
															type : "POST",
															success : function(
																	response) {
																/*  alert(JSON
																		.stringify(response));  */
																var standardFees = JSON
																		.parse(JSON
																				.stringify(response));
																//alert(standardFees);
																if (JSON
																		.stringify(response) != '[]') {
																	$
																			.each(
																					standardFees,
																					function(
																							index,
																							standardFee) {
																						// alert(standardFee.feeHeadId);
																						$(
																								"#fee-head-id-"
																										+ standardFee.feeHeadId)
																								.val(
																										standardFee.amount);
																						calculateSum();
																					});

																}/*else
																																											       $('#feeHeadBody').empty();*/

															}
														});

											}//valid true block

										});//submit_button click block

						function myfunction(reciptId) {
							//var reciptId = $('#receiptId').val();
							if (reciptId != 0) {
								$
										.ajax({
											async : false,
											url : "../feeCollection/standardFee/fee-head",
											data : {
												"receiptId" : reciptId
											},
											type : "POST",
											success : function(response) {
												//	alert(JSON.stringify(response));
												var headList = JSON.parse(JSON
														.stringify(response));
												if (JSON.stringify(response) != '[]') {
													$('#fee-heads').empty();
													var text = '';
													$
															.each(
																	headList,
																	function(
																			index,
																			head) {
																		text += "<tr class=\"odd\">"
																				+ "	<td>"
																				+ head.feeheadLongName
																				+ "</td>"
																				+ "	<td><input type=\"hidden\" name=\"standardFee["+head.serialNumber+"].feeHeadId\" value=\""+head.id+"\"><input class=\"txt form-control\" name=\"standardFee["
																				+ head.serialNumber
																				+ "].amount\" type=\"number\"  class=\"form-control\" oninput=\"calculateSum()\" placeholder=\"Enter Amount\" id=\"fee-head-id-"
																				+ head.id
																				+ "\"></td>"
																				+ "	</tr>";
																	});
													var text1 = '';
													text1 += "<tr> "
															+ "	<td>Total</td>"
															+ "	<td><input type=\"number\" id=\"sum\" readonly></td>"
															+ "	</tr>";

													var text3 = text + text1;
													$('#fee-heads').html(text3);

												} else {
													var flag = confirm('Fee Heads Not defined for Selected Receipt Type\n\nDo you want to create Fee Head ?');
													if (flag == true) {
														window.location = "../feeHeads";
													}
												}
												//$('#feeHeadBody').empty();

											}
										});
							}///reciptId != 0 block

						}//);onchange block 

					});//document ready block

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
		$("#sum").val(sum.toFixed(2));
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

				<form action="../feeCollection/standardFee/add" method="post"
					id="add-edit-form">
					<input type="hidden" id="id" name="id" value="0" />
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="grid box-filters">
								<div class="table-header">
									<div class="row">
										<div class="create_project_tbl">
											<div class="grid-header text">STANDARD FEE MANAGEMENT</div>
											
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
														<div class="col-sm-12">
															<div class="col-sm-5">
																<span id="ContentPlaceHolder1_lblModule"
																	class="control-label">Receipt Type <span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-7">
																<select id="receiptId" name="receiptId"
																	class="form-control">
																	<option selected="selected" value="">Please
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
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Degree<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-7">
																<select name="degreeId" id="degreeId"
																	class="form-control">
																	<option selected="selected" value="">Please
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
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Batch<span
																	style="color: #FF0000; font-weight: bold">*</span></span>

															</div>
															<div class="col-sm-7">
																<select name="acadamicSessionId" id="acadamicSessionId"
																	class="form-control">
																	<option selected="selected" value="">Please
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
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblMenuName"
																	class="control-label">Payment Type<span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-7">
																<select name="paymentTypeId" id="paymentTypeId"
																	class="form-control">
																	<option selected="selected" value="">Please
																		Select Payment Type</option>
																	<c:forEach items="${paymentTypeList}" var="paymentType">
																		<option value="${paymentType.id}">${paymentType.paymentType}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">
																<span id="ContentPlaceHolder1_lblMenuName"
																	class="control-label">Semester<span
																	style="color: #FF0000; font-weight: bold">*</span></span>
															</div>
															<div class="col-sm-7">
																<select name="semesterId" id="semesterId"
																	class="form-control">
																	<option selected="selected" value="">Please
																		Select Semester</option>
																	<c:forEach items="${semesterList}" var="semester">
																		<option value="${semester.id}">${semester.semesterName}</option>
																	</c:forEach>
																</select>

															</div>
														</div>
													</div>


													<div class="form-group action-btn-group">
														<div class="col-sm-6"></div>
														<div class="col-sm-6">
															<div class="col-sm-4">
																<button type="button" name="submit_create_edit_team"
																	title="Show"
																	class="btn btn-xl btn-success button-submit font13"
																	id="submit_button">Show</button>
															</div>

															<div class="col-sm-6">
																<button type="button" href="#myModal"
																	data-toggle="modal" title="Copy To"
																	class="btn btn-xl btn-primary button-submit font13 launch-modal"
																	id="copy_button">Copy To</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-md-6" style="padding-right: 50px">
												<br>
												<table id=""
													class="table table-bordered  table-checkable table-responsive  grid box-filters"
													aria-describedby="DataTables_Table_0_info"
													style="height: auto; position: relative; overflow: auto;">
													<thead>
														<tr role="row">
															<th class="" role="columnheader" tabindex="0"
																aria-controls="DataTables_Table_0" rowspan="1"
																colspan="1" aria-label="">Select Fee Item By Name</th>
														</tr>
													</thead>
													<tbody role="alert" aria-live="polite" aria-relevant="all"
														id="table-row">
														<tr>
															<td><label class="input-group"> <span
																	class="input-group-addon"><i class="icon-search"></i></span>
																	<input type="text" aria-controls="DataTables_Table_0" placeholder="Search..."
																	class="search form-control">
															</label></td>
														</tr>
													</tbody>
												</table>

												<!-- Giri$h -->
												<!-- <select> 
															<option selected="selected" value="0">Please Select Receipt Type</option>  -->
												<div
													style="height: 150px; position: relative; overflow: auto; top: -8px">
													<table id=""
														class="table table-bordered  table-checkable table-responsive  grid box-filters results"
														aria-describedby="DataTables_Table_0_info">
														<thead>

														</thead>
														<tbody role="alert" aria-live="polite" aria-relevant="all"
															id="table-row">

															<c:forEach items="${feeDescriptionList}"
																var="feeDescription">
																<tr>
																	<td><option class="getfeedescription"
																			value="${feeDescription}">${feeDescription}</option></td>
																</tr>
															</c:forEach>

															<!-- </select>  -->

														</tbody>
													</table>
												</div>

											</div>


											<!-- slide table starts here -->
											<form:form action="../feeCollection/standardFee/add"
												method="post" id="add-edit-form"
												modelAttribute="StandardFeeMasterList">
												<input type="hidden" id="receiptId1" name="receiptTypeId"
													value="0" />
												<input type="hidden" id="degreeId1" name="degreeId"
													value="0" />
												<input type="hidden" id="acadamicSessionId1" name="batchId"
													value="0" />
												<input type="hidden" id="paymentTypeId1"
													name="paymentTypeId" value="0" />
												<input type="hidden" id="semesterId1" name="semesterId"
													value="0" />
												<input type="hidden" id="feeDiscription"
													name="feeDescription" value="0" />
												<div class="col-md-12" id="table2" style="display: none;">
													<!--left div start here -->
													<div class="col-md-6">
														<br>
														<div class="grid box-filters"
															style="position: relative; overflow: auto">
															<table id=""
																class="table table-bordered  table-checkable table-responsive  "
																id="DataTables_Table_0"
																aria-describedby="DataTables_Table_0_info">
																<thead>
																	<tr role="row">
																		<th class="" role="columnheader" tabindex="0"
																			aria-controls="DataTables_Table_0" rowspan="1"
																			colspan="1" aria-label="">Fees Item</th>
																		<th class="" role="columnheader" tabindex="0"
																			aria-controls="DataTables_Table_0" rowspan="1"
																			colspan="1" aria-label="">Amount</th>
																	</tr>
																</thead>
																<tbody role="alert" aria-live="polite"
																	aria-relevant="all" id="fee-heads">
																	<tr class="odd">
																		<td></td>
																		<td><input class="form-control" name="value1"
																			type="number" class="form-control txt"
																			placeholder="Total Amount" id="input1"></td>
																	</tr>
																	<tr class="even">
																		<td>Total</td>
																		<td style="text-align: left" id="sum"></td>
																	</tr>
																</tbody>
															</table>
															<div class="col-sm-12" style="text-align: center">
																<br>
																<div class="controls2">
																	<button type="submit" name="submit_create_edit_team"
																		title="Submit"
																		class="btn btn-xl btn-success button-submit font13"
																		id="submit-button">
																		<span><span class="">Submit</span></span>
																	</button>
																</div>
																<br>
															</div>
														</div>
													</div>
												</div>
											</form:form>
											<!-- slide table ends here -->


											<!-- Model Dialog Box -->
											<div id="myModal" class="modal fade"
												style="position: fixed; overflow-y: hidden; top: 0px">
												<form action="" method="post" id="copy_form">
													<!-- <input type="hidden" id="receiptId2" name="receiptTypeId2"
													value="0" />
												<input type="hidden" id="degreeId2" name="degreeId2"
													value="0" />
												<input type="hidden" id="acadamicSessionId2" name="batchId2"
													value="0" />
												<input type="hidden" id="paymentTypeId1"
													name="paymentTypeId" value="0" />
												<input type="hidden" id="semesterId2" name="semesterId2"
													value="0" /> -->

													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">&times;</button>
																<h4 class="modal-title">Copy Standard Fee</h4>
															</div>

															<div class="modal-body" style="padding: 0px 0px 0px">
																<div class="col-md-12" style="background: #FFFFFF">
																	<div class="form-horizontal">
																		<div class="form-group">
																			<br>
																			<div class="col-sm-12">
																				<div class="col-sm-5">
																					<div id="ContentPlaceHolder1_lblModule"
																						class="control-label">
																						Receipt Type <span
																							style="color: #FF0000; font-weight: bold">*</span>
																					</div>
																				</div>
																				<div class="col-sm-7">
																					<select id="receiptId_To" name="receiptId_To"
																						class="form-control">
																						<option selected="selected" value="">Please
																							Select Receipt Type</option>
																						<c:forEach items="${receiptTypeList}"
																							var="receipt">
																							<option value="${receipt.id}">${receipt.receiptTitle}</option>
																						</c:forEach>
																					</select> 
																				</div>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-5">

																					<div id="ContentPlaceHolder1_lblParent"
																						class="control-label">
																						Degree<span
																							style="color: #FF0000; font-weight: bold">*</span>
																					</div>

																				</div>
																				<div class="col-sm-7">
																					<select name="degreeId_To" id="degreeId_To"
																						class="form-control">
																						<option selected="selected" value="">Please
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
																				<div class="col-sm-5">
																					<div id="ContentPlaceHolder1_lblParent"
																						class="control-label">
																						Batch<span
																							style="color: #FF0000; font-weight: bold">*</span>
																					</div>

																				</div>
																				<div class="col-sm-7">
																					<select name="acadamicSessionId_To"
																						id="acadamicSessionId_To" class="form-control">
																						<option selected="selected" value="">Please
																							Select Batch</option>
																						<c:forEach items="${academicSessionList}"
																							var="session">
																							<option value="${session.id}">${session.sessionName}</option>
																						</c:forEach>
																					</select>

																				</div>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-5">
																					<div id="ContentPlaceHolder1_lblMenuName"
																						class="control-label">
																						Payment Type<span
																							style="color: #FF0000; font-weight: bold">*</span>
																					</div>
																				</div>
																				<div class="col-sm-7">
																					<select name="paymentTypeId_To"
																						id="paymentTypeId_To" class="form-control">
																						<option selected="selected" value="">Please
																							Select Payment Type</option>
																						<c:forEach items="${paymentTypeList}"
																							var="paymentType">
																							<option value="${paymentType.id}">${paymentType.paymentType}</option>
																						</c:forEach>
																					</select>

																				</div>
																			</div>
																		</div>

																		<div class="form-group">
																			<div class="col-sm-12">
																				<div class="col-sm-5">
																					<div id="ContentPlaceHolder1_lblMenuName"
																						class="control-label">
																						Semester<span
																							style="color: #FF0000; font-weight: bold">*</span>
																					</div>
																				</div>
																				<div class="col-sm-7">
																					<select name="semesterId_To" id="semesterId_To"
																						class="form-control">
																						<option selected="selected" value="">Please
																							Select Semester</option>
																						<c:forEach items="${semesterList}" var="semester">
																							<option value="${semester.id}">${semester.semesterName}</option>
																						</c:forEach>
																					</select>

																				</div>
																			</div>
																		</div>
																	</div>

																</div>
																<div class="" style="text-align: center;">
																	<label>Overwrite existing Standard Fee?<input
																		type="checkbox" name="overwriteDemand"
																		id="overwriteDemand" value="false" /></label>
																</div>
															</div>
															<div class="modal-footer" style="margin: 0">
																<button type="button" title="Copy"
																	class="btn btn-primary" id="copy-std-fee-btn">Copy</button>
																<button type="button" class="btn btn-default"
																	title="Close" data-dismiss="modal"
																	id="close-dialog-box">Close</button>

															</div>
														</div>
													</div>
												</form>
												<!-- /.modal-content -->
											</div>
											<!-- /.modal-dialog -->

										</div>
										<!-- /.modal-dialog -->


									</div>
								</div>
							</div>


						</div>
					</div>
			</div>
			</form>


		</div>


	</div>
	</div>


	<!--=== Page Content ===-->

	<!-- /.container -->
	<!-- /.container -->
</body>

