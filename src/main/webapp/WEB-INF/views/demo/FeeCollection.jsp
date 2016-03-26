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
	font-weight: bold;
}
</style>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

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
							if ($("#add-edit-feecollection").validate()) {
								$("#student-info").slideDown(1000);
								$("#receipt-info").slideDown(1000);
								$("#btngroup").slideDown(1000);
								$("#tbldiv").slideDown(1000);
								$("#feetbldiv").slideDown(1000);
							}

						});

						$("#check_condition").click(function() {
						//	$("#draftDiv").slideUp(1000);
							$("#checkDiv").toggle("slide","4000");
							
						});

						$("#reset_button")
								.click(
										function() {
											validator.resetForm();
											$("#enrollno").val(0);
											$("#studentName").text('');
											$("#gender").text('');
											$("#admissionDate").text('');
											$("#paymentType").text('');
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
						$(".launch-modal").click(function() {
							$("#student-info-modal").modal({
								backdrop : 'static'
							});
						});

						$("#student-info-modal").draggable({
							handle : ".modal-header"
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
				<form action="" id="add-edit-feecollection">
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
											<div id="student-info-modal" class="modal fade launch-modal"
												style="overflow: hidden;">
												<div class="modal-dialog col-sm-6 col-xs-12"  >
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
																							<option value="${degree.id
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
																					<div class="control-label">Semester</div>
																				</div>
																				<div class="col-sm-8">
																					<select name="semester" class="form-control"
																						id="semester">
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
																	<div style="text-align: center">
																		<div class="col-sm-12">
																			<input type="button" title="Search" name="search"
																				value="Search" id="search-btn"
																				class="btn btn-default"> <input
																				type="button" name="cancel" title="Reset"
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
												<div class="col-sm-5">
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

												<div class="col-sm-5">
													<div class="form-horizontal" style="text-align: left">
														<br>
														<div class="form-group">
															<div class="col-sm-5">
																<span class="control-label">Semester <span
																	style="color: #FF0000; font-weight: bold">*</span>
																</span>
															</div>
															<div class="col-sm-5">
																<input type="text" class="form-control" id="semester"
																	name="semester">
															</div>
														</div>
													</div>
												</div>
												<div class="col-sm-2">
													<br>
													<div class="form-group" style="text-align: left">
														<button type="button"
															name="submit_create_edit_feecollection" title="Show"
															class="btn btn-xl btn-primary button-submit font13"
															id="show_button">Show</button>

														<!-- <button type="button" title="Reset"
															class="btn btn-xl btn-default button-submit font13"
															id="reset_button">Reset</button> -->
													</div>
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
												<table class="table table-responsive">
													<tbody>
														<tr>
															<td width="17%">Enrollment No.:</td>
															<td width="33%"><span id="enrollno"
																class="control-label">15071A1202</span></td>
															<td width="11%">Degree:</td>
															<td width="39%"><span id="degree"
																class="control-label">Bachelor of Technology</span></td>
														</tr>
														<tr>
															<td>Student's Name:</td>
															<td><span id="studentName" class="control-label">A
																	AKHIL SAI</span></td>
															<td>Branch:</td>
															<td><span id="branch" class="control-label">Information
																	Technology</span></td>
														</tr>
														<tr>
															<td>Gender:</td>
															<td><span id="gender" class="control-label">MALE</span></td>
															<td>Year:</td>
															<td><span id="" class="control-label">I</span></td>
														</tr>
														<tr>
															<td>Date of Admission:</td>
															<td><span id="admissionDate" class="control-label">07/08/2015</span>
															</td>
															<td>Semester:</td>
															<td><span id="semester" class="control-label">I
																	Year II sem</span></td>
														</tr>
														<tr>
															<td>Payment Type:</td>
															<td><span id="paymentType" class="control-label">NRI-IT</span>
															</td>
															<td>Batch:</td>
															<td><span id="batch" class="control-label">2015-16</span>
															</td>
														</tr>
														<tr>
															<td>Hostel:</td>
															<td><span id="hostel" class="control-label">No</span></td>
															<td>Transport:</td>
															<td><span id="transport" class="control-label">No</span></td>
														</tr>

													</tbody>
												</table>

											</div>
											<div class="col-sm-12" id="receipt-info"
												style="display: none">
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
														<div class="col-sm-6">
															<input name="receiptNo" type="text" maxlength="5"
																id="receiptNo" class="form-control" readonly>
														</div>
														<input type="checkbox" id="check_condition"
															name="checkall" /> <label> Change</label>
													</div>
													<div class="form-group">
														<div class="col-sm-4">
															<span class="control-label">Receipt Date:</span>
														</div>
														<div class="col-sm-6">
															<input name="receiptDate" type="text" id="receiptDate"
																class="form-control">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-4">
															<span class="control-label">Payment Type:</span>
														</div>
														<div class="col-sm-6">
															<select name="paymentType" id="paymentType" tabindex="1"
																class="form-control">
																<option value="">Please Select</option>
																<c:forEach items="${paymentTypeList}" var="paymentType">
																	<option value="${paymentType.paymentTypeId}">${paymentType.paymentTypeName}</option>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-4">
															<span class="control-label">Amount to be paid:</span>
														</div>
														<div class="col-sm-6">
															<input name="amount" type="text" maxlength="5"
																id="amount" placeholder="Please Enter Amount"
																class="form-control">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-4">
															<span class="control-label">Currency :</span>
														</div>
														<div class="col-sm-6">
															<select name="currency" id="currency" tabindex="1"
																class="form-control">
																<option value="">Please Select</option>
																<c:forEach items="${currencyList}" var="currency">
																	<option value="${currency.currencyId}">${currency.currencyName}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>


												<div class="col-sm-8" id="checkDiv" style="display: none">


													<div class="grid box-filters">
														<div class="table-header">

															<div class="row">
															<div class="grid-header text" style="font-weight:normal">
																		Reset Condition </div> 

 


																<!--1st div start here -->
																<div class="col-md-6">
																	<div class="form-group">

																		<div class="col-sm-6">
																			<div class="control-label">
																				Receipt Type<span
																					style="color: #FF0000; font-weight: bold">*</span>
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<select name="branchDegreeNumber"
																				class="form-control" id="degreeNumber">
																				<option selected="selected" value="0">Please
																					Select</option>

																			</select>

																		</div>
																	</div>

																</div>

																<div class="col-md-6">
																	<div class="form-group">

																		<div class="col-sm-6 ">
																			<div class="control-label">
																				Payment Type: <span
																					style="color: #FF0000; font-weight: bold">*</span>
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<select name="branchDegreeNumber"
																				class="form-control" id="degreeNumber">
																				<option selected="selected" value="0">Please
																					Select</option>

																			</select>

																		</div>
																	</div>

																</div>
																
																<!--Button start here -->
															<div class="col-md-12" style="text-align: center">

																<button type="submit" id="submit-btn"
																	class="btn btn-xl btn-warning button-submit font13 "
																	title="Save" data-placement="top">Update</button>

																<button type="button"
																	class="btn btn-xl btn-cancel button-submit font13"
																	title="Reset" data-placement="top" id="cancel-btn">Reset</button>


															</div>
															 
															<!-- Button  end here -->
																 <br>
															</div>


															 <br> 

														</div>
													</div>
													
												</div>
												<!-- end of checkdiv -->


												<div class="col-sm-8" id="draftDiv">

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
																			<input type="text" name="mothertongue"
																				class="form-control" id="dname"
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
																			<input type="text" name="mothertongue"
																				class="form-control" id="dname"
																				placeholder=" 	Amount" />


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
																			<input type="text" name="mothertongue"
																				class="form-control" id="dname" placeholder="Date" />


																		</div>
																	</div>

																</div>

																<div class="col-md-6">
																	<div class="form-group">

																		<div class="col-sm-6 ">
																			<div class="control-label">
																				City: <span
																					style="color: #FF0000; font-weight: bold">*</span>
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<input type="text" name="mothertongue"
																				class="form-control" id="dname" placeholder="City" />


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
																			<input type="text" name="mothertongue"
																				class="form-control" id="dname"
																				placeholder="Please Enter Mothertongue" />



																		</div>

																	</div>
																	</div>
																	<!--1st div end here -->

																	<!--2nd div start here -->
																	<div class="col-sm-12">

																		<div class="form-horizontal">
																			<div class="form-group">

																				<!--Button start here -->
																				<div class="col-md-12" style="text-align: center">

																					<button type="submit" id="submit-btn"
																						class="btn btn-xl btn-success button-submit font13 "
																						title="Save" data-placement="top">Save</button>

																					<button type="button"
																						class="btn btn-xl btn-cancel button-submit font13"
																						title="Reset" data-placement="top" id="cancel-btn">Reset</button>


																				</div>
																				<!-- Button  end here -->

																			</div>
																		</div>
																	</div>
																	<!--2nd div end here -->

																	<!-- end of all 3 div row-->
																</div>
															</div>
														</div>
													</div>




												</div>
												<br>


                                    <div class="col-sm-12" id="feetbldiv"
													style="display: none; top: 5px">
													<div class="grid-header text" style="font-weight:normal">
																		Available Fee Items  </div>
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
																	class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  "
																	>
																	<thead>
																		<tr role="row">
																			<th style="width: 20%">Sr. No. </th>
																			<th style="width: 30%">Fee Heads </th>
																			<th style="width: 30%">Currency </th>
																			<th style="width: 20%">Amount </th>
																		
																		</tr>
																	</thead>

																	<tbody role="alert" aria-live="polite"
																		aria-relevant="all">

																		<tr class="odd">
																			<td style="width: 20%"></td>
																			<td style="width: 30%"></td>
																			<td style="width: 30%"></td>
																			<td style="width: 20%"><input type="text" class="form-control"/></td>
																			
																			
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<!-- Modal dialog -->

													<!-- /.modal -->
												</div>
												
												
												


												<div class="col-sm-12" id="tbldiv"
													style="display: none; top: 5px">
													<div class="grid-title">
														<div class="pull-left" style="font-weight: normal">Previous
															Receipts</div>
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
																			<th style="width: 20%">Receipt Type</th>
																			<th style="width: 20%">Receipt No</th>
																			<th style="width: 10%">Date</th>
																			<th style="width: 20%">Semester</th>
																			<th style="width: 10%">Pay Type</th>
																			<th style="width: 10%">Amount</th>
																			<th style="width: 10%">Print</th>
																		</tr>
																	</thead>

																	<tbody role="alert" aria-live="polite"
																		aria-relevant="all">

																		<tr class="odd">
																			<td style="width: 20%"></td>
																			<td style="width: 20%"></td>
																			<td style="width: 10%"></td>
																			<td style="width: 20%"></td>
																			<td style="width: 10%"></td>
																			<td style="width: 10%"></td>
																			<td style="width: 10%">
																				<div class="fa-myprint" title="Print">
																					<span class="glyphicon glyphicon-print"></span>
																				</div>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
													<!-- Modal dialog -->

													<!-- /.modal -->
												</div>


												<br>




											</div>
										</div>
										<br>


									</div>

								</div>
							</div>
						</div>
					</div>

			</div>
	</div>
</body>





