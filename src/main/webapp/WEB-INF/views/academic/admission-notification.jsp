<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<jsp:useBean id="userInfo" scope="session" class="com.iitms.rfcampusdata.authentication.entity.SessionUser" />

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Admission Notification | RFCampus</title>

<jsp:include page="../authentication/script.jsp" />
<link
	href="${pageContext.request.contextPath}/resources/complete-date-picker/datepicker.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/bootstrap-datepicker.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/complete-date-picker/bootstrap-datepicker3.css"
	rel="stylesheet" type="text/css">



<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/moment.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/bootstrap-datetimepicker.min.js"></script>



<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/lang/en-gb.js"></script>


<script type="text/javascript"
	src="<c:url value="/resources/plugins/multiselect/jquery.multiselect.js"/>"></script>
<link
	href="<c:url value="/resources/plugins/multiselect/jquery.multiselect.css"/>"
	rel="stylesheet" type="text/css">
<style>
.table-condensed {
	width: 220px;
}

.accordion-toggle .btn {
	/* width: 100%; */
	left: 39%;
	position: relative;
}
</style>

<script>
		
			/*jQuery(function() {
				$('#admissionPrintDateString').datetimepicker({
					//   useCurrent: false,
					// minDate: moment().add(-1, 'd').toDate(),
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'DD/MM/YYYY HH:MM A'
				});});*/

	
