<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>View Merit List</title>

<jsp:include page="../authentication/script.jsp" />
<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../authentication/header.jsp" />
	<!-- /.header -->


	<!-- for checkall function -->
	<script>
	
	var studentInfo = {"srno": "", "id": "", "studentName": "", "fatherName": "","lastName": "","genderName": "","entranceExamRank": "","category": ""};
	var rowNumber = 0;
	var studentJsonArrayString = new Array();
	var studentJsonArray = new Array();
	var formData;
	
	
	
		$(document)
				.ready(
						function() {
							function checkAll(ele) {
								var checkboxes = document
										.getElementsByTagName('input');
								if (ele.checked) {
									for (var i = 0; i < checkboxes.length; i++) {
										if (checkboxes[i].type == 'checkbox') {
											checkboxes[i].checked = true;
										}
									}
								} else {
									for (var i = 0; i < checkboxes.length; i++) {
										console.log(i)
										if (checkboxes[i].type == 'checkbox') {
											checkboxes[i].checked = false;
										}
									}
								}
							}

							$("#submit-btn")
									.click(
											function() {

												studentJsonArrayString = new Array();

												$
														.each(
																studentJsonArray,
																function(index,
																		ob) {
																	studentJsonArrayString
																			.push(JSON
																					.stringify(ob));
																});

												var sessionId = $("#sessionId")
														.val();
												var degreeId = $("#degreeId")
														.val();
												var meritListName = $(
														"#merit-list-id").val();
												//var meritListName = $("#meritListName").val();
												var meritListId = "";

												formData = new FormData();
												formData.append("sessionId",
														sessionId);
												formData.append("degreeId",
														degreeId);
												formData.append(
														"meritListName",
														meritListName);
												//formData.append("meritListName", meritListName);
												formData
														.append(
																"studentList",
																new String(
																		studentJsonArrayString));

												$
														.ajax({
															async : false,
															url : "./academic/studentMeritList/transfer",
															type : "POST",
															data : formData,
															processData : false,
															contentType : false,
															success : function(
																	response) {
																meritListId = response;
																//alert(response);
																if (response != 0) {
																	window.location = "./show-merit-list-report?meritListId="
																			+ response;
																}
															},
															error : function() {
																alert('error!!!...');
															},
														});

											});

							jQuery.validator.addMethod('selectcheck', function(
									value) {
								return (value != '');
							}, "");

							$("#new-merit-list").validate({
								// Specify the validation rules
								rules : {
									meritlist : {
										required : true,
										selectcheck : true
									}
								},
								messages : {
									meritlist : {
										required : "",
										selectcheck : ""
									}
								}
							});

							// Jquery draggable
							$('.modal-dialog').draggable({
								handle : ".modal-header"
							});

						
							
							$("#add_button").click(function(){
								$("#modaltable").empty();
								$ ("#id").val('');	
							});
							
							
							$("#get-details").click(function(){
								
								/* var id = $("#application-id").val(); */
								var meritListId = $("#merit-list-id").val();
								var id= $ ("#id").val();
								
								$("#modaltable").empty();
								
								$
								.ajax({
									async : false,
									url : "../../academic/studentMeritList/student",
									type : "POST",
									data : {
										"id" : id, "meritListId" : meritListId
									},
									success : function(
											response) {
										//alert(JSON.stringify(response));
										//alert('');
										var studentList = JSON
												.parse(JSON
														.stringify(response))
										if (JSON
												.stringify(response) != "[]"){
												$.each(studentList, function(index, student){
													$("#modaltable").append("<tr>"+
															"	<td>"+student.id+"</td>"+
															"	<td>"+student.studentName+ " " + student.fatherName + " "+ student.lastName + "</td>"+
															"	<td>"+student.entranceExamRank+""+
															"	<td>"+student.category+"</td>"+
															"</tr>");	
													
													studentInfo.id = student.id;
													studentInfo.applicationId = student.applicationId;
													studentInfo.studentName = student.studentName;
													studentInfo.fatherName = student.fatherName;
													studentInfo.lastName = student.lastName;
													studentInfo.entranceExamRank = student.entranceExamRank;
													studentInfo.category = student.category;
													studentInfo.genderName = student.genderName	;
													
													//alert(JSON.stringify(studentInfo));
												});	
											
												/* $("#modaltable").empty(); */
										}
										else
											alert('Wrong Application Id (OR)\nStudent Record is Already Exist');
									},
									error : function() {
										alert('eror...!');
									},
								});
							});
							
							
							
/* 							document.getElementById("add-student-btn").onclick = function() {
							    //disable
							    this.disabled = true;

							} */
							
													
							
							$("#add-student-btn").click(function(){	
								
								rowNumber++; 
								
								$("#student-list-body").append("<tr id=\"application-id-"+rowNumber+"\">"+
										"	<td><div class=\"fa-myremove\" title=\"Delete\"  onclick=\"deleteRow("+rowNumber+")\">"+
										"	<i class=\"fa fa-trash-o\"></i>"+
										"	</div><label class=\"ids\" style=\"visibility: hidden;\">"+studentInfo.id+"</label></td>"+
										"	<td class=\"serialNumber\">"+rowNumber+"</td>"+
										"	<td >"+studentInfo.applicationId+"</td>"+
										"	<td>"+studentInfo.studentName+"</td>"+
										"	<td>"+studentInfo.fatherName+"</td>"+
										"	<td>"+studentInfo.lastName+"</td>"+
										"	<td>"+studentInfo.genderName+"</td>"+
										"	<td>"+studentInfo.entranceExamRank+""+
										"	<td>"+studentInfo.category+"</td>"+
										"</tr>");
								
								//$("#application-id").val('');
								$("id").val('');
								$("#modaltable").empty();
								
							});
							
							
							/* for upadate new merit list */
							$("#update-btn").click(function() {
								studentJsonArrayString = new Array();
								
								var studentJsonArrayString = new Array();
								var studentJsonArray = new Array();
								
								var serialNumber = 1;
								//checking already available id
								/*var applicatiopnIds = null;
								if (ids=!0){
									if(ids[i]==$formObj()) {
										
									}
								}*/
								
								
								
								/* $.each($(".serialId"), function(){
									studentJsonArray.push({"studentSerialId" : $(this).html(),
										"serialNumberMeritlist" : serialNumber});	
									});
								 */
								
								 /* for sorting by serial no from transactions on id*/
								 /* $.each($(".id"), function(){
										studentJsonArray.push({"id" : $(this).html(),
											"serialNumberMeritlist" : serialNumber});
										serialNumber++;
										
									});
								 */	
								 
								/* $.each($(".id"), function() {
									studentJsonArray.push({"studentId" :$(this).html(),
										"serialNumberMeritList": serialNumber});		
									serialNumber++;
									 								 
								 });*/
								
								$.each($(".ids"), function(){
									studentJsonArray.push({"studentId" : $(this).html(),
										"serialNumberMeritlist" : serialNumber});
									serialNumber++;
									
								});
								
								
								
									$.each(studentJsonArray, function(index, ob) {
									studentJsonArrayString.push(JSON.stringify(ob));
								});

								var meritListName = $("#new-merit-list-name").val();
								//var meritListName = $("#meritListName").val();
								var meritListId ="";
								
								formData = new FormData();
								formData.append("meritListName", meritListName);
								//formData.append("meritListName", meritListName);
								formData.append("studentList", new String(studentJsonArrayString));

								$.ajax({
									async : false,
									url : "../../academic/studentMeritList/update",
									type : "POST",
									data : formData,
									processData : false,
									contentType : false,
									success : function(response) {
										meritListId =response;
										//alert(response);
										if(response != 0){
											window.location = "../../academic/studentMeritList/show-merit-list?merit-list-id="+response;
										}
									},
									error : function() {
										alert('error...');
									},
								});
							});
						/* update ends here */
						
						
						$("#update-merit-list-btn").click(function() {
							//alert($("#merit-list-name").val());
							$("#new-merit-list-name").val($("#merit-list-name").val());
							
						});
				
		
						});

		
			function deleteRow(rowNumber){
			$("#application-id-"+rowNumber).remove();
			//$("#id-"+rowNumber).remove();
			reorderSerialNumber();
		}
		
		function reorderSerialNumber(){
			rowNumber = 1;
			//alert('reorderSerialNumber');
			$.each($(".serialNumber"), function(){
				$(this).html(rowNumber);
				rowNumber++;
			});
		}
				
		
		
		
