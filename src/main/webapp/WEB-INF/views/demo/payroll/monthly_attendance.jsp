<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Monthly Attendance | RF-Campus</title>

<!--=== CSS ===-->
<jsp:include page="../../authentication/script.jsp" />

</head>

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

							<div class="grid-header text">ATTENDANCE ENTRY</div>
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
															<div class="control-label">
																Staff<span style="color: #FF0000; font-weight: bold">
																	*</span>
															</div>
														</div>
														<div class="col-sm-6">
															<select name="branchDegreeNumber" class="form-control"
																id="degreeNumber">
																<option selected="selected" value="0">Please
																	Select</option>

															</select> <input type="checkbox" name="gender" id="gender-1"
																value="1" /> <label>Order By Id</label> <input
																type="checkbox" name="gender" id="gender-2" value="2" />
															<label>Show Absent Only</label>


														</div>
													</div>

												</div>



											</div>
											<!--1st div end here -->

											<!--2nd div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">

														<!--Button start here -->
														<div class="col-sm-12">

															<button type="submit" id="submit-btn"
																class="btn btn-xl btn-primary button-submit font13 "
																title="Save" data-placement="top">Show</button>

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
									</form>
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
													<th style="width: 20%">Idno</th>
													<th style="width: 40%">Name</th>
													<th style="width: 30%">Designation</th>
													<th style="width: 10%">Days</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">

												<tr class="odd">
													<td style="width: 20%"></td>
													<td style="width: 40%"></td>
													<td style="width: 30%"></td>
													<td style="width: 10%"><input type="text"
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

