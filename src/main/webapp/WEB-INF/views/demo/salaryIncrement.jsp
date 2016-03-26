<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>SALARY INCREMENT</title>

<!--=== CSS ===-->
<jsp:include page="../authentication/script.jsp" />
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

							<div class="grid-header text">SALARY INCREMENT ENTRY FORM</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="./mothertongue/add" id="add-update-document">
										<input type="hidden" name="id" id="documentId" value="0">
										<div class="row">
											<!--1st div start here -->
								 			<div class="col-md-4">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Staff<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
															<select name="cityId" id="cityId" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>

														</select>
														</div>
													</div>

												</div>
											</div>
											
												<div class="col-md-4">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Increment Month<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
																<select name="cityId" id="cityId" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>

														</select>

														</div>
													</div>

												</div>
											</div>
											
												<div class="col-md-4">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Order By<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
															<select name="cityId" id="cityId" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>

														</select>


														</div>
													</div>

												</div>
											</div>
											<!--1st div end here -->

											<!--2nd div start here -->
											

											<!-- end of all 3 div row-->
										</div>
									</form>
								</div>
							</div>

							<!--Changes By Sachinmt  -->
							<!-- Success Message -->
							<div align="center">
								<span id="message" align=""><font face='verdana' size='2'
									color='Green'><b>${message}</b></font></span>
							</div>
							<!-- Message End -->
							<!-- /**--###--**/ -->

							<div class="grid-title">
								<div class="pull-left">Change Of Increment</div>
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
											class=" dataTables_header table table-striped  table-hover table-checkable table-responsive datatable dataTable"
							 				id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th>Sr	No</th>
													<th>Name</th>
													<th>Designation</th>
													<th style="width:10%"> Old Basic </th>
													<th style="width:5%">Inc</th>
													<th style="width:10%"> Inc.Date </th>
													<th style="width:10%"> New Basic </th>
												</tr>
											</thead>

										 	<tbody role="alert" aria-live="polite" aria-relevant="all" >
                                                       
                                                        <tr class="odd">
                                                        <td class=" "></td>
														<td class=" ">Scale : 75000-75000 </td>
														<td class=" "></td>
														<td style="width:10%"></td>
														<td style="width:5%"></td>
														<td style="width:10%"></td>
														<td style="width:10%"></td>
													
													</tr>
													    <tr class="odd">
														<td class=" "></td>
														<td class=" "></td>
														<td class=" "></td>
														<td style="width:10%"><input type="text" class="form-control" readonly="readonly"/></td>
														<td style="width:5%"><input type="text" class="form-control" /></td>
														<td style="width:10%"><input type="text" class="form-control" readonly="readonly"/></td>
														<td style="width:10%"><input type="text" class="form-control" readonly="readonly"/></td>
													
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

