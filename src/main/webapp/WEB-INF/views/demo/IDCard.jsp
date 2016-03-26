<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Batch Allotment</title>

<!--=== CSS ===-->

<style type="text/css">
</style>
<jsp:include page="../authentication/script.jsp" />
<%-- <jsp:include page="../authentication/commonFilter.jsp" /> --%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js "></script> -->
<script type="text/javascript">
$(document)
.ready(
		function() {
			
			appendCommonDiv("#commonFilterIn");
			
			$("#tableOne thead tr th:first input:checkbox")
					.click(
							function() {
								var checkedStatus = this.checked;
								$(
										"#tableOne tbody tr td:first-child input:checkbox")
										.each(
												function() {
													this.checked = checkedStatus;
												});
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

						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">
							<div class="grid-header text">BATCH ALLOTMENT</div>
							<!-- <div class="tab-pane active" id="tab_general"> -->
							<div
								class="two-child-containers clearfixs column-one-contents info-container-page">
								<div class="grid box-filters">
									<div class="table-header">
										<form class="form-inline ng-pristine ng-valid" method="post"
											action="./branch/add" id="add-branch">
											<input type="hidden" name="id" id="branchId" value="0">
											<div class="row my-bg-success">
												<!--1st div start here -->
												<div class="col-md-6">
												<div id="commonFilterIn">
												 </div>
												
												</div>
												<!--1st div end here -->
												
												<!--2nd div start here -->
												<div class="col-md-6">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">Semester</div>
																</div>
																<div class="col-sm-7">
																	<select name="deptNo" class="form-control" id="dept">
																		<option selected="selected" value="0">Please
																			Select</option>

																	</select>

																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Subject Type <span
																			style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="branchDegreeType" class="form-control"
																		id="degreeType">
																		<option selected="selected" value="0">Please
																			Select</option>

																	</select>
																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Course Type <span
																			style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="branchDegreeType" class="form-control"
																		id="degreeType">
																		<option selected="selected" value="0">Please
																			Select</option>

																	</select>
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Section <span
																			style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="branchDegreeType" class="form-control"
																		id="degreeType">
																		<option selected="selected" value="0">Please
																			Select</option>

																	</select>
																</div>
															</div>
														</div>


													</div>

												</div>

												<!--2nd div end here -->


												<!--Button start here -->
												<div class="form-horizontal">
													<div class="" style="text-align: center">

														<div class="col-sm-12" style="left: 5%">


															<button type="submit" id="submit-btn" title="Save"
																class="btn btn-xl btn-primary button-submit font13">Show</button>


															<button type="button" title="Reset"
																class="btn btn-xl btn-cancel button-cancel font13"
																id="cancel-btn">Reset</button>



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
							
							
							<!-- new set for save div  start-->
							<div
								class="two-child-containers clearfixs column-one-contents info-container-page">
								<div class="grid box-filters">
									<div class="table-header">
										
										
											<div class="row my-bg-success">
											
											<!-- new row div start here again  -->
												<!-- 1/3st div -->
												<div class="col-md-4">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																	Batch<span style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="branchDegreeNumber" class="form-control"
																		id="degreeNumber">
																		<option selected="selected" value="0">Please
																			Select</option>

																	</select>


																</div>
															</div>
														</div>
													</div>
												</div>

												<!-- 2/3st div -->

												<div class="col-md-3">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-7">
																	<div class="control-label">
																		Total Student<span
																style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-5" >
																	<input type="text" maxlength="40" value="0" readonly="readonly"
																		id="total_student"	name="branchDuration" class="form-control"  />
																</div>
															</div>
														</div>
													</div>
												</div>

												<!-- 3/3st div -->

												<div class="col-md-3">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-12" style="text-align: center">
																<button type="button" title="Report"
																	class="btn btn-xl  btn-success button-submit font13"
						 											id="report-btn">Save</button>
															</div>
														</div>
													</div>
												</div>
												<!-- new row div end here again -->
											</div>
											</div>
											</div>
							<!-- new set for save div end -->
							
							
							<!-- </div> -->

							<!--Changes By Sachinmt  -->
							<!-- Success Message -->
							<div align="center">
								<span id="message"><font face='verdana' size='2'
									color='Green'><b>${message}</b></font></span>
							</div>
							<!-- Message End -->
							<!--**--#--**  -->

							<div class="grid-title">
								<div class="pull-left">Student List</div>
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
										<table id="tableOne"	class=" dataTables_header table table-striped
										 table-bordered table-hover table-checkable table-responsive datatable dataTable"
												aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th style="width: 10%">SrNo  &nbsp; &nbsp; <input type="checkbox" id=""
																			name="checkall" /> <label> All</label></th>
													<th style="width: 10%">Roll Number</th>
													<th style="width: 60%">Student Name</th>
													<th style="width: 10%">Tutorial Batch</th>
													<th style="width: 10%">Practical Batch</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:set var="srno" value="1" />

												<tr class="odd">
													<%-- value="${branch.admissionDegreeMasterEntity.degreeName} --%>
													<td style="width: 10%"> <input type="checkbox" name="" /> <c:out value="${srno}" /></td>
													<td style="width: 10%"></td>
													<td style="width: 60%"></td>
													<td style="width: 10%"></td>
													<td style="width: 10%"></td>

												</tr>
												<c:set var="srno" value="${srno+1}" />

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- /General Information -->
					</div>
				</div>
			</div>
		</div>

	</div>
	</div>
	<!-- /.container -->
</body>

