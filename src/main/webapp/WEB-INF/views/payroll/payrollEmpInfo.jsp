<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Employee Creation</title>

<jsp:include page="../authentication/script.jsp" />
<script>
	//alert('${PAYROLL_MASTER_PAYSCALE}');
	$(document)
			.ready(
					function() {
						
						/* for validations check-ap*/
						jQuery.validator.addMethod('selectcheck', function(
						value) {
					return (value != "" && value!= 0 && value!='0');
				}, "");
						var validator = $("#payroll_emp_form").validate({

							rules : {
								title: {
									required : true,
									selectcheck : true
								},
								firstName : {
									required : true,
									selectcheck : true
								},
								middleName: {
									required : true,
									selectcheck : true
								},
								lastName : {
									required : true,
									selectcheck : true
								},
								dateOfBirthString: {
									required : true,
									selectcheck : true,
									date:true
								},
								gender: {
									required : true,
									selectcheck : true
								},
								basicPay: {
									required : true,
									selectcheck : true
								}
							},

							messages : {
							  title	: {
									required : "",
									selectcheck : ""
								},

								firstName : {
									required : "",
									selectcheck : ""
								},
								middleName: {
									required : "",
									selectcheck : ""
								},
								lastName : {
									required : "",
									selectcheck : ""
								},
								dateOfBirthString: {
									required : "",
									selectcheck : "",
									date:""
								},
								gender	: {
									required : "",
									selectcheck : ""
								},
								basicPay: {
									required : "",
									selectcheck : ""
								}
							},

							submitHandler : function(form) {
								form.submit();
							}
						});
						
						$("#cancel-btn").click(function() {
							validator.resetForm();
							$("#title").val('0');
							$("#firstName").val('');
							$("#middleName").val('');
							$("#lastName").val('');
							$("#fatherName").val('');
							$("#phoneNumber").val('');
							$("#landlineNumber").val('');
							/* $("#sign").attr('src',''); */
							$("#dateOfBirthString").val('');
							$("#categoryId").val('0');
							$("#casteId").val('0');
							$("#nationalityId").val('0');
							$("#emailId").val('');
							$("#uniqueId").val('');
							/* $("#studentImage").attr('src',''); */
							$("#pfNumber").val('0');
							$("#ppfNumber").val('');
							$("#gpfNumber").val('');
							$("#ruleNumber").val('0');
							$("#scale").val('0');
							$("#bank").val('0'); 
							$("#bankNumber").val('');
							$("#deptmentName").val('0');
							$("#desigName").val('0');
							$("#designationN").val('0');
							$("#staffT").val('0');
							$("#appoint").val('0');
							$("#basicPay").val('');
							$("#staff1").val('0');
							$("#bankNumber").val('');
							$("#quarterType").val('');
							$("#quarterNumber").val('');
							$("#remark").val(''); 
							$("#submit-btn").html('Save');
							$("#submit-btn").attr('title', 'Save');
							$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
							$("#payroll_emp_form").attr('action', '../payroll/employee-registration/add-update');
						});
						
						
						$("#quarterYes").click(function() {
							$("#quarterId").slideDown("slow");
						});
						$("#quarterNo").click(function() {
							$("#quarterId").slideUp("slow");
						});

						$("#payroll_emp_form").on('submit', function(e) {
							$("#payroll_emp_form").validate();
							//alert('submit');
							//e.preventDefault();

							//var valid = $("#payroll_emp_form").valid();
							//alert("Hello");
							 
							if ($("#payroll_emp_form").valid()) {
								var gender;
								var handicapped;
								var seniorCitizen;
								var joiningAnFn;
								var quarter;
								var Fore1;
								var Pay;
								$.each($("[name=gender]"), function() {
									if ($(this).is(":checked")) {
										gender = $(this).val();

										//alert(gender);
									}
								});

								

								$.each($("[name=handicapped]"), function() {
									if ($(this).is(":checked")) {
										handicapped = $(this).val();
										//alert(handicapped);
									}
								});

								$.each($("[name=seniorCitizen]"), function() {
									if ($(this).is(":checked")) {
										seniorCitizen = $(this).val();
										//alert(seniorCitizen);
									}
								});

								$.each($("[name=quarter]"), function() {
									if ($(this).is(":checked")) {
										quarter = $(this).val();
										//alert(quarter);
									}
								});

								$.each($("[name=Fore1]"), function() {
									if ($(this).is(":checked")) {
										Fore1 = $(this).val();
										//alert(Fore1);
									}
								});

								$.each($("[name=Pay]"), function() {
									if ($(this).is(":checked")) {
										Pay = $(this).val();
										//alert(Pay);
									}
								});

								$.each($("[name=joiningAnFn]"), function() {
									if ($(this).is(":checked")) {
										joiningAnFn = $(this).val();
										//alert(joiningAnFn);
									}
								});
							}

						});

						/* $("#cityId").change(
								function() {
									var payScale = $("#cityId option:selected")
											.html();

									var str = new String(payScale);
									var startIndex = str.indexOf('(');
									var endIndex = str.indexOf(')');
									alert(str.substring(startIndex, endIndex));
									$("#gradePay")
											.val(
													str.substring(startIndex,
															endIndex));
								}); */

						/**********************Ajax Call for Get PayScale**************************/
						/** Get Pay Scale Based on Pay Rule id
						 **/
						$("#ruleNumber")
								.change(
										function() {
											var ruleNumber = $("#ruleNumber")
													.val();
											$
													.ajax({
														async : false,
														url : "./employee-registration/getPayScale",
														type : "POST",
														data : {
															"ruleNumber" : ""
																	+ ruleNumber
														},

														success : function(
																response) {
															//alert(response);
															var jsonOb = JSON
																	.parse(JSON
																			.stringify(response));
															var text = "<option selected=\"selected\" value=\"0\">Please Select Branch</option>";
															$
																	.each(
																			jsonOb,
																			function(
																					index,
																					payscale) {
																				text += "<option value=\""+payscale.id+"\">"
																						+ payscale.scale
																						+ "</option>";
																			});

															$("#scale").empty()
																	.html(text);
														},

														error : function() {
															alert('error...');
														},
													});
										});
						/**********************Method End Here**************************/

						/**********************AJax call for Grade pay******************/
						/** Get Grade Pay based on payscale Id
						 **/
						$("#scale")
								.change(
										function() {

											var id = $("#scale").val();
											$
													.ajax({
														async : false,
														url : "./employee-registration/getGradePay",
														type : "POST",
														data : {
															"id" : "" + id
														},

														success : function(
																response) {
															//alert(response);
															var jsonOb = JSON
																	.parse(JSON
																			.stringify(response));
															//	alert(response);
															//var text = response;
															var text = "<input type=\"text\" name=\"gradePay\"  readonly=\"readonly\" value=\""+response+"\">";
															/* var text = "<option selected=\"selected\" value=\"0\">Please Select Branch</option>";
															$.each( jsonOb , function( index, gradepay) {
															text += "<option value=\""+payscale.id+"\">" + payscale.scale + "</option>";
															}); */

															$("#gradePay")
																	.empty()
																	.html(text);
														},

														error : function() {
															alert('error...');
														},
													});
										});
						 $("#submit-btn").click(function(){
							if($("#payroll_emp_form").valid())
								{$("#payroll_emp_form").submit();}
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
				<!--=== Page Header ===-->
				<jsp:include page="../authentication/page-header.jsp" />
				<!-- /Page Header -->
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">
								<div class="grid-header text">Employee Information</div>
							</div>

				<form id="payroll_emp_form" action="../payroll/employee-registration/add-update"
								method="post" class="form-horizontal"
								enctype="multipart/form-data">

								<!-- General header tab start here -->


								<!-- jaskirat code start here -->
								<div class="box-header" style="top: 5px;">
									<div class="box-name">
										<i class="fa fa-table"></i> <span>Basic Information</span>
									</div>


								</div>
								<div class="row my-bg-success">

									<!--left div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">

											<br>
											<div class="form-group">
												<div class="col-sm-5">
													<div class="control-label">Identification No
													</div>
												</div>
												<div class="col-sm-7">
													<div class="input-group">
														<input name="userId" readonly type="text"
															id="name" tabindex="2" value="${maxId}" readonly
															class="form-control" placeholder="Enter User"> <span
															id="name" style="display: none;"></span> <span
															class="input-group-addon"><i><a
																href="#myModal" data-backdrop="false"
																data-toggle="modal" onclick="resetModelDialogBox()">
																	<span class="glyphicon glyphicon-search"
																	title="Lookup Existing User"></span>
															</a></i></span>
													</div>

												</div>

											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div class="control-label">Title<span
														style="color: #FF0000; font-weight: bold">*</span>
														</div>
													</div>
													<div class="col-sm-7">
														<select name="title" id="title" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${PAYROLL_MASTER_TITLE}" var="title">
																<option value="${title.id}">${title.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div class="control-label">Employee First Name<span
															style="color: #FF0000; font-weight: bold">*</span></div>

													</div>
													<div class="col-sm-7">
														<input title="" name="firstName" type="text"
															maxlength="40" id="firstName" tabindex="3"
															class="form-control" placeholder="Employee First Name">

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div class="control-label">Employee Middle Name<span
															style="color: #FF0000; font-weight: bold">*</span></div>

													</div>
													<div class="col-sm-7">
														<input name="middleName" type="text" maxlength="40"
															id="middleName" tabindex="3" class="form-control"
															placeholder="Employee Middle Name">

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Employee Last Name<span
															style="color: #FF0000; font-weight: bold">*</span></div>

													</div>
													<div class="col-sm-7">
														<input name="lastName" type="text" maxlength="40"
															id="lastName" tabindex="3" class="form-control"
															placeholder="Employee Last Name">

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Father Name </div>


													</div>
													<div class="col-sm-7">
														<input name="fatherName" type="text" maxlength="40"
															id="fatherName" tabindex="3" class="form-control"
															placeholder="Father Name">
													</div>
												</div>
											</div>




											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div class="control-label">Mobile Number</div>

													</div>
													<div class="col-sm-7">
														<input name="phoneNumber" type="text" maxlength="100"
															id="phoneNumber" tabindex="4" class="form-control"
															placeholder="Mobile Number">

													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Employee Number</div>

													</div>
													<div class="col-sm-7">
														<input name="landlineNumber" type="text" maxlength="100"
															id="landlineNumber" tabindex="4" class="form-control"
															placeholder="Employee Number">

													</div>
												</div>
											</div>

											<!-- photo code state here -->

											<div class="form-group">

												<div class="col-sm-12">
													<div class="col-xs-5">
														<div 
															class="control-label">Employee Image</div>
													</div>
													<div class="col-sm-7">
														<input type="file" name="studentPhoto" id="studentPhoto"
															title="Please Select Photo">
														<!-- onchange="showImage()"> -->

													</div>
												</div>
											</div>
											<div class="form-group">





												<div class="col-sm-5"></div>
												<div class="col-sm-7">

													<img id="sign" style="border: 1px solid #A9E6F9"
														src="<c:url value="../../resources/uploads/academic/registration/${student.photoLink}"/>"
														style="height: 75px; width: 75px;">
												</div>
											</div>
											<!-- photo end state here -->



										</div>

									</div>


									<!--left div end here -->

									<!--right div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">
											<br>
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Sequence No</div>

													</div>
													<div class="col-sm-7">
														<input name="sequenceNumber" type="text" maxlength="100"
															id="sequenceNumber" tabindex="4" class="form-control"
															placeholder="Sequence No" value="0">

													</div>
												</div>
											</div>


											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5 col-xs-12">

														<div 
															class="control-label">Date of Birth<span
															style="color: #FF0000; font-weight: bold">*</span></div>
													</div>
													<div class="col-sm-7 col-xs-12">
														<div class='input-group date startDate'>
															<input type="text" name="dateOfBirthString" required
																id="dateOfBirthString" class="form-control"
																placeholder="Press to Select date" /> <span
																class="input-group-addon"><span
																class="glyphicon glyphicon-calendar"></span> </span>
														</div>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Gender <span
															style="color: #FF0000; font-weight: bold">*</span></div>


													</div>
													<div class="col-sm-7">
														<input type="radio" name="gender" id="gender-1" value="1" />
														<label>Male</label> <input type="radio" name="gender"
															id="gender-2" value="2" /> <label>Female</label> <input
															type="radio" name="gender" id="gender-3" value="3" /> <label>Transgender</label>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<div 
															class="control-label">Category </div>

													</div>

													<div class="col-sm-7">
														<select name="categoryId" id="categoryId"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${PAYROLL_MASTER_CATEGORY}"
																var="category">
																<option value="${category.id}">${category.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<div 
															class="control-label">Cast </div>

													</div>

													<div class="col-sm-7">
														<select name="casteId" id="casteId" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${PAYROLL_MASTER_CASTE}" var="cast">
																<option value="${cast.id}">${cast.name}</option>
															</c:forEach>
														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<div 
															class="control-label">Nationality </div>

													</div>

													<div class="col-sm-7">
														<select name="nationalityId" id="nationalityId"
															class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${PAYROLL_MASTER_NATIONALITY}"
																var="nationality">
																<option value="${nationality.id}">${nationality.name}</option>
															</c:forEach>

														</select>

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Email Id</div>

													</div>
													<div class="col-sm-7">
														<input name="emailId" type="text" maxlength="100"
															id="emailId" tabindex="4" class="form-control"
															placeholder="Email Id" >

													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">National Unique ID No</div>

													</div>
													<div class="col-sm-7">
														<input name="uniqueId" type="text" maxlength="100"
															id="uniqueId" tabindex="4" class="form-control"
															placeholder="National Unique ID No" >

													</div>
												</div>
											</div>


											<!-- photo code state here -->
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-xs-5">
														<div 
															class="control-label">Signature</div>
													</div>
													<div class="col-sm-7">
														<input type="file" name="studentPhoto" id="studentPhoto"
															title="Please Select Photo">
														<!-- onchange="showImage()"> -->

													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-5"></div>
												<div class="col-sm-7">

													<img id="studentImage" style="border: 1px solid #A9E6F9"
														src="<c:url value="../../resources/uploads/academic/registration/${student.photoLink}"/>"
														style="height: 75px; width: 75px;">
												</div>
											</div>
											<!-- photo end state here -->


										</div>

									</div>

									<!--right div end here -->
								</div>

								<!--left row 1 1 start here -->
								<!-- General header tab start here -->


								<div class="box-header" style="top: 5px;">
									<div class="box-name">
										<i class="fa fa-table"></i> <span>Service Details</span>
									</div>


								</div>



								<!--  General header tab end here -->


								
									<!--left div start here -->

									<div class="col-md-6">
										<br>
										<div class="form-horizontal">
											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Handicap </div>


													</div>
													<div class="col-sm-7">
														<input type="radio" name="handicapped" id="handicapped-1"
															value="true" /><label>Yes</label> <input type="radio"
															name="handicapped" id="handicapped-2" value="false" /> <label>No</label>
													</div>
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div 
															class="control-label">Senior Citizen</div>


													</div>
													<div class="col-sm-7">
														<input type="radio" name="seniorCitizen"
															id="seniorCitizen-1" value="true" /><label>Yes</label> <input
															type="radio" name="seniorCitizen" id="seniorCitizen-2"
															value="false" /> <label>No</label>
													</div>
												</div>
											</div>














											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5">

														<div  class="control-label">Quarter </div>


													</div>
													<div class="col-sm-7">
														<input type="radio" name="quarter" id="quarterYes"
															value="true" /> <label>Yes</label> <input type="radio"
															name="quarter" id="quarter" value="false" /> <label>No</label>
													</div>
												</div>
											</div>

											<div class="form-group" id="quarterId"
												style="display: none; border: 1px solid red; border-radius: 5px">
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div  class="control-label">Quarter Rent </div>


														</div>
														<div class="col-sm-7">
															<input type="radio" name="Rent"  value="1" /> <label>Yes</label>
															<input type="radio" name="Rent"  value="2" /> <label>No</label>
														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div  class="control-label">Quarter Type </div>


														</div>
														<div class="col-sm-7">
															<input name="quarterType" type="text" maxlength="100"
																id="quarterType" tabindex="4" class="form-control"
																placeholder="Quarter Type" >

														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div  class="control-label">Quarter No </div>


														</div>
														<div class="col-sm-7">
															<input name="quarterNumber" type="text" maxlength="100"
																id="quarterNumber" tabindex="4" class="form-control"
																placeholder="Quarter No" >
														</div>
													</div>
												</div>
											</div>


											<div class="form-group">
												<div class="col-sm-12">
													<div class="col-sm-5 col-xs-12">

														<div 
															class="control-label">Date of joining</div>
													</div>
													<div class="col-sm-7 col-xs-12">
														<div class='input-group date endDate'>
															<input type="text" name="dateOfJoiningString"
																id="dateOfJoiningString" class="form-control"
																placeholder="Press to Select date" /> <span
																class="input-group-addon"><span
																class="glyphicon glyphicon-calendar"></span> </span>

														</div>
														<input type="radio" name="joiningAnFn" id="joiningAnFn"
															value="1" /> <label>ForeNoon </label> <input
															type="radio" name="joiningAnFn" id="joiningAnFn"
															value="2" /> <label>AfterNoon </label>
													</div>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5 col-xs-12">

													<div 
														class="control-label">Incremental Date</div>
												</div>
												<div class="col-sm-7 col-xs-12">
													<div class='input-group date incrementDate'>
														<input type="text" name="dateOfIncrementString"
															id="dateOfIncrementString" class="form-control"
															placeholder="Press to Select date" /> <span
															class="input-group-addon"><span
															class="glyphicon glyphicon-calendar"></span> </span>
													</div>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5 col-xs-12">

													<div 
														class="control-label">Dt. of Retirement </div>
												</div>
												<div class="col-sm-7 col-xs-12">
													<div class='input-group date retireDate'>
														<input type="text" name="dateOfRetirementString"
															id="dateOfRetirementString" class="form-control"
															placeholder="Press to Select date" /> <span
															class="input-group-addon"><span
															class="glyphicon glyphicon-calendar"></span> </span>

													</div>
													<input type="radio" name="Fore1"  value="1" /> <label>ForeNoon
													</label> <input type="radio" name="Fore1"  value="2" /> <label>AfterNoon
													</label>
												</div>
											</div>
										</div>



										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">
				
													<div 
														class="control-label">Designation</div>
												</div>
												<div class="col-sm-7">
												<!-- previously id was cityId -->
													<select name="desigName" id="desigName" class="form-control">
														<option selected="selected" value="0">Please
															Select</option>
														<c:forEach items="${PAYROLL_MASTER_DESIGNATION}"
															var="designation">
															<option value="${designation.id}">${designation.name}</option>
														</c:forEach>

													</select>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">

													<div 
														class="control-label">Department</div>
												</div>
												<!-- previously id was cityId -->
												<div class="col-sm-7">
													<select name="deptmentName" id="deptmentName" class="form-control">
														<option selected="selected" value="0">Please
															Select</option>

														<c:forEach items="${PAYROLL_MASTER_DEPARTMENT}"
															var="department">
															<option value="${department.id}">${department.name}</option>
														</c:forEach>

													</select>
												</div>
											</div>
										</div>





										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">

													<div 
														class="control-label">Basic Pay <span
															style="color: #FF0000; font-weight: bold">*</span></div>
												</div>
												<div class="col-sm-7">
													<input name="basicPay" type="text" maxlength="100"
														id="basicPay" tabindex="4" class="form-control"
														placeholder="Basic Pay" >

												</div>
											</div>
										</div>



										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">

													<div 
														class="control-label">Designation Nature</div>
												</div>
												<!-- previously id was cityId -->
												<div class="col-sm-7">
													<select name="designationN" id="designationN" class="form-control">
														<option selected="selected" value="0">Please
															Select</option>

														<c:forEach items="${PAYROLL_MASTER_DESIGNATION_NATURE}"
															var="designationNature">
															<option value="${designationNature.id}">${designationNature.name}</option>
														</c:forEach>

													</select>
												</div>
											</div>
										</div>


										<!-- staff type -->

										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">

													<div 
														class="control-label">Staff Type</div>
												</div>
												<!-- previously id was cityId -->
												<div class="col-sm-7">
													<select name="staffT" id="staffT" class="form-control">
														<option selected="selected" value="0">Please
															Select</option>

														<c:forEach items="${PAYROLL_MASTER_STAFF_TYPE}"
															var="staff">
															<option value="${staff.id}">${staff.name}</option>
														</c:forEach>

													</select>
												</div>
											</div>
										</div>






										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">

													<div 
														class="control-label">Staff </div>
												</div>
												<div class="col-sm-7">
													<select name="staff1" id="staff1" class="form-control">
														<option selected="selected" value="0">Please
															Select</option>
														<c:forEach items="${PAYROLL_MASTER_STAFF}" var="staff1">
															<option value="${staff1.id}">${staff1.name}</option>
														</c:forEach>


													</select>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-12">
												<div class="col-sm-5">

													<div 
														class="control-label">Appointment</div>
												</div>
												<!-- previously id was cityId -->
												<div class="col-sm-7">
													<select name="appoint" id="appoint" class="form-control">
														<option selected="selected" value="0">Please
															Select</option>
														<c:forEach items="${PAYROLL_MASTER_APPOINTMENT_TYPE}"
															var="appointment">
															<option value="${appointment.id}">${appointment.name}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</div>






										<!-- country -->
									</div>
									
									<!--left div end here -->

									<!--right div start here -->
									<div class="col-md-6">

										<div class="form-horizontal" style="top: 5px">
											<br>

											<div class="form-horizontal">






												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">P.F</div>


														</div>
														<div class="col-sm-7">
															<select name="pfNumber" id="pfNumber"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${PAYROLL_MASTER_PF}" var="pf">
																	<option value="${pf.id}">${pf.name}</option>
																</c:forEach>

															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">P.P.F. No. </div>
														</div>
														<div class="col-sm-7">
															<input name="ppfNumber" type="text" maxlength="100"
																id="ppfNumber" tabindex="4" class="form-control"
																placeholder="P.P.F. No." >
														</div>
													</div>
												</div>


												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">GPF/EPF No. </div>
														</div>
														<div class="col-sm-7">
															<input name="gpfNumber" type="text" maxlength="100"
																id="gpfNumber" tabindex="4" class="form-control"
																placeholder="GPF/EPF No." >
														</div>
													</div>
												</div>



												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">Pay Type </div>
														</div>
														<div class="col-sm-7">
															<input type="radio" name="Pay"  value="1" /> <label>Yes</label>
															<input type="radio" name="Pay"  value="2" /> <label>No</label>
														</div>
													</div>
												</div>




												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">Pay Rule </div>
														</div>
														<div class="col-sm-7">
															<select name="ruleNumber" id="ruleNumber"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${PAYROLL_MASTER_PAYRULE}"
																	var="payRule">
																	<option value="${payRule.id}">${payRule.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">Scale </div>
														</div>

														<div class="col-sm-7">
															<select name="scale" id="scale" class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<%-- <c:forEach items="${PAYROLL_MASTER_PAYSCALE}"
																	var="payScale">
																	<option value="${payScale.id}">${payScale.scale}</option>
																</c:forEach> --%>
															</select>

															<!-- <select name="branchId" id="branchId"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select Branch</option>
																</select> -->
														</div>
														<br>
														<div>
														<div class="col-sm-5">

															<div 
																class="control-label">Grade Pay </div>
														</div>
														</div>
														<div class="col-sm-3 col-xs-6" id="gradePay">
															<!-- <input name="gradePay" type="text" maxlength="100"
																readonly="readonly" id="gradePay" /> -->
															<%-- 
																<c:forEach items=""
																	var="gradepay">
																	<option value="${gradepay.id}">${gradepay.name1}</option>
																</c:forEach> --%>
														</div>
													</div>
												</div>


												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">Bank Name </div>
														</div>
														<!-- id anme was cityId -->
														<div class="col-sm-7">
															<select name="bank" id="bank" class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${PAYROLL_MASTER_BANKNAME}"
																	var="bankName">
																	<option value="${bankName.id}">${bankName.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label">Bank A/C No.</div>
														</div>
														<div class="col-sm-7">
															<input name="bankNumber" type="text" maxlength="100"
																id="bankNumber" tabindex="4" class="form-control"
																placeholder="Bank A/C No." >
														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<div 
																class="control-label"> Remark</div>
														</div>
														<div class="col-sm-7">
															<div class="input-group">
																<textarea class="form-control custom-control" cols="40"
																	rows="5" style="resize: none" name="remark" id="remark">
																			
																			</textarea>
															</div>
														</div>
													</div>
												</div>
											</div>


										</div>
										<!--right div end here -->
									</div>
									<br>
									<!--Button code start here -->
									<div class="form-horizontal">
										<div class="" style="text-align: center">

											<div class="col-sm-12">


												<button type="button" title="Save" id="submit-btn"
													class="btn btn-xl btn-success button-submit font13">Save</button>


												<button type="button" title="Reset"
													class="btn btn-xl btn-cancel button-submit font13"
													id="cancel-btn">Reset</button>


											</div>
										</div>
									</div>
									<!--Button code start here -->
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>

		<!--=== Page Content ===-->
	</div>
	<script>
		jQuery(function() {
			jQuery(function() {
				$('.startDate').datetimepicker({
					//   useCurrent: false,
					// minDate: moment().add(-1, 'd').toDate(),
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'DD/MM/YYYY'
				});

				$('.endDate').datetimepicker({
					//useCurrent: false,
					// minDate: moment().add(1, 'd').toDate(),
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'DD/MM/YYYY'

				});

				$('.incrementDate').datetimepicker({
					//useCurrent: false,
					// minDate: moment().add(1, 'd').toDate(),
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'DD/MM/YYYY'

				});

				$('.retireDate').datetimepicker({
					//useCurrent: false,
					// minDate: moment().add(1, 'd').toDate(),
					defaultDate : moment().toDate(),
					locale : 'de',
					format : 'DD/MM/YYYY'

				});

				jQuery('.endDate').data("DateTimePicker").setMinDate(
						moment().toDate());
				jQuery('.startDate').data("DateTimePicker").setMaxDate(
						moment().toDate());
				//jQuery('#startDate').datetimepicker();
				//				jQuery('#endDate').datetimepicker();
				jQuery(".startDate").on(
						"dp.change",
						function(e) {
							jQuery('.endDate').data("DateTimePicker")
									.setMinDate(e.date.add(-1, 'D'));
						});
				jQuery(".endDate").on(
						"dp.change",
						function(e) {
							jQuery('.startDate').data("DateTimePicker")
									.setMaxDate(e.date.add(1, 'D'));
						});

			});

		});
	</script>
	<script type="text/javascript">
		$(function() {
			$('.startDate').datetimepicker({
				pickTime : false
			});
			$('.startDate').datetimepicker({
				pickTime : false
			});

			$("#studentPhoto").change(function() {
				readURL(this, '#dp');
			});

			$("#signButton").change(function() {
				readURL(this, '#sign');
			});
		});

		function readURL(input, id) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$(id).attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>

	<!-- /.container -->
	<!-- /.container -->
</body>

