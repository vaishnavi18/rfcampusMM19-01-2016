<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Leave Without Pay | RF-Campus</title>

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

							<div class="grid-header text">LWP ENTRY  </div>
							<div class="grid box-filters">
								<div class="table-header">
									
										<div class="row">
											<!--1st div start here -->
											<div class="col-md-6">
												<div class="form-group">
														<div class="col-sm-4 ">
															<div class="control-label">
																Select Month For Lwp Entry <span style="color: #FF0000; font-weight: bold">
																	*</span>
															</div>
														</div>
														<div class="col-sm-6">
								  								<input name="admissionPrintDateString" type="text"
															readonly="readonly" maxlength="40"
															id="admissionPrintDateString" tabindex="3"
															class="form-control datetimepicker"
															placeholder="Enter Admission Start Date"> 

                                                   </div>
														</div>
													
												
												
												
												<div class="form-group">
														<div class="col-sm-4 ">
															<div class="control-label">
																Employee Name <span style="color: #FF0000; font-weight: bold">
																	*</span>
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
                                                </div>
                                           

											<!--1st div end here -->

											<!--2nd div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
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

							<div class="col-sm-12">
								<div
				 				 	style="height: 37px; border-radius: 5px; text-align: center; padding: 10px;margin-bottom:10px" 
								  	class="col-xs-12 col-sm-12 bg-primary" id="confirm_div">Note :
&nbsp;&nbsp; *1) Enter Absent Day's in Day's Column  &nbsp; &nbsp;*2) If Present in whole month then enter only 0 (or) Blank  </div>
							</div>

							<div class="grid-title">
								<div class="pull-left">Enter Attendance</div>
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
													<th style="width: 20%">Srno</th>
													<th style="width: 50%">LWP Date</th>
													<th style="width: 30%">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">

												<tr class="odd">
													<td style="width: 20%"></td>
													<td style="width: 50%"></td>
													<td style="width: 30%">
												
										<div class="fa-select" title="Edit" onclick="setRecip(3,'AF','Application fee','Academic',true,'12343')">
																<span class="fa fa-pencil-square"></span>
															</div>
														</td>
				 									
											</tbody>
										</table>
									</div>
								</div>

								<!-- Modal dialog -->

								<!-- /.modal -->
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
	jQuery(function () {
		jQuery(function () {
			 $('#admissionStartDateString').datetimepicker({
			    //   useCurrent: false,
			      // minDate: moment().add(-1, 'd').toDate(),
			       defaultDate: moment().toDate(),
			       locale: 'de',
			       format: 'DD/MM/YYYY H:mm A'
			     });

			 $('#admissionEndDateString').datetimepicker({
			      //useCurrent: false,
			      // minDate: moment().add(1, 'd').toDate(),
			       defaultDate: moment().toDate(),
			       locale: 'de',
			       format: 'DD/MM/YYYY H:mm A'
			     });
			   
			 $('#admissionPrintDateString').datetimepicker({
				   viewMode: 'years',
	                format: 'MM/YYYY'  
			     });
			  
			  
			 jQuery('#admissionEndDateString').data("DateTimePicker").setMinDate(moment().toDate());
			 // jQuery('#admissionStartDateString').data("DateTimePicker").setMaxDate(moment().toDate());
				//jQuery('#startDate').datetimepicker();
//				jQuery('#endDate').datetimepicker();
				jQuery("#admissionStartDateString").on("dp.change",function (e) {
			        jQuery('#admissionEndDateString').data("DateTimePicker").setMinDate(e.date.add(-1, 'D'));
				});
				jQuery("#admissionEndDateString").on("dp.change",function (e) {
			        jQuery('#admissionStartDateString').data("DateTimePicker").setMaxDate(e.date.add(1, 'D'));
				});
			  
			  
			});

		});
	 $('#admissionStartDateString').datetimepicker({ pickTime: false }); 
	 $('#admissionEndDateString').datetimepicker({ pickTime: false }); 
	 
	</script>

</html>

