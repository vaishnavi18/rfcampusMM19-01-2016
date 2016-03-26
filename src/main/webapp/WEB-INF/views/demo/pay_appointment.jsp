<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Appointment</title>

<jsp:include page="../authentication/script.jsp" />
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


				<form action="./user-creation/add" method="post"
					id="user-add-edit-form" enctype="multipart/form-data">

					<div class="second-column one-child-container relative ">

						<div id="my_documents_container"
							style="margin-left: 0px; margin: auto; width: 90%"
							class="column-one clearfixs">
							<div class="">

								<div class="row">
									<div class="col-md-12">

										<div class="grid-header text">Payment Appointment</div>

										<fieldset class="scheduler-border">
											<div class="grid box-filters">
												<div class="table-header">

													<div class="row">
														<!--1st div start here -->
														<div class="col-md-6">
														
														
															<div class="form-group">
																<div class="">
																	<div class="col-sm-4 ">
																		<div class="control-label">
																			Appointment<span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<input type="text" name="mothertongue"
																			class="form-control" id="dname"
																			placeholder="Appointment" />


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
				</form>
			</div>
		</div>
		<div class="grid box-filters">
			<div class="table-header">
				<div class="row">
					<div class="col-md-6">
						<div class="form-horizontal">

<div class="grid-title">
								<div class="pull-left">Select Payhead for Add/Edit</div>
								<div class="clear"></div>
							</div>



							<div class="grid box-filters"
								style="height: 334px; position: relative; overflow: auto">

								<table id=""
									class="table table-bordered  table-checkable table-responsive  "
									id="DataTables_Table_0"
									aria-describedby="DataTables_Table_0_info">
									<thead>
										<tr role="row" class="customers">

											<th style="text-align: center; width: 10%">Action</th>
											<th style="text-align: center;">Appoint</th>


										</tr>
									<tbody>
										<tr class="">
											<td style="width: 10%">
												<div class="fa-select" title="Edit"
													onclick="set_value('${society.societyId}')">
													<span class="fa fa-pencil-square"> </span>
												</div>
											</td>
											<td style="width: 10%; text-align: center">
												${society.societyCode}</td>


										</tr>


									</tbody>
								</table>

							</div>

						</div>
					</div>

					<div class="col-md-6" >
						<div class="form-horizontal">
                           
							<fieldset class="scheduler-border">
								<div class="grid-title">
							 	<div class="pull-left">AppointMent</div>
								<div class="clear"></div>
							</div>
								
								<div class=""
									style="position: relative; overflow: auto; max-width: 100%">
									<table id="tableOne"
										class="table table-bordered  table-checkable table-responsive  "
										aria-describedby="DataTables_Table_0_info">
										<thead>
											<tr role="row">
												<th>Select <input type="checkbox" id="" name="checkall" />
													<label> All</label></th>
												<th>Pay Short</th>
											</tr>
										</thead>



										<tr class="odd">

											<td><input type="checkbox" name="" /> <label>1</label>
											</td>
											<td>13434</td>
										</tr>



										</tbody>
									</table>
								</div>
							</fieldset>

						</div>


					</div>
				</div>
			</div>
		</div>
		</fieldset>
	</div>
	</div>

	<!--           jaskirat code end here -->



	</div>
	</div>
	</div>
	</form>
	<!--=== Page Content ===-->
	</div>

	</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
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
	<!-- /.container -->
	<!-- /.container -->

</body>

