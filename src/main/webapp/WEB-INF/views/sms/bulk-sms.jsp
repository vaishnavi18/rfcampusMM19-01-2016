<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>SMS/Email Service</title>

<jsp:include page="../authentication/script.jsp" />

<!-- tab code link start here -->
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
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
<script>
<!-- tab code link end here -->
	function getgroup2(obj) {
		var tableId = obj.id.trim();
		var db_table = (document.getElementById(tableId).value);
		if (tableId != '') {
			$
					.ajax({
						url : "./getSmsGroup2",
						type : "GET",
						data : {
							"groupId" : tableId,
						},
						success : function(response) {
							//alert(response)
							var text2 = ''
							if (JSON.stringify(response) != '') {

								switch (tableId) {

								case "bloodGroupList": {

									var jsonOb = JSON
											.parse(JSON
													.stringify(response.bloodGroupList));
									$
											.each(
													response.bloodGroupList,
													function(index,
															bloodGroupList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+bloodGroupList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ bloodGroupList.bloodGroup
																+ "</td>"
																+ "</tr>";
													});
									break;

								} // case end here

								case "branchList": {
									//	alert(33)

									var jsonOb = JSON.parse(JSON
											.stringify(response.branchList));
									$
											.each(
													response.branchList,
													function(index, branchList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+branchList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ branchList.branchShortName
																+ "</td>"
																+ "</tr>";
													});
									break;

								} // case end here

								case "nationalityList": {

									var jsonOb = JSON
											.parse(JSON
													.stringify(response.nationalityList));
									$
											.each(
													response.nationalityList,
													function(index,
															nationalityList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+nationalityList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ nationalityList.branchShortName
																+ "</td>"
																+ "</tr>";
													});
									break;

								} // case end here

								case "yearList": {

									var jsonOb = JSON.parse(JSON
											.stringify(response.yearList));
									$
											.each(
													response.yearList,
													function(index, yearList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+yearList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ yearList.year
																+ "</td>"
																+ "</tr>";
													});
									break;

								} // case end here

								case "casteList": {
									//alert('in');

									var jsonOb = JSON.parse(JSON
											.stringify(response.casteList));
									$
											.each(
													response.casteList,
													function(index, casteList) {
														//alert(casteList.admCasteId)
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+casteList.admCasteId+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ casteList.caste
																+ "</td>"
																+ "</tr>";
													});
									break;
								} // case end here

								case "categoryList": {

									var jsonOb = JSON.parse(JSON
											.stringify(response.categoryList));
									$
											.each(
													response.categoryList,
													function(index,
															categoryList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+categoryList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ categoryList.category
																+ "</td>"
																+ "</tr>";
													});
									break;
								} // case end here

								case "cityList": {

									var jsonOb = JSON.parse(JSON
											.stringify(response.cityList));
									$
											.each(
													response.cityList,
													function(index, cityList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+cityList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ cityList.branchShortName
																+ "</td>"
																+ "</tr>";
													});
									break;
								} // case end here

								case "religionList": {

									var jsonOb = JSON.parse(JSON
											.stringify(response.religionList));
									$
											.each(
													response.religionList,
													function(index,
															religionList) {
														text2 += "<tr>"
																+ "<td style=\"width: 85px\"><input type=\"checkbox\" value=\""+religionList.id+"\" name=\"test\" /> <label>1</label></td> "
																+ "<td>"
																+ religionList.religion
																+ "</td>"
																+ "</tr>";
													});
									break;
								} // case end here
								default: {
									alert('default');
								}

								} // switch end here

								//	alert(text2)
								$('#group2').empty().append(text2);
							}
						},
						error : function() {

						}
					});
		} else {
			$("#group2").empty();
		}

	}

	$(function() {
		$("#tabs").tabs();
		$(".js-example-basic-multiple").select2();
	});

	/*  Date and time picker start here */
	$(function() {
		$(".datepicker").datepicker({
			showOn : "both",
			/* buttonImage : "image.jpg", */
			dateFormat : "dd-mm-yy hh:mm:ss",
			buttonText : "<i  class='icon-calendar my_cal'></i>",
			/* changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			yearRange: 'c-20:c+30',
			maxDate: '@maxDate',
			minDate: '@minDate', */
			buttonImageOnly : false,
			constrainInput : true,
			/*   minDate:+0, //you do not want to show previous date.*/
			maxDate : +0
		// you do not want to show next day. 
		});

	});
	/*  Date and time picker end here  */

	/* code for count textarea start here */
	$(function() {

		var text_max = 200;
		$('#count_message').html(text_max + ' remaining');

		$('#text').keyup(function() {

			var text_length = $('#text').val().length;
			var text_remaining = text_max - text_length;

			$('#count_message').html(text_remaining + ' remaining');
		});
	});

	$(function() {

		var text_max = 200;
		$('#template_count_message').html(text_max + ' remaining');

		$('#template_text').keyup(function() {

			var text_length = $('#text').val().length;
			var text_remaining = text_max - text_length;

			$('#template_count_message').html(text_remaining + ' remaining');
		});
	});
	/* code for count textarea end here */

	$(document)
			.ready(
					function() {
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
					});

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
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">

								<div class="grid-header text">SMS Module</div>


							</div>
							<!-- jaskirat code start here -->
							<div id="tabs">
								<ul>
									<li><a href="#tabs-1">SMS Setting</a></li>
									<li><a href="#tabs-2">Bulk SMS</a></li>
									<li><a href="#tabs-3">Pending Sms</a></li>
									<li><a href="#tabs-4">Scheduled Sms</a></li>

								</ul>

								<!-- tabs1 starts here -->
								<div id="tabs-1" style="padding: 17px 0px 15px;">
									<div class="row">
										<!--Outer row start here -->
										<!-- General Information tab start here -->
										<div class="col-xs-12 col-sm-12">
											<div class="box">
												<div class="box-header">
													<div class="box-name">
														<i class="fa fa-table"></i> <span> Server
															Configuration</span>
													</div>
													<div class="box-icons">
														<a class="collapse-link"> <i
															class="servicedrop  glyphicon glyphicon-chevron-down"></i>
														</a>


													</div>
													<div class="no-move"></div>
												</div>
												<div class="box-content" style="display: none">

													<!--left row 1 1 start here -->
													<!-- General header tab start here -->


													<div class="box-header" style="top: 5px;">
														<div class="box-name">
															<i class="fa fa-table"></i> <span> SMS Server
																Setting</span>
														</div>


													</div>


													<!-- General header tab end here -->


													<div class="row my-bg-success">
														<!--left div start here -->


														<div class="col-md-6">

															<div class="form-horizontal">
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">
																		<div class="col-sm-5">
																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">SMS Service List<span
																				style="color: #FF0000; font-weight: bold">*</span></span>
																		</div>
																		<div class="col-sm-7">
																			<select name="parentMenuId" data-toggle="modal"
																				data-original-title="Add to Project" id="parentMenu"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																			</select>
																		</div>

																	</div>
																</div>


															</div>

														</div>


														<!--left div end here -->
														<div class="col-xs-6 col-sm-6" style="padding-top: 15px">
															<div class="grid box-filters"
																style="height: 217px; position: relative; overflow: auto">

																<table id="menu_table"
																	class="table table-bordered  table-checkable table-responsive  "
																	id="DataTables_Table_0"
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">

																			<th>Srno</th>
																			<th>SMS</th>
																			<th>Email</th>
																			<th>Module code</th>
																			<th>Module Name</th>
																		</tr>
																	</thead>

																	<tbody role="alert" aria-live="polite"
																		aria-relevant="all">

																	</tbody>
																</table>
															</div>
														</div>





														<div class="col-xs-12 ">
															<div class="box-header-same" style="top: 5px">
																<div class="box-name">
																	<i class="fa fa-table"></i> <span>Messanger
																		Server Setting</span>
																</div>

															</div>
														</div>
													</div>

													<!--  Server cofiguration start here -->
													<div class="row my-bg-success">
														<div class="col-md-6">

															<div class="form-horizontal">
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Messenger Server <span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="parentMenuId" data-toggle="modal"
																				data-original-title="Add to Project" id="parentMenu"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																			</select>
																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblParent"
																				class="control-label">Server Name</span>

																		</div>
																		<div class="col-sm-7">
																			<input name="menuName" type="text" maxlength="40"
																				id="menu_name" tabindex="3" class="form-control"
																				onkeypress="return CheckAlphaNumeric(event,this)"
																				placeholder="Server Name" />

																		</div>
																	</div>
																</div>
															</div>
														</div>

														<!--left div end here -->


														<!--right div start here -->

														<div class="col-md-6" style="padding-top: 17px">
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblMenuName"
																			class="control-label">Server IP<span
																			style="color: #FF0000; font-weight: bold">*</span></span>


																	</div>
																	<div class="col-sm-7">
																		<input name="menuLink" type="text" maxlength="100"
																			id="menu_link" tabindex="4" class="form-control"
																			onkeypress="return CheckAlphaNumeric(event,this)"
																			placeholder="Server IP">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label">Port <span
																			style="color: #FF0000; font-weight: bold">*</span></span>

																	</div>

																	<div class="col-sm-7">
																		<input name="menuLink" type="text" maxlength="100"
																			id="menu_link" tabindex="4" class="form-control"
																			onkeypress="return CheckAlphaNumeric(event,this)"
																			placeholder="Port Number">

																	</div>
																</div>
															</div>


														</div>


														<!--button start here -->
														<div class="col-md-12">
															<div class="form-group action-btn-group">
																<div class="controls2">
																	<span class="left-margin-remove"> <a href="#">
																			<button type="submit" id="submit_button"  title="Save" name="submit_create_edit_team"
																	class="btn btn-xl btn-success button-submit font13">Save
																			</button>
																	</a>
																	</span>
																	
																	<button type="reset" id="cancel_id" title="Refresh" 
														class="btn btn-xl btn-default button-submit font13">Refresh
																	</button>


																	
																</div>
															</div>
														</div>
														<!--button end here -->
													</div>

													<!-- Server configuration End here -->



													<!--row inner  end here -->


												</div>
											</div>
										</div>
									</div>
								</div>
								<!--tab1 end here-->


								<!-- tabs1 starts here -->
								<div id="tabs-2" style="padding: 17px 0px 15px;">
									<div class="row">
										<!--Outer row start here -->
										<!-- General Information tab start here -->
										<div class="col-xs-12 col-sm-12">
											<div class="box">
												<div class="box-header">
													<div class="box-name">
														<i class="fa fa-table"></i> <span> Filter Tab</span>
													</div>
													<div class="box-icons">
														<a class="collapse-link"> <i
															class="servicedrop  glyphicon glyphicon-chevron-down"></i>
														</a>


													</div>
													<div class="no-move"></div>
												</div>
												<div class="box-content" style="display: none">

													<!--left row 1 1 start here -->
													<!-- General header tab start here -->



													<!-- General header tab end here -->


													<div class="row my-bg-success">
														<!--left div start here -->

														<div class="col-md-12">
															<div class="form-horizontal">
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">
																		<input type="radio" name="main_filter" /> <label>Particular
																			Class</label> <input type="radio" name="main_filter" /> <label>Particular
																			Student</label> <input type="radio" name="main_filter" /> <label>All
																			Student</label> <input type="radio" name="main_filter" /> <label>Multiple
																			Class</label> <input type="radio" name="main_filter" /> <label>Multiple
																			Student</label>

																	</div>
																</div>
															</div>
														</div>


														<div class="col-md-6">

															<div class="form-group">
																<br>
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Course Code<span
																			style="color: #FF0000; font-weight: bold">*</span>
																		</span>
																	</div>
																	<div class="col-sm-7">
																		<select name="parentMenuId" data-toggle="modal"
																			data-original-title="Add to Project" id="parentMenu"
																			class="form-control">
																			<c:forEach items="${branchList}" var="branch">
																				<option value="${branch.id}">${branch.branchLongName}</option>
																			</c:forEach>
																		</select>
																	</div>

																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblParent"
																			class="control-label">Medium</span>

																	</div>
																	<div class="col-sm-7">
																		<select name="parentMenuId" data-toggle="modal"
																			data-original-title="Add to Project" id="parentMenu"
																			class="form-control">
																			<option selected="selected" value="0">Please
																				Select</option>
																		</select>

																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblMenuName"
																			class="control-label">Extra Filter<span
																			style="color: #FF0000; font-weight: bold">*</span></span>


																	</div>
																	<div class="col-sm-7">
																		<select name="parentMenuId" data-toggle="modal"
																			data-original-title="Add to Project" id="parentMenu"
																			class="form-control">
																			<option selected="selected" value="0">Please
																				Select</option>
																		</select>
																	</div>
																</div>
															</div>


															<div class="form-group">
																<div class="col-sm-12">
																	<input type="radio" name="sub_filter" /> <label>Select
																		All</label> <input type="radio" name="sub_filter" /> <label>Admitted
																	</label> <input type="radio" name="sub_filter" /> <label>Cancelled
																	</label> <input type="radio" name="sub_filter" /> <label>Other
																	</label> <input type="radio" name="sub_filter" /> <label>All
																	</label>

																</div>
															</div>



														</div>


														<!--left div end here -->

														<!--right div start here -->

														<div class="col-md-6">

															<div class="form-group">

																<!-- TABLE Template CODE START HERE -->
																<div class="col-md-12">

																	<div class=""
																		style="height: 200px; position: relative; overflow: auto;">

																		<table id="tablethree"
																			class="table table-bordered  table-checkable table-responsive  "
																			aria-describedby="DataTables_Table_0_info">
																			<thead>
																				<tr role="row">
																					<th>Action</th>
																					<th>Class</th>
																					<th>Class Name</th>

																				</tr>
																			</thead>



																			<tr class="odd">

																				<td><input type="checkbox" name="class" /> <label>1</label>
																				</td>
																				<td>1</td>
																				<td>5th B</td>


																			</tr>

																			<tr class="odd">

																				<td><input type="checkbox" name="class" /> <label>2</label>
																				</td>
																				<td>2</td>
																				<td>7th</td>

																			</tr>



																			</tbody>
																		</table>


																	</div>
																</div>
																<!-- TABLE Template CODE END HERE -->


															</div>

														</div>


														<div class="col-md-3">
															<!-- TABLE CODE START HERE -->
															<div class="col-md-12">



																<table id="menu_table"
																	class="table table-bordered  table-checkable table-responsive  "
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">
																			<th style="width: 85px">Group 1</th>
																			<th>Filter Name</th>
																		</tr>
																	</thead>
																</table>

																<div class=""
																	style="height: 200px; position: relative; overflow: auto">
																	<table id="group1"
																		class="table table-bordered  table-checkable table-responsive  "
																		aria-describedby="DataTables_Table_0_info">
																		<tbody role="alert" aria-live="polite"
																			aria-relevant="all">

																			<tr class="odd">
																				<td style="width: 85px"><input
																					id="bloodGroupList" type="radio" name='group_one'
																					value="blood_group_id" onclick="getgroup2(this);" />
																					<label>1</label>
																				<td>Blood Group</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input id="branchList"
																					value="branch_id" type="radio" name='group_one'
																					onclick="getgroup2(this);" /> <label>2</label>
																				<td>Branch</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input id="yearList"
																					value="admitted_to_year" type="radio"
																					name='group_one' onclick="getgroup2(this);" /> <label>3</label>
																				<td>Year</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input
																					id="categoryList" type="radio" value='category_id'
																					name='group_one' onclick="getgroup2(this);" /> <label>4</label>
																				<td>Category</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input id="casteList"
																					type="radio" value='caste_id' name='group_one'
																					onclick="getgroup2(this);" /> <label>4</label>
																				<td>Caste</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input id="region"
																					type="radio" name='group_one' value=""
																					onclick="getgroup2(this);" /> <label>5</label>
																				<td>City</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input
																					id="nationalityList" type="radio" name='group_one'
																					value="" onclick="getgroup2(this);" /> <label>6</label>
																				<td>Nationality</td>
																			</tr>
																			<tr class="odd">
																				<td style="width: 85px"><input
																					id="religionList" type="radio" name='group_one'
																					value='religion_id' onclick="getgroup2(this);" />
																					<label>7</label>
																				<td>Religion</td>
																			</tr>
																		</tbody>
																	</table>


																</div>
															</div>
															<!-- TABLE CODE END HERE -->

														</div>



														<div class="col-md-3">
															<!-- TABLE CODE START HERE -->
															<div class="col-md-12">

																<table id="menu_table"
																	class="table table-bordered  table-checkable table-responsive  "
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">
																			<th style="width: 85px">Group 2</th>
																			<th>Multi Select</th>
																		</tr>
																	</thead>
																</table>

																<div class=""
																	style="height: 200px; position: relative; overflow: auto">
																	<table id="group2"
																		class="table table-bordered  table-checkable table-responsive  "
																		aria-describedby="DataTables_Table_0_info">
																		<tbody role="alert" aria-live="polite"
																			aria-relevant="all">

																			<!-- <tr class="odd">
																				<td style="width: 85px"><input type="checkbox"
																					name="group_two" /> <label>1</label></td>
																				<td>red</td>
																			</tr> -->

																		</tbody>
																	</table>


																</div>
															</div>
															<!-- TABLE CODE END HERE -->

														</div>
														<div class="col-md-1">
															<p>
																<button onclick="add_to_filter();" type="button"
																	class="btn btn-success btn-lg">
																	<span class="glyphicon glyphicon-circle-arrow-right"></span>
																</button>
															</p>
															<p>
																<button type="button" onclick="show_list()" class="btn btn-primary btn-lg">
																	<span class="glyphicon glyphicon-circle-arrow-Left"></span>
																</button>
															</p>
															<p>
																<button type="button" onclick=" $('#group3').empty();" class="btn btn-danger btn-lg">
																	<span class="glyphicon glyphicon glyphicon-refresh"></span>
																</button>
															</p>


														</div>
														<div class="col-md-5">
															<!-- TABLE CODE START HERE -->
															<div class="col-md-12">

																<table id="menu_table"
																	class="table table-bordered  table-checkable table-responsive  "
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">
																			<th style="width: 85px">Selected Filter</th>
																			<th>Value</th>
																			
																		</tr>
																	</thead>
																</table>

																<div class=""
																	style="height: 200px; position: relative; overflow: auto">
																	<table id="group3"
																		class="table table-bordered  table-checkable table-responsive  "
																		aria-describedby="DataTables_Table_0_info">
																		<tbody role="alert" aria-live="polite"
																			aria-relevant="all">

																			<tr class="odd" >
																				<td style="width: 120px"><input type="checkbox"
																					id="group_three_1" name="group_three" value="test3" />
																					<label>1</label></td>
																				<td><input type="hidden"
																					id="group_three_value_1" value="text3 value" />
																					red
																					</td>
																					
																					<td>
																					<button type="button" onclick="remove_this(this)" class="btn btn-warning">
																					<span class="glyphicon glyphicon-remove"></span>
																				</button>
																				</td>
																			</tr>

																		</tbody>
																	</table>


																</div>
															</div>
															<!-- TABLE CODE END HERE -->

														</div>


														<!-- TABLE Filter Start HERE -->
														<div class="col-md-12" style="padding-top: 10px">
															<div class="box-header">
																<div class="box-name">
																	<i class="fa fa-table"></i> <span> Filter
																		Template</span>
																</div>


															</div>
														</div>
														<!-- TABLE Filter END HERE -->


														<!-- TABLE CODE START HERE -->
														<div class="col-md-12">

															<div class=""
																style="height: auto; position: relative; overflow: auto">

																<table id="menu_table"
																	class="table table-bordered  table-checkable table-responsive  "
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">
																			<th>Action</th>
																			<th>Name</th>
																			<th>Family Relation</th>
																			<th>family Mobile Number</th>
																		</tr>
																	</thead>

																	<tbody role="alert" aria-live="polite"
																		aria-relevant="all">

																		<tr class="odd">

																			<td>
																				<button type="button" class="btn btn-success">
																					<span class="glyphicon glyphicon-pencil"></span>
																				</button>
																				<button type="button" class="btn btn-warning">
																					<span class="glyphicon glyphicon-remove"></span>
																				</button>
																			</td>

																			<td>John Rambo</td>
																			<td>Father</td>
																			<td>91093983483</td>
																		</tr>
																	</tbody>
																</table>


															</div>
														</div>
														<!-- TABLE CODE END HERE -->

														<!--button start here -->
														<div class="col-md-12">
															<div class="form-group action-btn-group">
																<div class="controls2">
																	<span class="left-margin-remove"> <a href="#">
																			<button id="cancel_id" type="reset"
																				class="btn btn-xl btn-warning button-submit font13">
																				<span><span class="">Show</span></span>
																			</button>
																	</a>
																	</span>
																	<!-- <a href="#"> -->
																	<button type="submit" name="submit_create_edit_team"
																		class="btn btn-xl btn-success button-submit font13">
																		<span><span class="" id="submit_button">Save</span></span>
																	</button>

																	<button type="submit" name="submit_create_edit_team"
																		class="btn btn-xl btn-default button-submit font13">
																		<span><span class="" id="submit_button">Clear</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>
														<!--button end here -->
													</div>
												</div>
												<!--row inner  end here -->

												<!-- Table List Student header tab start here -->


												<div class="box-header-same" style="top: 5px">
													<div class="box-name">
														<i class="fa fa-table"></i> <span>List</span>
													</div>


												</div>


												<!-- Table List Student header tab end here -->
												<!--Table list start here -->
												<div class="row my-bg-success">
													<!-- TABLE CODE START HERE -->
													<div class="col-md-12">

														<div class=""
															style="height: 295px; position: relative; overflow: auto; margin-top: 10px">

															<table id="tableOne"
																class="table table-bordered  table-checkable table-responsive  "
																aria-describedby="DataTables_Table_0_info">
																<thead>
																	<tr role="row">
																		<th>Select <input type="checkbox" id=""
																			name="checkall" /> <label> All</label></th>
																		<th>ID</th>
																		<th>Name</th>
																		<th>Mobile Number</th>
																		<th>Email Address</th>
																	</tr>
																</thead>



																<tr class="odd">

																	<td><input type="checkbox" name="" /> <label>1</label>
																	</td>
																	<td>1</td>
																	<td>Father</td>
																	<td>91093983483</td>
																	<td>john@gmail.com</td>
																</tr>
																


																</tbody>
															</table>


														</div>
													</div>
													<!-- TABLE CODE END HERE -->


													<!--  Email fields start here -->
													<div class="col-md-6">

														<div class="form-horizontal">
															<div class="form-group">
																<br>
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">From ( email ) <span
																			style="color: #FF0000; font-weight: bold">*</span></span>


																	</div>
																	<div class="col-sm-7">
																		<input name="menuName" type="text" maxlength="40"
																			id="menu_name" tabindex="3" class="form-control"
																			onkeypress="return CheckAlphaNumeric(event,this)"
																			placeholder="Email From" /> <span
																			id="ContentPlaceHolder1_rfvmodule"
																			style="display: none;"></span>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblParent"
																			class="control-label">To ( email )</span>

																	</div>
																	<div class="col-sm-7">
																		<input name="menuName" type="text" maxlength="40"
																			id="menu_name" tabindex="3" class="form-control"
																			onkeypress="return CheckAlphaNumeric(event,this)"
																			placeholder="Email To" />

																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblMenuName"
																			class="control-label">Password<span
																			style="color: #FF0000; font-weight: bold">*</span></span>


																	</div>
																	<div class="col-sm-7">
																		<input name="menuLink" type="text" maxlength="100"
																			id="menu_link" tabindex="4" class="form-control"
																			onkeypress="return CheckAlphaNumeric(event,this)"
																			placeholder="Password">
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label">Subject <span
																			style="color: #FF0000; font-weight: bold">*</span></span>

																	</div>

																	<div class="col-sm-7">
																		<input name="menuLink" type="text" maxlength="100"
																			id="menu_link" tabindex="4" class="form-control"
																			onkeypress="return CheckAlphaNumeric(event,this)"
																			placeholder="Email Subject">

																	</div>
																</div>
															</div>


														</div>

													</div>

													<div class="col-md-6">

														<form accept-charset="UTF-8" action="" method="POST">
															<textarea style="resize: none" class="form-control"
																id="text" name="text" placeholder="Type in your message"
																rows="5"></textarea>
															<h6 class="pull-right" id="count_message"></h6>
															<button class="btn btn-primary" type="submit">Post
																New Message</button>
														</form>
													</div>
													<!-- Email Fields End here -->

													<!--button start here -->
													<div class="col-md-12">
														<div class="form-group action-btn-group">
															<div class="controls2">
																<span class="left-margin-remove"> <a href="#">
																		<button id="cancel_id" type="button" onclick="send_sms()"
																			class="btn btn-xl btn-warning button-submit font13">
																			<span class="">Send SMS </span>
																		</button>
																</a>
																</span>
																<!-- <a href="#"> -->
																<button type="submit" name="submit_create_edit_team"
																	class="btn btn-xl btn-success button-submit font13">
																	<span><span class="" id="submit_button">Send
																			Email</span></span>
																</button>

																<button type="submit" name="submit_create_edit_team"
																	class="btn btn-xl btn-default button-submit font13">
																	<span><span class="" id="submit_button">Clear</span></span>
																</button>
																<!-- </a>  -->
															</div>
														</div>
													</div>
													<!--button end here -->


												</div>


											</div>
										</div>
									</div>
								</div>

								<!--tab2 end here-->

								<!--tab3 start here-->
								<div id="tabs-3" style="padding: 17px 0px 15px;">
									<div class="row">
										<!--  Entrance Exam Score tab start here -->
										<div class="col-xs-12 col-sm-12">
											<div class="box">
												<div class="box-header">
													<div class="box-name">
														<i class="fa fa-table"></i> <span>Pending SMS</span>
													</div>
													<div class="box-icons">
														<a class="collapse-link"> <i
															class="servicedrop  glyphicon glyphicon-chevron-up"></i>
														</a>


													</div>
													<div class="no-move"></div>
												</div>

												<div class="box-content" style="">
													<div class="row my-bg-success" style="padding-top: 15px">
														<!-- TABLE CODE START HERE -->
														<div class="col-md-12">

															<div class=""
																style="height: auto; position: relative; overflow: auto">

																<table id="menu_table"
																	class="table table-bordered  table-checkable table-responsive  "
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">
																			<th>Send Time</th>
																			<th>machine</th>
																			<th>Message</th>
																			<th>Mobile Number</th>
																			<th>Mobile Type</th>
																		</tr>
																	</thead>

																	<tbody role="alert" aria-live="polite"
																		aria-relevant="all">

																		<tr class="odd">



																			<td>11/12/2015 10:00:00</td>
																			<td>192.168.0.1</td>
																			<td>Student Having Food Feast on Coming Friday</td>
																			<td>91093983483</td>
																			<td>B</td>
																		</tr>
																	</tbody>
																</table>


															</div>
														</div>
														<!-- TABLE CODE END HERE -->
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- row end here -->
								</div>
								<!-- tab3  end here -->


								<!--tab3 start here-->
								<div id="tabs-4" style="padding: 17px 0px 15px;">


									<div class="row">
										<!--  Entrance Exam Score tab start here -->
										<div class="col-xs-12 col-sm-12">
											<div class="box">
												<div class="box-header">
													<div class="box-name">
														<i class="fa fa-table"></i> <span>Scheduled SMS</span>
													</div>
													<div class="box-icons">
														<a class="collapse-link"> <i
															class="servicedrop  glyphicon glyphicon-chevron-up"></i>
														</a>


													</div>
													<div class="no-move"></div>
												</div>

												<div class="box-content" style="">
													<div class="row my-bg-success" style="padding-top: 15px">
														<!--  Scehduled Fields start here -->
														<div class="col-md-6">

															<div class="form-horizontal">
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Course Code <span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="parentMenuId" data-toggle="modal"
																				data-original-title="Add to Project" id="parentMenu"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																			<c:forEach items="${branchList}" var="branch">
																				<option value="${branch.id}">${branch.branchLongName}</option>
																			</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblParent"
																				class="control-label">Event </span>

																		</div>
																		<div class="col-sm-7">
																			<select name="parentMenuId" data-toggle="modal"
																				data-original-title="Add to Project" id="parentMenu"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																			</select>

																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Scheduled At<span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<input type="text" name="workOrderDateString"
																				id="" style="z-index: 5000"
																				class="datepicker"
																				placeholder="Press to Select date" />

																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-xs-5">
																			<span id="ContentPlaceHolder1_lblMenuLink"
																				class="control-label">Sms Type <span
																				style="color: #FF0000; font-weight: bold">*</span></span>

																		</div>

																		<div class="col-sm-7">
																			<select name="parentMenuId" data-toggle="modal"
																				data-original-title="Add to Project" id="parentMenu"
																				class="form-control">
																				
																					<option  value="flash">Flash Message
																					</option>
																					<option  selected="selected" >Normal
																					Select</option>
																			</select>
																		</div>
																	</div>
																</div>


															</div>

														</div>

														<div class="col-md-6">

															<form accept-charset="UTF-8" action="" method="POST">
																<textarea style="resize: none" class="form-control"
																	id="" name="text" placeholder="Type in your message"
																	rows="5"></textarea>
															</form>
														</div>
														<!-- Scehduled Fields End here -->
													</div>

													<!-- Table List Student header tab start here -->


													<div class="box-header-same" style="top: 5px">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>List</span>
														</div>


													</div>


													<!-- Table List Student header tab end here -->
													<!--Table list start here -->
													<div class="row my-bg-success">
														<!-- TABLE CODE START HERE -->
														<div class="col-md-12">

															<div class=""
																style="height: 295px; position: relative; overflow: auto; margin-top: 10px">

																<table id="tabletwo"
																	class="table table-bordered  table-checkable table-responsive  "
																	aria-describedby="DataTables_Table_0_info">
																	<thead>
																		<tr role="row">
																			<th>Select <input type="checkbox" id=""
																				name="checkall" /> <label> All</label></th>
																			<th>ID</th>
																			<th>Name</th>
																			<th>Parent Name</th>
																			<th>Mobile Number</th>
																			<th>Email Address</th>
																		</tr>
																	</thead>



																	<tr class="odd">

																		<td><input type="checkbox" name="" /> <label>1</label>
																		</td>
																		<td>1</td>
																		<td>Suzen</td>
																		<td>John Cena</td>
																		<td>91093983483</td>
																		<td>john@gmail.com</td>
																	</tr>



																	</tbody>
																</table>


															</div>
														</div>
														<!-- TABLE CODE END HERE -->


														<!--  Scehduled Message start here -->
														<div class="col-md-6">

															<div class="box-header-same" style="top: 5px">
																<div class="box-name">
																	<i class="fa fa-table"></i> <span>Template</span>
																</div>


															</div>
															<div class="form-horizontal">
																<div class="form-group">
																	<br>

																	<!-- TABLE Template CODE START HERE -->
																	<div class="col-md-12">

																		<div class=""
																			style="height: 200px; position: relative; overflow: auto;">

																			<table id="tablethree"
																				class="table table-bordered  table-checkable table-responsive  "
																				aria-describedby="DataTables_Table_0_info">
																				<thead>
																					<tr role="row">
																						<th>Select One</th>
																						<th>ID</th>
																						<th>Template Name</th>
																						<th>Message</th>

																					</tr>
																				</thead>



																				<tr class="odd">

																					<td><input type="radio" name="" /> <label>1</label>
																					</td>
																					<td>1</td>
																					<td>childrens Day</td>
																					<td>Wish Childrens Day</td>

																				</tr>

																				<tr class="odd">

																					<td><input type="radio" name="" /> <label>2</label>
																					</td>
																					<td>2</td>
																					<td>Independent's Day</td>
																					<td>Wish All a very Happy Independence Day</td>

																				</tr>
																				<tr class="odd">

																					<td><input type="radio" name="" /> <label>3</label>
																					</td>
																					<td>4</td>
																					<td>New Year Day</td>
																					<td>Wish All a very Happy New year Day</td>

																				</tr>
																				<tr class="odd">

																					<td><input type="radio" name="" /> <label>4</label>
																					</td>
																					<td>3</td>
																					<td>Christmas Day</td>
																					<td>Wish All a very Happy Christmas Day</td>

																				</tr>



																				</tbody>
																			</table>


																		</div>
																	</div>
																	<!-- TABLE Template CODE END HERE -->

																</div>




															</div>

														</div>

														<div class="col-md-6">

															<div class="box-header-same">
																<div class="box-name">
																	<i class="fa fa-table"></i> <span>Message Text</span>
																</div>


															</div>

															<form accept-charset="UTF-8" action="" method="POST">
																<textarea style="resize: none" class="form-control"
																	id="template_text" name="text"
																	placeholder="Type in your message" rows="5"></textarea>
																<h6 class="pull-right" id="template_count_message"></h6>
																<button class="btn btn-primary" type="submit">Post
																	New Message</button>
															</form>
														</div>


														<!--button start here -->
														<div class="col-md-12">
															<div class="form-group action-btn-group">
																<div class="controls2">
																	<span class="left-margin-remove"> <a href="#">
																			<button id="cancel_id" type="reset"
																				class="btn btn-xl btn-warning button-submit font13">
																				<span><span class="">Send SMS</span></span>
																			</button>
																	</a>
																	</span>


																	<button type="submit" name="submit_create_edit_team"
																		class="btn btn-xl btn-default button-submit font13">
																		<span><span class="" id="submit_button">Clear</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>
														<!--button end here -->
														<!-- Scehduled Message End here -->
													</div>
												</div>
											</div>
										</div>
										<!-- row end here -->
									</div>
									<!-- tab4 end here -->

								</div>
								<!-- all tabs end here -->

								<!-- jaskirat code end here -->


							</div>
							
						</div>
						
					</div>
					
				</div>
				<!--=== Page Content ===-->
			</div>
		</div>
		</div>

		<script>