</script>


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

								<a class="navbar-brand"
									style="position: absolute; text-align: left; width: 15%;"
									href="#"> <img
									src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png"
									alt="logo" id="company-logo"></a>

								<div class="" style="text-align: center">
									<h4>CollegeName</h4>
									<h5>(College Address)</h5>


								</div>

								
								<div class="col-sm-8"
									style="text-align: right; text-decoration: underline; position: relative">
									<h4>${meritListName}</h4>
								</div>
								
								<%-- <h4>${reportName}</h4> --%>
								<!-- <div class="glyphicon glyphicon-print" title="Print Form"
										style="font-size: 25px; color: #1D9D74; float: right; right: 2%; position: absolute"></div> -->

								<%-- <div >
										<a href="${pageContext.request.contextPath}/show-merit-list-report?meritListId=${meritListId}" class="glyphicon glyphicon-print" title="Print Form"
										style="font-size: 25px; color: #1D9D74; float: right; right: 2%; position: absolute" onclick=""></a>
									</div> --%>

								<div class="col-sm-4"
									style="text-align: center; position: relative">

									<!-- vvv -->

									<%-- <h4>${reportName}</h4> --%>
									<!-- <div class="glyphicon glyphicon-print" title="Print Form"
										style="font-size: 25px; color: #1D9D74; float: right; right: 2%; position: absolute"></div> -->

									<div>
										<a
											href="${pageContext.request.contextPath}/show-merit-list-report?meritListId=${meritListId}"
											class="glyphicon glyphicon-print" title="Print Form"
											style="font-size: 25px; color: #1D9D74; float: right; right: 2%; position: absolute"
											onclick=""></a>

									</div>


									<%-- <h4>${reportName}</h4> --%>
									<!-- <div class="glyphicon glyphicon-print" title="Print Form"
										style="font-size: 25px; color: #1D9D74; float: right; right: 2%; position: absolute"></div> -->

									<div>
										<a target="_blank"
											href="${pageContext.request.contextPath}/show-merit-list-report?meritListId=${meritListId}"
											class="glyphicon glyphicon-print" title="Print Form"
											style="font-size: 25px; color: #1D9D74; float: right; right: 2%; position: absolute"
											onclick=""></a>
									</div>
									
								</div>
								<br><br><br>

								<div >
									<table class="table table-striped table-responsive" style="border-style: ridge;border-color:#E1E1E1;">
										<thead style="border-style: ridge;border-color:#E1E1E1;">
											<tr>
												<th>Select</th>
												<th>Merit No.</th>
												<th>Application ID</th>
												<th>Student Name</th>
												<th>Middle Name</th>
												<th>Last Name</th>
												<th>Gender</th>
												<th>AIR</th>
												<th>Category</th>
											</tr>
										</thead>
										<tbody id="student-list-body">
											<c:set var="srno" value="1" />
											<c:forEach items="${studentList}" var="student">
												<tr id="application-id-${srno}">
													<%-- <tr id ="id-${srno}}" > --%>
													<td><div class="fa-myremove" title="Delete"
															onclick="deleteRow(${srno})">
															<i class="fa fa-trash-o"></i>
														</div> <label class="ids" style="visibility: hidden;">${student.id}</label>
													</td>
													<td class="serialNumber">${srno}</td>
													<%-- <td>${student.id}</td> --%>
													<%-- <td class="ids">${student.id}</td> --%>
													<td>${student.applicationId}</td>
													<td>${student.studentName}</td>
													<td>${student.fatherName}</td>
													<td>${student.lastName}</td>
													<td>${student.genderName}</td>
													<td>${student.entranceExamRank}
													<td>${student.category}</td>
												</tr>
												<!-- serial nos inc-->
												<c:set var="srno" value="${srno + 1}" />
											</c:forEach>
											<p class="signin_btn">
										</tbody>
									</table>
									<script type="text/javascript">
										rowNumber = "${srno - 1}"
									</script>
									</br> </br>
									<button type="button" href="#myModal_addstudent"
										data-backdrop="false" style="float: centre"
										data-toggle="modal" title="Add Students"
										class="btn btn-xl btn-success button-submit font13"
										id="add_button">Add Student</button>

									<button type="button" href="#myModal1" data-backdrop="false"
										style="float: centre" data-toggle="modal" title="Update"
										title="Edit Merit List"
										class="btn btn-xl btn-warning button-submit font13"
										id="update-merit-list-btn">Update List Name</button>
									</p>
								</div>
								<!-- Model Dialog Box -->
								<div id="myModal_addstudent" class="modal fade"
									style="position: fixed; top: 0px">
									<div class="modal-dialog">
										<div class="modal-content" style="width:500px">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title">Add Student Here</h4>
											</div>
											<div class="modal-body" style="padding: 0px 0px 0px">
												<div class="col-md-12" style="background: #FFFFFF">
													<div class="form-horizontal">
														<div class="form-group" id="new-merit-list">
															<br>
															<div class="col-sm-12">
																<div class="col-sm-6">
																	<div id="ContentPlaceHolder1_lblModule"
																		class="control-label">Please Enter Application
																		Id <span style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-6">
																	<input name="meritlist" type="text" maxlength="200"
																		id="id" class="form-control"
																		placeholder="Application Id">
																	<div class="">
																		<div class="col-sm-12 text-center Height35px">
																			<input type="hidden" id="merit-list-id"
																				name="merit-list-id" value="${meritListId}">
																			<input type="hidden" id="merit-list-name"
																				name="merit-list-name" value="${meritListName}">
																		</div>
																		<br>
																	</div>
																	<button name="temp-btn" type="button" id="get-details" title="Get Details"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Get Details</span></span>
																	</button><br><br>
																</div>
															</div>
															<br> <br><br>
															<div class="">
																<div class="col-sm-12">
																	<div class="table-responsive TabContainer">
																		<table class="table table-hover table-striped" style="border-style: ridge;border-color:#E1E1E1;">
																			<thead>
																				<tr class="customers">

																					<th style="width: 20%;text-align:center;">Application Id</th>
																					<th style="width: 55%;text-align:center;">Student Name</th>
																					<th style="width: 15%;text-align:center;">AIR</th>
																					<th style="width: 45%;text-align:center;">Category</th>
																				</tr>
																			</thead>
																		</table>

																		<div class=""
																			style="position: relative; overflow: auto; width: auto; height:75px;">
																			<div class="TabScroll"
																				style="overflow: auto; width: auto; height:75px;">
																				<table class="table table-hover table-striped" style="border-style: ridge;border-color:#E1E1E1;"
																					id="modaltable">
																					<tbody>
																						<%-- <c:set var="srno" value="1" />
																						<c:forEach items="${studentList}" var="student">
																							<tr>
																								<td> <input type="checkbox" name="class" /> ${srno}</td>
																								<td>${student.id}</td>
																								<td>${student.id}</td>
																								<td>${student.studentName}</td>
																								<td>${student.entranceExamRank}
																								<td>${student.category}</td>
																							</tr>
																							<c:set var="srno" value="${srno + 1}" />
																						</c:forEach> --%>
																					</tbody>
																				</table>

																			</div>
																			<div class="slimScrollBar"
																				style="width: 7px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 93.361px; background: rgb(0, 0, 0);"></div>
																			<div class="slimScrollRail"
																				style="width: 7px; height: 100%; position: absolute; top: 0px; border-radius: 7px; opacity: 0.2; z-index: 90; right: 1px; display: none; background: rgb(51, 51, 51);"></div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<br> <br>
											<div class="modal-footer" style="margin: 0">
												<button type="button" title="Save" id="add-student-btn"
													class="btn btn-success">Save</button>
												<button type="button" class="btn btn-default" title="Close"
													data-dismiss="modal" id="close-dialog-box">Close</button>
											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->

								</div>
								<!-- /.modal-dialog -->




								<!-- for update list modal -->

								<div id="myModal1" class="modal fade"
									style="position: fixed; top: 0px">
									<div class="modal-dialog">
										<div class="modal-content" style="width: 553px;height: 160px;">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">&times;</button>
												<h4 class="modal-title">Enter Merit List Name Here</h4>
											</div>
											<div class="modal-body" style="padding: 0px 0px 0px">
												<div class="col-md-12" style="background: #FFFFFF">
													<div class="form-horizontal">
														<div class="form-group" id="new-merit-list">
															<br>
															
																<div class="col-sm-4">
																	<div id="ContentPlaceHolder1_lblModule"
																		class="control-label">Enter Merit List Name <span
																		style="color: #FF0000; font-weight: bold">*</span>
																	</div>
																</div>
																<div class="col-sm-8">
																	<input name="${meritListName}" type="text"
																		maxlength="200" id="new-merit-list-name"
																		class="form-control" placeholder="Merit List Name">
																</div>
															<br><br>
															<div class="">
																<div class="col-sm-12">
																	<div class="table-responsive TabContainer"></div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="modal-footer" style="margin: 0;background-color: #FFFFFF;">
											<br><br><br><br>
												<button type="button" title="Submit" id="update-btn"
													class="btn btn-success">Submit</button>

											</div>
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->

								</div>

								<!-- update list modal  ends here -->





								<!-- /.modal-dialog -->

							</div>







						</div>
					</div>
				</div>
			</div>
		</div>

		<!--=== Page Content ===-->
	</div>

	</div>
	<!-- /.container -->
	<!-- /.container -->
</body>

