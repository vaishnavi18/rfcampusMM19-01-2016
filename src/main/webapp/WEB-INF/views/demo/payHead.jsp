<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Pay Head  | RF-Campus </title>

<!--=== CSS ===-->
<jsp:include page="../authentication/script.jsp" />

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

							<div class="grid-header text">Pay Head </div>
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
														<div class="control-label">Select head<span
																style="color: #FF0000; font-weight: bold">*</span></div>
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
											</div>
											<!--1st div end here -->
											
											

											<!--2nd div start here -->
											<div class="col-md-7">
												<div class="form-horizontal">
													<div class="form-group">
													
														<!--Button start here -->
														<div class="col-sm-3">
														
															<button type="submit" id="submit-btn"
																class="btn btn-xl btn-primary button-submit font13 "
																title="Show" data-placement="top">Show</button>

											 			</div>
								  						<div class="col-sm-9"></div>
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
								  	<div class="grid-header text">Edit  Pay Head </div>
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
														<div class="control-label">Pay Code<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
															<input type="text" maxlength="40" placeholder="Pay Code"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" />
														</div>
													</div>

												</div>
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Pay Head<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
																<input type="text" maxlength="40" placeholder="Pay Head"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Type<span
																style="color: #FF0000; font-weight: bold">*</span></div>
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
												
												
												
											</div>
											<!--1st div end here -->
											
											

											<!--2nd div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-4 ">
														<div class="control-label">Select head<span
																style="color: #FF0000; font-weight: bold">*</span></div>
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
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Full Name<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
																<input type="text" maxlength="40" placeholder="Full Name"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Formula<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
																<input type="text" maxlength="40" placeholder="Formula"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> 
														</div>
													</div>

												</div>
												
												
												
												</div>
											</div>
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

							<div class="grid-title">
								<div class="pull-left">Pay Head Details</div>
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
													<th  style="width:10%">Pay Code</th>
													<th  style="width:15%">Pay Head</th>
													<th  style="width:15%">Type</th>
													<th  style="width:15%">Calculation</th>
													<th  style="width:25%">Full Name</th>
													<th  style="width:10%">Formula</th>
													<th  style="width:10%">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">

													<tr class="odd">
														<td style="width:10%"></td>
														<td style="width:15%"></td>
														<td style="width:15%"></td>
														<td style="width:10%"></td>
														<td style="width:15%"></td>
														<td style="width:25%"></td>
														<td style="width:10%">
															<div class="fa-select" title="Edit"
																onclick="open_div()">
																<span class="fa fa-pencil-square"></span>
															</div></td>
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