</script>
<script type="text/javascript">
	var validator;
	var notificationAvailable = false;
	var id;
	var sessionId;
	var degreeId;
	var branchId;
	var admissionStartDateString;
	var admissionEndDateString;
	var admissionPrintDateString;
	var prefix;
	var startNumber;
	var sufix;
	var formData = new FormData();
	var branchOptions = '';
	var updateOperation = false;
	var branchIds;

	$(document)
			.ready(
					function() {

						//tool tip configuration
						$(document).ready(function() {
							$('[data-toggle="tooltip"]').tooltip();
						});

						// no space in menu link
						$('#menu_link').keypress(function(e) {
							if (e.which === 32)
								return false;
						});

						$
								.ajax({
									async : false,
									url : "../academic/admission-notification/all-branches",
									type : "POST",
									success : function(response) {
									
										branchOptions = JSON
												.stringify(response);
									},
									error : function() {
										alert('error...');
									},
								});

						/* Session ON CHANGE  */
						var tempItemId = '';
						$("#sessionId").change(function() {
							//$("#degreeId").val(0).change();
							$("#loading-image").show();
							if ($("#sessionId").val() == 0) {
								$("#degreeId").val(0);
								$("#degree-list-div").html("<ul class=\"form-control\" style=\"height:100px;overflow:auto;border-radius:4px\">"+
										"															"+
										"</ul>");
								$("#table-row").empty();
							} else {
								$("#menu_table tr td").remove();
								$("#degree-list-div").html("<ul class=\"form-control\" style=\"height:100px;overflow:auto;border-radius:4px\">"+
										"															"+
										"</ul>")
								getNotifications();
							}
							$("#loading-image").hide();
						});

						/* Session ON CHANGE ENDS */

						$("#degreeId")
								.change(
										function() {
											$("#loading-image").show();
											var degreeId = $(
													"#degreeId").val();//degreeOptions
											//alert('degreeId : '+ degreeId);
											var text = "	<ul class=\"form-control\" style=\"height:100px;overflow:auto;border-radius:4px\">";
											getNotifications();
											//alert('degreeIds :- ' + degreeIds );
											$
											.each(
													JSON
															.parse(branchOptions),
													function(index,
															branch) {
													//	var a  = $.inArray(degree.admDegreeId, degreeIds);
													////	alert(a);
														if(($.inArray(branch.id, branchIds) == -1) && (branch.branchDegreeNumber == degreeId)){
															//alert((degree.degreeId == degreeId) + ' = ' + degree.degreeId +' : '+degreeId);
															text += "<li class=\"list-group-item\"><input type=\"checkbox\" checked=\"checked\" class=\"degree-option\" name=\"degree-id-"+branch.id+"\" value=\""+branch.id+"\" id=\"degree-id-"+branch.id+"\">"+
															"			"+branch.branchShortName+"</li>";	
														}
															
													});
											text += ""+
											"	</ul>"+
											"";
											//alert(text);
											$("#degree-list-div").empty().html(text);
											//alert(text);
											//$("#degree-list").append(text);
											/*if (updateOperation == false) {
												getNotifications();
											}*/
											$("#loading-image").hide();
										});


				jQuery.validator.addMethod('selectcheck', function(value) {
							return (value != '' && value != '0');
						}, "");
					var validator =	$("#add-edit-form").validate({

							// Specify the validation rules
							rules : {
								sessionId : {
									required : true,
									selectcheck : true
								},
								
								admissionStartDateString : {
									required : true
								},
								admissionEndDateString : {
									required : true
								},
								admissionPrintDateString : {
									required : true
								}
							},

							// Specify the validation error messages
							messages : {
								sessionId : {
									required : "",
									selectcheck : ""
								},
								
								admissionStartDateString : {
									required : ""//,
								},
								admissionEndDateString : {
									required : ""//,
								},
								admissionPrintDateString : {
									required : ""//,
								}
							},

							submitHandler : function(form) {
								//e.preventDefault();
								//form.submit();
							}
						});

						$("#cancel_id").click(function() {
							notificationAvailable = false;
							updateOperation = false;
							validator.resetForm();
							$("#id").val(0);
							$("#submit_button").html('Save');	
							$("#submit_button").attr('title','Save');
							$("#submit_button").attr('class','btn btn-xl btn-success button-submit font13');
							$("#degree-list-div").html("<ul class=\"form-control\" style=\"height:100px;overflow:auto;border-radius:4px\">"+
									"															"+
									"</ul>");
						});

						$("#add-edit-form")
								.on(
										'submit',
										function(e) {
											//alert('on submit');
											e.preventDefault();
											var isvalidate = $("#add-edit-form")
													.valid();
											if (isvalidate)
											{
												//alert('prevent');
												// if(notificationAvailable == true){
												//	alert("Notification Already Exist For Selected Degree");
												// }else{
												$("#loading-image").show();	
												id = $("#id").val();
												sessionId = $("#sessionId")
														.val();
												degreeId = $(
														"#degreeId").val();

												admissionStartDateString = $(
														"#admissionStartDateString")
														.val();
												admissionEndDateString = $(
														"#admissionEndDateString")
														.val();
												admissionPrintDateString = $(
														"#admissionPrintDateString")
														.val();
												prefix = $("#prefix").val();
												startNumber = $("#startNumber")
														.val();
												sufix = $("#sufix").val();
												var branchIds = '';
												
												$.each($(".degree-option"), function(){
													if ($(this).is(":checked")) {

														branchIds += $(this).val() + ",";
													}
												});
												
												if (branchIds == '') {
													alert('Please Select Branch');
													return;
												} 

												formData = new FormData();
												formData.append("id", id);
												formData.append("sessionId",
														sessionId);
												formData.append("degreeId",
														degreeId);
												formData.append("branchIds",
														branchIds);
												formData
														.append(
																"admissionStartDateString",
																admissionStartDateString);
												formData
														.append(
																"admissionEndDateString",
																admissionEndDateString);
												formData
														.append(
																"admissionPrintDateString",
																admissionPrintDateString);
												formData.append("prefix",
														prefix);
												formData.append("startNumber",
														startNumber);
												formData.append("sufix", sufix);

												$
														.ajax({
															async : false,
															url : "../academic/admission-notification/add-update",
															type : "POST",
															data : formData,
															processData : false,
															contentType : false,
															success : function(
																	response) {
																//alert(response);
																if (response == 1) {
																	notifysuccess('Notification Added Successfully!!');
																	$(
																			"#cancel_id")
																			.click();
																	$(
																			"#table-row")
																			.empty();
																} else if (response == 2) {
																	notifysuccess('Notification Updated Successfully!!');
																	$(
																			"#cancel_id")
																			.click();
																	$(
																			"#table-row")
																			.empty();
																} else {
																	alert('Error...');
																}
																
																$("#loading-image").hide();
															},
															error : function() {
																alert('error...');
																$("#loading-image").hide();
															},
														});
												//   }
											}

										});
						
						$(".datepicker")
								.datepicker(
										{
											showOn : "both",
											/* buttonImage : "image.jpg", */
											dateFormat : "dd-mm-yy",
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
										//maxDate : +0
										// you do not want to show next day. 
										});

					});

	function updateNotification(id, sessionId, degreeId, branchId,
			admissionStartDateString, admissionEndDateString,
			admissionPrintDateString, prefix, startNumber, sufix, branchShortName) {
		//alert(itemId+" - "+itemCode+ " - "+itemName+ " - "+minStock+ " - "+maxStock+ " - "+currentStock+ " - "+itemUnit + " - "+ deptId + " - " + complaintTypeId);
		notificationAvailable = false;
		updateOperation = true;

		$("#id").val(id);
		$("#sessionId").val(sessionId);//.change();
		$("#degreeId").val(degreeId);//.change();
		$(".degree-option").removeAttr('checked');
		$("#degree-list-div").html("<ul class=\"form-control\" style=\"height:100px;overflow:auto;border-radius:4px\">"+
				"<li class=\"list-group-item\"><input type=\"checkbox\" checked=\"checked\" class=\"degree-option\" name=\"degree-id-"+branchId+"\" value=\""+branchId+"\" id=\"degree-id-"+branchId+"\">"+
				"			"+branchShortName+"</li>"+
				"</ul>");
		//$("#degree-id-"+degreeId).prop('checked', 'checked');
		//$(".degree-option").change();
		//$("#degreeId").val(degreeId).change();
		//$("#degreeId").val(degreeId);//.change();
		$("#admissionStartDateString").val(admissionStartDateString);
		$("#admissionEndDateString").val(admissionEndDateString);
		$("#admissionPrintDateString").val(admissionPrintDateString);
		$("#prefix").val(prefix);
		$("#startNumber").val(startNumber);
		$("#sufix").val(sufix);
		
		$("#submit_button").html('Update');
		$("#submit_button").attr('title','Update');
		$("#submit_button").attr('class','btn btn-xl btn-warning button-submit font13');
		$("#add-edit-form").valid();
	}

	function getDate(date) {
		  var hours = date.getHours();
		  var minutes = date.getMinutes();
		  var ampm = hours >= 12 ? 'pm' : 'am';
		  hours = hours % 12;
		  hours = hours ? hours : 12; // the hour '0' should be '12'
		  minutes = minutes < 10 ? '0'+minutes : minutes;
		  var strTime = hours + ':' + minutes + ' ' + ampm;
		  var dateStr = date.getDate() + "/" + (date.getMonth() + 1) + "/" +date.getFullYear()
		  return dateStr + " " + strTime;
		}
	
	function getNotifications() {
		$("#loading-image").show();
		var sessionId = $("#sessionId").val();
		var degreeId = $("#degreeId").val();
		//var degreeId = $("#degreeId").val();
		branchIds = new Array();
		
		$("#table-row").empty();

		if (sessionId != 0 || (sessionId != 0 && degreeId != 0)) {
			$
					.ajax({
						async:false,
						url : "../academic/admission-notification/notifications",
						type : "POST",
						data : {
							"sessionId" : sessionId,
							"degreeId" : degreeId/*,
							"degreeId" : degreeId*/
						},
						success : function(response) {
							//alert(JSON.stringify(response));
							var text = '';
							var registeredranchIds = response.registeredranchIds;
							var admissionNotificationList = response.admissionNotificationList;
							
							if (JSON.stringify(response) != '[]') {
								notificationAvailable = true;
								$
										.each(
												response.admissionNotificationList,
												function(index,
														admissionNotification) {

													/*var ddmmyy = admissionNotification.admissionStartDate.split("-");
													var startDate = ddmmyy[2]+"-"+ddmmyy[1]+"-"+ddmmyy[0];
													ddmmyy = admissionNotification.admissionEndDate.split("-");
													var endDate = ddmmyy[2]+"-"+ddmmyy[1]+"-"+ddmmyy[0];
													ddmmyy = admissionNotification.admissionPrintDate.split("-");
													var printDate = ddmmyy[2]+"-"+ddmmyy[1]+"-"+ddmmyy[0];*/
													var d = new Date(
															admissionNotification.admissionStartDate);
													//2016/01/04 17:28		//alert(new Date(admissionNotification.admissionStartDate).toString());	
													var startDate = getDate(d);
													d = new Date(
															admissionNotification.admissionEndDate);
													var endDate = getDate(d);
													d = new Date(
															admissionNotification.admissionPrintDate);
													var printDate = getDate(d);
													;

													text += ""
														+ "<tr class=\"odd notification-row-"+admissionNotification.id+"\"> "
														+ "<td>";
														
													if($.inArray(admissionNotification.branchId, registeredranchIds) != -1){
															
															text += "	<div class=\"fa-select\" title=\"Edit\" "
															+"onclick=\"updateNotification("
															+ admissionNotification.id
															+ ","
															+ admissionNotification.sessionId
															+ ","
															+ admissionNotification.degreeId
															+ ","
															+ admissionNotification.branchId
															+ ",'"
															+ startDate
															+ "','"
															+ endDate
															+ "','"
															+ printDate
															+ "','"
															+ admissionNotification.prefix
															+ "','"
															+ admissionNotification.startNumber
															+ "','"
															+ admissionNotification.sufix
															+ "','"
															+ admissionNotification.branchShortName
															+ "')\">"
															+ "		<i class=\"fa fa-pencil-square\" ></i>"
															+ "	</div>";
													}
													
															
															text += "<div class=\"fa-myremove\" title=\"Delete\" onclick=\"deleteNotification("
															+ admissionNotification.id
															+ ")\">"
															+ "<i class=\"fa fa-trash-o\"></i>"
															+ "	</div>";
															
															if($.inArray(admissionNotification.branchId, registeredranchIds) != -1)
															{text += "<div class=\"fa-myprint\" title=\"Print\"  onclick=\"printNotification("
																	+admissionNotification.id
																	+")\">"
																+"<i class=\"fa fa-print\"></i>"
																+"</div>";
														}
															
															
															text +="</td>"
															+ "<td class=\" \">"
															+ admissionNotification.id
															+ "</td> "
															+ "<td class=\" \">"
															+ admissionNotification.sessionName
															+ "</td> "
															+ "<td class=\" \">"
															+ admissionNotification.branchShortName
															+ "</td> "
															+ "<td class=\" \">"
															+ startDate
															+ "</td> "
															+ "<td class=\" \">"
															+ endDate
															+ "</td> "
															+ "</tr>";

															branchIds.push(admissionNotification.branchId);
												});
								$("#table-row").empty();
								$("#table-row").html(text);
								//alert(text);
							} else {
								notificationAvailable = false;
							}

						},
						error : function() {

						}
					});
		} else {
			$("#table-row").empty();
			//$("#parentMenu").val(0);//.change();
			//$("#parentMenu").val(0);//.change();
			$("#admissionStartDateString").val('');
			$("#admissionEndDateString").val('');
			$("#admissionPrintDateString").val('');
			$("#prefix").val('');
			$("#startNumber").val('');
			$("#sufix").val('');
		}
		$("#loading-image").show();
	}

	function updateDegreeOptions() {

	}

	function deleteNotification(notificationId) {
		$("#loading-image").show();		
		$.ajax({
			async : false,
			url : "../academic/admission-notification/delete",
			type : "POST",
			data : {
				"notificationId" : notificationId
			},
			success : function(response) {
				$("#loading-image").hide();
				if (response == 3) {
					notifysuccess('Notification Deleted Successfully!!');
					$("#cancel_id").click();
					$(".notification-row-" + notificationId).remove();
				}
			},
			error : function() {
				alert('Error...');
				$("#loading-image").hide();
			}
		});
	}
	
	
	function printNotification(notificationId){
		window.open('../academic/admission-notification/printnotificationreport?notificationId='+notificationId,'_blank');
	}
