<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Payment Over Rule| RF-Campus</title>

<!--=== CSS ===-->
<jsp:include page="../../authentication/script.jsp" />

</head>
<style>
.table-condensed {
	width: 220px;
}

.accordion-toggle .btn {
	width: 100%;
	left: 39%;
	position: relative;
}
</style>
<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../../authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="../../authentication/page-header.jsp" />
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">

							<div class="grid-header text">Add/Edit OverRule Details</div>
							<div class="grid box-filters">
								<div class="table-header">

									<div class="row">
										<!--1st div start here -->
										<div class="col-md-6">
											<div class="form-group">
												<div class="col-sm-4 ">
													<div class="control-label">
														Employee Name <span
															style="color: #FF0000; font-weight: bold"> *</span>
													</div>
												</div>
												<div class="col-sm-6">
													<select name="branchDegreeNumber" class="form-control"
														id="degreeNumber">
														<option selected="selected" value="0">Please
															Select</option>

													</select>

												</div>
											</div>




											<div class="form-group">
												<div class="col-sm-4 ">
													<div class="control-label">
														Designation <span
															style="color: #FF0000; font-weight: bold"> *</span>
													</div>
												</div>
												<div class="col-sm-6">
													<input name="" type="text" readonly="readonly"
														maxlength="40" class="form-control "
														placeholder="Designation">


												</div>
											</div>


											<div class="form-group">
												<div class="col-sm-4 ">
													<div class="control-label">
														Appointment <span
															style="color: #FF0000; font-weight: bold"> *</span>
													</div>
												</div>
												<div class="col-sm-6">
													<input name="" type="text" readonly="readonly"
														maxlength="40" class="form-control "
														placeholder="Designation">




												</div>

											</div>


										</div>


										<!--1st div end here -->

										<!--2nd div start here -->
										<div class="col-md-6">
											<div class="form-horizontal">

												<div class="form-group">
													<div class="col-sm-4 ">
														<div class="control-label">
															Active <span style="color: #FF0000; font-weight: bold">
																*</span>
														</div>
													</div>
													<div class="col-sm-6">
														<input type="checkbox" name="" id="gender-1" value="1" />
														<label>Yes</label>


													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-4 ">
														<div class="control-label">
															From Date <span style="color: #FF0000; font-weight: bold">
																*</span>
														</div>
													</div>
													<div class="col-sm-6">
														<input name="admissionStartDateString" type="text"
															readonly="readonly" maxlength="40"
															id="admissionStartDateString" tabindex="3"
															class="form-control datetimepicker"
															placeholder="Enter Admission Start Date">


													</div>
												</div>

												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
															<div class="control-label">
																To Date <span style="color: #FF0000; font-weight: bold">
																	*</span>
															</div>
														</div>
														<div class="col-sm-6">
															<input name="admissionEndDateString" type="text"
																readonly="readonly" maxlength="100"
																id="admissionEndDateString" tabindex="4"
																class="form-control datetimepicker"
																placeholder="Enter Admission End Date">


														</div>
													</div>





												</div>
											</div>
										</div>
										<!--2nd div end here -->

										<!-- end of all 3 div row-->
									</div>
								</div>
							</div>


                  	<div class="row">  
							<!-- 1st left table div start here -->
							<div class="col-sm-6">
								<div class="grid-title">
									<div class="pull-left">Earning Heads</div>
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
												class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  "
												id="DataTables_Table_0"
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th style="width: 40%">PayHead</th>
														<th style="width: 40%">Calculation</th>
														<th style="width: 20%">Days</th>
													</tr>
												</thead>

												<tbody role="alert" aria-live="polite" aria-relevant="all">

													<tr class="odd">
														<td style="width: 40%"><input type="checkbox" name=""
															id="test" value="1" /> <label>HRA</label></td>
														<td style="width: 40%"><select
															name="branchDegreeNumber" class="form-control"
															id="degreeNumber">
																<option selected="selected" value="0">Please
																	Select</option>

														</select></td>
														<td style="width: 20%"><input type="text"
															class="form-control" /></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<!-- Modal dialog -->

									<!-- /.modal -->
								</div>
							</div>

							<!-- 1st left div ends here -->


							<!-- 2nd left table div start here -->
							<div class="col-sm-6">
								<div class="grid-title">
									<div class="pull-left">Deduction Heads</div>
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
												class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive  "
												id="DataTables_Table_0" aria-describedby="">
												<thead>
													<tr role="row">
														<th style="width: 40%">PayHead</th>
														<th style="width: 40%">Calculation</th>
														<th style="width: 20%">Days</th>
													</tr>
												</thead>

												<tbody role="alert" aria-live="polite" aria-relevant="all">

													<tr class="odd">
														<td style="width: 40%"><input type="checkbox" name=""
															id="test" value="1" /> <label>HRA</label></td>
														<td style="width: 40%"><select
															name="branchDegreeNumber" class="form-control"
															id="degreeNumber">
																<option selected="selected" value="0">Please
																	Select</option>

														</select></td>
														<td style="width: 20%"><input type="text"
															class="form-control" /></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>

									<!-- Modal dialog -->

									<!-- /.modal -->
								</div>
							</div>
                           </div>
							<!-- 2nd left div ends here -->

							<div class="row">
								<div class="col-sm-12">
									<div class="form-group" style="padding-bottom: 15px;">
										<div class="col-sm-12">
											<div class="col-sm-2">
												<div id="ContentPlaceHolder1_Label1" class="control-label">Remark</div>
                                                </div>  
											
											<div class="col-sm-9">
												<input type="text" placeholder="Designation" class="form-control" maxlength="40" readonly="readonly" name="">
											</div>
										</div> 
									</div>
 
								</div>
								
								<!--Button start here -->
								<div class="form-horizontal">
												<div class="" style="text-align: center">

													<div class="col-sm-12">
 

														<button type="submit" id="submit-btn" title="Save" class="btn btn-xl btn-success button-submit font13">Save</button>


														<button type="button" title="Reset" class="btn btn-xl btn-cancel button-submit font13" id="cancel-btn">Reset</button>


													</div>
												</div>
											</div>
								<!-- Button  end here -->

							</div>


				  		</div>
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
<script>
	jQuery(function() {
		jQuery(function() {
			$('#admissionStartDateString').datetimepicker({
				//   useCurrent: false,
				// minDate: moment().add(-1, 'd').toDate(),
				defaultDate : moment().toDate(),
				locale : 'de',
				format : 'DD/MM/YYYY H:mm A'
			});

			$('#admissionEndDateString').datetimepicker({
				//useCurrent: false,
				// minDate: moment().add(1, 'd').toDate(),
				defaultDate : moment().toDate(),
				locale : 'de',
				format : 'DD/MM/YYYY H:mm A'
			});

			$('#admissionPrintDateString').datetimepicker({
				viewMode : 'years',
				format : 'MM/YYYY'
			});

			jQuery('#admissionEndDateString').data("DateTimePicker")
					.setMinDate(moment().toDate());
			// jQuery('#admissionStartDateString').data("DateTimePicker").setMaxDate(moment().toDate());
			//jQuery('#startDate').datetimepicker();
			//				jQuery('#endDate').datetimepicker();
			jQuery("#admissionStartDateString").on(
					"dp.change",
					function(e) {
						jQuery('#admissionEndDateString')
								.data("DateTimePicker").setMinDate(
										e.date.add(-1, 'D'));
					});
			jQuery("#admissionEndDateString").on(
					"dp.change",
					function(e) {
						jQuery('#admissionStartDateString').data(
								"DateTimePicker")
								.setMaxDate(e.date.add(1, 'D'));
					});

		});

	});
	$('#admissionStartDateString').datetimepicker({
		pickTime : false
	});
	$('#admissionEndDateString').datetimepicker({
		pickTime : false
	});
</script>

</html>

