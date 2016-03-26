<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Fee Refund Rule | RF-Campus</title>

<!--=== CSS ===-->

<style type="text/css">
</style>
<jsp:include page="../authentication/script.jsp" />
<script>
	
	
	
	$(document).ready(function(){
		
		jQuery.validator.addMethod('selectcheck', function(value) {
			return (value != "");
		}, "");

		jQuery.validator.addMethod("lettersonly", function(value, element) {
			return this.optional(element) || /^[a-z," "]+$/i.test(value);
		}, "Numbers or Special Characters not Allowed");

		var validator = $("#fee-refund-rule-form").validate({
			// Specify the validation rules
			rules : {
				receiptTypeId : {
					required : true,
					selectcheck : true,
				},
				degreeId : {
					required : true,
					selectcheck : true,
				},
				paymentTypeId : {
					required : true,
					selectcheck : true,
				}
			},

			// Specify the validation error messages
			messages : {
				receiptTypeId : {
					required : "",
					selectcheck : "",
				},
				degreeId : {
					required : "",
					selectcheck : "",
				},
				paymentTypeId : {
					required : "",
					selectcheck : "",
				},

			},

			submitHandler : function(form) {
				//form.submit();
			}
		});
		
		$("#show-btn").click(function(){
			
			var receiptTypeId = $("#receiptTypeId").val();
			var degreeId = $("#degreeId").val();
			var paymentTypeId = $("#paymentTypeId").val();
			
			$
			.ajax({
				async : false,
				url : "./fees-refund-rule/heads",
				type : "GET",
				data : {
					"receiptTypeId" : receiptTypeId, "degreeId": degreeId, "paymentTypeId" : paymentTypeId
				},
				success : function(
						response) {
					//alert(JSON.stringify(response));
					var text = '';
					var srno = 0;
					var amount;
					var isCalculative;
					$.each(response, function(index, feeHead){
						amount = (feeHead.percentageOrAmount != undefined ? feeHead.percentageOrAmount : 0);
						isCalculative = (feeHead.isCalculative != undefined ? feeHead.isCalculative : false);
						text += "<tr>"+
						"	<td>"+feeHead.feeheadLongName+"</td>"+
						"	<td><input type=\"hidden\" name=\"refundRuleTransaction["+srno+"].feeHeadId\" value=\""+feeHead.feeHeadId+"\"/><input type=\"text\" name=\"refundRuleTransaction["+srno+"].percentageOrAmount\" value=\""+amount+"\"/></td>";
						if(isCalculative == true){
							text +="	<td><input type=\"hidden\" name=\"_refundRuleTransaction["+srno+"].isCalculative\" value=\"on\"/> <input type=\"checkbox\" checked=\"checked\" class=\"isCalculative\" name=\"refundRuleTransaction["+srno+"].isCalculative\" value=\""+isCalculative+"\"/></td>";	
						}else{
							text +="	<td><input type=\"hidden\"  name=\"_refundRuleTransaction["+srno+"].isCalculative\" value=\"on\"/> <input type=\"checkbox\" class=\"isCalculative\" name=\"refundRuleTransaction["+srno+"].isCalculative\" value=\""+isCalculative+"\"/></td>";
						}
						text+= "</tr>";
						srno++;
					});
					
					$("#feeHeadsBody").empty().html(text);
				},
				error : function() {
					alert('eror...');
				},
			});
		});
		
		
		$("body").on('change', ".isCalculative", function(){
			//alert('checked');
			if($(this).is(":checked")){
				$(this).val(true);
				$(this).prev().val('off');
			}else{
				$(this).val(false);
				$(this).prev().val('on');
			}
		});
		
		$(".dropdowns").change(function(){
			//alert('change');
			var degreeId = $("#degreeId").val();
			var paymentTypeId = $("#paymentTypeId").val();
			var receiptTypeId = $("#receiptTypeId").val();
			var text = '';
			
			if(degreeId != 0 && paymentTypeId != 0 && receiptTypeId != 0){
				text += $("#degreeId option:selected").html() + '-';
				text += $("#paymentTypeId option:selected").html() + '-';
				text += $("#receiptTypeId option:selected").html();
				//alert(text);	
				$("#ruleLongName").val(text);
			}
			
		});
		
	});
