<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Monthly Installment Entry | RF-Campus </title>

<!--=== CSS ===-->
<jsp:include page="../../authentication/script.jsp" />

</head>
<script>

  function close_me(){
	  $("#quarterId").slideUp("slow");
  }
function open_div(){
        $("#quarterId").slideDown("slow");
  
} 
</script>
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

				 			<div class="grid-header text">Select Criteria </div>
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="./mothertongue/add" id="add-update-document">
										<input type="hidden" name="id" id="documentId" value="0">
										<div class="row">
											<!--1st div start here -->
											<div class="col-md-5">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Order By<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
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
									 			
									 			<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Employee Name <span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
															<select name="branchDegreeNumber" class="form-control"
																			id="">
																			<option selected="selected" value="0">Please
																				Select</option>
																		
																		</select>
														</div>
													</div>  

									 			</div>
									 			
											</div>
											<!--1st div end here -->
											
											

											<!--2nd div start here -->
											<div class="col-md-7">
												<div class="form-horizontal">
													<div class="form-group">
													
														<!--Button start here -->
														<div class="col-sm-3">
														
													 		<button type="button" id="submit-btn"
																class="btn btn-xl btn-primary button-submit font13 "
															 onclick="open_div()"	title="Show" data-placement="top">Show</button>

											 			</div>
								  						<div class="col-sm-9"></div>
														<!-- Button  end here -->
														
													</div>
													
													<div class="form-group">
													
														<!--Button start here -->
														<div class="col-sm-9">
														
														<input type="checkbox" name=""
															id="test" value="1" /> <label>Show Stop Installation Entry</label>

											 			</div>
								  						<div class="col-sm-3"></div>
														<!-- Button  end here -->
														
													</div>
												</div>
											</div>
											<!--2nd div end here -->

											<!-- end of all 3 div row-->
										</div>
									</form>
								</div>
							</div>

						
	<div class="form-group" id="quarterId" style="display: none;">
								 	<div class="grid-title">
				 				<div class="pull-left">Edit Pay Head </div>
								<div class="clear"></div>
							</div>
							<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post" action="./mothertongue/add" id="add-update-document">
										<input type="hidden" name="id" id="documentId" value="0">
										<div class="row">
											<!--1st div start here -->
					 						<div class="col-md-12" >
												<div class="form-group">
													<div class="">
														<div class="col-sm-12 ">
														<div class="control-label"  style="text-align:center;font-weight:bold;float:none">Id or Name  :  123434</div>
														</div>
													
													</div>  

									 			</div>
									 			
									 				<div class="form-group">
													<div class="">
														<div class="col-sm-12">
														<div class="control-label"  style="text-align:center;font-weight:bold;float:none">Designation  : Java Developer</div>
										 				</div>
														
					 								</div>  

									 			</div>
									 			
									 				<div class="form-group">
													<div class="">
														<div class="col-sm-12 ">
														<div class="control-label"  style="text-align:center;font-weight:bold;float:none">Department : CSE</div>
														</div> 
														
						 			 				</div>  

									 			</div>
									 			
											</div>
											<!--1st div end here -->
											
											

											 

			 								<!-- end of all 3 div row-->
										</div>
									</form>
								</div>
							
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="./mothertongue/add" id="add-update-document">
										<input type="hidden" name="id" id="documentId" value="0">
										<div class="row">
											<!--1st div start here -->
											<div class="col-md-6">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Pay Head<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
															<select name="branchDegreeNumber" class="form-control"
																			id="degreeNumber">
																			<option selected="selected" value="0">Please
																				Select</option>
																		
																		</select><input type="checkbox" name=""
															id="test" value="1" /> <label> Stop  </label>
																		
														</div>
													</div>

			 									</div>
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Installation for Sub Pay Head<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
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
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Monthly Deducted Amount<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
															<input type="text" maxlength="40" placeholder="Monthly Deducted Amount"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Total Number of Installment<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
															<input type="text" maxlength="40" placeholder="  Total Number of Installment"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												
											</div>
											<!--1st div end here -->
											
											

											<!--2nd div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-4 ">
														<div class="control-label">Total Amount<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
																<input type="text" maxlength="40" placeholder="  Total Amount"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>

												</div>
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">OutStanding Amount<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
																<input type="text" maxlength="40" placeholder="OutStanding Amount"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Account No.<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
																<input type="text" maxlength="40" placeholder="Account No."
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Start Date<span
						 										style="color: #FF0000; font-weight: bold"> *</span></div>
														</div>
														<div class="col-sm-6">
															<input name="admissionStartDateString" type="text"
																readonly="readonly" maxlength="100"
																id="admissionStartDateString" tabindex="4"
																class="form-control datetimepicker"
																placeholder="Enter Admission End Date">


														</div>
													</div>

												</div>
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">End Date<span
																style="color: #FF0000; font-weight: bold"> *</span></div>
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


																<button type="submit" id="submit-btn" title="Save"
																	class="btn btn-xl btn-success button-submit font13">Save</button>


																<button type="button" title="Reset"
																	class="btn btn-xl btn-cancel button-cancel font13"
																	id="cancel-btn">Reset</button>
																
																<button type="button" title="Report" onclick="close_me()"
																	class="btn btn-xl btn-cancel button-submit font13"
																	id="report-btn">Close</button>

															</div>
														</div>
													</div>
													<!--Button  end here -->

											<!-- end of all 3 div row-->
										</div>
									</form>
									
									
								</div>
							</div>
							
							
							
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