</script>


<script type="text/javascript">
	$(document).ready(function() {
		$('.datetimepicker').datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en',
			disabledDates : [ '1986/01/08', '1986/01/09', '1986/01/10' ],
			startDate : '2016/01/01'
		});

		/*$('#degreeId').multiselect({
		includeSelectAllOption: true
		});*/

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
				<form action="../academic/admission-notification/add-update"
					method="post" id="add-edit-form">
					<input type="hidden" id="id" name="id" value="0" />
					<div class="second-column one-child-container relative ">
						<div id="my_documents_container" style=""
							class=" doc-container column-one clearfixs ">
							<div class="row">
								<div class="create_project_tbl">

									<div class="grid-header text">Admission Notification</div>

									<div class="form-group">
										<div class="col-sm-12 ">
											<div class="col-sm-3">
												Note <b>:</b> <span style="color: #FF0000">* Marked
													Is Mandatory !</span>
											</div>
										</div>

									</div>
									<!-- jaskirat code start here -->


									<div class="col-md-6">
										<div class="form-horizontal">
											<div class="form-group">
												<br>
												<div class="col-sm-12">
													<div class="col-sm-5">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">Session <span
															style="color: #FF0000; font-weight: bold">*</span></div>
													</div>
													<div class="col-sm-7">
														<select id="sessionId" title="module" name="sessionId"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${ACADEMIC_SESSION_LIST}" var="session">
																<option value="${session.id}">${session.name}</option>
															</c:forEach>
														</select> <span id="ContentPlaceHolder1_rfvmodule"
															style="display: none;"></span>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div id="ContentPlaceHolder1_lblParent"
															class="control-label">Degree<span
															style="color: #FF0000; font-weight: bold"></span></div>

													</div>
													<div class="col-sm-7">
														<select name="degreeId" id="degreeId"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${DEGREE_LIST}" var="degree">
																<option value="${degree.id}">${degree.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12" id="degree-list">
													<div class="col-sm-5">

														<div id="ContentPlaceHolder1_lblParent"
															class="control-label">Branch<span
															style="color: #FF0000; font-weight: bold"> *</span></div>

													</div>
													<div class="col-sm-7" id="degree-list-div">
										 				<ul class="form-control" style="height:100px;overflow:auto;border-radius:4px">
															<!-- <li class="list-group-item"><input type="checkbox">
																Hi</li> -->
														</ul>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<div id="ContentPlaceHolder1_lblMenuName"
															class="control-label">Admission Start Date <span
															style="color: #FF0000; font-weight: bold">*</span></div>


													</div>
													<div class="col-sm-7">
													<div class='input-group date' id='startDate'>
														<input name="admissionStartDateString" type="text"
															readonly="readonly" maxlength="40"
															id="admissionStartDateString" tabindex="3"
															class="form-control datetimepicker"
															placeholder="Enter Admission Start Date"> 
														</div>	
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<div id="ContentPlaceHolder1_lblMenuLink"
															class="control-label">Admission End Date <span
															style="color: #FF0000; font-weight: bold">*</span></div>

													</div>

													<div class="col-sm-7">
														<input name="admissionEndDateString" type="text"
															readonly="readonly" maxlength="100"
															id="admissionEndDateString" tabindex="4"
															class="form-control datetimepicker"
															placeholder="Enter Admission End Date"> 
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<div id="ContentPlaceHolder1_lblMenuToolTip"
															class="control-label">Admission Print Date<span
															style="color: #FF0000; font-weight: bold">*</span></div>
													</div>
													<div class="col-sm-7">
														<input name="admissionPrintDateString" type="text"
															readonly="readonly" maxlength="40"
															id="admissionPrintDateString" tabindex="5"
															class="form-control datetimepicker"
															placeholder="Enter Admission Print Date">

													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div id="ContentPlaceHolder1_lblMenusrno"
															class="control-label">Prefix</div>


													</div>
													<div class="col-sm-7">
														<input name="prefix" type="text" maxlength="10"
															id="prefix" tabindex="6" class="form-control"
															placeholder="Enter  Prefix"> <span
															id="ContentPlaceHolder1_rfvMenusrno"
															style="display: none;"></span>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<div id="ContentPlaceHolder1_Label1"
															class="control-label">Start Number</div>

													</div>
													<div class="col-sm-7">
														<input id="startNumber" value="" type="text"
															name="startNumber" tabindex="8"
															placeholder="Enter  Start Number">
													</div>
												</div>
											</div>

											<div class="form-group" style="padding-bottom: 15px;">
												<div class="col-sm-12">
													<div class="col-sm-5">
														<div id="ContentPlaceHolder1_Label1"
															class="control-label">Suffix</div>

													</div>
													<div class="col-sm-7">
														<input id="sufix" value="" type="text" name="sufix"
															tabindex="8" placeholder="Enter  Suffix">
													</div>
												</div>
											</div>

										</div>


									</div>


									<div class="col-md-6" style="padding-right: 50px">

										<div class="grid box-filters"
											style="height: 334px; position: relative; overflow: auto">

											<table id="menu_table"
												class="table table-bordered  table-checkable table-responsive  "
												id="DataTables_Table_0"
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Assign to Project: activate to sort column ascending">Select</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="ID: activate to sort column ascending">Srno</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="First Name: activate to sort column ascending">Session</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Last Name: activate to sort column ascending">Degree</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Last Name: activate to sort column ascending">Admission
															Start Date</th>
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Last Name: activate to sort column ascending">Admission
															End Date</th>
													</tr>
												</thead>

												<tbody role="alert" aria-live="polite" aria-relevant="all"
													id="table-row">

												</tbody>
											</table>


										</div>
									</div>

									<!-- jaskirat code end here -->




									<div class="">
										<div class="row">
											<div class="col-md-12">
												<div class="form-group action-btn-group">
													<div class="controls2">
														<span class="left-margin-remove"> 
														<button type="submit" title="Save" name="submit_create_edit_team"
															class="btn btn-xl btn-success button-submit font13"  id="submit_button">
														Save
														</button>	
														
														</span>
														
														<button id="cancel_id" title="Reset" type=reset
																	class="btn btn-xl btn-default button-submit font13">
																	Reset
																</button>
													
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<!--=== Page Content ===-->
		</div>
<img alt="" src='<c:url value="/resources/loading-gif.gif"/>' style="position: absolute;left: 635px;top: 296px;display: none;" id="loading-image">
	</div>
	
	
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
			      //useCurrent: false,
			      // minDate: moment().add(1, 'd').toDate(),
			       defaultDate: moment().toDate(),
			       locale: 'de',
			       format: 'DD/MM/YYYY H:mm A'
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

	</script>
	<!-- /.container -->
	<!-- /.container -->
</body>

