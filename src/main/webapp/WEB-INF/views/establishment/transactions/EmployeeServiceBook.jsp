<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Service Book | RF Campus</title>
<meta charset="utf-8" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">

<jsp:include page="../../authentication/script.jsp" />

<!-- tab code link start here -->
<link
	href="${pageContext.request.contextPath}/resources/tab/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/css/select2.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/verticalTab.css">
<script type="text/javascript">
	$(document)
			.ready(
					function() {

						$(function() {
							$("#tabs").tabs();
							$(".js-example-basic-multiple").select2();
						});

						$(function() {
							$("#tabs1").tabs();
							$(".js-example-basic-multiple").select2();
						});

						$(function() {
							$("#tabs2").tabs();
							$(".js-example-basic-multiple").select2();
						});

						$(function() {
							$("#tabs3").tabs();
							$(".js-example-basic-multiple").select2();
						});

						$(function() {
							$("#tabs4").tabs();
							$(".js-example-basic-multiple").select2();
						});

						$(".box-header")
								.click(
										function() {
											$(this).parent().find(
													'.box-content')
													.slideToggle();
											$(this)
													.parent()
													.find(
															'glyphicon glyphicon-chevron-down')
													.hide();
											$(this)
													.parent()
													.find('.servicedrop')
													.toggleClass(
															'glyphicon-chevron-down glyphicon-chevron-up');
										});

						$(function() {
							$("#dateOfBirth")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
												maxDate : +0
											});

						});

						$(function() {
							$("#dateOfRetirement")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#dateOfAppontment")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});
						$(function() {
							$("#familyMemberDateOfBirth")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#nomineeDateOfBirth")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#fromDate")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});
						$(function() {
							$("#toDate")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});
						$(function() {
							$("#toDateAdministrativeResponsibilities")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});
						$(function() {
							$("#fromDateAdministrativeResponsibilities")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#publicationDate")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#dateOfTalk")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#toDateConferenceAttended")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#fromDateConferenceAttended")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#fromDateConferenceConducted")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#toDateConferenceConducted")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#loanDate")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#fromDateLeave")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#toDateLeave")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#joiningDateLeave")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#toDatePayRevision")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#fromDatePayRevision")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#ordEffDate")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#orderDateIncrementTermination")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#grDateIncrementTermination")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#terRetDateIncrementTermination")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#orderDateLtc")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#toPeriodDateLtc")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

						$(function() {
							$("#fromPeriodDateLtc")
									.datepicker(
											{
												showOn : "both",
												dateFormat : "dd-mm-yy",
												buttonText : "<i  class='icon-calendar my_cal'></i>",
												buttonImageOnly : false,
												constrainInput : true,
											});

						});

					});
</script>

</head>
<body>
	<!-- http://iitmstestserver/nitgoa/default.aspx -->

	<jsp:include page="../../authentication/header.jsp"></jsp:include>
	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<jsp:include page="../../authentication/page-header.jsp"></jsp:include>

				<!-- HEADER END MAIN BODY STARTS -->

				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class="doc-container column-one clearfixs ">

						<div class="grid-header text">EMPLOYEE SERVICE BOOK</div>

						<!-- MAIN SEARCH FORM START -->

						<div class="grid box-filters">
							<div class="table-header">
								<form class="form-inline ng-pristine ng-valid" method="post"
									action="getDetails">
									<div class="row">
										<div class="col-sm-6">
											<div class="col-sm-2 ">
												<div class="control-label">
													Search<span style="color: #FF0000; font-weight: bold">*</span>
												</div>
											</div>
											<div class="col-sm-6">
												<input type="text" name="searchTextName"
													class="form-control" id="searchTextID"
													placeholder="Please Search Here" />
											</div>

											<button type="submit" id="submit-btn"
												class="btn btn-xl btn-success button-submit font13 "
												title="submit-btn" data-placement="top">Search</button>
										</div>

										<div class="col-sm-6">
											<table>
												<tbody>
													<tr>
														<td><input id="searchById" type="radio"
															name="searchBy" value="1" checked="checked"><label>SEARCH
																BY ID</label></td>
														<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="searchByName"
															type="radio" name="searchBy" value="2"><label>SEARCH
																BY NAME</label></td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</form>
							</div>
						</div>

						<!-- MAIN SEARCH FORM END -->


						<!-- NEXT SECTION STARTS WITH VERTICAL AND HORIZONTAL TABS START -->

						<div class="grid box-filters">
							<div class="table-header">
								<div class="row">
									<div class="col-sm-2">
										<!-- required for floating -->
										<!-- Nav tabs -->
										<ul class="nav nav-tabs tabs-left">
											<!-- 'tabs-right' for right tabs -->
											<li class="active"><a href="#vTab1" data-toggle="tab">Personal</a></li>
											<li><a href="#vTab2" data-toggle="tab">Department</a></li>
											<li><a href="#vTab3" data-toggle="tab">Extra Courses
													/ Training</a></li>
											<li><a href="#vTab4" data-toggle="tab">Other</a></li>
										</ul>
									</div>



									<div class="col-sm-10">
										<div class="grid box-filters">
											<div class="table-header">

												<!-- Tab panes -->
												<div class="tab-content">
													<!-- VERTICAL TAB 1 END HERE -->
													<div class="tab-pane active" id="vTab1">

														<div id="tabs">
															<ul>
																<li><a href="#tabs-1">PersonalMemoranda </a></li>
																<li><a href="#tabs-2">Family Particulars </a></li>
																<li><a href="#tabs-3">Qualification</a></li>
																<li><a href="#tabs-4">Nomination</a></li>
															</ul>
															<!-- TAB 1 START -->
															<div id="tabs-1" style="padding: 17px 0px 15px">
																<form action="savePersonalMemoranda" method="post"
																	id="personalMemoranda">
																	<div class="row">
																		<div class="col-xs-12 col-sm-12">
																			<div class="box">
																				<div class="box-header">
																					<div class="box-name">
																						<i class="fa fa-table"></i> <span>Personal
																							Details</span>
																					</div>
																					<div class="box-icons">
																						<a class="collapse-link"> <i
																							class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																						</a>
																					</div>
																					<div class="no-move"></div>
																				</div>
																				<div class="row">
																					<br>
																					<div class="box-content" style="">
																						<div class="col-md-6">

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Title</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="title" type="text" maxlength="40"
																										id="title" class="form-control"
																										placeholder="Title" disabled />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">First
																										Name</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="firstName" type="text"
																										maxlength="40" id="firstName"
																										class="form-control" placeholder="First Name"
																										disabled />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Middle
																										Name</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="middleName" type="text"
																										maxlength="40" id="middleName"
																										class="form-control" placeholder="Middle Name"
																										disabled />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Last
																										Name</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="lastName" type="text"
																										maxlength="40" id="lastName"
																										class="form-control" placeholder="Title"
																										disabled />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Date
																										Of Birth</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="dateOfBirth" type="text"
																										maxlength="40" class="datepicker"
																										id="dateOfBirth" class="form-control"
																										placeholder="Date Of Birth" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Date
																										Of Retirement</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="dateOfRetirement" type="text"
																										maxlength="40" class="datepicker"
																										id="dateOfRetirement" class="form-control"
																										placeholder="Date Of Retirement" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Marks
																											Of Identification</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="identificationMarkOne"
																											type="text" maxlength="40"
																											id="identificationMarkOne"
																											class="form-control"
																											placeholder="Identification Mark One" />
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label"></span>
																									</div>
																									<div class="col-sm-7">
																										<input name="identificationMarkTwo"
																											type="text" maxlength="40"
																											id="identificationMarkTwo"
																											class="form-control"
																											placeholder="Identification Mark Two" />
																									</div>
																								</div>
																							</div>



																						</div>
																						<!-- right start here -->
																						<div class="col-sm-6">

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">FN/AN</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="FN-AN" type="text" maxlength="10"
																										id="FN-AN" class="form-control"
																										placeholder="FN / AN" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Height
																										(in cms)</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="height" type="text" maxlength="10"
																										id="height" class="form-control"
																										placeholder="Height In Centimeters" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Phone
																										Number</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="phoneNumber" type="text"
																										maxlength="10" id="phoneNumber"
																										class="form-control"
																										placeholder="Phone Number" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Present
																										Address</span>
																								</div>
																								<div class="col-sm-7">
																									<textarea name="permanantAddress"
																										id="permanantAddress" class="form-control"
																										cols="" rows="">
																</textarea>
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Permanant
																										Address</span>
																								</div>
																								<div class="col-sm-7">
																									<textarea name="permanantAddress"
																										id="permanantAddress" class="form-control"
																										cols="" rows="">
																</textarea>
																								</div>
																							</div>


																						</div>
																						<!-- right end above -->

																					</div>
																				</div>
																			</div>
																		</div>
																	</div>

																	<div class="row">
																		<div class="col-xs-12 col-sm-12">
																			<div class="box">
																				<div class="box-header">
																					<div class="box-name">
																						<i class="fa fa-table"></i> <span>Service
																							Type Details</span>
																					</div>
																					<div class="box-icons">
																						<a class="collapse-link"> <i
																							class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																						</a>
																					</div>
																					<div class="no-move"></div>
																				</div>

																				<div class="box-content" style="">
																					<br>
																					<div class="row">
																						<div class="row col-md-6">
																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Present
																										Designation</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="presentDesignation" type="text"
																										maxlength="40" id="presentDesignation"
																										class="form-control"
																										placeholder="Present Designation" disabled />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Present
																										Department</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="presentDepartment" type="text"
																										maxlength="40" id="presentDepartment"
																										class="form-control"
																										placeholder="Present Department" disabled />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Staff
																										Type</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="staffType" id="staffType"
																										class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>

																									</select>
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Appointment
																										Category</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="appointmentCategory"
																										id="appointmentCategory" class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>

																									</select>
																								</div>
																							</div>

																						</div>
																						<!-- left column end here -->
																						<!-- right column starts here -->

																						<div class="col-md-6">
																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Date
																										Of Appointment</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="dateOfAppontment" type="text"
																										class="datepicker" id="dateOfAppontment"
																										class="form-control"
																										placeholder="Date Of Appointment" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Authenticated
																										with reference to</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="authenticatedWithRefrenceTo"
																										type="text" id="authenticatedWithRefrenceTo"
																										class="form-control"
																										placeholder="Authenticated with reference to" />
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">E-Mail</span>
																								</div>
																								<div class="col-sm-7">
																									<input name="emailAddress" type="text"
																										id="emailAddress" class="form-control"
																										placeholder="E-Mail Address" />
																								</div>
																							</div>
																						</div>
																						<!-- right column end here -->
																					</div>
																				</div>
																			</div>

																		</div>
																	</div>

																	<div class="row">
																		<div class="col-xs-12 col-sm-12">
																			<div class="box">
																				<div class="box-header">
																					<div class="box-name">
																						<i class="fa fa-table"></i> <span>Nationality
																							And Caste Details</span>
																					</div>
																					<div class="box-icons">
																						<a class="collapse-link"> <i
																							class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																						</a>
																					</div>
																					<div class="no-move"></div>
																				</div>

																				<div class="box-content" style="">
																					<br>
																					<div class="row">
																						<div class="col-md-6">
																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Nationality</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="nationality" id="nationality"
																										class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>

																									</select>
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Religion</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="religion" id="religion"
																										class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>

																									</select>
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Caste</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="caste" id="caste"
																										class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>

																									</select>
																								</div>
																							</div>


																						</div>
																						<div class="col-md-6">
																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Category</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="category" id="category"
																										class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>

																									</select>
																								</div>
																							</div>

																							<div class="form-group">
																								<div class="col-sm-5">
																									<span id="" class="control-label">Blood
																										Group</span>
																								</div>
																								<div class="col-sm-7">
																									<select name="bloodGroup" id="bloodGroup"
																										class="form-control">
																										<option id="0" selected="selected">Please
																											Select</option>
																									</select>
																								</div>

																							</div>
																						</div>
																					</div>
																				</div>
																			</div>

																		</div>
																		<!--button start here -->
																		<div class="col-md-12">
																			<div class="form-group action-btn-group">
																				<div class="controls2">
																					<span class="left-margin-remove"> <!-- <a href="#"> -->
																						<button type="submit" id="submit_button"
																							title="Save" name="submit_create_edit_team"
																							class="btn btn-xl btn-success button-submit font13">Save
																						</button> <!-- </a> -->
																					</span>
																					<button type="reset" id="cancel_id" title="Reset"
																						class="btn btn-xl btn-default button-submit font13">Reset
																					</button>
																				</div>
																			</div>
																		</div>
																		<!--button end here -->
																	</div>
																</form>
															</div>
															<!-- TAB 1 END -->
															<!-- TAB 2 START -->
															<div id="tabs-2" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Family
																						Particulars</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<div class="col-md-12">
																						<form action="saveFamilyMember" method="post"
																							id="familyMember">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Family
																											Member Name</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="familyMemberName" type="text"
																											maxlength="40" id="familyMemberName"
																											class="form-control"
																											placeholder="Family Member Name" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Relationship</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="relationship" type="text"
																											maxlength="40" id="relationship"
																											class="form-control"
																											placeholder="Relationship" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Date
																											Of Birth</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="familyMemberDateOfBirth"
																											type="text" maxlength="40"
																											id="familyMemberDateOfBirth"
																											class="form-control datepicker"
																											placeholder="Date Of Birth" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Age</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="age" type="text" maxlength="40"
																											id="age" class="form-control"
																											placeholder="Age" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Annual
																											Income</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="annualIncome" type="text"
																											maxlength="40" id="annualIncome"
																											class="form-control"
																											placeholder="Annual Income" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Designation
																											Of Attesting Officer</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="designationOfAttestingOfficer"
																											type="text" maxlength="40"
																											id="designationOfAttestingOfficer"
																											class="form-control"
																											placeholder="Designation Of Attesting Officer" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Address</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="familyMemberAddress"
																											id="familyMemberAddress" class="form-control"
																											cols="" rows=""></textarea>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>

																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Member</th>
																										<th>Relation</th>
																										<th>DOB</th>
																										<th>AGE</th>
																										<th>Annual Income</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>
																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 2 END -->

															<!-- TAB 3 START -->
															<div id="tabs-3" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Qualification</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="qualificationForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Examination
																											Passed</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="examinationPassed" type="text"
																											maxlength="40" id="examinationPassed"
																											class="form-control"
																											placeholder="Examination Passed" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">University/Institute</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="university-institute" type="text"
																											maxlength="40" id="university-institute"
																											class="form-control"
																											placeholder="University / Institute" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Year
																											Of Passing</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="yearOfPassing" type="text"
																											maxlength="40" id="yearOfPassing"
																											class="form-control"
																											placeholder="Year Of Passing" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Reg.
																											No</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="regNo" type="text" maxlength="40"
																											id="regNo" class="form-control"
																											placeholder="University / Institute" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Specialization</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="specialization" type="text"
																											maxlength="40" id="specialization"
																											class="form-control"
																											placeholder="Specialization" />
																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Exam Pass</th>
																										<th>University/Institute</th>
																										<th>Year Of Passing</th>
																										<th>Reg No</th>
																										<th>Specialization</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 3 END -->

															<!-- TAB 4 START -->
															<div id="tabs-4" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Nomination</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post" id="nominationForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Nomination
																											For</span>
																									</div>
																									<div class="col-sm-7">
																										<select class="form-control"
																											name="nominationFor" id="nominationFor">
																											<option>Please Select</option>
																											<option>Please Select</option>
																											<option>Please Select</option>
																										</select>

																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											Of Nominee</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfNominee" type="text"
																											maxlength="40" id="university-institute"
																											class="form-control"
																											placeholder="Name Of Nominee" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Relation</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="relationWithNominee" type="text"
																											maxlength="40" id="relationWithNominee"
																											class="form-control" placeholder="Relation" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Reg.
																											No</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="regNo" type="text" maxlength="40"
																											id="regNo" class="form-control"
																											placeholder="University / Institute" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Percentage</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="percentage" type="text"
																											maxlength="40" id="percentage"
																											class="form-control" placeholder="Percentage" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Date
																											Of Birth</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nomineeDateOfBirth" type="text"
																											maxlength="40" id="nomineeDateOfBirth"
																											class="form-control datepicker"
																											placeholder="Date Of Birth" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Age</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nomineeAge" type="text"
																											maxlength="40" id=""
																											nomineeAge"" class="form-control"
																											placeholder="Age" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Contingencies
																											Of The Happening</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="contingenciesOfHappenning"
																											type="text" maxlength="40"
																											id="contingenciesOfHappenning"
																											class="form-control"
																											placeholder="Contingencies Of The Happening" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Address</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="address" id="address"
																											class="form-control" cols="" rows="">
																	</textarea>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remarks</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarks" id="remarks"
																											class="form-control" cols="" rows="">
																	</textarea>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5" align="right">
																										<input type="checkbox" name="class" />
																									</div>
																									<div class="col-sm-7">
																										<label>Last Nominee</label>
																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Nomination For</th>
																										<th>Name</th>
																										<th>Relation</th>
																										<th>Percentage</th>
																										<th>DOB</th>
																										<th>Age</th>
																										<th>Contingencies Of The Happening</th>
																										<th>Address</th>
																										<th>Remark</th>
																										<th>Last Nominee</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 4 END -->
														</div>
													</div>
													<!-- VERTICAL TAB 1 END HERE -->

													<!-- VERTICAL TAB 2 START HERE  -->
													<div class="tab-pane" id="vTab2">

														<div id="tabs1">
															<ul>
																<li><a href="#tabs-5">Dept Examination</a></li>
																<li><a href="#tabs-6">Previous Experience</a></li>
																<li><a href="#tabs-7">Administrative
																		Responsibilities</a></li>
																<li><a href="#tabs-8">Publication Details</a></li>
																<li><a href="#tabs-9">Invited Talks</a></li>
															</ul>
															<!-- TAB 5 START -->
															<div id="tabs-5" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Department
																						Examination</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="departmentExaminationForm">

																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											Of Examination</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfExamination" type="text"
																											maxlength="40" id="nameOfExamination"
																											class="form-control"
																											placeholder="Name Of Examination" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Reg
																											No</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="regNo" type="text" maxlength="40"
																											id="regNo" class="form-control"
																											placeholder="Reg No" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Year
																											Of Passing</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="yearOfPassing" type="text"
																											maxlength="40" id="yearOfPassing"
																											class="form-control"
																											placeholder="Year Of Passing" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Attesting
																											Officer</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="attestingOfficer" type="text"
																											maxlength="40" id="attestingOfficer"
																											class="form-control"
																											placeholder="Attesting Officer" />
																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Name Of Examination</th>
																										<th>Reg No</th>
																										<th>Year Of Passing</th>
																										<th>Attesting Officer</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 5 END -->
															<!-- TAB 6 START -->
															<div id="tabs-6" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Previous
																						Experience</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="previousExperienceForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="fromDate" type="text"
																											maxlength="40" id="fromDate"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="toDate" type="text"
																											maxlength="40" id="toDate"
																											class="form-control datepicker"
																											placeholder="To Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											of Institute & PostHeld</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfInstituteAndPost"
																											type="text" maxlength="40"
																											id="nameOfInstituteAndPost"
																											class="form-control"
																											placeholder="Institute Name And Post Held" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Reason
																											For Living Service</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="reasonForLeavingService"
																											type="text" maxlength="40" id=""
																											reasonForLeavingService"" class="form-control"
																											placeholder="Reason For Living Service" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Desig.of
																											Attest.Officer</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="desigOfAttestingOfficer"
																											type="text" maxlength="40"
																											id="desigOfAttestingOfficer"
																											class="form-control"
																											placeholder="Desig.of Attest.Officer" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkOfPreviousExperience"
																											id="remarkOfPreviousExperience"
																											class="form-control" cols="" rows="">
																</textarea>

																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>From Date</th>
																										<th>To Date</th>
																										<th>Institute / Post</th>
																										<th>Reason</th>
																										<th>Attesting Officer</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 6 END -->
															<!-- TAB 7 START -->
															<div id="tabs-7" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Administrative
																						Responsibilities</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="administrativeResponsibilitiesForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Responsibility</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="responsibility" type="text"
																											maxlength="40" id="responsibility"
																											class="form-control"
																											placeholder="Responsibility" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Organization</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="organization" type="text"
																											maxlength="40" id="organization"
																											class="form-control"
																											placeholder="Organization" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input
																											name="fromDateAdministrativeResponsibilities"
																											type="text" maxlength="40"
																											id="fromDateAdministrativeResponsibilities"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input
																											name="toDateAdministrativeResponsibilities"
																											type="text" maxlength="40"
																											id="toDateAdministrativeResponsibilities"
																											class="form-control datepicker"
																											placeholder="To Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea
																											name="remarkOfAdministrativeResponsibilities"
																											id="remarkOfAdministrativeResponsibilities"
																											class="form-control" cols="" rows="">
																</textarea>

																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Responsibility</th>
																										<th>Organization</th>
																										<th>From Date</th>
																										<th>To Date</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 7 END -->
															<!-- TAB 8 START -->
															<div id="tabs-8" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Publication
																						Details</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="publicationDetailsForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Publication
																											Type</span>
																									</div>
																									<div class="col-sm-7">
																										<select id="publicationType"
																											name="publicationType" class="form-control">
																											<option>PLEASE SELECT</option>
																											<option>PLEASE SELECT</option>
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Publication
																											Category</span>
																									</div>
																									<div class="col-sm-7">
																										<select id="publicationCategory"
																											name="publicationCategory"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																											<option>PLEASE SELECT</option>
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Title</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="title" type="text" maxlength="40"
																											id="title" class="form-control"
																											placeholder="Title" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Publication
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="publicationDate" type="text"
																											maxlength="40" id="publicationDate"
																											class="form-control datepicker"
																											placeholder="Publication Date" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Location</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="location" type="text"
																											maxlength="40" id="location"
																											class="form-control" placeholder="Title" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Details</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea
																											name="remarkOfAdministrativeResponsibilities"
																											id="remarkOfAdministrativeResponsibilities"
																											class="form-control" cols="" rows="">
																</textarea>

																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Type</th>
																										<th>Category</th>
																										<th>Title</th>
																										<th>Subject</th>
																										<th>Publication Date</th>
																										<th>Location</th>
																										<th>Details</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 8 END -->
															<!-- TAB 9 START -->
															<div id="tabs-9" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Invited
																						Talks</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="invitedTalksForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Subject</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="subject" type="text"
																											maxlength="40" id="subject"
																											class="form-control" placeholder="Subject" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Venue</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="venue" type="text" maxlength="40"
																											id="venue" class="form-control"
																											placeholder="Venue" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Duration</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="duration" type="text"
																											maxlength="40" id="duration"
																											class="form-control" placeholder="Duration" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Date
																											Of Talk</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="dateOfTalk" type="text"
																											maxlength="40" id="dateOfTalk"
																											class="form-control datepicker"
																											placeholder="Date Of Talk" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkOfInvitedTalks"
																											id="remarkOfInvitedTalks"
																											class="form-control" cols="" rows="">
																</textarea>

																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">

																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Subject</th>
																										<th>Venue</th>
																										<th>Duration</th>
																										<th>Date Of Talk</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 9 END -->


														</div>

													</div>
													<!-- VERTICAL TAB 2 END HERE  -->

													<!-- VERTICAL TAB 3 START HERE  -->
													<div class="tab-pane" id="vTab3">

														<div id="tabs3">
															<ul>
																<li><a href="#tabs-10">Training/Short Term
																		Course/Conference Attended</a></li>
																<li><a href="#tabs-11">Training/Short Term
																		Course/Conference Conducted</a></li>
																<li><a href="#tabs-12">Matters </a></li>
															</ul>
															<!-- TAB 10 START -->
															<div id="tabs-10" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Training/Short
																						Term Course/Conference Attended</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="training-shortTerm-courseAttendedForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Type</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="type" id="type"
																											class="form-control">
																											<option>Please Select</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											of Course</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfCourse" type="text"
																											maxlength="40" id="nameOfCourse"
																											class="form-control"
																											placeholder="Name OF Course" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											of Institute/Organization</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfInstituteOrOrganization"
																											type="text" maxlength="40"
																											id="nameOfInstituteOrOrganization"
																											class="form-control"
																											placeholder="Institute Name / Organization" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="fromDateConferenceAttended"
																											type="text" maxlength="40"
																											id="fromDateConferenceAttended"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="toDateConferenceAttended"
																											type="text" maxlength="40"
																											id="toDateConferenceAttended"
																											class="form-control datepicker"
																											placeholder="To Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkOfPreviousExperience"
																											id="remarkOfPreviousExperience"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Type</th>
																										<th>Name Of Course</th>
																										<th>Institute</th>
																										<th>From Date</th>
																										<th>To Date</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 10 END -->

															<!-- TAB 11 START -->
															<div id="tabs-11" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Training/Short
																						Term Course/Conference Conducted</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="training-shortTerm-courseConductedForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Type</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="type" id="type"
																											class="form-control">
																											<option>Please Select</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											of Course</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfCourse" type="text"
																											maxlength="40" id="nameOfCourse"
																											class="form-control"
																											placeholder="Name OF Course" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Name
																											of Institute/Organization</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="nameOfInstituteOrOrganization"
																											type="text" maxlength="40"
																											id="nameOfInstituteOrOrganization"
																											class="form-control"
																											placeholder="Institute Name / Organization" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="fromDateConferenceConducted"
																											type="text" maxlength="40"
																											id="fromDateConferenceConducted"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="toDateConferenceConducted"
																											type="text" maxlength="40"
																											id="toDateConferenceConducted"
																											class="form-control datepicker"
																											placeholder="To Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkOfPreviousExperience"
																											id="remarkOfPreviousExperience"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Type</th>
																										<th>Name Of Course</th>
																										<th>Institute</th>
																										<th>From Date</th>
																										<th>To Date</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 11 END -->

															<!-- TAB 12 START -->
															<div id="tabs-12" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Matters</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post" id="mattersForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Heading
																											Topic</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="headingTopic" type="text"
																											maxlength="40" id="headingTopic"
																											class="form-control"
																											placeholder="Heading Topic" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="dateMatters" type="text"
																											maxlength="40"
																											id="fromDateConferenceConducted"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Matter</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkOfPreviousExperience"
																											id="matter" class="form-control" cols=""
																											rows="">
																</textarea>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>

																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Heading Topic</th>
																										<th>Date</th>
																										<th>Matter</th>

																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 12 END HERE -->
														</div>
													</div>
													<!-- VERTICAL TAB 3 END HERE  -->

													<!-- VERTICAL TAB 4 START HERE  -->
													<div class="tab-pane" id="vTab4">

														<div id="tabs4">
															<ul>
																<li><a href="#tabs-13">Image Upload</a></li>
																<li><a href="#tabs-14">Loans & Advance </a></li>
																<li><a href="#tabs-15">Leave</a></li>
																<li><a href="#tabs-16">Pay Revision</a></li>
																<li><a href="#tabs-17">Increment / Termination</a></li>
																<li><a href="#tabs-18">LTC</a></li>
															</ul>

															<!-- TAB 13 START HERE-->
															<div id="tabs-13" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Image
																						Upload</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="imageUploadForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Image
																											Type </span>
																									</div>
																									<div class="col-sm-7">
																										<select name="imageType" id="imageType"
																											class="form-control">
																											<option>Please Select</option>


																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-12">
																										<div class="col-xs-5">
																											<span id="ContentPlaceHolder1_lblMenuLink"
																												class="control-label">Photo</span>
																										</div>
																										<div class="col-sm-7">
																											<input type="file" name="documentImage"
																												id="documentImage"
																												title="Please Select Photo">
																											<!-- onchange="showImage()" -->
																										</div>
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-12">
																										<div class="col-xs-5" align="right">
																											<button type="button"
																												id="uploadDocumentImage" title="Upload"
																												name="uploadDocumentImage"
																												class="btn button-primary font13">Upload
																											</button>
																										</div>
																										<div class="col-sm-7">
																											<div class="col-sm-7">
																												<img id="documentUploadedImage"
																													style="border: 1px solid #FFE6F9"
																													src="./resources/No_image_available.svg"
																													style="height: 75px; width: 75px;" alt="">
																											</div>
																										</div>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>

																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Heading Topic</th>
																										<th>Date</th>
																										<th>Matter</th>

																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 13 END HERE -->

															<!-- TAB 14 START HERE-->
															<div id="tabs-14" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Loan And
																						Advance</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post" id="loanForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Loan
																											Name</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="loanName" id="loanName"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Order
																											No</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="orderNo" type="text"
																											maxlength="40" id="orderNo"
																											class="form-control" placeholder="Order No" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Amount
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="amount" type="text"
																											maxlength="40" id="amount"
																											class="form-control" placeholder="Amount" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Rate
																											Of Intrest </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="rateOfIntrest" type="text"
																											maxlength="40" id="rateOfIntrest"
																											class="form-control"
																											placeholder="Rate Of Intrest" />
																									</div>
																								</div>

																							</div>
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">No Of
																											Installments</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="noOfInstallments" type="text"
																											maxlength="40" id="noOfInstallments"
																											class="form-control"
																											placeholder="No Of Installments" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="loanDate" type="text"
																											maxlength="40" id="loanDate"
																											class="form-control datepicker"
																											placeholder="Loan Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="loanRemark" id="loanRemark"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>

																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Loan Name</th>
																										<th>Order No</th>
																										<th>Amount</th>
																										<th>Rate Of Intrest</th>
																										<th>No Of Installments</th>
																										<th>Loan Date</th>
																										<th>Remarks</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 14 END HERE -->

															<!-- TAB 15 START HERE-->
															<div id="tabs-15" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Leave</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post" id="leaveForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Leave
																											Name</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="leaveName" id="leaveName"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="fromDateConferenceConducted"
																											type="text" maxlength="40" id="fromDateLeave"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="toDateConferenceConducted"
																											type="text" maxlength="40" id="toDateLeave"
																											class="form-control datepicker"
																											placeholder="To Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">No Of
																											Days</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="noOfDaysLeave" type="text"
																											maxlength="40" id="noOfDaysLeave"
																											class="form-control" placeholder="No Of Days" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Order
																											No</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="orderNoLeave" type="text"
																											maxlength="40" id="orderNoLeave"
																											class="form-control" placeholder="Order No" />
																									</div>
																								</div>
																							</div>

																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Joining
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="joiningDateLeave" type="text"
																											maxlength="40" id="joiningDateLeave"
																											class="form-control datepicker"
																											placeholder="Joining Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Session
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="sessionLeave" id="sessionLeave"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Leave
																											Trans Type</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="leaveTransType"
																											id="leaveTransType" class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>


																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="loanRemark" id="loanRemark"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Leave Name</th>
																										<th>From Date</th>
																										<th>To Date</th>
																										<th>No Of Days</th>
																										<th>Order No</th>
																										<th>Joining Date</th>
																										<th>Session</th>
																										<th>Leave Trans Type</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 15 END HERE -->

															<!-- TAB 16 START HERE-->
															<div id="tabs-16" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Pay
																						Revision</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="payRevisionForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Designation
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="designationPayRevision"
																											id="designationPayRevision"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Scale
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="scalePayRevision"
																											id="scalePayRevision" class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="fromDatePayRevision" type="text"
																											maxlength="40" id="fromDatePayRevision"
																											class="form-control datepicker"
																											placeholder="From Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="toDatePayRevision" type="text"
																											maxlength="40" id="toDatePayRevision"
																											class="form-control datepicker"
																											placeholder="To Date" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Type
																										</span>
																									</div>
																									<div class="col-sm-7">

																										<table>
																											<tbody>
																												<tr>
																													<td><input id="searchById"
																														type="radio" name="searchBy" value="1"
																														checked="checked"><label>Pay
																															Revision</label></td>
																													<td>&nbsp;&nbsp;<input
																														id="searchByName" type="radio"
																														name="searchBy" value="2"><label>Promotion
																													</label></td>
																												</tr>
																											</tbody>
																										</table>

																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="loanRemark" id="loanRemark"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>

																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Designation</th>
																										<th>Scale</th>
																										<th>From Date</th>
																										<th>To Date</th>
																										<th>Type</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 16 END HERE -->

															<!-- TAB 17 START HERE-->
															<div id="tabs-17" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>Increment
																						/Termination</span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post"
																							id="incrementTerminationForm">
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Sq No
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="sqNo" type="text" maxlength="40"
																											id="sqNo" class="form-control"
																											placeholder="Sq No" />
																									</div>
																								</div>


																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Transaction
																											Type </span>
																									</div>
																									<div class="col-sm-7">
																										<select name="transactionType"
																											id="transactionType" class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Ord
																											Eff Date</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="ordEffDate" type="text"
																											maxlength="40" id="ordEffDate"
																											class="form-control datepicker"
																											placeholder="Ord Eff Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Department
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="departmentIncrementTermination"
																											id="departmentIncrementTermination"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Designation
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="designationIncrementTermination"
																											id="designationIncrementTermination"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Order
																											NO </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="orderNoIncrementTermination"
																											type="text" maxlength="40"
																											id="orderNoIncrementTermination"
																											class="form-control datepicker"
																											placeholder="Order No" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Order
																											Date </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="orderDateIncrementTermination"
																											type="text" maxlength="40"
																											id="orderDateIncrementTermination"
																											class="form-control datepicker"
																											placeholder="Order Date" />
																									</div>
																								</div>

																							</div>
																							<div class="col-md-6">

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Gr NO
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="grNoIncrementTermination"
																											type="text" maxlength="40"
																											id="grNoIncrementTermination"
																											class="form-control datepicker"
																											placeholder="Order No" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Gr
																											Date </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="grrDateIncrementTermination"
																											type="text" maxlength="40"
																											id="grDateIncrementTermination"
																											class="form-control datepicker"
																											placeholder="Order Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Pay
																											Allowance </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="payAllowanceIncrementTermination"
																											type="text" maxlength="40"
																											id="payAllowanceIncrementTermination"
																											class="form-control datepicker"
																											placeholder="Pay Allowance" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Ter/Ret
																											Date </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="terRetDateIncrementTermination"
																											type="text" maxlength="40"
																											id="terRetDateIncrementTermination"
																											class="form-control datepicker"
																											placeholder="Ter / Ret Date" />
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Scale
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="scaleIncrementTermination"
																											id="scaleIncrementTermination"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>

																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkIncrementTermination"
																											id="remarkIncrementTermination"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>

																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>

																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>Sq No</th>
																										<th>Transaction Type</th>
																										<th>Ord Eff Date</th>
																										<th>Department</th>
																										<th>Designation</th>
																										<th>Order No</th>
																										<th>Order Date</th>
																										<th>Gr NO</th>
																										<th>Gr Date</th>
																										<th>Pay Allowance</th>
																										<th>Ter/Ret Date</th>
																										<th>Scale</th>
																										<th>Remark</th>
																									</tr>
																								</thead>

																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">

																									<tr class="odd">

																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>

																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 17 END HERE -->

															<!-- TAB 18 START HERE-->
															<div id="tabs-18" style="padding: 17px 0px 15px;">
																<div class="row">
																	<div class="col-xs-12 col-sm-12">
																		<div class="box">
																			<div class="box-header">
																				<div class="box-name">
																					<i class="fa fa-table"></i> <span>LTC </span>
																				</div>
																				<div class="box-icons">
																					<a class="collapse-link"> <i
																						class="servicedrop  glyphicon glyphicon-chevron-up"></i>
																					</a>
																				</div>
																				<div class="no-move"></div>
																			</div>
																			<div class="row">
																				<br>
																				<div class="box-content" style="">
																					<!-- left div start here -->
																					<div class="col-md-12">
																						<form action="#" method="post" id="ltcForm">
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Type
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<table>
																											<tbody>
																												<tr>
																													<td><input id="homeTown" type="radio"
																														name="homeTown" value="1"
																														checked="checked"><label>Home
																															Town</label></td>
																													<td>&nbsp;&nbsp;<input
																														id="anywhereInIndia" type="radio"
																														name="anywhereInIndia" value="2"><label>Anywhere
																															in<br>India
																													</label></td>
																												</tr>
																											</tbody>
																										</table>
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Staff
																											Type </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="staffType" type="text"
																											maxlength="40" id="staffType"
																											class="form-control" placeholder="Staff Type" />
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">City
																										</span>
																									</div>
																									<div class="col-sm-7">
																										<select name="cityLtc" id="cityLtc"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Order
																											No</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="orderNoLtc" type="text"
																											maxlength="40" id="orderNoLtc"
																											class="form-control" placeholder="Order No" />
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Order
																											Date </span>
																									</div>
																									<div class="col-sm-7">
																										<input name="orderDateLtc" type="text"
																											maxlength="40" id="orderDateLtc"
																											class="form-control datepicker"
																											placeholder="Order Date" />
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">From
																											Period</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="fromPeriodDateLtc" type="text"
																											maxlength="40" id="fromPeriodDateLtc"
																											class="form-control datepicker"
																											placeholder="From Period" />
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">To
																											Period</span>
																									</div>
																									<div class="col-sm-7">
																										<input name="toPeriodDateLtc" type="text"
																											maxlength="40" id="toPeriodDateLtc"
																											class="form-control datepicker"
																											placeholder="To Period" />
																									</div>
																								</div>
																							</div>
																							<div class="col-md-6">
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Block
																											/ Year </span>
																									</div>
																									<div class="col-sm-7">
																										<select name="departmentIncrementTermination"
																											id="departmentIncrementTermination"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Sub
																											Block / Month </span>
																									</div>
																									<div class="col-sm-7">
																										<select name="departmentIncrementTermination"
																											id="departmentIncrementTermination"
																											class="form-control">
																											<option>PLEASE SELECT</option>
																										</select>
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Family
																											Members </span>
																									</div>
																									<div class="col-sm-7">
																										<div class=""
																											style="height: auto; position: relative; overflow: auto">
																											<table id="table"
																												class="table table-bordered  table-checkable table-responsive  "
																												aria-describedby="DataTables_Table_0_info">
																												<thead>
																													<tr role="row">
																														<th><input type="checkbox" /></th>
																														<th>Name</th>
																														<th>Age</th>
																													</tr>
																												</thead>
																												<tbody role="alert" aria-live="polite"
																													aria-relevant="all">

																													<tr class="odd">
																														<td><input type="checkbox" /></td>
																														<td>John Rambo</td>
																														<td>48</td>
																													</tr>
																												</tbody>
																											</table>
																										</div>
																									</div>
																								</div>
																								<div class="form-group">
																									<div class="col-sm-5">
																										<span id="" class="control-label">Remark</span>
																									</div>
																									<div class="col-sm-7">
																										<textarea name="remarkIncrementTermination"
																											id="remarkIncrementTermination"
																											class="form-control" cols="" rows="">
																</textarea>
																									</div>
																								</div>
																							</div>
																							<!--button start here -->
																							<div class="col-md-12">
																								<br>
																								<div class="form-group action-btn-group">
																									<div class="controls2">
																										<span class="left-margin-remove"> <a
																											href="#">
																												<button type="submit" id="submit_button"
																													title="Save" name="submit_create_edit_team"
																													class="btn btn-xl btn-success button-submit font13">Save
																												</button>
																										</a>
																										</span>
																										<button type="reset" id="cancel_id"
																											title="Refresh"
																											class="btn btn-xl btn-default button-submit font13">Reset
																										</button>
																									</div>
																								</div>
																							</div>
																							<!--button end here -->
																						</form>
																					</div>
																					<!-- left div end here -->
																					<!-- Right div start here -->
																					<div class="col-md-12">
																						<br>
																						<div class=""
																							style="height: auto; position: relative; overflow: auto">
																							<table id="table"
																								class="table table-bordered  table-checkable table-responsive  "
																								aria-describedby="DataTables_Table_0_info">
																								<thead>
																									<tr role="row">
																										<th>Action</th>
																										<th>LTC Type</th>
																										<th>Staff Type</th>
																										<th>City</th>
																										<th>Order NO</th>
																										<th>Order Date</th>
																										<th>From Period</th>
																										<th>To Period</th>
																										<th>Block/Year</th>
																										<th>Sub Block/Month</th>
																										<th>Family Members</th>
																										<th>Remark</th>
																									</tr>
																								</thead>
																								<tbody role="alert" aria-live="polite"
																									aria-relevant="all">
																									<tr class="odd">
																										<td class=" ">
																											<div class="fa-select" title="Edit"
																												data-placement="top" onclick="">
																												<span class="fa fa-pencil-square"> </span>
																											</div>

																											<div class="fa fa-myremove" title="Delete"
																												data-placement="top" onclick="">
																												<span class="fa fa-trash-o"> </span>
																											</div>
																										</td>
																										<td>John Rambo</td>
																										<td>Father</td>
																										<td>2/2/1980</td>
																										<td>48</td>
																										<td>500000</td>
																									</tr>
																								</tbody>
																							</table>
																						</div>
																					</div>
																					<!-- Right div end here -->
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<!-- TAB 18 END HERE -->

														</div>
													</div>
													<!-- VERTICAL TAB 4 END HERE  -->
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- TABS -->
						<!-- TABS END -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
