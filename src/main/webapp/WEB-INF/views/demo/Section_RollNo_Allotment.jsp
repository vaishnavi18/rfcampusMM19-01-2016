<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Section / Roll No Allotment</title>

<!--=== CSS ===-->

<style type="text/css">
</style>
<jsp:include page="../authentication/script.jsp" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js "></script> -->
<script type="text/javascript">
	
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
							<div class="grid-header text">SECTION / ROLLNO ALLOTMENT</div>
							<!-- <div class="tab-pane active" id="tab_general"> -->
							<div
								class="two-child-containers clearfixs column-one-contents info-container-page">
								<div class="grid box-filters">
									<div class="table-header">
										<form class="form-inline ng-pristine ng-valid" method="post"
											action="./branch/add" id="add-branch">
											<div class="row my-bg-success">
												<!--1st div start here -->
												<div class="col-md-6">
													<div class="form-horizontal">
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Scheme Type<span
																			style="color: #FF0000; font-weight: bold">*</span>
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

														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">
																		Batch <span style="color: #FF0000; font-weight: bold">*</span>
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
																		Degree<span style="color: #FF0000; font-weight: bold">*</span>
																	</div>
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
																		Branch <span style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-7">
																	<select name="deptNo" class="form-control" id="dept">
																		<option selected="selected" value="0">Please
																			Select</option>

																	</select>
																</div>
															</div>
														</div>


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
																	<div class="control-label">With Respect To</div>
																</div>
																<div class="col-sm-7">
																	<input type="radio" required name="by" id="gender"	value="1" /> <label>All Student</label> 
																		<input	type="radio" name="by" id="gender" value="2" /> <label>Remaining	</label>


																</div>
															</div>
														</div>
														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<div class="control-label">Sorted By</div>
																</div>
																<div class="col-sm-7">
																	<input type="radio" required name="sort" id="gender"
																		value="1" /> <label>Reg. Number</label> 
																		<input
																		type="radio" name="sort" id="gender" value="2" /> <label>Student
																		Name</label>


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
																class="btn btn-xl btn-primary button-submit font13">Show</button>


															<button type="button" title="Reset"
																class="btn btn-xl btn-cancel button-cancel font13"
																id="cancel-btn">Reset</button>

															<button type="button" title="Report"
																class="btn btn-xl  btn-success button-submit font13"
																id="report-btn">Save</button>

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
							<!-- </div> -->

							<!--Changes By Sachinmt  -->
							<!-- Success Message -->
							<div align="center">
								<span id="message" align=""><font face='verdana' size='2'
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
										<table
											class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th style="width:10% " >SrNo</th>
													<th style="width:10% ">Register Number </th>
													<th style="width:60% ">Student Name</th>
													<th style="width:10% ">Section</th>
													<th style="width:10% ">Roll No</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:set var="srno" value="1" />
												
													<tr class="odd">
														<%-- value="${branch.admissionDegreeMasterEntity.degreeName} --%>
														<td style="width:10% "><c:out value="${srno}" /></td>
														<td style="width:10%  "></td>
														<td style=" width:60% "></td>
														<td style="width:10%  "><select name="deptNo" class="form-control" id="dept">
											 							<option selected="selected" value="0">A</option>
																	</select>
																	</td>
														<td style=" width:10% "><input type="text" /></td>
													
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
	<!-- /.container -->
</body>