</script>
</head>

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

						<form class="form-inline ng-pristine ng-valid" method="post"
											action="" id="fee-refund-rule-form">
						<input type="text" name="id" id="id" value="0">
											
						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">
							<div class="grid-header text">FEES REFUND RULE</div>
							<div
								class="two-child-containers clearfixs column-one-contents info-container-page">
								<div class="grid box-filters">
									<div class="table-header">
										
											<div class="row my-bg-success">
												<!--1st div start here -->
												<div class="col-md-6">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Rule Name<!-- <span
																			style="color: #FF0000; font-weight: bold">*</span> -->
																	</div>
																</div>
																<div class="col-sm-7">
																	<input type="text" maxlength="40" name="ruleLongName"
																		class="form-control" id="ruleLongName"
																		placeholder="Please enter rule name" readonly="readonly"/>
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Degree <span style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="degreeId" class="form-control dropdowns"
																		id="degreeId">
																		<option selected="selected" value="0">Please
																			Select</option>
																			<c:forEach items="${DEGREE_LIST}" var="degree">
																				<option value="${degree.id}">${degree.name}</option>	
																			</c:forEach>
																		
																	</select>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Payment Type <span
																			style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="paymentTypeId" class="form-control dropdowns"
																		id="paymentTypeId">
																		<option selected="selected" value="0">Please
																			Select</option>
																			<c:forEach items="${PAYMENT_TYPE_LIST}" var="paymentType">
																				<option value="${paymentType.id}">${paymentType.name}</option>	
																			</c:forEach>
																	</select>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Receipt <span
																			style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="receiptTypeId" class="form-control dropdowns"
																		id="receiptTypeId">
																		<option selected="selected" value="0">Please
																			Select</option>
																		<c:forEach items="${FEES_COLLECTION_RECEIPT_TYPE}" var="receiptType">
																				<option value="${receiptType.id}">${receiptType.name}</option>	
																			</c:forEach>
																	</select>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!--1st div end here -->

												<!--Button start here -->
												<div class="form-horizontal">
													<div class="" style="text-align: center">

														<div class="col-sm-12">

															<button type="button" id="show-btn" title="Show"
																class="btn btn-xl btn-success button-submit font13">Show</button>

															<!-- <button type="button" title="Reset"
																class="btn btn-xl btn-cancel button-cancel font13"
																id="cancel-btn">Reset</button>

															<button type="button" title="Report"
																class="btn btn-xl btn-cancel button-submit font13"
																id="report-btn">Report</button> -->

														</div>
													</div>
												</div>
												<!--Button  end here -->

												<!-- end of all 3 div row-->

											</div>

										
									</div>
								</div>
							</div>
							<!-- </div> -->

							<div class="grid-title">
								<div class="pull-left">Fee Heads</div>
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
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="PHOTO: activate to sort column ascending">Head
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Amount
													</th>

													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Calculative
													</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all" id="feeHeadsBody">
												<!-- <tr>
													<td>Head 1</td>
													<td><input type="text" /></td>
													<td><input type="checkbox" /></td>
												</tr> -->

											</tbody>
										</table>
									</div>
									<br>
									<div class="row">
										<div class="form-horizontal">
											<div class="" style="text-align: center">

												<div class="col-sm-12">

													<button type="submit" id="" title="Save"
														class="btn btn-xl btn-success button-submit font13">Save</button>


													<button type="button" title="Reset"
														class="btn btn-xl btn-cancel button-cancel font13"
														id="cancel-btn">Reset</button>

													<!-- <button type="button" title="Report"
														class="btn btn-xl btn-cancel button-submit font13"
														id="report-btn">Report</button> -->

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						</form>
						<!-- /General Information -->
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->
</body>

