
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Fee Head Details | RF-Campus</title>

<!--=== CSS ===-->
<style>


.highlight {
	background:#00FFCC; 
	color:white; 

}

.glyphicon-plus {
	font-size: 20px;
	color: #1D9D74;
	text-shadow: 2px 2px 4px #83878D;
}
</style>
<jsp:include page="../authentication/script.jsp" />
<script type="text/javascript">
	function append_new_row() {

		$('#feeHeadBody')
				.append(
						'<tr>'

								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								//+ '<input type=\"hidden\" name=\"feeHeads['+totalFeeHead+'].serialNumber\" value=\"\">'
								+ totalFeeHead
								+ '</td>'
								+ ''
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
								+ totalFeeHead
								+ '].feeheadLongName\" value=\"'
								+ ''
								+ '\" />'
								+ '</td>'
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
								+ totalFeeHead
								+ '].feeheadShortName\" value=\"'
								+ ''
								+ '\" />'
								+ '</td>'
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
	'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
								+ totalFeeHead
								+ '].serialNumber\" value=\"'
								+ ''
								+ '\" />'
								+ '</td>'
								+ "<td class=\" \"> "
								+ "															<div class=\"fa-myremove\" title=\"Add\" > "
								+ "																<span class=\"glyphicon glyphicon-plus\" onclick=\"append_new_row()\"> "
								+ "															</span></div> "
								+ "	</td>"
								+ '</tr>');

		totalFeeHead++;
	}

	var excessHeadAvailable = false;
	var totalFeeHead = 1;

	function AddRow() {
		var text = '<tr>'
				+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
				+ '<input type=\"hidden\" name=\"feeHeads['+totalFeeHead+'].serialNumber\" value="'+totalFeeHead+'">'
				+ 'F'
				+ totalFeeHead
				+ '</td>'
				+ ''
				+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
				+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
				+ totalFeeHead
				+ '].feeheadLongName\" value=\"\" />'
				+ '</td>'
				+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
				+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
				+ totalFeeHead + '].feeheadShortName\" value=\"\" />' + '</td>'
				+ '</tr>';

		if (excessHeadAvailable == false) {
			$('#feeHeadBody').append(text);
		} else {
			var rowCount = $('#table1 tr').length;
			$(text).insertAfter($('#table1 tr:eq(' + (rowCount - 2) + ')'));
		}
		totalFeeHead++;
	}

	function AddExcessRow() {
		$('#feeHeadBody')
				.append(
						'<tr class=\"excess-fee\">'
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input type=\"hidden\" name=\"feeHeads['+0+'].serialNumber\" value="'+0+'">'
								+ 'FX</td>'
								+ ''
								+ '<td class=\"sorting\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
								+ 0
								+ '].feeheadLongName\" value=\"\" />'
								+ '</td>'
								+ '<td class=\"sorting\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
								+ 0 + '].feeheadShortName\" value=\"\" />'
								+ '</td>' + '</tr>');

		$("#excessFeeHeadButton").attr('disabled', 'disabled')
		excessHeadAvailable = true;
	}

	/* /* ===ptu deleting row  === */

	/* function myFunction() {
		var choice = confirm('Are you sure?');
		if (choice == true) {
			if ($('#table1 tr:last').hasClass('excess-fee')) {
				excessHeadAvailable = false;
				$("#excessFeeHeadButton").removeAttr('disabled');
			} else {
				totalFeeHead--;
			}
			$('#table1 tr:last').remove();

		}
		return false; */

	/* } */
	/*--------------#####-----------------*/

	$(document)
			.ready(
					function() {

						function validateTable() {
							var flag = true;
							$('#DataTables_Table_0 > tbody > tr').each(
									function() {
										var curr = $(this).find("td:nth-child(2) input");
										if ($(curr).val() == "") {
											$(curr).addClass('highlight');
											flag = false;
										}else{
											$(curr).removeClass('highlight');
										}
										
										var curr = $(this).find("td:nth-child(3) input");
										if ($(curr).val() == "") {
											$(curr).addClass('highlight');
											flag = false;
										}else{
											$(curr).removeClass('highlight');
										}
										
										var curr = $(this).find("td:nth-child(4) input");
										if ($(curr).val() == "") {
											$(curr).addClass('highlight');
											flag = false;
										}else{
											$(curr).removeClass('highlight');
										}
									});
							return flag;
						}

						if ("${message}" == "add") {
							notifysuccess('Record Saved Successfully!!');
						}

						else if ("${message}" == "update") {
							notifyupdate('Record Updated Successfully!!');
						}

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '');
						}, "");

						var validator = $("#add-update-form").validate({
							// Specify the validation rules
							rules : {
								receiptTypeId : {
									required : true,
									selectcheck : true
								}
							},

							messages : {
								receiptTypeId : {
									required : "",
									selectcheck : ""
								}

							},
							submitHandler : function(form) {
								form.submit();
							}

						});

						$("#reset_button").click(
								function() {
									validator.resetForm();
									$("#add-update-form").attr('action',
											'./feeHeads/add');

								});

						$("[name=receiptTypeId]")
								.change(
										function() {
											//alert($(this).val());
											var id = $(this).val();
											//$("#receiptTypeId").val(id);

											totalFeeHead = 1;
											$
													.ajax({
														async : false,
														url : "./feeHeads/getList",
														data : {
															"id" : id
														},
														type : "POST",
														success : function(
																response) {
															//alert(JSON.stringify(response));
															var headList = JSON
																	.parse(JSON
																			.stringify(response));
															if (JSON
																	.stringify(response) != '[]') {
																$(
																		'#feeHeadBody')
																		.empty();
																var msg = '';
																$
																		.each(
																				headList,
																				function(
																						index,
																						feeHead) {
																					if (feeHead.serialNumber != 0) {
																						$(
																								'#feeHeadBody')
																								.append(
																										'<tr>'

																												+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
	        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																												//+ '<input type=\"hidden\" name=\"feeHeads['+totalFeeHead+'].serialNumber\" value=\"'+feeHead.serialNumber+'\">'
																												+ totalFeeHead
																												+ '</td>'
																												+ ''
																												+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
	        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																												+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
																												+ totalFeeHead
																												+ '].feeheadLongName\" value=\"'
																												+ feeHead.feeheadLongName
																												+ '\" />'
																												+ '</td>'
																												+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
	        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																												+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																												+ totalFeeHead
																												+ '].feeheadShortName\" value=\"'
																												+ feeHead.feeheadShortName
																												+ '\" />'
																												+ '</td>'
																												+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
																						        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																												+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																												+ totalFeeHead
																												+ '].serialNumber\"  value=\"'
																												+ feeHead.serialNumber
																												+ '\" />'
																												+ '</td>'
																												+ "<td class=\" \"> "
																												+ "															<div class=\"fa-myremove\" title=\"\" > "
																												+ "																<span class=\"\"> "
																												+ "															</span></div> "
																												+ "	</td>"
																												+ '</tr>');

																						totalFeeHead++;

																					} else {
																						msg = '<tr>'

																								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
		'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																								//+ '<input type=\"hidden\" name=\"feeHeads['+totalFeeHead+'].serialNumber\" value=\"'+feeHead.serialNumber+'\">'
																								+ totalFeeHead
																								+ '</td>'
																								+ ''
																								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
		'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																								+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
																								+ 0
																								+ '].feeheadLongName\" value=\"'
																								+ feeHead.feeheadLongName
																								+ '\" />'
																								+ '</td>'
																								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
		'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																								+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																								+ 0
																								+ '].feeheadShortName\" value=\"'
																								+ feeHead.feeheadShortName
																								+ '\" />'
																								+ '</td>'
																								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
																	        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																								+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																								+ 0
																								+ '].serialNumber\"  value=\"'
																								+ feeHead.serialNumber
																								+ '\" />'
																								+ '</td>'
																								+ "<td class=\" \"> "
																								+ "															<div class=\"fa-myremove\" title=\"\" > "
																								+ "																<span class=\"\"> "
																								+ "															</span></div> "
																								+ "	</td>"
																								+ '</tr>';
																					}

																				});

																$(
																		'#feeHeadBody')
																		.append(
																				'<tr>'

																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						//+ '<input type=\"hidden\" name=\"feeHeads['+''+'].serialNumber\" value=\"\">'
																						+ totalFeeHead
																						+ '</td>'
																						+ ''
																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
																						+ totalFeeHead
																						+ '].feeheadLongName\" value=\"'
																						+ ''
																						+ '\" />'
																						+ '</td>'
																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																						+ totalFeeHead
																						+ '].feeheadShortName\" value=\"'
																						+ ''
																						+ '\" />'
																						+ '</td>'
																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
												        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																						+ totalFeeHead
																						+ '].serialNumber\" value=\"'
																						+ ''
																						+ '\" />'
																						+ '</td>'
																						+ "<td class=\" \"> "
																						+ "															<div class=\"fa-myremove\" title=\"Add\" > "
																						+ "																<span class=\"glyphicon glyphicon-plus\" onclick=\"append_new_row()\"> "
																						+ "															</span></div> "
																						+ "	</td>"
																						+ '</tr>');

																if (msg != '') {
																	excessHeadAvailable = true;
																	$(
																			'#feeHeadBody')
																			.append(
																					msg);
																	$(
																			"#excessFeeHeadButton")
																			.attr(
																					'disabled',
																					'disabled');
																}

															} else {
																$(
																		'#feeHeadBody')
																		.empty();

																$(
																		'#feeHeadBody')
																		.append(
																				'<tr>'

																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						//	+ '<input type=\"hidden\" name=\"feeHeads['+''+'].serialNumber\" value=\"\">'
																						+ totalFeeHead
																						+ '</td>'
																						+ ''
																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						+ '<input style=\"width:100%; ;\" type=\"text\" name=\"feeHeads['
																						+ totalFeeHead
																						+ '].feeheadLongName\" value=\"'
																						+ ''
																						+ '\" />'
																						+ '</td>'
																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																						+ totalFeeHead
																						+ '].feeheadShortName\" value=\"'
																						+ ''
																						+ '\" />'
																						+ '</td>'
																						+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
										        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
																						+ '<input style=\"width:20%; ;\" type=\"text\" name=\"feeHeads['
																						+ totalFeeHead
																						+ '].serialNumber\" />'
																						+ '</td>'
																						+ "<td class=\" \"> "
																						+ "															<div class=\"fa-myremove\" title=\"Add\" > "
																						+ "																<span class=\"glyphicon glyphicon-plus\" onclick=\"append_new_row()\"> "
																						+ "															</span></div> "
																						+ "	</td>"
																						+ '</tr>');
																totalFeeHead++;
															}

														}
													});
										});

						$("#save-fee-heads-btn").click(function() {
							var flag = validateTable();
							if (flag != false) {
								$("#add-update-form").submit();
							} else {
 
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
							action="./feeHeads/add" id="add-update-form"
							modelAttribute="FeeHeadList">
							<!-- /Navigation Vertical -->
							<div id="my_documents_container" style=""
								class="doc-container column-one clearfix ">

								<div class="grid-header text">FEE HEAD MASTER</div>
								<div class="grid box-filters">
									<div class="table-header">


										<!-- <input type="hidden" name="receiptTypeId" id="receiptTypeId" value="0" /> -->
										<div class="row my-bg-success">
										<div class="form-group">
													<div class="col-sm-12 ">
														<div class="col-sm-3">
															Note <b>:</b> <span style="color: #FF0000">*
																Marked Is Mandatory !</span>
														</div>
													</div>
												</div>
											<!--1st div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-4 ">
															<div class="control-label">
																Receipt For <span
																	style="color: #FF0000; font-weight: bold"> *</span>
															</div>
														</div>
														<div class="col-sm-6">
															<select name="receiptTypeId" id="receiptTypeId"
																class="form-control">
																<option selected="selected" value="">Please
																	Select</option>
																<c:forEach items="${reciptTypeList}" var="receipt">
																	<option value="${receipt.id}">${receipt.receiptTitle}
																	</option>
																</c:forEach>
															</select>

														</div>
													</div>

												</div>
											</div>

											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">
														<!--Button start here -->

														<!-- Button  end here -->
													</div>
												</div>
											</div>
											<!--2nd div end here -->
										</div>
										<%-- </form> --%>
									</div>
								</div>

								<div class="grid-title">
									<div class="pull-left">Fee Head Definition</div>
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
												class=" dataTables_header table table-striped table-bordered table-hover table-responsive "
												id="DataTables_Table_0"
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">

														<th>Sr No</th>
														<th>Fee Long Name</th>
														<th>Short Name</th>
														<th>Sequence</th>
														<th>Action</th>
													</tr>
												</thead>

												<tbody id="feeHeadBody">

													<%-- <c:forEach items="${FeeHeadList.feeHeads}" var="head"
													varStatus="status">
													<tr>
														<td id="count" class="sorting" role="columnheader"
															tabindex="0" aria-controls="DataTables_Table_0"
															rowspan="1" colspan="1">&nbsp;</td>
														<td id="" class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1">&nbsp;</td>
														<td class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"><input id=""
															style="width: 100%; outline: none; border: 0; ;"
															type="text"
															name="feeHeads[${status.index}].feeheadLongName" value="" />
														</td>
														<td class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"><input
															style="width: 100%; outline: none; border: 0; ;"
															type="text"
															name="feeHeads[${status.index}].feeheadShortName"
															value="" /></td>
													</tr>
												</c:forEach> --%>
		 										</tbody>
											</table>
										</div>
									</div>

									<!-- Modal dialog -->

									<!-- /.modal -->
								</div>

								<div class="col-md-12">
									<div class="form-group action-btn-group">
										<div class="controls2">
											<span class="left-margin-remove">
												<button id="save-fee-heads-btn" type="button" title="Save"
													class="btn btn-xl btn-success button-submit font13">
													Save</button>
											</span>
											<!-- <a href="#"> -->
											<button type="button" name="submit_create_edit_team"
												id="reset_button" title="Reset"
												class="btn btn-xl btn-default button-submit font13">
												Reset</button>
											<button type="button" name="submit_create_edit_team"
												id="report_button" title="Report"
												class="btn btn-xl btn-default button-submit font13">
												Report</button>
										</div>
									</div>
								</div>
								<!--hell code end here -->
							</div>
						</form>
					</div>
					<!-- /.modal -->
				</div>

				<!--=== Page Content ===-->
				<!--=== Managed Tables ===-->

				<!--=== Horizontal Scrolling ===-->

				<!-- /Horizontal Scrolling -->
				<!-- /Page Content -->
			</div>
			<!-- /.container -->

		</div>

	</div>
</body>


</html>