function add_to_filter(){
	  var tbl = document.getElementById("group2");
	  var tbl1 = document.getElementById("group1");
	     var rCount = tbl.rows.length;
	     var rCount1 = tbl1.rows.length;
// 	     try {
	
		// code to get the data from group2 
		var g2_id='';
		var g2_text='';
		var db_column_name='';
		// for each row
	    	 for(var i=0;i<rCount;i++){
	        // CONDITION HERE
	   		 if(tbl.rows[i].cells[0].children[0].checked){
	    	
	   		//get each id	 
	    	var temp_id=	tbl.rows[i].cells[0].children[0].value;
	    	var temp_text=tbl.rows[i].cells[1].innerHTML;
	    	// conactenate
	    	g2_id=g2_id+','+temp_id;
	    	g2_text=g2_text+','+temp_text;
	    		 }
			}// loop end here
			
			// split and merge
	    	 g2_id='('+( g2_id.substring(1, g2_id.length))+')';
	    	 g2_text='('+(g2_text.substring(1, g2_text.length))+')';
	    	 
	 	    alert(g2_id)
	 	    alert(g2_text)
// 	     } catch (e) {
	
	// getting the column name of the database here
	     for(var i=0;i<rCount1;i++){
	        // CONDITION HERE
	   		 if(tbl1.rows[i].cells[0].children[0].checked){
	   		//get each id	 
	    	 db_column_name=	tbl1.rows[i].cells[0].children[0].value;
	   		alert(db_column_name)
	   		 }
	     }
	
	     var row3 = ""
	    	 + "<tr class=\"odd\" > "
	    	 + " "
	    	 + "<td style=\"width: 120px\"><input type=\"checkbox\" "
	    	 + "id=\"group_three_1\" name=\"group_three\" value='"+db_column_name+"' /> "
	    	 + "<label>g3</label></td> "
	    	 + "<td><input type=\"hidden\" "
	    	 + "id=\"group_three_value_1\" value='"+g2_id+"' /> "
	    	 + ""+g2_text+" "
	    	 + "</td> "
	    	 + "																					 "
	    	 + "<td> "
	    	 + "<button type=\"button\" onclick=\"remove_this(this)\" class=\"btn btn-warning\"> "
	    	 + "<span class=\"glyphicon glyphicon-remove\"></span> "
	    	 + "</button> "
	    	 + "</td> "
	    	 + " "
	    	 + "</tr>";
// 	     }
	     $('#group3').append(row3);
}


