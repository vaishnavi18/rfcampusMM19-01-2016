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
<title>Student Fee Collection | RF-Campus</title>
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

#outterDivFeeDetailTable:hover{
position:absolute;
width:100%;
/* border:1px solid red; */
background:#f1f1f1;
min-height:150px;
z-index:40000;
}

#demanddraftList
{
    counter-reset: Serial;           /* Set the Serial counter to 0 */
}

tr td:first-child:before
{
  counter-increment: Serial;      /* Increment the Serial counter */
  content:  counter(Serial); /* Display the counter */
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
						

						/* $("#check_condition").click(); */
					    
					    	  $("#checkDiv").modal({
									backdrop : 'static',
									keyboard : false
								});
					            $.cookie('msg', 'str');
					       
					        
						

						$("#select-btn")
								.click(
										function() {
											if ($("#initialModal").valid()) {
												document
														.getElementById('message').innerHTML = "Fee Collection for Receipt Type: "
														+ $(
																"#receiptType_modal :selected")
																.text()
														+ " and Payment Type: "
														+ $(
																"#paymentMode_modal :selected")
																.text();
												/*   $("#checkDiv").modal('hide'); */

												var receiptType = $(
														"#receiptType_modal")
														.val();
												var paymentMode = $(
														"#paymentMode_modal")
														.val();
												$("#checkDiv").modal('hide');
												var months = [ '01', '02',
														'03', '04', '05', '06',
														'07', '08', '09', '10',
														'11', '12' ];
												var today = new Date();
												if (today < 10) {
													document
															.getElementById("receiptDate").value = "0"
															+ today.getDate()
															+ "/"
															+ months[today
																	.getMonth()]
															+ "/"
															+ today
																	.getFullYear();
												} else {
													document
															.getElementById("receiptDate").value = today
															.getDate()
															+ "/"
															+ months[today
																	.getMonth()]
															+ "/"
															+ today
																	.getFullYear();
												}
												$
														.ajax({
															async : false,
															url : "../feeCollection/dcr/setDcr",
															data : {
																"receiptType" : receiptType,
																"paymentMode" : paymentMode
															},
															type : "POST",
															success : function(
																	response) {

															}
														});
											}
										});

						jQuery('#demandDraftDate').datetimepicker({
							timepicker : false,
							format : 'd/m/Y'
						});

						$("#paymentType").change(function() {
							var p = $("#paymentType").val();

							if (p == "CC") {
								$("#draftDiv").hide();
							} else {
								$("#draftDiv").show();
							}
						});
						$("#currency").prop("selectedIndex",2);

					$("#show_button").click(function()
					{	
							if ($("#add-edit-feecollection").valid()) 
							{	
									var enrollmentId = document.getElementById("enrollno").value;
										var enrollmentId = $('#enrollno').val();
										var semesterId = $('#semester_two').val();
										
										 $.ajax({
													async : false,
													url : "../feeCollection/dcr/information",
													data : {
														"enrollmentId" : enrollmentId,
														"semesterId" : semesterId	
													},
													type : "POST",
													success : function(response) {	
														alert(JSON.stringify(response));
														var studentInfo=response.studentInfo[0];
														if(response.result=='false')
														{
															if(response.message=='true')
															   {
																notifyerror("Standard Fee Is Not Defined!!")
														       }
															else
																{
															   		
															   		noty({

																		text : 'Do you want to create demand ?',
																		layout : 'center',
																		type : 'warning',
																	 	modal : true,
																	 	theme : 'defaultTheme',
																		  buttons     : [
																		               {addClass: 'btn btn-primary', text: 'Ok', onClick: function ($noty) {
																		            	$.ajax({
																							async : false,
																							url : "../feeCollection/dcr/addDemand",
																							data : {
																								"degreeId" :studentInfo.degreeId,
																								"branchId" : studentInfo.branchId,
																								"paymentTypeId" : studentInfo.paymentTypeId,
																								"demandFor" : semesterId,
																								"semesterId" : studentInfo.semesterId,
																								"enrollmentNumber" : studentInfo.enrollmentNumber,
																								"admissionBatch" : studentInfo.admissionBatchId,
																									},
																							//contentType: "application/json",
																								type : "POST",
																								success : function(response)
																								{	
																									notifysuccess(response);
																								}
																			   				});	 
																		            	$noty.close();
																		            	
																		            	 
																		               }
																		               },
																		               {addClass: 'btn btn-default', text: 'Cancel', onClick: function ($noty) {
																		                   $noty.close();
																		                  
																		               }
																		               }
																		           ] ,
																		animation : {
																			open : 'animated fadeIn', // Animate.css class names
																			close : 'animated fadeOut',// Animate.css class names
																			easing : 'swing',
																			speed : 500,
																		},
																		timeout : 2000,
																	});
															   		
																   }
															}
														else{
															var studentDemand=response.studentDemand;
															var feeDetails=response.feeDetails;
															alert(JSON.stringify(studentInfo));
															setStudentDeatils(JSON.stringify(studentInfo));
															setStudentDemandDeatils(JSON.stringify(studentDemand));
															setStudentFeeDetails(JSON.stringify(feeDetails))
															$("#receiptNumber").val(response.receiptNumber);
															$("#adjustexcess").val(response.excessAmt);	
														}	
													}
												});
							
							}
				});//submit_button click block

				
				
				
				
				
										
						/* function setDemandDraft(demandNo) {
							alert(demandNo);
						} */

						function setStudentDemandDeatils(studentDemand) {
							var text = "";
							var srno = 1;
							studentDemand = JSON.parse(studentDemand);
							$
									.each(
											studentDemand,
											function(index, demand) {
												text += "<tr class=\"odd\">"
														+ "		<td style=\"width: 20%\">"
														+ srno
														+ "</td>"
														+ "		<td style=\"width: 30%\">"
														+ demand.feeheadLongName
														+ "</td>"
														+ "		<td style=\"width: 30%\">"
														+ 'INR'
														+ "</td>"
														+ "		<td style=\"width: 20%\"><input type=\"hidden\"  name=\"dcrTransaction["+srno+"].feeheadId\""+
									"			class=\"form-control\" value=\""+demand.feeheadId+"\"/><input type=\"text\""
														+ "			class=\"txt form-control headAmount\" oninput=\"calculateSum()\" name=\"dcrTransaction["
														+ srno
														+ "].amount\" value=\""
														+ demand.amount
														+ "\"/></td>" + "</tr>";
												srno++;

											});
							$("#demandList").empty().html(text);
							calculateSum();
						}
						function setStudentDeatils(studentInfo) {
							studentInfo = JSON.parse(studentInfo);
							$("#enrollmentNumber").html(
									studentInfo.enrollmentNumber);
							$("#degreeName").html(studentInfo.degreeName);
							$("#studentName").html(studentInfo.studentName);
							$("#branchShortName").html(
									studentInfo.branchShortName);
							$("#genderName").html(studentInfo.genderName);
							$("#year_two").html(studentInfo.year);
							$("#admissionDate").html(studentInfo.admissionDate);
							$("#semesterName").html(studentInfo.semesterName);
							$("#payType").html(studentInfo.paymentType);
							$("#admissionBatch").html(
									studentInfo.admissionBatch);
							$("#degreeId").val(studentInfo.degreeId);
							//$("#branchId").val(studentInfo.branchId);
							//$("#genderId").val(studentInfo.genderId);
							//$("#yearId").val(studentInfo.yearId);
							$("#semesterId").val(studentInfo.semesterId);
							$("#paymentTypeId").val(studentInfo.paymentTypeId);
							$("#studentId").val(studentInfo.studentId);
							$("#admissionBatchId").val(
									studentInfo.admissionBatchId);
							if (studentInfo.hosteler == 'true') {
								$("#hosteler").html('Yes');
							} else {
								$("#hosteler").html('No');
							}

							if (studentInfo.transport == 'true') {
								$("#transport").html('Yes');
							} else {
								$("#transport").html('No');
							}
						}
						function setStudentFeeDetails(feeDetails)
						{
							var text = "";
							
							feeDetails = JSON.parse(feeDetails);
							$
									.each(
											feeDetails,
											function(index, fee) {
												text += "<tr class=\"odd\" >"+
												"<td class=\" \">"+fee.semesterId+"</td>"+
												"<td class=\" \">"+fee.totalAppliedAmount+"</td>"+
												"<td class=\" \">"+fee.totalAmtPaid+"</td>"+
												"<td class=\" \">"+fee.totalExcessAmt+"</td>"+
												"<td class=\" \">"+0.0+"</td>"+
												"<td class=\" \">"+fee.balanceAmt+"</td>"+
												"</tr>";
											});
							$("#feeDetails").empty().html(text);							
						}
						

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0' && value != '' && value != 0);
						}, "");
						var validatorInitialModal = $("#initialModal").validate({

									rules : {
										receiptType_modal : {
											required : true,
											selectcheck : true

										},
										paymentMode_modal : {
											required : true,
											selectcheck : true

										}
									},

									messages : {
										receiptType_modal : {
											required : "",
											selectcheck : ""

										},
										paymentMode_modal : {
											required : "",
											selectcheck : ""

										}
									},
									submitHandler : function(form) {
										form.submit();
									}

								});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0' && value != '' && value != 0);
						}, "");

						var validator_two = $("#add-edit-feecollection").validate({
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

						var validator_three = $("#add-edit-feecollection").validate({
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
						
						$("#check_condition").click(function() {
							$("#checkDiv").modal({
								backdrop : 'static',
								keyboard : false
							});
						});

						$("#checkDiv").draggable({
							handle : ".changemodal"
						});

						$("#save-demanddraft-btn")
								.click(
										function() {

											if ($("#add-edit-feecollection").valid()) {
												$("#totalDD").val(parseInt($("#totalDD").val()) + parseInt($("#demandDraftAmount").val()));
												if (parseInt($("#totalDD").val()) >= parseInt($("#amounttopay").val())) {
													$("#totalcash").val(0);

												} else {
													$("#totalcash").val(parseInt($("#amounttopay").val()) - parseInt($("#totalDD").val()));
												}

												calculateExcess();
												$("#demand_draft_table").slideDown(1000);
												text = {
													"demandDraftNumber" : $("#demandDraftNumber").val(),
													"demandDraftDate" : $("#demandDraftDate").val(),
													"locationId" : $("#locationId").val(),
													"bankId" : $("#bankId").val(),
													"demandDraftAmount" : $("#demandDraftAmount").val()
												};
												ddDetails.push(text);

												if (updateOperation == true) {
													remove_this($("#demandDraftNumber").val());
												}

												$("#demanddraftList").append("<tr class=\"odd\" id=\"ddId-"
																		+ $("#demandDraftNumber").val()
																		+ "\">"
																		+ "	<td style=\"width: 5%\"></td>"
																		+ "<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].demandDraftNumber\" value=\""
																		+ $("#demandDraftNumber").val()
																		+ "\""
																		+ "></span>"
																		+ $("#demandDraftNumber").val()
																		+ "</td>"
																		+ "<td style=\"width: 10%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].demandDraftDate\" value=\""
																		+ $("#demandDraftDate").val()
																		+ "\"></span>"
																		+ $("#demandDraftDate").val()
																		+ "</td>"
																		+ "<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].locationId\" value=\""
																		+ $("#locationId").val()
																		+ "\"></span>"
																		+ $("#locationId option:selected").html()
																		+ "</td>"
																		+ "<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].bankId\" value=\""
																		+ $("#bankId").val()
																		+ "\"></span>"
																		+ $("#bankId option:selected").html()
																		+ "</td>"
																		+ "	<td style=\"width: 20%\"><span><input type=\"hidden\" name=\"dcrDDTransaction["
																		+ ddSequenceNumber
																		+ "].demandDraftAmount\" value=\""
																		+ $("#demandDraftAmount").val()
																		+ "\"></span>"
																		+ $("#demandDraftAmount").val()
																		+ "</td>"
																		+ "	<td style=\"width: 30%\">"
																		+ "	<div class=\"fa-select\" title=\"Edit\""
																		+ "	onclick=\"edit_this('"
																		+ $("#demandDraftNumber").val()
																		+ "', '"
																		+ $("#demandDraftDate").val()
																		+ "', '"
																		+ $("#locationId").val()
																		+ "', '"
																		+ $("#bankId").val()
																		+ "', '"
																		+ $("#demandDraftAmount").val()
																		+ "')\">"
																		+ "	<i class=\"fa fa-pencil-square\"></i>"
																		+ "	</div>"
																		+ "	<div class=\"fa-myremove\" title=\"Delete\" "
																		+ "	onclick=\"remove_this('"
																		+ $("#demandDraftNumber").val()
																		+ "')\">"
																		+ "<i class=\"fa fa-trash-o\"></i>"
																		+ "</div>"
																		+ "</td>"
																		+ "	</tr>");
												ddSequenceNumber++;

												$("#save-demanddraft-btn").html('Save Demand Draft');
												$("#reset-demanddraft-btn").click();
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
							"info" : false
						});

					});

	function resetAll()
	{
		//$("#enrollno").val('');
		$("#enrollmentNumber").text('');
		$("#degreeName").text('');
		$("#studentName").text('');
		$("#branchShortName").text('');
		$("#genderName").text('');
		$("#year_two").text('');
		$("#admissionDate").text('');
		$("#semesterName").text('');
		$("#payType").text('');
		$("#admissionBatch").text('');
		$("#hosteler").text('');
		$("#transport").text('');
			
		
		
	}
	
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
		if($("#demand_draft_table tbody tr").size()==1)
		{ 
		$("#ddId-" + demandNo).remove();
		$("#demand_draft_table").slideUp();
		}
		else{$("#ddId-" + demandNo).remove();}
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
											<div class="grid-header text">STUDENT FEE COLLECTION</div>
											<!-- Model Dialog Box -->
											<div class="col-sm-12">
												<div class="col-sm-7">
													<div id="message" style="font-weight: bold;"></div>
												</div>
												<div class="col-sm-1">
													<input type="button" id="check_condition"
														data-toggle="modal" name="checkall" title="Change"
														value="Change" data-target="#checkDiv">
												</div>
											</div>
											<br>

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
																<input type="text" onchange="resetAll()" class="form-control eitheror"
																	id="enrollno" name="enrollno"> <input 
																	type="hidden" id="studentId" name="studentSerialNumber"
																	value="0">
															</div>
															<div>

																<a href="#student-info-modal" data-backdrop="false"
																	data-toggle="modal"
																	class="fa fa-search" style="padding-top: 5px;"
																	title="Search Student"> </a>
															</div>
														</div>
													</div>
												</div>

												<div class="col-sm-6">
													<div class="form-horizontal" style="text-align: left">
														<br>
														<div class="form-group">
															<div class="col-sm-5">
																<span class="control-label">Semester <span
																	style="color: #FF0000; font-weight: bold">*</span>
																</span>
															</div>

															<div class="col-sm-7">
																<select name="semester_two" class="form-control"
																	id="semester_two">
																	<option selected="selected" onchange="resetAll()" value="0">Please
																		Select</option>
																	<c:forEach items="${semesterList}" var="semester">
																		<option value="${semester.id}">${semester.name}</option>
																	</c:forEach>
																</select>
															</div>

														</div>
													</div>
												</div>

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

											<div class="col-sm-12" id="student-info">
												<div class="box-header"
													style="top: 5px; background-color: #E2DFDF">
													<div class="box-name">
														<span>Student Information</span>
													</div>
												</div>
												<br>
												<div class="col-sm-12">
													<div class="col-sm-3">
                                                    <ul class="list-unstyled">
                                                        <li>
                                                            <span>Enrollment No.:&nbsp;&nbsp;</span> 
                                                          <strong><span id="enrollmentNumber"></span></strong>
															<input type="hidden" id="studentId" name="studentId"
																	value="0">
                                                        </li>
                                                       <br>
                                                        <li>
                                                            <span>Degree:&nbsp;&nbsp;</span> 
                                                   <strong> <span id="degreeName" > </span></strong> <input
																	type="hidden" id="degreeId" name="degreeId" value="0">
                                                        </li>
                                                        <br>
                                                        <li>
                                                            <span>Student's Name:&nbsp;&nbsp;</span> 
                                                        <strong><span id="studentName" > </span></strong>
                                                        </li>
                                                        <br>
                                                        <li>
                                                          <span>Branch:&nbsp;&nbsp;</span> 
                                                          <strong> <span class="strong" id="branchShortName" ></span></strong>
                                                        </li>
                                                        <br>
                                                        <li>
                                                         <span>Gender:&nbsp;&nbsp;</span> 
                                                         <strong>  <span class="strong" id="genderName" > </span></strong>
                                                        </li>
                                                        <br>
                                                        <li>
                                                            <span>Year:&nbsp;&nbsp;</span> 
                                                        <strong><span class="strong" id="year_two" > </span></strong>
                                                        </li>
                                                        <br>
                                                        </ul>
                                                        </div>
                                                        <div class="col-sm-3">
                                                    <ul class="list-unstyled">
														<li>
                                                            <span>Date of Admission:&nbsp;&nbsp;</span> 
                                                       <strong><span  id="admissionDate" ></span></strong>
                                                        </li>
                                                        <br>
														<li>
                                                            <span>Semester:&nbsp;&nbsp;</span> 
                                                         <strong><span  id="semesterName" > </span></strong> <input
																	type="hidden" id="semesterId" name="semesterId"
																	value="0">
                                                        </li>
                                                        <br>
														<li>
                                                            <span>Payment Type:&nbsp;&nbsp;</span> 
                                                        <strong><span  id="payType" ></span></strong> <input
																	type="hidden" id="paymentTypeId" name="paymentTypeId"
																	value="">
                                                        </li>
                                                        <br>
														<li>
                                                            <span>Batch:&nbsp;&nbsp;</span> 
                                                        <strong><span id="admissionBatch" ></span></strong>
																<input type="hidden" id="admissionBatchId"
																	name="batchId" value="0">
                                                        </li>
                                                        <br>
														<li>
                                                            <span>Hostel:&nbsp;&nbsp;</span> 
                                                         <strong> <span id="hosteler" ></span></strong>
                                                        </li>
                                                        <br>
														<li>
                                                            <span>Transport:&nbsp;&nbsp;</span> 
                                                         <strong>  <span id="transport" ></span></strong>
                                                        </li>
                                                        <br>
                                                    </ul>
                                                    </div>
                                                    <div class="col-sm-6" id="outterDivFeeDetailTable">
														<div class="grid-title">
															<div class="pull-left">Fees Detail</div>
															<div class="clear"></div>
														</div>
														<div class="grid-content">
															<div class="form-inline" role="grid">
																<div class="row" style="margin-top: -15px;">
																	<div class="dataTables_header clearfix">
																		<div class="col-md-6"></div>
																	</div>
																</div>
																<div
																	style="position: relative; overflow: auto; max-width: 100%">
																	<table id="feesDetailTable"
																		class="display table table-striped table-bordered table-hover table-checkable  table-responsive"
																		style="cellspacing: 0; width: 100%;">
																		<thead>
																		<thead>
																			<tr role="row">
																				<th>Year</th>
																				<th>Applied</th>
																				<th>Paid</th>
																				<th>Excess</th>
																				<th>Adjusted</th>
																				<th>Balance</th>
																			</tr>
																		</thead>
																		<tbody role="alert" aria-live="polite"
																			aria-relevant="all" id="feeDetails">
																			
																				<!-- <tr class="odd" >
																					<td class=" ">OP_BL</td>
																					<td class=" ">0.00</td>
																					<td class=" ">0.00</td>
																					<td class=" ">0.00</td>
																					<td class=" ">0.00</td>
																					<td class=" ">0.00</td>
																				</tr> -->
																			
																		</tbody>
																	</table>
																</div>
															</div>

														</div>
													</div>
											</div>
										</div>
										<div class="col-sm-12" id="receipt-info">
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
														<span class="control-label">Receipt No.:</span>
													</div>
													<div class="col-sm-7">
														<input name="receiptNumber" type="text" id="receiptNumber"
															class="form-control" readonly>
													</div>


												</div>
												<div class="form-group">
													<div class="col-sm-4">
														<span id="rd" class="control-label">Receipt Date:</span>
													</div>
													<div class="col-sm-6">
														<input name="receiptDate" type="text" id="receiptDate"
															class="form-control" />
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-4">
														<span id="pt" class="control-label">Payment Type:</span>
													</div>
													<div class="col-sm-6">
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
												<div class="form-group">
													<div class="col-sm-4">
														<span id="atpd" class="control-label">Amount to be
															paid:</span>
													</div>
													<div class="col-sm-6">
														<input name="totalPaidAmount" type="number"
															id="amounttopay" placeholder="Please Enter Amount"
															class="form-control">
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-4">
														<span id="aea" class="control-label">Adjust Excess
															Amount:</span>
													</div>
													<div class="col-sm-6">
														<input name="adjustexcess" type="number" id="adjustexcess"
															class="form-control" value="0" disabled />
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-4">
														<span id="cur" class="control-label">Currency :</span>
													</div>
													<div class="col-sm-6">
														<select name="currency" id="currency" tabindex="1"
															class="form-control">
															<option value="">Please Select</option>
															<c:forEach items="${currencyList}" var="currency">
																<option value="${currency.id}">${currency.currencyName}</option>
															</c:forEach>
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
										<br>
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
														<table
															class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  ">
															<thead>
																<tr role="row">
																	<th style="width: 20%">Sr. No.</th>
																	<th style="width: 30%">Fee Heads</th>
																	<th style="width: 30%">Currency</th>
																	<th style="width: 20%">Amount</th>
																</tr>
															</thead>

															<tbody role="alert" aria-live="polite"
																aria-relevant="all" id="demandList">

																<tr class="odd">
																	<td style="width: 20%"></td>
																	<td style="width: 30%"></td>
																	<td style="width: 30%"></td>
																	<td style="width: 20%"><input type="number"
																		class="form-control" /></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<!-- Modal dialog -->

											<!-- /.modal -->
										</div>
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
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- start of checkDiv-->
	<form action="../feeCollection/dcr/setDcr" method="post"
		id=initialModal>
		<div class="modal fade " id="checkDiv" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="overflow: hidden;">
			<div class="modal-dialog ">
				<div class="modal-content">
					<div class="modal-header changemodal">
						<button type="button" class="" data-dismiss=""
							style="display: none"></button>
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
									<select name="receiptType_modal" class="form-control"
										id="receiptType_modal">
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
									<select name="paymentMode_modal" class="form-control"
										id="paymentMode_modal">
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
								<button type="button" id="select-btn"
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
	<div id="student-info-modal" class="modal fade"
		style="overflow: hidden;">
		<div class="modal-dialog" style="width: 50%">
			<div class="modal-content">
				<div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal" data-backdrop= 'static' data-keyboard = false>&times;</button>
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
										for="">NAME</label>&nbsp;&nbsp;&nbsp;
									<input id="searchByUserId" type="radio" name="searchBy"
										value="2"> <label
										for="">ENROLLMENT
										NO.&nbsp;</label>&nbsp;&nbsp;&nbsp; <input id="searchByLoginId"
										type="radio" name="searchBy" value="3"> <label
										for="">ID NO.</label>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-4"></div>
								<div class="col-sm-4">
									<input name=""
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
													<option value="${degree.id}">${degree.name}
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
					 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal-dialog -->
	<!-- end of checkdiv -->
</body>