function remove_this(row){
	alert(6);
	 row.closest('tr').remove();
}

function show_list(){
	alert('show')
	  var tbl = document.getElementById("group3");
	 
	     var rCount = tbl.rows.length;
	 
// 	     try {
	
		// code to get the data from group3
		var g3_column_name='';
		var g3_column_value='';
		var where_clause='';
		// for each row
	    	 for(var i=0;i<rCount;i++){
	        // CONDITION HERE
	   		 if(tbl.rows[i].cells[0].children[0].checked){
	    	
	   		//get each id	 
	    	var g3_column_name=	tbl.rows[i].cells[0].children[0].value;
	    	var g3_column_value=tbl.rows[i].cells[1].children[0].value;
	    	
			g3_column_name='this_.'+g3_column_name;
	        
	    	var get_each_conditon = g3_column_name +' in '+g3_column_value ;
	    	
	    	 where_clause =where_clause + ' and ' +get_each_conditon;
	    	 }
	   	  
	        
	    	 }
	    	
		   		where_clause=where_clause.substring(4, where_clause.length);
		     
	       // return false;
	
	
	
	
	$ 
					.ajax({
						url : "./getStudentList",
						type : "GET",
						data : {
							"query" : where_clause,
						},
						success : function(response) {
							//alert(response)
							var text2 = ''
							if (JSON.stringify(response) != '[]') {
							//	alert(response)
							
								alert(JSON
										.stringify(response));
									var jsonOb = JSON
											.parse(JSON
													.stringify(response));
									var count =0;
									$
											.each(
													response,
													function(index,
															StudentAdmissionEntity) {
														count++;
													
														text2 += ""
																+ "<tr class=\"odd\"> "
																+ " "
																+ "																	<td><input type=\"checkbox\" name=\"\" /> <label>"+count+"</label> "
																+ "																	</td> "
																+ "																	<td>"+StudentAdmissionEntity.id+"</td> "
																+ "																	<td>"+StudentAdmissionEntity.studentName+"</td> "
																+ "																	<td>"+StudentAdmissionEntity.studentMobileNumber+"</td> "
																+ "																	<td>"+StudentAdmissionEntity.email+"</td> "
																+ "																</tr>";
													});
									
									  $('#tableOne tbody').empty().append(text2);
								}else{
									 $('#tableOne tbody').empty();
								}
							
						},
						error : function() {

						}
					});
}

function send_sms(){
	
	alert('send sms')

	 var tbl = document.getElementById("tableOne");
	 var text = document.getElementById("text").value;
     var rCount = tbl.rows.length;
 
//	     try {

	// code to get the data from group3
	var phones='';
	var g3_column_value='';
	var where_clause='';
	// for each row
    	 for(var i=0;i<rCount;i++){
        // CONDITION HERE
   		 if(tbl.rows[i].cells[0].children[0].checked){
   		//get each id	 
    	var g3_column_name=	tbl.rows[i].cells[3].innerHTML;
   		phones=phones+"&PhNo="+g3_column_name;
             }
    	 }
	
	var urls="http://localhost:8095/myapp/sending-message?"
			+"module_code=TEST&user_code=111&message_type=bulk&api_id=msg_1313&application_password=iitms123$"
			+"&Text="+ encodeURIComponent(text)+"&senderid=257147"
			+phones;
	alert(urls);
	
	$ 
	.ajax({
		url : urls,
		type : "GET",
		data : {
			"query" : where_clause,
		},
		success : function(response) {
			alert(response)
		}
	});
		
		}
	
</script>
		<!-- /.container -->
		<!-- /.container -->
</body>

