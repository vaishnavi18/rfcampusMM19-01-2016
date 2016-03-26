<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Information</title>

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
<script>
	var submitByButton = false;
	var staticContents = {
		"statesLoaded" : false,
		"districtsLoaded" : false,
		"citiesLoaded" : false,
		"stateJson" : {},
		"districtJson" : {},
		"cityJson" : {}
	};
	var lastQualifyingArray = new Array();
	var removedLastQualifyingExamOptions = new Array();
	var updateOperation = false;
	
	$(function() {
		$("#tabs").tabs();
	});

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

						$("#registrationNumber")
								.keyup(
										function(event) {

											if (event.keyCode == 13) {
												var id = $(
														"#registrationNumber")
														.val();
												//alert(id);
												$
														.ajax({
															async : false,
															url : "../academic/student",
															type : "GET",
															data : {
																"searchText" : ""
																		+ id,
																"srarchCriteria" : 2
															},
															success : function(
																	response) {
																/* alert(JSON
																		.stringify(response)); */
																var jsonOb = JSON
																		.parse(JSON
																				.stringify(response))
																setStudentData(JSON
																		.stringify(response));
															},
															error : function() {
																alert('eror...');
															},
														});
												return false;
											}
										});

						$("#add-update-student-form").on('submit', function(e) {
							if (submitByButton == false) {
								e.preventDefault();
							}

						})

						$("#submit_button, #submit-form-btn").click(function() {
							submitByButton = true;
							$('#add-update-student-form').submit();
						});

						$
								.ajax({
									async : false,
									url : "../resources/uploads/states.json",
									type : "GET",
									success : function(response) {
										//alert(JSON.stringify(response));
										var jsonOb = JSON.parse(JSON
												.stringify(response));
										var text = "<option selected=\"selected\" value=\"0\">Please Select State</option>";
										$
												.each(
														jsonOb,
														function(index, stateOb) {
															text += "<option value=\""+stateOb.id+"\">"
																	+ stateOb.state
																	+ "</option>";
														});
										$("#localStateId").empty().html(text);
										$("#permenantStateId").empty().html(
												text);
										$("#guardianStateId").empty()
												.html(text);
										$("#fatherOfficeState").empty().html(
												text);
										$("#motherOfficeState").empty().html(
												text);
										//staticContents.statesLoaded = true;
										//staticContents.stateJson = jsonOb; 
									},
									error : function() {
									},
								});
						
						$(
								"#localStateId, #permenantStateId, #guardianStateId, #fatherOfficeState, #motherOfficeState")
								.change(
										function() {
											var stateId = $(this).val();
											var stateName = $(this)
													.attr("name");
											var districts;
											if (stateId != 0) {
												districts = loadDistricts(stateId);

												switch (stateName) {
												case "localStateId":
													$("#localDistrictId")
															.empty().html(
																	districts);
													$("#localCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "permenantStateId":
													$("#permenantDistrictId")
															.empty().html(
																	districts);
													$("#permenantCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "guardianStateId":
													$("#guardianDistrict")
															.empty().html(
																	districts);
													$("#guardianCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "fatherOfficeState":
													$("#fatherOfficeDistrict")
															.empty().html(
																	districts);
													$("#fatherOfficeCity")
															.find(
																	"option:gt(0)")
															.remove();
													break;
												case "motherOfficeState":
													$("#motherOfficeDistrict")
															.empty().html(
																	districts);
													$("#motherOfficeCity")
															.find(
																	"option:gt(0)")
															.remove();
													break;
												}
											} else {
												switch (stateName) {
												case "localStateId":
													$("#localDistrictId").find(
															"option:gt(0)")
															.remove();
													$("#localCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "permenantStateId":
													$("#permenantDistrictId")
															.find(
																	"option:gt(0)")
															.remove();
													$("#permenantCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "guardianStateId":
													$("#guardianDistrictId")
															.find(
																	"option:gt(0)")
															.remove();
													$("#guardianCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "fatherOfficeState":
													$("#fatherOfficeDistrict")
															.find(
																	"option:gt(0)")
															.remove();
													$("#fatherOfficeCity")
															.find(
																	"option:gt(0)")
															.remove();
													break;
												case "motherOfficeState":
													$("#motherOfficeDistrict")
															.find(
																	"option:gt(0)")
															.remove();
													$("#motherOfficeCity")
															.find(
																	"option:gt(0)")
															.remove();
													break;
												}
											}
										});

						$(
								"#localDistrictId, #permenantDistrictId, #guardianDistrict, #fatherOfficeDistrict, #motherOfficeDistrict")
								.change(
										function() {
											var districtId = $(this).val();
											var districtName = $(this).attr(
													"name");
											var cities = '';
											if (districtId != 0) {
												cities = loadCities(districtId);

												switch (districtName) {
												case "localDistrictId":
													$("#localCity").empty()
															.html(cities);
													break;
												case "permenantDistrictId":
													$("#permenantCityId").empty()
															.html(cities);
													break;
												case "guardianDistrict":
													$("#guardianCity").empty()
															.html(cities);
													break;
												case "fatherOfficeDistrict":
													$("#fatherOfficeCity")
															.empty().html(
																	cities);
													break;
												case "motherOfficeDistrict":
													$("#motherOfficeCity")
															.empty().html(
																	cities);
													break;
												}

											} else {
												switch (districtName) {
												case "localDistrictId":
													$("#localCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "permenantDistrictId":
													$("#permenantCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "guardianDistrictId":
													$("#guardianCity").find(
															"option:gt(0)")
															.remove();
													break;
												case "fatherOfficeDistrict":
													$("#fatherOfficeCity")
															.find(
																	"option:gt(0)")
															.remove();
													break;
												case "motherOfficeDistrict":
													$("#motherOfficeCity")
															.find(
																	"option:gt(0)")
															.remove();
													break;
												}
											}
										});

						$('#is-father-details-applicable')
								.change(
										function() {
											//alert('change');
											if ($(this).is(":checked")) {

												$(
														"#fatherOccupationId, #fatherEducationId, #fatherFlatNumber, #fatherStreetName, #fatherOfficeCity, #fatherOfficeDistrict, #fatherOfficePINCode, #fatherEmailid, #fatherDesignation, #fatherOfficeLocality, #fatherOfficeLandmark, #fatherOtherCityName, #localOtherDistrictName, #fatherOfficeState, #fatherMobileNumber, #fatherOfficeNumber")
														.attr('disabled',
																'disabled');
											} else {
												$(
														"#fatherOccupationId, #fatherEducationId, #fatherFlatNumber, #fatherStreetName, #fatherOfficeCity, #fatherOfficeDistrict, #fatherOfficePINCode, #fatherEmailid, #fatherDesignation, #fatherOfficeLocality, #fatherOfficeLandmark, #fatherOtherCityName, #localOtherDistrictName, #fatherOfficeState, #fatherMobileNumber, #fatherOfficeNumber")
														.removeAttr('disabled');
											}

										});

						$('#is-mother-details-applicable, #is-mother-housewife')
								.change(
										function() {
											if ($(this).is(":checked")) {

												$(
														"#motherEducation,#motherFlatNumber,#motherOfficeStreetName,#motherOfficeCity,#motherOfficeDistrict,#motherOfficePINCode,#motherEmailid,#motherMaidenName,#motherDesignation,#motherOfficeLocality,#motherOfficeLandmark,#motherOtherCityName,#motherOtherDistrictName,#motherOfficeState,#motherMobileNumber,#motherOfficeNumber")
														.attr('disabled',
																'disabled');
											} else {
												$(
														"#motherEducation,#motherFlatNumber,#motherOfficeStreetName,#motherOfficeCity,#motherOfficeDistrict,#motherOfficePINCode,#motherEmailid,#motherMaidenName,#motherDesignation,#motherOfficeLocality,#motherOfficeLandmark,#motherOtherCityName,#motherOtherDistrictName,#motherOfficeState,#motherMobileNumber,#motherOfficeNumber")
														.removeAttr('disabled');
											}

										});

						$("#copy-local-address")
								.click(
										function() {
											$("#permenantFlatNumber")
													.val(
															$(
																	"#localFlatNumber")
																	.val());
											$("#permanantStreetName")
													.val(
															$(
																	"#localStreetName")
																	.val());
											$("#permenantStateId").val(
													$("#localStateId").val())
													.change();
											$("#permenantDistrictId")
													.val(
															$(
																	"#localDistrictId")
																	.val())
													.change();
											$("#permenantCityId").val(
													$("#localCity").val())
													.change();
											$("#permenantPINCode").val(
													$("#localPINCode").val());
											$("#permenantLocality").val(
													$("#localLocality").val());
											$("#permanantLandmark").val(
													$("#localLandmark").val());
											$("#permenantOthercityName").val(
													$("#localOthercityName")
															.val());
											$("#permenantOtherDistrictName")
													.val(
															$(
																	"#localOtherDistrictName")
																	.val());
											$("#permenantPostOffice")
													.val(
															$(
																	"#localPostOffice")
																	.val());
										});

						$("#copy-permanant-address")
								.click(
										function() {
											$("#guardianFlatNo").val(
													$("#permenantFlatNumber")
															.val());
											$("#guardianStreetName").val(
													$("#permanantStreetName")
															.val());
											$("#guardianState").val(
													$("#permenantStateId")
															.val()).change();
											$("#guardianDistrict").val(
													$("#permenantDistrictId")
															.val()).change();
											$("#guardianCity").val(
													$("#permenantCityId").val());
											$("#guardianPINCode").val(
													$("#permenantPINCode")
															.val());
											$("#guardianLocality").val(
													$("#permenantLocality")
															.val());
											$("#guardianLandmark").val(
													$("#permanantLandmark")
															.val());
											$("#guardianOtherCityName")
													.val(
															$(
																	"#permenantOthercityName")
																	.val());
											$("#guardianOtherDistrictName")
													.val(
															$(
																	"#permenantOtherDistrictName")
																	.val());
										});

						$('#is-guardian-address-applicable')
								.change(
										function() {
											if ($(this).is(":checked")) {

												$(
														"#guardianName,#guardianOccupationName,#guardianFlatNumber,#guardianStreetName,#guardianCity,#guardianDistrictId,#guardianPINCode,#relationWithGuardian,#guardianPhone,#guardianLocality,#guardianLandmark,#guardianOthercityName,#guardianOtherDistrictName,#guardianStateId")
														.attr('disabled',
																'disabled');
											} else {
												$(
														"#guardianName,#guardianOccupationName,#guardianFlatNumber,#guardianStreetName,#guardianCity,#guardianDistrictId,#guardianPINCode,#relationWithGuardian,#guardianPhone,#guardianLocality,#guardianLandmark,#guardianOthercityName,#guardianOtherDistrictName,#guardianStateId")
														.removeAttr('disabled');
											}

										});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0');
						}, "");

						$("#add-update-student-form")
								.validate(
										{

											rules : {
												title : {
													required : true,
													selectcheck : true
												},
												studentFirstName : {
													required : true
												//,
												},
												studentMiddleName : {
													required : true
												//,
												},
												studentLastName : {
													required : true
												//,
												},
												bloodGroupId : {
													required : true,
													selectcheck : true
												},
												nationalityId : {
													required : true,
													selectcheck : true
												},
												religionId : {
													required : true,
													selectcheck : true
												},
												annualIncome : {
													required : true
												//,
												},
												admissionCategoryNumber : {
													required : true,
													selectcheck : true
												},
												email : {
													required : true
												//,
												},
												emergencyContactNumber : {
													required : true
												//,
												},
												localFlatNumber : {
													required : true
												//,
												},
												localLocality : {
													required : true
												//,
												},
												localStreetName : {
													required : true
												//,
												},
												localLandmark : {
													required : true
												//,
												},
												localCity : {
													required : true,
													selectcheck : true
												},
												localDistrictId : {
													required : true,
													selectcheck : true
												},
												localStateId : {
													required : true,
													selectcheck : true
												},
												localPINCode : {
													required : true
												//,
												},
												permenantFlatNumber : {
													required : true
												//,
												},
												permenantStreetName : {
													required : true
												//,
												},
												permenantLocality : {
													required : true
												//,
												},
												permenantLandmark : {
													required : true
												//,
												},
												permenantCity : {
													required : true,
													selectcheck : true
												},
												permenantDistrictId : {
													required : true,
													selectcheck : true
												},
												permenantStateId : {
													required : true,
													selectcheck : true
												},
												permenantPINCode : {
													required : true
												//,
												},
												birthPlace : {
													required : true
												//,
												},
												motherTongueId : {
													required : true,
													selectcheck : true
												},
												countryDomicile : {
													required : true
												//,
												},
												adharCardNumber : {
													required : true
												//,
												},
												numberOfBrother : {
													required : true
												//,
												},
												numberOfSister : {
													required : true
												//,
												}
											},

											messages : {

												title : {
													required : "Please Select Title",
													selectcheck : "Please Select Title"
												},
												studentFirstName : {
													required : "Student First Name"//,
												},
												studentMiddleName : {
													required : "Student Middle Name"//,
												},
												studentLastName : {
													required : "Student Last Name"//,
												},
												bloodGroupId : {
													required : "Please Select Blood Group",
													selectcheck : "Please Select Blood Group"
												},
												nationalityId : {
													required : "Please Select Nationality",
													selectcheck : "Please Select Nationality"
												},
												religionId : {
													required : "Please Select Religion",
													selectcheck : "Please Select Religion"
												},
												annualIncome : {
													required : "Please Enter Annual Income"//,
												},
												admissionCategoryNumber : {
													required : "Please Select Admission Category",
													selectcheck : "Please Select Admission Category"
												},
												email : {
													required : "Please Enter Email"//,
												},
												emergencyContactNumber : {
													required : "Please Enter Emergency Contact Number"//,
												},
												localFlatNumber : {
													required : "Please Enter Local Flat Number"//,
												},
												localLocality : {
													required : "Please Enter Local Locality"//,
												},
												localStreetName : {
													required : "Please Enter Local Street Name"//,
												},
												localLandmark : {
													required : "Please Enter Local Landmark"//,
												},
												localCity : {
													required : "Please Select Local City",
													selectcheck : "Please Select Local City"
												},
												localDistrictId : {
													required : "Please Select Local District",
													selectcheck : "Please Select Local District"
												},
												localStateId : {
													required : "Please Select Local State",
													selectcheck : "Please Select Local State"
												},
												localPINCode : {
													required : "Please Enter Local PIN Code"//,
												},
												permenantFlatNumber : {
													required : "Please Enter Permenant Flat Number"//,
												},
												permenantStreetName : {
													required : "Please Enter Permenant Street Name"//,
												},
												permenantLocality : {
													required : "Please Enter Permenant Locality"//,
												},
												permenantLandmark : {
													required : "Please Enter permenant Landmark"//,
												},
												permenantCity : {
													required : "Please Select Permenant City",
													selectcheck : "Please Select Permenant City"
												},
												permenantDistrictId : {
													required : "Please Select Permenant District",
													selectcheck : "Please Select Permenant District"
												},
												permenantStateId : {
													required : "Please Select Permenant State",
													selectcheck : "Please Select Permenant State"
												},
												permenantPINCode : {
													required : "Please Enter PIN Code"//,
												},
												birthPlace : {
													required : "Please Enter Birth Place"//,
												},
												motherTongueId : {
													required : "Please Select Mothertongue",
													selectcheck : "Please Select Mothertongue"
												},
												countryDomicile : {
													required : "Please Enter Country Domicile"//,
												},
												adharCardNumber : {
													required : "Please Enter Adhar Card Number"//,
												},
												numberOfBrother : {
													required : "Please Enter Number of Brothers"//,
												},
												numberOfSister : {
													required : "Please Enter Number of Sisters"//,
												}
											},

											submitHandler : function(form) {
												form.submit();
											}
										});

						$("#save-general-information-btn")
								.click(
										function() {
											var title = $("#title").val();
											var studentFirstName = $(
													"#studentFirstName").val();
											var studentLastName = $(
													"#studentLastName").val();
											var nationalityId = $(
													"#nationalityId").val();
											var reserveCategory = $('[name=reserveCategory]:checked').val();
											var ebc = $('[name=ebc]:checked').val();
											var admissionCategoryNumber = $(
													"#admissionCategoryNumber")
													.val();
											var email = $("#email").val();
											var studentMobileNumber = $(
													"#studentMobileNumber")
													.val();
											var studentMiddleName = $(
													"#studentMiddleName").val();
											var bloodGroupId = $(
													"#bloodGroupId").val();
											var religionId = $("#religionId")
													.val();
											var annualIncome = $(
													"#annualIncome").val();
											var studentLandlineNumber = $(
													"#studentLandlineNumber")
													.val();
											var married = $('[name=married]:checked').val();
											var emergencyContactNumber = $(
													"#emergencyContactNumber")
													.val();

											var dataParam = {
												"title" : title,
												"studentFirstName" : studentFirstName,
												"studentLastName" : studentLastName,
												"nationalityId" : nationalityId,
												"reserveCategory" : reserveCategory,
												"ebc" : ebc,
												"admissionCategoryNumber" : admissionCategoryNumber,
												"email" : email,
												"studentMobileNumber" : studentMobileNumber,
												"studentMiddleName" : studentMiddleName,
												"bloodGroupId" : bloodGroupId,
												"religionId" : religionId,
												"annualIncome" : annualIncome,
												"studentLandlineNumber" : studentLandlineNumber,
												"married" : married,
												"emergencyContactNumber" : emergencyContactNumber
											};

											$
													.ajax({
														async : false,
														url : "./admission/student/basic-information",
														type : "POST",
														data : dataParam,
														success : function() {
														},
														error : function() {
														}
													});
										});

						$("#save-parents-details-btn")
						.click(
								function() {
									var fatherOccupationId = $("#fatherOccupationId").val();
									var fatherEducationId = $("#fatherEducationId").val();
									var fatherFlatNumber = $("#fatherFlatNumber").val();
									var fatherStreetName = $("#fatherStreetName").val();
									var fatherOfficeCity = $("#fatherOfficeCity").val();
									var fatherOfficeDistrict = $("#fatherOfficeDistrict").val();
									var fatherOfficePINCode = $("#fatherOfficePINCode").val();
									var fatherEmailid = $("#fatherEmailid").val();
									var fatherDesignation = $("#fatherDesignation").val();
									var fatherOfficeLocality = $("#fatherOfficeLocality").val();
									var fatherOfficeLandmark = $("#fatherOfficeLandmark").val();
									var fatherOtherCityName = $("#fatherOtherCityName").val();
									var localOtherDistrictName = $("#localOtherDistrictName").val();
									var fatherOfficeState = $("#fatherOfficeState").val();
									var fatherMobileNumber = $("#fatherMobileNumber").val();
									var fatherOfficeNumber = $("#fatherOfficeNumber").val();

									var motherEducation = $("#motherEducation").val();
									var motherFlatNumber = $("#motherFlatNumber").val();
									var motherOfficeStreetName = $("#motherOfficeStreetName").val();
									var motherOfficeCity = $("#motherOfficeCity").val();
									var motherOfficeDistrict = $("#motherOfficeDistrict").val();
									var motherOfficePINCode = $("#motherOfficePINCode").val();
									var motherEmailid = $("#motherEmailid").val();
									var motherMaidenName = $("#motherMaidenName").val();
									var motherDesignation = $("#motherDesignation").val();
									var motherOfficeLocality = $("#motherOfficeLocality").val();
									var motherOfficeLandmark = $("#motherOfficeLandmark").val();
									var motherOtherCityName = $("#motherOtherCityName").val();
									var motherOtherDistrictName = $("#motherOtherDistrictName").val();
									var motherOfficeState = $("#motherOfficeState").val();
									var motherMobileNumber = $("#motherMobileNumber").val();
									var motherOfficeNumber = $("#motherOfficeNumber").val();

									var dataParam = {
											"fatherOccupationId":fatherOccupationId ,
											"fatherEducationId":fatherEducationId ,
											"fatherFlatNumber":fatherFlatNumber ,
											"fatherStreetName" : fatherStreetName ,
											"fatherOfficeCity" : fatherOfficeCity ,
											"fatherOfficeDistrict" : fatherOfficeDistrict ,
											"fatherOfficePINCode" : fatherOfficePINCode ,
											"fatherEmailid" : fatherEmailid ,
											"fatherDesignation" : fatherDesignation ,
											"fatherOfficeLocality" : fatherOfficeLocality ,
											"fatherOfficeLandmark" : fatherOfficeLandmark ,
											"fatherOtherCityName" : fatherOtherCityName ,
											"localOtherDistrictName" : localOtherDistrictName ,
											"fatherOfficeState" : fatherOfficeState ,
											"fatherMobileNumber" : fatherMobileNumber ,
											"fatherOfficeNumber" : fatherOfficeNumber ,

											"motherEducation" : motherEducation ,
											"motherFlatNumber" : motherFlatNumber ,
											"motherOfficeStreetName" : motherOfficeStreetName ,
											"motherOfficeCity" : motherOfficeCity ,
											"motherOfficeDistrict" : motherOfficeDistrict ,
											"motherOfficePINCode" : motherOfficePINCode ,
											"motherEmailid" : motherEmailid ,
											"motherMaidenName" : motherMaidenName ,
											"motherDesignation" : motherDesignation ,
											"motherOfficeLocality" : motherOfficeLocality ,
											"motherOfficeLandmark" : motherOfficeLandmark ,
											"motherOtherCityName" : motherOtherCityName ,
											"motherOtherDistrictName" : motherOtherDistrictName ,
											"motherOfficeState" : motherOfficeState ,
											"motherMobileNumber" : motherMobileNumber ,
											"motherOfficeNumber" : motherOfficeNumber
											};

									$
											.ajax({
												async : false,
												url : "./admission/student/parents-information",
												type : "POST",
												data : dataParam,
												success : function() {
												},
												error : function() {
												}
											});
								});
						
						$("#save-address-details-btn")
						.click(
								function() {
									var localFlatNumber = $("#localFlatNumber").val();
									var localStreetName = $("#localStreetName").val();
									var localCity = $("#localCity").val();
									var localDistrictId = $("#localDistrictId").val();
									var localPINCode = $("#localPINCode").val();
									var localLocality = $("#localLocality").val();
									var localLandmark = $("#localLandmark").val();
									var localOthercityName = $("#localOthercityName").val();
									var localOtherDistrictName = $("#localOtherDistrictName").val();
									var localStateId = $("#localStateId").val();
									var localPostOffice = $("#localPostOffice").val();

									var permenantFlatNumber = $("#permenantFlatNumber").val();
									var permanantStreetName = $("#permanantStreetName").val();
									var permenantCityId = $("#permenantCityId").val();
									var permenantDistrictId = $("#permenantDistrictId").val();
									var permenantPINCode = $("#permenantPINCode").val();
									var permenantLocality = $("#permenantLocality").val();
									var permanantLandmark = $("#permanantLandmark").val();
									var permenantOthercityName = $("#permenantOthercityName").val();
									var permenantOtherDistrictName = $("#permenantOtherDistrictName").val();
									var permenantStateId = $("#permenantStateId").val();
									var permenantPostOffice = $("#permenantPostOffice").val();

									var guardianName = $("#guardianName").val();
									var guardianOccupationName = $("#guardianOccupationName").val();
									var guardianFlatNo = $("#guardianFlatNo").val();
									var guardianStreetName = $("#guardianStreetName").val();
									var guardianCity = $("#guardianCity").val();
									var guardianDistrict = $("#guardianDistrict").val();
									var guardianPINCode = $("#guardianPINCode").val();
									var relationWithGuardian = $("#relationWithGuardian").val();
									var guardianPhone = $("#guardianPhone").val();
									var guardianLocality = $("#guardianLocality").val();
									var guardianLandmark = $("#guardianLandmark").val();
									var guardianOtherCityName = $("#guardianOtherCityName").val();
									var guardianOtherDistrictName = $("#guardianOtherDistrictName").val();
									var guardianState = $("#guardianState").val();


									var dataParam = {
											"localFlatNumber":localFlatNumber,
											"localStreetName":localStreetName,
											"localCity":localCity,
											"localDistrictId":localDistrictId,
											"localPINCode":localPINCode,
											"localLocality":localLocality,
											"localLandmark":localLandmark,
											"localOthercityName":localOthercityName,
											"localOtherDistrictName":localOtherDistrictName,
											"localStateId":localStateId,
											"localPostOffice":localPostOffice,

											"permenantFlatNumber":permenantFlatNumber,
											"permanantStreetName":permanantStreetName,
											"permenantCityId":permenantCityId,
											"permenantDistrictId":permenantDistrictId,
											"permenantPINCode":permenantPINCode,
											"permenantLocality":permenantLocality,
											"permanantLandmark":permanantLandmark,
											"permenantOthercityName":permenantOthercityName,
											"permenantOtherDistrictName":permenantOtherDistrictName,
											"permenantStateId":permenantStateId,
											"permenantPostOffice":permenantPostOffice,

											"guardianName":guardianName,
											"guardianOccupationName":guardianOccupationName,
											"guardianFlatNo":guardianFlatNo,
											"guardianStreetName":guardianStreetName,
											"guardianCity":guardianCity,
											"guardianDistrict":guardianDistrict,
											"guardianPINCode":guardianPINCode,
											"relationWithGuardian":relationWithGuardian,
											"guardianPhone":guardianPhone,
											"guardianLocality":guardianLocality,
											"guardianLandmark":guardianLandmark,
											"guardianOtherCityName":guardianOtherCityName,
											"guardianOtherDistrictName":guardianOtherDistrictName,
											"guardianState":guardianState
											};

									$
											.ajax({
												async : false,
												url : "./admission/student/address-information",
												type : "POST",
												data : dataParam,
												success : function() {
												},
												error : function() {
												}
											});
								});
						
						$("#save-admission-details-btn")
						.click(
								function() {
									
									var admissionDateString = $("#admissionDateString").val();
									var branchNumber = $("#branchNumber").val();
									var admissionBatch = $("#admissionBatch").val();
									var scholership = $('[name=scholership]:checked').val();
									var local = $('[name=local]:checked').val();
									var semesterId = $("#semesterId").val();
									var degreeId = $("#degreeId").val();
									var paymentType = $("#paymentType").val();
									var admittedToYear = $("#admittedToYear").val();
									var scholarshipDetails = $("#scholershipDetails").val();
									var statusStudent = $("#statusOfStudent").val();

									var dataParam = {
											"admissionDateString":admissionDateString,
											"branchNumber":branchNumber,
											"admissionBatch":admissionBatch,
											"scholership":scholership,
											"local":local,
											"semesterId":semesterId,
											"degreeId":degreeId,
											"paymentType":paymentType,
											"admittedToYear":admittedToYear,
											"scholershipDetails":scholarshipDetails,
											"statusOfStudent":statusStudent
											};

									$
											.ajax({
												async : false,
												url : "./admission/student/admission-information",
												type : "POST",
												data : dataParam,
												success : function() {
												},
												error : function() {
												}
											});
								});
						
						$("#save-personal-details-btn")
						.click(
								function() {
									
									var birthPlace = $("#birthPlace").val();
									var motherTongueId = $("#motherTongueId").val();
									var otherLanguage = $('[name=otherLanguage]:checked').map(function() {
									    return this.value;
									}).get();
									otherLanguage = new String(otherLanguage);
									//alert(new String(otherLanguage));
									//var otherLanguage = $("[name=otherLanguage]:checked").val();
									var height = $("#height").val();
									var urban = $('[name=urban]:checked').val(); 
									var passportNumber = $("#passportNumber").val();
									var bankAddress = $("#bankAddress").val();
									var bankIFSCCode = $("#bankIFSCCode").val();
									var physicallyHandicapped = $('[name=physicallyHandicapped]:checked').val();
									var visaNumber = $("#visaNumber").val();
									var voterNumber = $("#voterNumber").val();
									var hosteler = $('[name=hosteler]:checked').val();
									var nprStatus = $('[name=nprStatus]:checked').val();
									var transport = $('[name=transport]:checked').val();
									var routeNumber = $("#routeNumber").val();
									var numberOfBrother = $("#numberOfBrother").val();
									var weight = $("#weight").val();
									var countryDomicile = $("#countryDomicile").val();
									var bankNumber = $("#bankNumber").val();
									//var physicallyHandicapped = $("#physicallyHandicapped").val();
									var typeOfPhysicallyHandicap = $("#typeOfPhysicallyHandicap").val();
									var panNumber = $("#panNumber").val();
									var adharCardNumber = $("#adharCardNumber").val();
									var nprNumber = $("#nprNumber").val();
									var routeAmount = $("#routeAmount").val();
									var medicalDetails = $("#medicalDetails").val();
									var medicalProblem = $('[name=medicalProblem]:checked').val();
									var numberOfSister = $("#numberOfSister").val();
									//$("#leftThumbTag")
									//$("#rightThumbTag")

									var dataParam = {
											"birthPlace":birthPlace,
											"motherTongueId":motherTongueId,
											"otherLanguage":otherLanguage,
											"height":height,
											"urban":urban,
											"passportNumber":passportNumber,
											"bankAddress":bankAddress,
											"bankIFSCCode":bankIFSCCode,
											"physicallyHandicapped":physicallyHandicapped,
											"visaNumber":visaNumber,
											"voterNumber":voterNumber,
											"hosteler":hosteler,
											"nprStatus":nprStatus,
											"transport":transport,
											"routeNumber":routeNumber,
											"numberOfBrother":numberOfBrother,
											"weight":weight,
											"countryDomicile":countryDomicile,
											"bankNumber":bankNumber,
											"physicallyHandicapped":physicallyHandicapped,
											"typeOfPhysicallyHandicap":typeOfPhysicallyHandicap,
											"panNumber":panNumber,
											"adharCardNumber":adharCardNumber,
											"nprNumber":nprNumber,
											"routeAmount":routeAmount,
											"medicalDetails":medicalDetails,
											"medicalProblem":medicalProblem,
											"numberOfSister":numberOfSister
											};

									$
											.ajax({
												async : false,
												url : "./admission/student/personal-information",
												type : "POST",
												data : dataParam,
												success : function() {
												},
												error : function() {
												}
											});
								});
						
						$("#save-document-list-btn")
						.click(
								function() {
									var documentList = $('[name=documentList]:checked').map(function() {
									    return this.value;
									}).get();
									documentList = new String(documentList);
									var jsonStr = new Array();
									
									$.each(lastQualifyingArray, function(index, ob){
										jsonStr.push(JSON.stringify(ob));
									});
									
									var dataParam = {
											"documentList":documentList,
											"array":new String(jsonStr)
											};

									$
											.ajax({
												async : false,
												url : "./admission/student/document-information",
												type : "POST",
												data : dataParam,
												success : function() {
												},
												error : function() {
												}
											});
								});
						
						$("#save-last-qualificaiton-details-btn")
								.click(
										function() {
														
											text = '';
											if ($("#yearOfExamHssc").val() == '')
												$("#qualifyingExamNumberLabel")
														.css('visibility',
																'visible');
											else if ($("#schoolCollegeName")
													.val() == '')
												$("#schoolCollegeNameLabel")
														.css('visibility',
																'visible');
											else if ($("#board").val() == '')
												$("#boardLabel")
														.css('visibility',
																'visible');
											else if ($("#qualifyingExamNumber").val() == 0)
												return false;
											else {
												text = {"qualifyingExamNumber":$("#qualifyingExamNumber").val(), "yearOfExamHssc":$("#yearOfExamHssc").val(), "schoolCollegeName":$("#schoolCollegeName").val(), "board" :$("#board").val(), "marksObtained":$("#marksObtained").val(), "grade":$("#grade").val(), "outOfMarks":$("#outOfMarks").val(), "percentage":$("#percentage").val(), "attemptsTaken":$("#attemptsTaken").val()};
												lastQualifyingArray[$("#qualifyingExamNumber").val()] = text;
												
												 if(updateOperation == true){
													 $("#last_qualifying_tr_id_"+$("#qualifyingExamNumber").val()).remove();
													updateOperation = false;
												} 
													
												$("#last_qualifying_table").append("<tr class=\"odd\" id=\"last_qualifying_tr_id_"+$("#qualifyingExamNumber").val()+"\">"+
														"<td>"+
														"	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateLastQualificaitonDetails("+$("#qualifyingExamNumber").val()+")\">"+
														"		<span class=\"glyphicon glyphicon-pencil\"></span>"+
														"	</button>"+
														"	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteLastQualificaitonDetails("+$("#qualifyingExamNumber").val()+")\">"+
														"		<span class=\"glyphicon glyphicon-remove\"></span>"+
														"	</button>"+
														"</td>"+
														""+
														"<td>"+$("#qualifyingExamNumber option[value='"+$("#qualifyingExamNumber").val()+"']").text()+"</td>"+
														"<td>"+$("#yearOfExamHssc").val()+"</td>"+
														"<td>"+$("#schoolCollegeName").val()+"</td>"+
														"<td>"+$("#percentage").val()+"</td>"+
														"<td>"+$("#board").val()+"</td>"+
														"</tr>");
												
												removedLastQualifyingExamOptions.push({"id":$("#qualifyingExamNumber").val(), "text":$("#qualifyingExamNumber option[value='"+$("#qualifyingExamNumber").val()+"']").text()});
												$("#qualifyingExamNumber option[value='"+$("#qualifyingExamNumber").val()+"']").remove();
												$("#qualifyingExamNumber").val(0).change();
												
											}

										});
					});

	function updateLastQualificaitonDetails(id){
		updateOperation = true;
		var flag = false;
		
		$.each($("#qualifyingExamNumber option"), function(){
			if($(this).attr('value') == id)
				flag = true;
		});
		
		$.each(removedLastQualifyingExamOptions, function(index, option){
			if(option.id == id && flag == false){
				$("#qualifyingExamNumber").append("<option value=\""+option.id+"\">"+option.text+"</option>");
			}
			//removedLastQualifyingExamOptions[id] = {"id":-1, "text":""};
		});
		
		$.each(lastQualifyingArray, function(index, object){
			if(index == id){
				$("#qualifyingExamNumber").val(object.qualifyingExamNumber);
				$("#yearOfExamHssc").val(object.yearOfExamHssc);
				$("#schoolCollegeName").val(object.schoolCollegeName);
				$("#board").val(object.board);
				$("#marksObtained").val(object.marksObtained);
				$("#grade").val(object.grade);
				$("#outOfMarks").val(object.outOfMarks);
				$("#percentage").val(object.percentage);
				$("#attemptsTaken").val(object.attemptsTaken);
			}
		});
	}
	
	function deleteLastQualificaitonDetails(id){
		$("#last_qualifying_tr_id_"+id).remove();
		$.each(removedLastQualifyingExamOptions, function(index, option){
			if(option.id == id){
				$("#qualifyingExamNumber").append("<option value=\""+option.id+"\">"+option.text+"</option>");
			}
		});
		lastQualifyingArray[id] = {"qualifyingExamId":-1, "text":""};
	}
	
	function setStudentData(response) {
		var jsonOb = JSON.parse(response);

		$("#registrationNumber").val(
				jsonOb.studentAdmissionEntity.registrationNumber);
		$("#title").val(jsonOb.studentAdmissionEntity.title).change();
		$("#dateOfBirthString").val(
				jsonOb.studentAdmissionEntity.dateOfBirthString);
		$("#identityMark1").val(jsonOb.studentAdmissionEntity.identityMark1);
		$("#fatherName").val(jsonOb.studentAdmissionEntity.fatherName);
		$("#enrollmentNumber").val(
				jsonOb.studentAdmissionEntity.enrollmentNumber);
		$("#studentName").val(jsonOb.studentAdmissionEntity.studentName);
		$("#gender-" + jsonOb.studentAdmissionEntity.gender).attr('checked',
				'checked');
		$("#identityMark2").val(jsonOb.studentAdmissionEntity.identityMark2);

		$("#studentFirstName").val(
				jsonOb.studentAdmissionEntity.studentFirstName);
		$("#studentLastName")
				.val(jsonOb.studentAdmissionEntity.studentLastName);
		$("#nationalityId").val(jsonOb.studentAdmissionEntity.nationalityId);
		$("#reserveCategory-" + jsonOb.studentAdmissionEntity.reserveCategory)
				.attr('checked', 'checked');
		$("#ebc-" + jsonOb.studentAdmissionEntity.ebc).attr('checked',
				'checked');
		$("#admissionCategoryNumber").val(
				jsonOb.studentAdmissionEntity.admissionCategoryNumber);
		$("#email").val(jsonOb.studentAdmissionEntity.email);
		$("#studentMobileNumber").val(
				jsonOb.studentAdmissionEntity.studentMobileNumber);
		$("#studentMiddleName").val(
				jsonOb.studentAdmissionEntity.studentMiddleName);
		$("#bloodGroupId").val(jsonOb.studentAdmissionEntity.bloodGroupId);
		$("#religionId").val(jsonOb.studentAdmissionEntity.religionId);
		$("#annualIncome").val(jsonOb.studentAdmissionEntity.annualIncome);
		$("#studentLandlineNumber").val(
				jsonOb.studentAdmissionEntity.studentLandlineNumber);
		$("#married-" + jsonOb.studentAdmissionEntity.married).attr('checked',
				'checked');
		$("#emergencyContactNumber").val(
				jsonOb.studentAdmissionEntity.emergencyContactNumber);
		$("#studentImageTag").attr(
				'src',
				"../resources/uploads/academic/admission/"
						+ jsonOb.studentAdmissionEntity.studentPhoto);
		$("#studentSignatureTag").attr(
				'src',
				"../resources/uploads/academic/admission/"
						+ jsonOb.studentAdmissionEntity.studentSignature);

		$("#fatherOccupationId").val(
				jsonOb.studentAddressEntity.fatherOccupationId).change();
		$("#fatherEducationId").val(
				jsonOb.studentAddressEntity.fatherEducationId).change();
		$("#fatherFlatNumber")
				.val(jsonOb.studentAddressEntity.fatherFlatNumber);
		$("#fatherStreetName")
				.val(jsonOb.studentAddressEntity.fatherStreetName);
		$("#fatherOfficeCity")
				.val(jsonOb.studentAddressEntity.fatherOfficeCity).change();
		$("#fatherOfficeDistrict").val(
				jsonOb.studentAddressEntity.fatherOfficeDistrict).change();
		$("#fatherOfficePINCode").val(
				jsonOb.studentAddressEntity.fatherOfficePINCode);
		$("#fatherEmailid").val(jsonOb.studentAddressEntity.fatherEmailid);
		$("#fatherDesignation").val(
				jsonOb.studentAddressEntity.fatherDesignation).change();
		$("#fatherOfficeLocality").val(
				jsonOb.studentAddressEntity.fatherOfficeLocality);
		$("#fatherOfficeLandmark").val(
				jsonOb.studentAddressEntity.fatherOfficeLandmark);
		$("#fatherOtherCityName").val(
				jsonOb.studentAddressEntity.fatherOtherCityName);
		$("#localOtherDistrictName").val(
				jsonOb.studentAddressEntity.localOtherDistrictName);
		$("#fatherOfficeState").val(
				jsonOb.studentAddressEntity.fatherOfficeState).change();
		$("#fatherMobileNumber").val(
				jsonOb.studentAddressEntity.fatherMobileNumber);
		$("#fatherOfficeNumber").val(
				jsonOb.studentAddressEntity.fatherOfficeNumber);

		$("#motherEducation").val(jsonOb.studentAddressEntity.motherEducation)
				.change();
		$("#motherFlatNumber")
				.val(jsonOb.studentAddressEntity.motherFlatNumber);
		$("#motherOfficeStreetName").val(
				jsonOb.studentAddressEntity.motherOfficeStreetName);
		$("#motherOfficeCity")
				.val(jsonOb.studentAddressEntity.motherOfficeCity).change();
		$("#motherOfficeDistrict").val(
				jsonOb.studentAddressEntity.motherOfficeDistrict).change();
		$("#motherOfficePINCode").val(
				jsonOb.studentAddressEntity.motherOfficePINCode);
		$("#motherEmailid").val(jsonOb.studentAddressEntity.motherEmailid);
		$("#motherMaidenName")
				.val(jsonOb.studentAddressEntity.motherMaidenName);
		$("#motherDesignation").val(
				jsonOb.studentAddressEntity.motherDesignation).change();
		$("#motherOfficeLocality").val(
				jsonOb.studentAddressEntity.motherOfficeLocality);
		$("#motherOfficeLandmark").val(
				jsonOb.studentAddressEntity.motherOfficeLandmark);
		$("#motherOtherCityName").val(
				jsonOb.studentAddressEntity.motherOtherCityName);
		$("#motherOtherDistrictName").val(
				jsonOb.studentAddressEntity.motherOtherDistrictName);
		$("#motherOfficeState").val(
				jsonOb.studentAddressEntity.motherOfficeState).change();
		$("#motherMobileNumber").val(
				jsonOb.studentAddressEntity.motherMobileNumber);
		$("#motherOfficeNumber").val(
				jsonOb.studentAddressEntity.motherOfficeNumber);

		$("#localFlatNumber").val(jsonOb.studentAddressEntity.localFlatNumber);
		$("#localStreetName").val(jsonOb.studentAddressEntity.localStreetName);
		$("#localCity").val(jsonOb.studentAddressEntity.localCity).change();
		$("#localDistrictId").val(jsonOb.studentAddressEntity.localDistrictId)
				.change();
		$("#localPINCode").val(jsonOb.studentAddressEntity.localPINCode);
		$("#localLocality").val(jsonOb.studentAddressEntity.localLocality);
		$("#localLandmark").val(jsonOb.studentAddressEntity.localLandmark);
		$("#localOthercityName").val(
				jsonOb.studentAddressEntity.localOthercityName);
		$("#localOtherDistrictName").val(
				jsonOb.studentAddressEntity.localOtherDistrictName);
		$("#localStateId").val(jsonOb.studentAddressEntity.localStateId)
				.change();
		$("#localPostOffice").val(jsonOb.studentAddressEntity.localPostOffice);

		$("#permenantFlatNumber").val(
				jsonOb.studentAddressEntity.permenantFlatNumber);
		$("#permenantStreetName").val(
				jsonOb.studentAddressEntity.permenantStreetName);
		$("#permenantCity").val(jsonOb.studentAddressEntity.permenantCity)
				.change();
		$("#permenantDistrictId").val(
				jsonOb.studentAddressEntity.permenantDistrictId).change();
		$("#permenantPINCode")
				.val(jsonOb.studentAddressEntity.permenantPINCode);
		$("#permenantLocality").val(
				jsonOb.studentAddressEntity.permenantLocality);
		$("#permenantLandmark").val(
				jsonOb.studentAddressEntity.permenantLandmark);
		$("#permenantOthercityName").val(
				jsonOb.studentAddressEntity.permenantOthercityName);
		$("#permenantOtherDistrictName").val(
				jsonOb.studentAddressEntity.permenantOtherDistrictName);
		$("#permenantStateId")
				.val(jsonOb.studentAddressEntity.permenantStateId).change();
		$("#permenantPostOffice").val(
				jsonOb.studentAddressEntity.permenantPostOffice);

		$("#guardianName").val(jsonOb.studentAddressEntity.guardianName);
		$("#guardianOccupationName").val(
				jsonOb.studentAddressEntity.guardianOccupationName);
		$("#guardianFlatNumber").val(
				jsonOb.studentAddressEntity.guardianFlatNumber);
		$("#guardianStreetName").val(
				jsonOb.studentAddressEntity.guardianStreetName);
		$("#guardianCity").val(jsonOb.studentAddressEntity.guardianCity)
				.change();
		$("#guardianDistrictId").val(
				jsonOb.studentAddressEntity.guardianDistrictId).change();
		$("#guardianPINCode").val(jsonOb.studentAddressEntity.guardianPINCode);
		$("#relationWithGuardian").val(
				jsonOb.studentAddressEntity.relationWithGuardian);
		$("#guardianPhone").val(jsonOb.studentAddressEntity.guardianPhone);
		$("#guardianLocality")
				.val(jsonOb.studentAddressEntity.guardianLocality);
		$("#guardianLandmark")
				.val(jsonOb.studentAddressEntity.guardianLandmark);
		$("#guardianOthercityName").val(
				jsonOb.studentAddressEntity.guardianOthercityName);
		$("#guardianOtherDistrictName").val(
				jsonOb.studentAddressEntity.guardianOtherDistrictName);
		$("#guardianStateId").val(jsonOb.studentAddressEntity.guardianStateId)
				.change();

		$("#admissionDateString").val(
				jsonOb.studentAdmissionEntity.admissionDateString);
		$("#branchNumber").val(jsonOb.studentAdmissionEntity.branchNumber)
				.change();
		$("#admissionBatch").val(jsonOb.studentAdmissionEntity.admissionBatch)
				.change();
		$("#scholership-" + jsonOb.studentAdmissionEntity.scholership).attr(
				'checked', 'checked');
		$("#local-" + jsonOb.studentAdmissionEntity.local).attr('checked',
				'checked');
		$("#semesterId").val(jsonOb.studentAdmissionEntity.semesterId).change();
		$("#degreeId").val(jsonOb.studentAdmissionEntity.degreeId).change();
		$("#paymentType").val(jsonOb.studentAdmissionEntity.paymentType)
				.change();
		$("#admittedToYear").val(jsonOb.studentAdmissionEntity.admittedToYear)
				.change();
		$("#scholarshipDetails").val(
				jsonOb.studentAdmissionEntity.scholarshipDetails).change();
		$("#statusStudent").val(jsonOb.studentAdmissionEntity.statusStudent)
				.change();

		$("#birthPlace").val(jsonOb.studentAdmissionEntity.birthPlace);
		$("#motherTongueId").val(jsonOb.studentAdmissionEntity.motherTongueId)
				.change();

		if (jsonOb.studentAdmissionEntity.otherLanguage != null)
			$.each(jsonOb.studentAdmissionEntity.otherLanguage.split(","),
					function(language) {
						$("#otherLanguage-" + language).attr('checked',
								'checked');
					});

		$("#height").val(jsonOb.studentAdmissionEntity.height);
		$("#urban-" + jsonOb.studentAdmissionEntity.urban).attr('checked',
				'checked');
		$("#passportNumber").val(jsonOb.studentAdmissionEntity.passportNumber);
		$("#bankAddress").val(jsonOb.studentAdmissionEntity.bankAddress);
		$("#bankIFSCCode").val(jsonOb.studentAdmissionEntity.bankIFSCCode);
		$("#physicallyHandicapped").val(
				jsonOb.studentAdmissionEntity.physicallyHandicapped);
		$("#visaNumber").val(jsonOb.studentAdmissionEntity.visaNumber);
		$("#voterNumber").val(jsonOb.studentAdmissionEntity.voterNumber);
		$("#hosteler-" + jsonOb.studentAdmissionEntity.hosteler).attr(
				'checked', 'checked');
		$("#nprStatus-" + jsonOb.studentAdmissionEntity.nprStatus).attr(
				'checked', 'checked');
		$("#transport-" + jsonOb.studentAdmissionEntity.transport).attr(
				'checked', 'checked');
		$("#routeNumber").val(jsonOb.studentAdmissionEntity.routeNumber);
		$("#numberOfBrother")
				.val(jsonOb.studentAdmissionEntity.numberOfBrother);
		$("#weight").val(jsonOb.studentAdmissionEntity.weight);
		$("#countryDomicile")
				.val(jsonOb.studentAdmissionEntity.countryDomicile);
		$("#bankNumber").val(jsonOb.studentAdmissionEntity.bankNumber).change();
		$(
				"#physicallyHandicapped-"
						+ jsonOb.studentAdmissionEntity.physicallyHandicapped)
				.attr("checked", "checked");
		$("#typeOfPhysicallyHandicap").val(
				jsonOb.studentAdmissionEntity.typeOfPhysicallyHandicap);
		$("#panNumber").val(jsonOb.studentAdmissionEntity.panNumber);
		$("#adharCardNumber")
				.val(jsonOb.studentAdmissionEntity.adharCardNumber);
		$("#nprNumber").val(jsonOb.studentAdmissionEntity.nprNumber);
		$("#routeAmount").val(jsonOb.studentAdmissionEntity.routeAmount);
		$("#medicalDetails").val(jsonOb.studentAdmissionEntity.medicalDetails);
		$("#medicalProblem-" + jsonOb.studentAdmissionEntity.medicalProblem)
				.attr("checked", "checked");
		$("#numberOfSister").val(jsonOb.studentAdmissionEntity.numberOfSister);
		$("#leftThumbTag").attr(
				'src',
				"../resources/uploads/academic/admission/"
						+ jsonOb.studentAdmissionEntity.leftThumb);
		$("#rightThumbTag").attr(
				'src',
				"../resources/uploads/academic/admission/"
						+ jsonOb.studentAdmissionEntity.rightThumb);

		if (jsonOb.studentAdmissionEntity.documentList != null)
			$.each(jsonOb.studentAdmissionEntity.documentList.split(","),
					function(index, document) {
						console.log(document);
						$("#document-" + document).attr("checked", "checked");
					});

	}

	function loadDistricts(localStateId) {
		var text = '';

		if (staticContents.districtsLoaded == true) {
			text = "<option selected=\"selected\" value=\"0\">Please Select District</option>";
			$.each(staticContents.districtJson, function(index, districtOb) {
				if (districtOb.stateId == localStateId)
					text += "<option value=\""+districtOb.id+"\">"
							+ districtOb.districtName + "</option>";
			});
		} else {
			$
					.ajax({
						async : false,
						url : "../resources/uploads/districts.json",
						type : "GET",
						success : function(response) {
							//alert(JSON.stringify(response));
							var jsonOb = JSON.parse(JSON.stringify(response));
							text = "<option selected=\"selected\" value=\"0\">Please Select District</option>";
							$
									.each(
											jsonOb,
											function(index, districtOb) {
												if (districtOb.stateId == localStateId)
													text += "<option value=\""+districtOb.id+"\">"
															+ districtOb.districtName
															+ "</option>";
											});
							staticContents.districtsLoaded = true;
							staticContents.districtJson = jsonOb;
						},
						error : function() {
						},
					});

		}

		return text;
	}

	function loadCities(localDistrictId) {
		var text = '';

		if (staticContents.citiesLoaded == true) {
			text = "<option selected=\"selected\" value=\"0\">Please Select City</option>";
			$.each(staticContents.cityJson, function(index, cityOb) {
				if (cityOb.districtId == localDistrictId)
					text += "<option value=\""+cityOb.id+"\">"
							+ cityOb.cityName + "</option>";
			});
		} else {
			$
					.ajax({
						async : false,
						url : "../resources/uploads/cities.json",
						type : "GET",
						success : function(response) {
							//alert(JSON.stringify(response));
							var jsonOb = JSON.parse(JSON.stringify(response));
							text = "<option selected=\"selected\" value=\"0\">Please Select City</option>";
							$.each(jsonOb, function(index, cityOb) {
								if (cityOb.districtId == localDistrictId)
									text += "<option value=\""+cityOb.id+"\">"
											+ cityOb.cityName + "</option>";
							});

							staticContents.citiesLoaded = true;
							staticContents.cityJson = jsonOb;
						},
						error : function() {
						},
					});

		}

		return text;
	}
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

								<div class="grid-header text">Admission Details</div>


							</div>
							<!-- jaskirat code start here -->
							<form action="../academic/admission/save" method="post"
								id="add-update-student-form" enctype="multipart/form-data">
								<!-- 	<input type="hidden" name=""> -->
								<div id="tabs">
									<ul>
										<li><a href="#tabs-1">General Information</a></li>
										<li><a href="#tabs-2">Address Details and Contact</a></li>
										<li><a href="#tabs-3">Admission Details</a></li>
										<li><a href="#tabs-4">Personal Information</a></li>
										<li><a href="#tabs-5">Family Member Details</a></li>
										<li><a href="#tabs-6">Student Last Qualification</a></li>
										<li><a href="#tabs-7">Entrance Exam Score</a></li>
										<li><a href="#tabs-8">Documentation List</a></li>
									</ul>

									<div id="tabs-1" style="padding: 17px 0px 15px;">
										<div class="row">
											<!--Outer row start here -->
											<!-- General Information tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span> Information</span>
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
																<i class="fa fa-table"></i> <span>General
																	Information</span>
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
																					class="control-label">Identification Number
																					<span style="color: #FF0000; font-weight: bold">*</span>
																				</span>
																			</div>
																			<div class="col-sm-6">
																				<input name="registrationNumber" type="text"
																					maxlength="40" id="registrationNumber" tabindex="3"
																					class="form-control"
																					placeholder="Identification Number" />
																			</div>
																			<div class="col-sm-1">
																				<label style="top: 7px"
																					class="glyphicon glyphicon-search" title="search"></label>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Title</span>

																			</div>
																			<div class="col-sm-7">
																				<select name="title" data-toggle="modal"
																					data-original-title="Add to Project" id="title"
																					class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<option selected="selected" value="1">Mr</option>
																					<option selected="selected" value="2">Ms</option>
																					<option selected="selected" value="3">Mrs</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Date of Birth <span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input name="dateOfBirthString" type="text"
																					value="12-12-2015" maxlength="40"
																					id="dateOfBirthString" tabindex="3"
																					class="form-control" placeholder="Date of Birth">
																				<span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Identification Mark<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input name="identityMark1" type="text"
																					maxlength="100" id="identityMark1" tabindex="4"
																					class="form-control"
																					placeholder="Identification Mark">


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Father Name</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="fatherName" type="text" maxlength="40"
																					id="fatherName" tabindex="5" class="form-control"
																					placeholder="Father Name">
																			</div>
																		</div>
																	</div>


																</div>

															</div>


															<!--left div end here -->

															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Enrollment Number <span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input name="enrollmentNumber" type="text"
																					maxlength="40" id="enrollmentNumber" tabindex="3"
																					class="form-control"
																					placeholder="Enrollment Number" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Student Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="studentName" type="text" maxlength="40"
																					id="studentName" tabindex="3" class="form-control"
																					placeholder="Student Name" />

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Gender <span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input type="radio" name="gender" id="gender-1"
																					value="1" /> <label>Male</label> <input
																					type="radio" name="gender" id="gender-2" value="2" />
																				<label>Female</label> <input type="radio"
																					name="gender" id="gender-3" value="3" /> <label>Transgender</label>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Identification Mark 2
																					<span style="color: #FF0000; font-weight: bold">*</span>
																				</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="identityMark2" type="text"
																					maxlength="100" id="identityMark2" tabindex="4"
																					class="form-control"
																					placeholder="Identification Mark 2 ">

																			</div>
																		</div>
																	</div>


																</div>

															</div>

															<!--right div end here -->
															<div class="col-xs-12 col-sm-12 bg-primary"
																style="height: 37px; border-radius: 5px; text-align: center; padding: 10px;">(The
																above information is to be filled exactly as per
																SSC/CBSE/ICSE Certificate)</div>
														</div>


														<!--row 11 div end here -->


														<!-- Basic Information tab start here -->


														<div class="box-header" style="top: 5px">
															<div class="box-name">
																<i class="fa fa-table"></i> <span>Basic Details</span>
															</div>


														</div>


														<!-- Basic Information tab end here -->

														<!--left row 12 basic info start here -->
														<div class="row my-bg-info">

															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Student First Name <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input name="studentFirstName" type="text"
																					maxlength="40" id="studentFirstName" tabindex="3"
																					class="form-control"
																					placeholder="Student First Name" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label"> Student Last Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="studentLastName" type="text"
																					maxlength="40" id="studentLastName" tabindex="3"
																					class="form-control"
																					placeholder="Student Last Name" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Nationality</span>

																			</div>
																			<div class="col-sm-7">
																				<select name="nationalityId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="nationalityId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${nationalityList}"
																						var="nationality">
																						<option value="${nationality.id}">${nationality.nationality}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Reservation Category<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input type="radio" name="reserveCategory"
																					value="true" id="reserveCategory-true" /> <label>Yes</label>
																				<input type="radio" name="reserveCategory"
																					value="false" id="reserveCategory-false" /> <label>No</label>


																				<span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">EBC<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input type="radio" name="ebc" value="true"
																					id="ebc-true" /> <label>Yes</label> <input
																					type="radio" name="ebc" value="false"
																					id="ebc-false" /> <label>No</label>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Admission Category</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="admissionCategoryNumber"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="admissionCategoryNumber" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${categoryList}" var="category">
																						<option value="${category.id}">${category.category}</option>
																					</c:forEach>
																				</select>

																			</div>
																		</div>
																	</div>

																	<!-- photo code state here -->
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Photo</span>
																			</div>
																			<div class="col-sm-7">
																				<input type="file" name="studentImage"
																					id="studentImage" title="Please Select Photo">
																				<!-- onchange="showImage()" -->


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-5"></div>
																		<div class="col-sm-7">

																			<img id="studentImageTag"
																				style="border: 1px solid #A9E6F9"
																				src="./resources/No_image_available.svg"
																				style="height: 75px; width: 75px;">


																		</div>
																	</div>
																	<!-- photo end state here -->

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Student Email</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="email" type="text" maxlength="40"
																					id="email" tabindex="5" class="form-control"
																					placeholder="Student Email">
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Student Mobile Number</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="studentMobileNumber" type="text"
																					maxlength="40" id="studentMobileNumber"
																					tabindex="5" class="form-control"
																					placeholder="Student Mobile Number">
																			</div>
																		</div>
																	</div>




																	<!-- photo code end here -->


																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Student Middle Name<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input name="studentMiddleName" type="text"
																					maxlength="40" id="studentMiddleName" tabindex="3"
																					class="form-control"
																					placeholder="Student Middle Name" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Blood Group</span>

																			</div>
																			<div class="col-sm-7">
																				<select name="bloodGroupId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="bloodGroupId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${bloodGroupList}"
																						var="bloodGroup">
																						<option value="${bloodGroup.id}">${bloodGroup.bloodGroup}</option>
																					</c:forEach>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Religion </span>


																			</div>
																			<div class="col-sm-7">
																				<select name="religionId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="religionId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${religionList}" var="religion">
																						<option value="${religion.id}">${religion.religion}</option>
																					</c:forEach>
																				</select> <span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Family Annual Income</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="annualIncome" type="text"
																					maxlength="100" id="annualIncome" value="0"
																					tabindex="4" class="form-control"
																					placeholder="Family Annual Income">

																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label"> Landline Number</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="studentLandlineNumber" type="text"
																					maxlength="100" id="studentLandlineNumber"
																					tabindex="4" class="form-control"
																					placeholder="Landline Number">

																			</div>
																		</div>
																	</div>
																	<!-- sign code state here -->
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Signature</span>
																			</div>
																			<div class="col-sm-7">
																				<input type="file" name="studentSignatureImage"
																					id="studentSignature"
																					title="Please Select Signature">
																				<!-- onchange="showImage()" -->


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-5"></div>
																		<div class="col-sm-7">

																			<img id="studentSignatureTag"
																				style="border: 1px solid #A9E6F9"
																				src="./resources/No_image_available.svg"
																				style="height: 75px; width: 75px;">


																		</div>
																	</div>
																	<!-- sign end state here -->

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Marital Status</span>

																			</div>

																			<div class="col-sm-7">
																				<input type="radio" name="married" value="false"
																					id="married-false" /> <label>Single</label> <input
																					type="radio" name="married" value="true"
																					id="married-true" /> <label>Married</label>

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Emergency Contact
																					Number</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="emergencyContactNumber" type="text"
																					maxlength="40" id="emergencyContactNumber"
																					tabindex="5" class="form-control"
																					placeholder="Emergency Contact Number">
																			</div>
																		</div>
																	</div>




																</div>

															</div>

															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="reset-general-information-btn"
																					type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="button"
																			id="save-general-information-btn" disabled="disabled"
																			name="submit_create_edit_team"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="submit_button">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>


														</div>
														<!--row 12 div end here -->

													</div>
												</div>
											</div>
											<!-- General Information tab end here -->



											<!--  Parent Detail tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Parent Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 13 start here -->
														<div class="row my-bg-warning">


															<!-- Father header Information tab start here -->


															<div class="box-header" style="top: 5px;">
																<div class="box-name">
																	<i class="fa fa-table"></i> <span>Father Details</span>
																</div>


															</div>


															<!-- Father header Information tab end here -->

															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label"> If Not Applicable <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input type=checkbox
																					name="father-details-applicable"
																					id="is-father-details-applicable" /> <label>Yes</label>

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Father's Occupation</span>

																			</div>
																			<div class="col-sm-7">
																				<select name="fatherOccupationId"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="fatherOccupationId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${occupationList}"
																						var="occupation">
																						<option value="${occupation.id}">${occupation.occupation}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Father Education<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<select name="fatherEducationId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="fatherEducationId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${educationList}" var="education">
																						<option value="${education.id}">${education.education}</option>
																					</c:forEach>
																				</select> <span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Flat No/ House No<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input name="fatherFlatNumber" type="text"
																					maxlength="40" id="fatherFlatNumber" tabindex="5"
																					class="form-control"
																					placeholder="Flat No/ House No">


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Father Office Street
																					Name</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="fatherStreetName" type="text"
																					maxlength="40" id="fatherStreetName" tabindex="5"
																					class="form-control"
																					placeholder="Father Office Street Name">



																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Father Office City</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="fatherOfficeCity" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="fatherOfficeCity" class="form-control">
																					<option selected="selected" value="0">Please
																						Select City</option>
																				</select>
																			</div>
																		</div>

																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Father Office District</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="fatherOfficeDistrict"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="fatherOfficeDistrict" class="form-control">
																					<option selected="selected" value="0">Please
																						Select District</option>
																				</select>
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Father Office PIN Code</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="fatherOfficePINCode" type="text"
																					maxlength="40" id="fatherOfficePINCode"
																					tabindex="5" class="form-control"
																					placeholder="Father Office PIN Cod">



																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Father Email Id</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="fatherEmailid" type="text"
																					maxlength="40" id="fatherEmailid" tabindex="5"
																					class="form-control" placeholder="Father Email Id">

																			</div>
																		</div>
																	</div>




																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label"> Father's Designation<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input name="fatherDesignation" type="text"
																					maxlength="40" id="fatherDesignation" tabindex="3"
																					class="form-control"
																					placeholder="Father's Designation" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Father Office Locality</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="fatherOfficeLocality" type="text"
																					maxlength="100" id="fatherOfficeLocality"
																					tabindex="4" class="form-control"
																					placeholder="Father Office Locality">

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Father Office Landmark
																				</span>


																			</div>
																			<div class="col-sm-7">
																				<input name="fatherOfficeLandmark" type="text"
																					maxlength="100" id="fatherOfficeLandmark"
																					tabindex="4" class="form-control"
																					placeholder="Father Office Landmark">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other City Name</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="fatherOtherCityName" type="text"
																					maxlength="100" id="fatherOtherCityName"
																					tabindex="4" class="form-control"
																					placeholder="Other City Name">

																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other District Name</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="localOtherDistrictName" type="text"
																					maxlength="100" id="localOtherDistrictName"
																					tabindex="4" class="form-control"
																					placeholder="Other District Name">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Father Office State</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="fatherOfficeState" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="fatherOfficeState" class="form-control">
																					<option selected="selected" value="0">Please
																						State</option>
																				</select>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Father's Mobile Number</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="fatherMobileNumber" type="text"
																					maxlength="100" id="fatherMobileNumber"
																					tabindex="4" class="form-control"
																					placeholder="Father's Mobile Number">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Father's Office Phone
																					Number</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="fatherOfficeNumber" type="text"
																					maxlength="40" id="fatherOfficeNumber" tabindex="5"
																					class="form-control"
																					placeholder="Father's Office Phone Number">

																			</div>
																		</div>
																	</div>



																</div>

															</div>


															<!--right div end here -->



														</div>
														<!--row 13 div end here -->



														<!-- mother header Information tab start here -->


														<div class="box-header" style="top: 5px;">
															<div class="box-name">
																<i class="fa fa-table"></i> <span>Mother Details</span>
															</div>


														</div>


														<!-- mother header Information tab end here -->

														<!--left row 14 mother  start here -->
														<div class="row my-bg-danger">

															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">If Not Applicable <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input type="radio" name="mother-details-applicable"
																					id="is-mother-details-applicable" /> <label>Yes</label>
																				<input type="radio" name="mother-details-applicable"
																					id="is-mother-housewife" /> <label>HouseWife</label>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Mother's Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Mother's Name">
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Mother Education<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<select name="motherEducation" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="motherEducation" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<c:forEach items="${educationList}" var="education">
																						<option value="${education.id}">${education.education}</option>
																					</c:forEach>
																				</select> <span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Flat No/ House No<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input name="motherFlatNumber" type="text"
																					maxlength="40" id="motherFlatNumber" tabindex="5"
																					class="form-control"
																					placeholder="Flat No/ House No">


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Mother's Office Street
																					Name</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="motherOfficeStreetName" type="text"
																					maxlength="40" id="motherOfficeStreetName"
																					tabindex="5" class="form-control"
																					placeholder="Mother's Office Street Name">
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Mother's Office City</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="motherOfficeCity" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="motherOfficeCity" class="form-control">
																					<option selected="selected" value="0">Please
																						Select City</option>
																				</select>
																			</div>
																		</div>

																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Mother's Office
																					District</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="motherOfficeDistrict"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="motherOfficeDistrict" class="form-control">
																					<option selected="selected" value="0">Please
																						Select District</option>
																				</select>
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Mother's Office PIN
																					Code</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="motherOfficePINCode" type="text"
																					maxlength="40" id="motherOfficePINCode"
																					tabindex="5" class="form-control"
																					placeholder="Mother's Office PIN Cod">
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Mother's Email </span>
																			</div>
																			<div class="col-sm-7">
																				<input name="motherEmailid" type="text"
																					maxlength="40" id="motherEmailid" tabindex="5"
																					class="form-control"
																					placeholder="Mother's Email Id">
																			</div>
																		</div>
																	</div>




																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">

																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label"> Mother's Maiden Name<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input name="motherMaidenName" type="text"
																					maxlength="40" id="motherMaidenName" tabindex="3"
																					class="form-control"
																					placeholder="Mother's Maiden Name" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>



																	<div class="form-group">

																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label"> Mother's Designation<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<input name="motherDesignation" type="text"
																					maxlength="40" id="motherDesignation" tabindex="3"
																					class="form-control"
																					placeholder="Mother's Designation" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Mother's Office
																					Locality</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="motherOfficeLocality" type="text"
																					maxlength="100" id="motherOfficeLocality"
																					tabindex="4" class="form-control"
																					placeholder="Mother's Office Locality">

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Mother's Office
																					Landmark </span>


																			</div>
																			<div class="col-sm-7">
																				<input name="motherOfficeLandmark" type="text"
																					maxlength="100" id="motherOfficeLandmark"
																					tabindex="4" class="form-control"
																					placeholder="Mother's Office Landmark">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other City Name</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="motherOtherCityName" type="text"
																					maxlength="100" id="motherOtherCityName"
																					tabindex="4" class="form-control"
																					placeholder="Other City Name">

																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other District Name</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="motherOtherDistrictName" type="text"
																					maxlength="100" id="motherOtherDistrictName"
																					tabindex="4" class="form-control"
																					placeholder="Other District Name">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Mother's Office State</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="motherOfficeState" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="motherOfficeState" class="form-control">
																					<option selected="selected" value="0">Please
																						Mother's Office State</option>
																				</select>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Mother's Mobile Number</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="motherMobileNumber" type="text"
																					maxlength="100" id="motherMobileNumber"
																					tabindex="4" class="form-control"
																					placeholder="Mother's's Mobile Number">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Mother's Office Phone
																					Number</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="motherOfficeNumber" type="text"
																					maxlength="40" id="motherOfficeNumber" tabindex="5"
																					class="form-control"
																					placeholder="Mother's Office Phone Number">

																			</div>
																		</div>
																	</div>



																</div>

															</div>


															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="reset-parents-details-btn" type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="button" name="submit_create_edit_team"
																			id="save-parents-details-btn" disabled="disabled"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>


														</div>
														<!--row 14 div end here -->
													</div>
												</div>

											</div>
											<!-- Parents Detail tab end here -->

										</div>

									</div>
									<!-- Tab1  end here -->


									<div id="tabs-2" style="padding: 17px 0px 15px;">
										<div class="row">
											<!-- All Address Information tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span> Address Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">

														<!-- Local Address  tab start here -->


														<div class="box-header" style="top: 5px;">
															<div class="box-name">
																<i class="fa fa-table"></i> <span>Local Address
																	Details </span>
															</div>


														</div>


														<!--Local Address tab end here -->



														<!--left row 1 1 permanent start here -->
														<div class="row my-bg-info">
															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Flat No/House No </span>
																			</div>
																			<div class="col-sm-7">
																				<input name="localFlatNumber" type="text"
																					maxlength="40" id="localFlatNumber" tabindex="3"
																					class="form-control"
																					placeholder="Enter Flat No/House No" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Street Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="localStreetName" type="text"
																					maxlength="40" id="localStreetName" tabindex="3"
																					class="form-control"
																					placeholder="Enter Street Name"> <span
																					id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">City </span>


																			</div>
																			<div class="col-sm-7">
																				<select name="localCity" data-toggle="modal"
																					data-original-title="Add to Project" id="localCity"
																					class="form-control">
																					<option selected="selected" value="0">Please
																						Select Local City</option>
																				</select>

																			</div>

																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">District</span>

																			</div>

																			<div class="col-sm-7">
																				<select name="localDistrictId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="localDistrictId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Local District</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Pin Code</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="localPINCode" type="text"
																					maxlength="40" id="localPINCode" tabindex="5"
																					class="form-control" placeholder="Enter Pin Code">

																			</div>
																		</div>
																	</div>


																</div>

															</div>


															<!--left div end here -->

															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Locality </span>


																			</div>
																			<div class="col-sm-7">
																				<input name="localLocality" type="text"
																					maxlength="40" id="localLocality" tabindex="3"
																					class="form-control" placeholder="Enter Locality" />
																				<span id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Land Mark</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="localLandmark" type="text"
																					maxlength="40" id="localLandmark" tabindex="3"
																					class="form-control" placeholder="Enter Land Mark" />

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Other City Name</span>


																			</div>
																			<div class="col-sm-7">
																				<input name="localOthercityName" type="text"
																					maxlength="40" id="localOthercityName" tabindex="3"
																					class="form-control"
																					placeholder="Enter Other City Name"> <span
																					id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other District Name </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="localOtherDistrictName" type="text"
																					maxlength="100" id="localOtherDistrictName"
																					tabindex="4" class="form-control"
																					placeholder="Enter Other District Name ">

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">State </span>

																			</div>

																			<div class="col-sm-7">
																				<select name="localStateId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="localStateId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select State</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Post Office </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="localPostOffice" type="text"
																					maxlength="100" id="localPostOffice" tabindex="4"
																					class="form-control"
																					placeholder="Enter Post Office ">

																			</div>
																		</div>
																	</div>



																</div>

															</div>



															<!--right div end here -->
															<div class="col-xs-12 col-sm-12 bg-primary"
																style="height: 37px; border-radius: 5px; text-align: center; padding: 10px;">(The
																above information is to be filled exactly)</div>
														</div>

														<!--row 11 local div end here -->
														<!-- Permanent Address tab start here -->

														<div class="box-header" style="top: 5px">
															<div class="box-name">
																<i class="fa fa-table"></i> <span>Permanent
																	Address</span>
															</div>



														</div>
														<!-- permanent address header tab end here -->
														<!--left row 1 1 permanent start here -->
														<div class="row my-bg-warning">
															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Copy Local Address </span>
																			</div>
																			<div class="col-sm-7">
																				<a href="#" id="copy-local-address">COPY</a> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Flat No/House No </span>
																			</div>
																			<div class="col-sm-7">
																				<input name="permenantFlatNumber" type="text"
																					maxlength="40" id="permenantFlatNumber"
																					tabindex="3" class="form-control"
																					placeholder="Enter Flat No/House No" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Street Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="permanantStreetName" type="text"
																					maxlength="40" id="permanantStreetName"
																					tabindex="3" class="form-control"
																					placeholder="Enter Street Name"> <span
																					id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">City </span>


																			</div>
																			<div class="col-sm-7">
																				<select name="permenantCityId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="permenantCityId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select City</option>
																				</select>

																			</div>

																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">District</span>

																			</div>

																			<div class="col-sm-7">
																				<select name="permenantDistrictId"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="permenantDistrictId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select District</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Pin Code</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="permenantPINCode" type="text"
																					maxlength="40" id="permenantPINCode" tabindex="5"
																					class="form-control" placeholder="Enter Pin Code">

																			</div>
																		</div>
																	</div>


																</div>

															</div>


															<!--left div end here -->

															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Locality </span>


																			</div>
																			<div class="col-sm-7">
																				<input name="permenantLocality" type="text"
																					maxlength="40" id="permenantLocality" tabindex="3"
																					class="form-control" placeholder="Enter Locality" />
																				<span id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Land Mark</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="permanantLandmark" type="text"
																					maxlength="40" id="permanantLandmark" tabindex="3"
																					class="form-control" placeholder="Enter Land Mark" />

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Other City Name</span>


																			</div>
																			<div class="col-sm-7">
																				<input name="permenantOthercityName" type="text"
																					maxlength="40" id="permenantOthercityName"
																					tabindex="3" class="form-control"
																					placeholder="Enter Other City Name"> <span
																					id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other District Name </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="permenantOtherDistrictName" type="text"
																					maxlength="100" id="permenantOtherDistrictName"
																					tabindex="4" class="form-control"
																					placeholder="Enter Other District Name ">

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">State </span>

																			</div>

																			<div class="col-sm-7">
																				<select name="permenantStateId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="permenantStateId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select State</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Post Office </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="permenantPostOffice" type="text"
																					maxlength="100" id="permenantPostOffice"
																					tabindex="4" class="form-control"
																					placeholder="Enter Post Office ">

																			</div>
																		</div>
																	</div>



																</div>

															</div>



															<!--right div end here -->
															<div class="col-xs-12 col-sm-12 bg-primary"
																style="height: 37px; border-radius: 5px; text-align: center; padding: 10px;">(The
																above information is to be filled exactly)</div>
														</div>


														<!--row 11  permanent div end here -->

														<!-- guardian Address header  tab start here -->


														<div class="box-header" style="top: 5px;">
															<div class="box-name">
																<i class="fa fa-table"></i> <span>guardian
																	Address Details </span>
															</div>


														</div>


														<!--guardian Address header tab end here -->

														<!--left row 1 1 guardian start here -->
														<div class="row my-bg-success">
															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">If Not Applicable <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input type="checkbox"
																					name="guardian-address-applicable"
																					id="is-guardian-address-applicable" /> <label>Yes</label>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Copy Permanent Address
																				</span>
																			</div>
																			<div class="col-sm-7">
																				<a href="#" id="copy-permanant-address">COPY</a> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Guardian Name </span>
																			</div>
																			<div class="col-sm-7">
																				<input name="guardianName" type="text"
																					maxlength="40" id="guardianName" tabindex="3"
																					class="form-control"
																					placeholder="Enter Flat No/House No" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Guardian Occupation </span>
																			</div>
																			<div class="col-sm-7">
																				<input name="guardianOccupationName" type="text"
																					maxlength="40" id="guardianOccupationName"
																					tabindex="3" class="form-control"
																					placeholder="Enter Flat No/House No" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Flat No/House No </span>
																			</div>
																			<div class="col-sm-7">
																				<input name="guardianFlatNo" type="text"
																					maxlength="40" id="guardianFlatNo" tabindex="3"
																					class="form-control"
																					placeholder="Enter Flat No/House No" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Street Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="guardianStreetName" type="text"
																					maxlength="40" id="guardianStreetName" tabindex="3"
																					class="form-control"
																					placeholder="Enter Street Name"> <span
																					id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">City </span>


																			</div>
																			<div class="col-sm-7">
																				<select name="guardianCity" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="guardianCity" class="form-control">
																					<option selected="selected" value="0">Please
																						Select City</option>
																				</select>

																			</div>

																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">District</span>

																			</div>

																			<div class="col-sm-7">
																				<select name="guardianDistrict" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="guardianDistrict" class="form-control">
																					<option selected="selected" value="0">Please
																						Select District</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Pin Code</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="guardianPINCode" type="text"
																					maxlength="40" id="guardianPINCode" tabindex="5"
																					class="form-control" placeholder="Enter Pin Code">
																			</div>
																		</div>
																	</div>


																</div>

															</div>


															<!--left div end here -->

															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Relation With Guardian
																				</span>


																			</div>
																			<div class="col-sm-7">
																				<input name="relationWithGuardian" type="text"
																					maxlength="40" id="relationWithGuardian"
																					tabindex="3" class="form-control"
																					placeholder="Enter Relation With Guardian " /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Guardian Phone Number</span>


																			</div>
																			<div class="col-sm-7">
																				<input name="guardianPhone" type="text"
																					maxlength="40" id="guardianPhone" tabindex="3"
																					class="form-control"
																					placeholder="Enter Guardian Phone Number" /> <span
																					id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Enter Locality </span>


																			</div>
																			<div class="col-sm-7">
																				<input name="guardianLocality" type="text"
																					maxlength="40" id="guardianLocality" tabindex="3"
																					class="form-control" placeholder="Enter Locality" />
																				<span id="ContentPlaceHolder1_rfvmodule"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Land Mark</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="guardianLandmark" type="text"
																					maxlength="40" id="guardianLandmark" tabindex="3"
																					class="form-control" placeholder="Enter Land Mark" />

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Other City Name</span>


																			</div>
																			<div class="col-sm-7">
																				<input name="guardianOtherCityName" type="text"
																					maxlength="40" id="guardianOtherCityName"
																					tabindex="3" class="form-control"
																					placeholder="Enter Other City Name"> <span
																					id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Other District Name </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="guardianOtherDistrictName" type="text"
																					maxlength="100" id="guardianOtherDistrictName"
																					tabindex="4" class="form-control"
																					placeholder="Enter Other District Name ">

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">State </span>

																			</div>

																			<div class="col-sm-7">
																				<select name="guardianStateId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="guardianStateId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																				</select>

																			</div>
																		</div>
																	</div>
																	<!-- <div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-xs-5">
																			<span id="ContentPlaceHolder1_lblMenuLink"
																				class="control-label">Post Office </span>

																		</div>

																		<div class="col-sm-7">
																			<input name="menuLink" type="text" maxlength="100"
																				id="menu_link" tabindex="4" class="form-control"
																				onkeypress="return CheckAlphaNumeric(event,this)"
																				placeholder="Enter Post Office ">

																		</div>
																	</div>
																</div> -->



																</div>

															</div>


															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="reset-address-details-btn" type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="button" name="submit_create_edit_team"
																			id="save-address-details-btn" disabled="disabled"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 bg-primary"
																style="height: 37px; border-radius: 5px; text-align: center; padding: 10px;">(The
																above information is to be filled exactly)</div>
														</div>

														<!--row 11 div guardian end here -->



													</div>
												</div>
											</div>
											<!-- Lacal Address Information tab end here -->




										</div>
									</div>

									<div id="tabs-3" style="padding: 17px 0px 15px;">
										<div class="row">
											<!--Over all row of this tab Start here-->


											<!--  Admission Detail tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Admission
																Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 31 start here -->
														<div class="row my-bg-danger">

															<div class="col-md-12"
																style="top: 5px; padding-bottom: 5px">
																<span class="label label-warning control-label"
																	style="white-space: normal; line-height: 1.8em">This
																	Information is very critical. A separate permission is
																	required to change this critical data</span>
															</div>
															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Date of Admission <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input name="admissionDateString" type="text"
																					maxlength="100" id="admissionDate" tabindex="4"
																					class="form-control"
																					placeholder="Enter Admission Date">
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Branch<span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<select name="branchNumber" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="branchNumber" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Branch</option>
																					<c:forEach items="${branchList}" var="branch">
																						<option value="${branch.id}">${branch.branchLongName}</option>
																					</c:forEach>
																				</select> <span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Admission Batch<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<select name="admissionBatch" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="admissionBatch" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Admission Batch</option>
																					<c:forEach items="${batchList}" var="batch">
																						<option value="${batch.id}">${batch.batchName}</option>
																					</c:forEach>
																				</select> <span id="ContentPlaceHolder1_rfvmenu"
																					style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Scholarship Received <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input type="radio" name="scholership" value="true"
																					id="scholership-true" /> <label>Yes</label> <input
																					type="radio" name="scholership" value="false"
																					id="scholership-false" /> <label>No</label>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Local <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input type="radio" name="local" value="true"
																					id="local-true" /> <label>Yes</label> <input
																					type="radio" name="local" value="false"
																					id="local-false" /> <label>No</label>
																			</div>
																		</div>
																	</div>


																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Semester</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="semesterId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="semesterId" class="form-control">
																					<option selected="selected" value="0">Please
																						Select semester</option>
																					<c:forEach items="${semesterList}" var="semester">
																						<option value="${semester.id}">${semester.semesterName}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>

																	</div>


																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">

																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Degree<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<select name="degreeId" data-toggle="modal"
																					data-original-title="Add to Project" id="degreeId"
																					class="form-control">
																					<option selected="selected" value="0">Please
																						Select degree</option>
																					<c:forEach items="${degreeList}" var="degree">
																						<option value="${degree.id}">${degree.degreeName}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>
																	</div>



																	<div class="form-group">

																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Payment Type<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<select name="paymentType" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="paymentType" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Payment Type</option>
																					<c:forEach items="${paymentTypeList}"
																						var="paymentType">
																						<option value="${paymentType.id}">${paymentType.paymentType}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label">Year</span>

																			</div>
																			<div class="col-sm-7">
																				<select name="admittedToYear" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="admittedToYear" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Year</option>
																					<c:forEach items="${yearList}" var="year">
																						<option value="${year.id}">${year.year}</option>
																					</c:forEach>
																				</select>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Scholarship Details </span>


																			</div>
																			<div class="col-sm-7">
																				<select name="scholershipDetails"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="scholershipDetails" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Scholarship Details</option>
																				</select>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Status Of Student</span>

																			</div>

																			<div class="col-sm-7">
																				<select name="statusOfStudent" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="statusOfStudent" class="form-control">
																					<option selected="selected" value="0">Please
																						Select Status</option>
																					<c:forEach items="${studentStatus}"
																						var="studentStatus">
																						<option value="${studentStatus.id}">${studentStatus.statusType}</option>
																					</c:forEach>
																				</select>

																			</div>
																		</div>
																	</div>



																</div>

															</div>


															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="reset-admission-details-btn"
																					type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="button" name="submit_create_edit_team"
																			id="save-admission-details-btn" disabled="disabled"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>


														</div>
														<!--row 31 div end here -->
													</div>
												</div>
											</div>
										</div>
										<!--Over all row of this tab end here-->
									</div>
									<!-- Admission Detail tab end here -->


									<div id="tabs-4">
										<div class="row">
											<!-- Personal tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Personal Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 14 start here -->
														<div class="row row my-bg-info">

															<!--left div start here -->

															<div class="col-md-12">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">

																			<div class="col-md-6">
																				<div class="form-group">
																					<div class="col-sm-12">
																						<div class="col-xs-5">
																							<span id="ContentPlaceHolder1_lblMenuLink"
																								class="control-label">Birth Place</span>

																						</div>

																						<div class="col-sm-7">
																							<input name="birthPlace" type="text"
																								maxlength="40" id="birthPlace" tabindex="3"
																								class="form-control" placeholder="Birth Place" />
																							<span id="ContentPlaceHolder1_rfvmodule"
																								style="display: none;"></span>

																						</div>
																					</div>
																				</div>


																			</div>
																			<div class="col-md-6">

																				<div class="form-group">
																					<div class="col-sm-12">
																						<div class="col-xs-5">
																							<span id="ContentPlaceHolder1_lblMenuLink"
																								class="control-label">Mother tongue</span>

																						</div>

																						<div class="col-sm-7">
																							<select name="motherTongueId" data-toggle="modal"
																								data-original-title="Add to Project"
																								id="motherTongueId" class="form-control">
																								<option selected="selected" value="0">Please
																									Select</option>
																								<c:forEach items="${mothertongueList}"
																									var="mothertongue">
																									<option value="${mothertongue.id}">${mothertongue.mothertongue}</option>
																								</c:forEach>
																							</select>

																						</div>
																					</div>
																				</div>

																			</div>


																			<div class="row">
																				<div class="col-sm-12" style="padding-bottom: 10px">
																					<div class="col-xs-5">
																						<span id="ContentPlaceHolder1_lblMenuLink"
																							class="control-label">Other Language</span>

																					</div>
																				</div>


																				<c:forEach items="${mothertongueList}"
																					var="mothertongue">
																					<div class="col-sm-2">
																						<input type=checkbox name="otherLanguage"
																							id="otherLanguage-${mothertongue.id}"
																							value="${mothertongue.id}" /> <label>${mothertongue.mothertongue}</label>
																					</div>
																				</c:forEach>


																			</div>
																			<!--left div start here -->

																			<div class="col-md-6">

																				<div class="form-horizontal">
																					<div class="form-group">
																						<br>
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblModule"
																									class="control-label">Height (In cm)</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="height" type="text" maxlength="40"
																									id="height" tabindex="3" class="form-control"
																									placeholder="Height" /> <span
																									id="ContentPlaceHolder1_rfvmodule"
																									style="display: none;"></span>
																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">

																								<span id="ContentPlaceHolder1_lblParent"
																									class="control-label">Urban:</span>

																							</div>
																							<div class="col-sm-7">
																								<input type="radio" name="urban" value="true"
																									id="urban-true" /> <label>Yes</label> <input
																									type="radio" name="urban" value="false"
																									id="urban-false" /> <label>No</label>


																							</div>
																						</div>
																					</div>
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">

																								<span id="ContentPlaceHolder1_lblMenuName"
																									class="control-label">Passport Number<span
																									style="color: #FF0000; font-weight: bold">*</span></span>


																							</div>
																							<div class="col-sm-7">
																								<input name="passportNumber" type="text"
																									maxlength="40" id="passportNumber" tabindex="3"
																									class="form-control"
																									placeholder="Passport Number" /> <span
																									id="ContentPlaceHolder1_rfvmodule"
																									style="display: none;"></span>


																							</div>
																						</div>
																					</div>
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label">Bank Account
																									Number<span
																									style="color: #FF0000; font-weight: bold">*</span>
																								</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="bankAddress" type="text"
																									maxlength="40" id="menu_name" tabindex="3"
																									class="form-control"
																									onkeypress="return CheckAlphaNumeric(event,this)"
																									placeholder="Bank Account Number" /> <span
																									id="ContentPlaceHolder1_rfvmodule"
																									style="display: none;"></span>
																							</div>
																						</div>
																					</div>
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Branch Details</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="bankAddress" type="text"
																									id="bankAddress" maxlength="40"
																									id="menu_tool_tip" tabindex="5"
																									class="form-control"
																									placeholder="Branch Details">



																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Bank IFSC Code</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="bankIFSCCode" type="text"
																									id="bankIFSCCode" maxlength="40"
																									id="menu_tool_tip" tabindex="5"
																									class="form-control"
																									placeholder="Bank IFSC Code">

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Physical
																									Handicapped </span>
																							</div>
																							<div class="col-sm-7">
																								<input type="radio" name="physicallyHandicapped"
																									value="true" id="physicallyHandicapped-true" />
																								<label>Yes</label> <input type="radio"
																									name="physicallyHandicapped" value="false"
																									id="physicallyHandicapped-false" /> <label>No</label>
																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Visa Number</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="visaNumber" type="text"
																									maxlength="40" id="visaNumber" tabindex="5"
																									class="form-control" placeholder="Visa Number">
																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Voter Number</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="voterNumber" type="text"
																									maxlength="40" id="voterNumber" tabindex="5"
																									class="form-control" placeholder="Voter Number">

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Hosteler</span>
																							</div>
																							<div class="col-sm-7">
																								<input type="radio" name="hosteler" value="true"
																									id="hosteler-true" /> <label>Yes</label> <input
																									type="radio" name="hosteler" value="false"
																									id="hosteler-false" /> <label>No</label>

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">NPR </span>
																							</div>
																							<div class="col-sm-7">
																								<input type="radio" name="nprStatus"
																									value="true" id="nprStatus-true" /> <label>Yes</label>
																								<input type="radio" name="nprStatus"
																									value="false" id="nprStatus-false" /> <label>No</label>

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Transport Service:</span>
																							</div>
																							<div class="col-sm-7">
																								<input type="radio" name="transport"
																									value="true" id="transport-true" /> <label>Yes</label>
																								<input type="radio" name="transport"
																									value="false" id="transport-false" /> <label>No</label>

																							</div>
																						</div>
																					</div>


																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Route Number</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="routeNumber" type="text"
																									maxlength="40" id="routeNumber" tabindex="5"
																									class="form-control"
																									placeholder="Transport Service">

																							</div>
																						</div>
																					</div>



																					<!-- photo code state here -->
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label">Right Thumb</span>
																							</div>
																							<div class="col-sm-7">
																								<input type="file" name="rightThumbImage"
																									id="rightThumbImage"
																									title="Please Select Image">
																								<!-- onchange="showImage()" -->


																							</div>
																						</div>
																					</div>
																					<div class="form-group">
																						<div class="col-sm-5"></div>
																						<div class="col-sm-7">

																							<img id="rightThumbTag"
																								style="border: 1px solid #A9E6F9"
																								src="./resources/No_image_available.svg"
																								style="height: 75px; width: 75px;">


																						</div>
																					</div>
																					<!-- photo end state here -->
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Number Of
																									Brother's</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="numberOfBrother" type="text"
																									value="0" maxlength="40" id="numberOfBrother"
																									tabindex="5" class="form-control"
																									placeholder="Number Of Brother's">



																							</div>
																						</div>
																					</div>






																				</div>

																			</div>

																			<!--left div end here -->


																			<!--right div start here -->

																			<div class="col-md-6">

																				<div class="form-horizontal">
																					<div class="form-group">
																						<br>
																						<div class="col-sm-12">
																							<div class="col-sm-5">

																								<span id="ContentPlaceHolder1_lblModule"
																									class="control-label">Weight (In Kg)<span
																									style="color: #FF0000; font-weight: bold">*</span></span>


																							</div>
																							<div class="col-sm-7">
																								<input name="weight" type="text" maxlength="40"
																									id="weight" tabindex="3" class="form-control"
																									placeholder="Weight (In Kg)" /> <span
																									id="ContentPlaceHolder1_rfvmodule"
																									style="display: none;"></span>
																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">

																								<span id="ContentPlaceHolder1_lblParent"
																									class="control-label">Country Domicile</span>

																							</div>
																							<div class="col-sm-7">
																								<input name="countryDomicile" type="text"
																									maxlength="40" id="countryDomicile"
																									tabindex="3" class="form-control"
																									placeholder="Country Domicile" /> <span
																									id="ContentPlaceHolder1_rfvmodule"
																									style="display: none;"></span>

																							</div>
																						</div>
																					</div>
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">

																								<span id="ContentPlaceHolder1_lblMenuName"
																									class="control-label">Bank Name </span>


																							</div>
																							<div class="col-sm-7">
																								<select name="bankNumber" data-toggle="modal"
																									data-original-title="Add to Project"
																									id="bankNumber" class="form-control">
																									<option selected="selected" value="0">Please
																										Bank Name</option>
																									<c:forEach items="${bankList}" var="bank">
																										<option value="${bank.id}">${bank.bankName}</option>
																									</c:forEach>
																								</select> <span id="ContentPlaceHolder1_rfvmenu"
																									style="display: none;"></span>
																							</div>
																						</div>
																					</div>


																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">

																								<span id="ContentPlaceHolder1_lblMenuName"
																									class="control-label">Physically
																									Handicapped </span>


																							</div>
																							<div class="col-sm-7">
																								<select name="physicallyHandicapped"
																									data-toggle="modal"
																									data-original-title="Add to Project"
																									id="physicallyHandicapped" class="form-control">
																									<option selected="selected" value="0">Please
																										Physically Handicapped</option>
																									<c:forEach items="${physicallyHandicappedList}"
																										var="physicallyHandicapped">
																										<option value="${physicallyHandicapped.id}">${physicallyHandicapped.handicapType}</option>
																									</c:forEach>
																								</select> <span id="ContentPlaceHolder1_rfvmenu"
																									style="display: none;"></span>
																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label">Type</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="typeOfPhysicallyHandicap"
																									type="text" maxlength="100"
																									id="typeOfPhysicallyHandicap" tabindex="4"
																									class="form-control" placeholder="Type">

																							</div>
																						</div>
																					</div>


																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label"> Pan Number</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="panNumber" type="text"
																									maxlength="100" id="panNumber" tabindex="4"
																									class="form-control" placeholder="Pan Number">

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label"> Aadhar Card
																									Number</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="adharCardNumber" type="text"
																									maxlength="100" id="adharCardNumber"
																									tabindex="4" class="form-control"
																									placeholder="Aadhar Card  Number">

																							</div>
																						</div>
																					</div>


																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label"> NPR Number</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="nprNumber" type="text"
																									maxlength="100" id="nprNumber" tabindex="4"
																									class="form-control" placeholder="NPR Number">

																							</div>
																						</div>
																					</div>


																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label">Route Amount</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="routeAmount" type="text"
																									value="100.5" maxlength="100" id="routeAmount"
																									tabindex="4" class="form-control"
																									placeholder="Route Amount">

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label"> Medical Details</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="medicalDetails" type="text"
																									maxlength="100" id="medicalDetails"
																									tabindex="4" class="form-control"
																									placeholder="Medical Detailsr">

																							</div>
																						</div>
																					</div>



																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Any Medical
																									Problem:</span>
																							</div>
																							<div class="col-sm-7">
																								<input type="radio" name="medicalProblem"
																									value="true" id="medicalProblem-true" /> <label>Yes</label>
																								<input type="radio" name="medicalProblem"
																									value="false" id="medicalProblem-false" /> <label>No</label>

																							</div>
																						</div>
																					</div>
																					<!-- Left Thumb state here -->
																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label">Left Thumb:</span>
																							</div>
																							<div class="col-sm-7">
																								<input type="file" name="leftThumbImage"
																									id="leftThumbImage" title="Please select Image">
																								<!-- onchange="showImage()" -->


																							</div>
																						</div>
																					</div>
																					<div class="form-group">
																						<div class="col-sm-5"></div>
																						<div class="col-sm-7">

																							<img id="leftThumbTag"
																								style="border: 1px solid #A9E6F9"
																								src="./resources/No_image_available.svg"
																								style="height: 75px; width: 75px;">


																						</div>
																					</div>
																					<!-- Left Thumb state here -->

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-xs-5">
																								<span id="ContentPlaceHolder1_lblMenuLink"
																									class="control-label">NPR Number</span>

																							</div>

																							<div class="col-sm-7">
																								<input name="nprNumber" type="text"
																									maxlength="40" id="nprNumber" tabindex="5"
																									class="form-control" placeholder="NPR Number">

																							</div>
																						</div>
																					</div>

																					<div class="form-group">
																						<div class="col-sm-12">
																							<div class="col-sm-5">
																								<span id="ContentPlaceHolder1_lblMenuToolTip"
																									class="control-label">Number Of Sister's</span>
																							</div>
																							<div class="col-sm-7">
																								<input name="numberOfSister" type="text"
																									value="0" maxlength="40" id="numberOfSister"
																									tabindex="5" class="form-control"
																									placeholder="Number Of Sister's">



																							</div>
																						</div>
																					</div>




																				</div>

																			</div>


																			<!-- personal right div end here -->

																		</div>
																	</div>
																</div>










															</div>

														</div>

														<!--left div end here -->


														<!--right div start here -->

														<!--right div end here -->
														<div class="col-md-12">
															<div class="form-group action-btn-group">
																<div class="controls2">
																	<span class="left-margin-remove"> <a href="#">
																			<button id="reset-personal-details-btn" type="reset"
																				class="btn btn-xl btn-default button-submit font13">
																				<span><span class="">Clear</span></span>
																			</button>
																	</a>
																	</span>
																	<!-- <a href="#"> -->
																	<button type="button" name="submit_create_edit_team"
																		id="save-personal-details-btn" disabled="disabled"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Save</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>

														<!--row 14 div end here -->
													</div>
												</div>


											</div>
											<!-- row end here -->
										</div>
									</div>
									<!--Personal Details end here -->


									<div id="tabs-5" style="padding: 17px 0px 15px;">
										<div class="row">
											<!--Outer row start here -->
											<!--  Family Detail tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Family Member
																Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 14 start here -->
														<div class="row my-bg-warning">

															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">If Not Applicable <span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<input type="radio" name="applicable" /> <label>Yes</label>
																				<input type="radio" name="applicable" /> <label>No</label>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label"> Name</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Mother's Name">
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Address<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<div class="input-group">
																					<textarea class="form-control custom-control"
																						cols="40" rows="5" style="resize: none">
																			</textarea>

																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Mobile Number<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Mobile Number">


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Qualification</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="parentMenuId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="parentMenu" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																				</select>
																			</div>
																		</div>
																	</div>


																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label"> Relation</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="parentMenuId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="parentMenu" class="form-control">
																					<option selected="selected" value="0">Please
																						Group</option>
																				</select>
																			</div>
																		</div>
																	</div>




																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Email </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="menuLink" type="text" maxlength="100"
																					id="menu_link" tabindex="4" class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Email">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Designation</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Designation">



																			</div>
																		</div>
																	</div>



																</div>

															</div>


															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="cancel_id" type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="submit" name="submit_create_edit_team"
																			disabled="disabled"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="submit_button">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>

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




															<!--row 14 div end here -->
														</div>
													</div>
												</div>

											</div>
											<!-- family Detail tab end here -->

										</div>
										<!-- outer row end  -->
									</div>
									<!-- tab5 row end  -->

									<div id="tabs-6" style="padding: 17px 0px 15px;">
										<div class="row">
											<!--Outer row start here -->
											<!--  Student Last Qualificaiton Detail tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Student Last
																Qualificaiton Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 14 start here -->
														<div class="row my-bg-success">

															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Qualifying Exam<span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<select name="qualifyingExamNumber"
																					data-toggle="modal"
																					data-original-title="Add to Project"
																					id="qualifyingExamNumber" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																					<option value="1">SSC</option>
																					<option value="2">BSC</option>
																					<option value="3">BCA</option>
																				</select> <label id="qualifyingExamNumberLabel"
																					style="color: red; visibility: hidden;">Plz
																					Enter Qualifying Exam</label>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblParent"
																					class="control-label"> Year Of Exam</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="yearOfExamHssc" type="text"
																					value="2009" maxlength="40" id="yearOfExamHssc"
																					tabindex="5" class="form-control"
																					placeholder="Year Of Exam"> <label
																					id="yearOfExamHsscLabel"
																					style="color: red; visibility: hidden;">Plz
																					Enter Year Of Exam</label>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Marks Obtained<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<div class="input-group">
																					<input name="marksObtained" type="text" value="0"
																						maxlength="40" id="marksObtained" tabindex="5"
																						class="form-control" placeholder="Marks Obtained">

																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Out Of Marks<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input name="outOfMarks" type="text" value="0"
																					maxlength="40" id="outOfMarks" tabindex="5"
																					class="form-control" placeholder="Out Of Marks">

																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Percentage</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="percentage" type="text" value="1.01"
																					maxlength="40" id="percentage" tabindex="5"
																					class="form-control" placeholder="Percentage">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Attempt</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="attemptsTaken" type="text" value="0"
																					maxlength="40" id="attemptsTaken" tabindex="5"
																					class="form-control" placeholder="Attempt">
																			</div>
																		</div>
																	</div>


																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">



																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">School / College Name
																				</span>

																			</div>

																			<div class="col-sm-7">
																				<input name="schoolCollegeName" type="text"
																					maxlength="100" id="schoolCollegeName" tabindex="4"
																					class="form-control"
																					placeholder="School / College Name"> <label
																					id="schoolCollegeNameLabel"
																					style="color: red; visibility: hidden;">Plz
																					Enter School / College Name</label>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Board</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="board" type="text" maxlength="40"
																					id="board" tabindex="5" class="form-control"
																					placeholder="Board"> <label id="boardLabel"
																					style="color: red; visibility: hidden;">Plz
																					Enter Board</label>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label"> Grade</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="grade" type="text" maxlength="40"
																					id="grade" tabindex="5" class="form-control"
																					placeholder="Grade">

																			</div>
																		</div>
																	</div>



																</div>

															</div>


															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="reset-last-qualificaiton-details-btn"
																					type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="button" name="submit_create_edit_team"
																			id="save-last-qualificaiton-details-btn"
																			disabled="disabled"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>

															<!-- TABLE CODE START HERE -->
															<div class="col-md-12">

																<div class=""
																	style="height: auto; position: relative; overflow: auto">

																	<table id="last_qualifying_table"
																		class="table table-bordered  table-checkable table-responsive  "
																		aria-describedby="DataTables_Table_0_info">
																		<thead>
																			<tr role="row">
																				<th>Action</th>
																				<th>Qualifying Exam Name</th>
																				<th>Year of Exam</th>
																				<th>School/College Name</th>
																				<th>Percentage</th>
																				<th>Board</th>
																			</tr>
																		</thead>

																		<tbody role="alert" aria-live="polite"
																			aria-relevant="all">

																			<!-- <tr class="odd">

																				<td>
																					<button type="button" class="btn btn-success">
																						<span class="glyphicon glyphicon-pencil"></span>
																					</button>
																					<button type="button" class="btn btn-warning">
																						<span class="glyphicon glyphicon-remove"></span>
																					</button>
																				</td>

																				<td>SSC/ICSE/CBSE</td>
																				<td>2012</td>
																				<td>ST.JOHN HIGH SCHOOL</td>
																				<td>82.00</td>
																				<td>SSC</td>
																			</tr>

																			<tr class="even">

																				<td>
																					<button type="button" class="btn btn-success">
																						<span class="glyphicon glyphicon-pencil"></span>
																					</button>
																					<button type="button" class="btn btn-warning">
																						<span class="glyphicon glyphicon-remove"></span>
																					</button>
																				</td>

																				<td>DIPLOMA</td>
																				<td>2015</td>
																				<td>CITD L</td>
																				<td>82.00</td>
																				<td>CITD</td>
																			</tr> -->



																		</tbody>
																	</table>


																</div>
															</div>
															<!-- TABLE CODE END HERE -->


															<!--row 14 div end here -->
														</div>
													</div>
												</div>

											</div>
											<!-- Qualification marks Details end here -->

										</div>
										<!-- outer row end  -->

									</div>
									<!-- tab 6 end  -->



									<div id="tabs-7" style="padding: 17px 0px 15px;">
										<div class="row">
											<!--Outer row start here -->
											<!--  Entrance Exam Score tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Entrance Exam
																Score Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 14 start here -->
														<div class="row my-bg-warning">

															<!--left div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Exam Name<span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>
																			<div class="col-sm-7">
																				<select name="parentMenuId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="parentMenu" class="form-control">
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
																					class="control-label"> All India Rank</span>

																			</div>
																			<div class="col-sm-7">
																				<input name="rank" type="text" maxlength="40"
																					value="1" id="rank" tabindex="5"
																					class="form-control" placeholder="All India Rank">
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">

																				<span id="ContentPlaceHolder1_lblMenuName"
																					class="control-label">Marks Obtained<span
																					style="color: #FF0000; font-weight: bold">*</span></span>


																			</div>
																			<div class="col-sm-7">
																				<div class="input-group">
																					<input name="marksObtained" type="text"
																						maxlength="40" id="marksObtained" tabindex="5"
																						class="form-control" placeholder="Marks Obtained">

																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label">Year Of Exam<span
																					style="color: #FF0000; font-weight: bold">*</span></span>

																			</div>

																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Out Of Marks">


																			</div>
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label"> Marks Obtained</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Percentage">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Percentage</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Percentage">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Score</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Score">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label"> Quota</span>
																			</div>
																			<div class="col-sm-7">
																				<select name="parentMenuId" data-toggle="modal"
																					data-original-title="Add to Project"
																					id="parentMenu" class="form-control">
																					<option selected="selected" value="0">Please
																						Select</option>
																				</select>
																			</div>
																		</div>
																	</div>


																</div>

															</div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6">

																<div class="form-horizontal">

																	<p style="height: 17px"></p>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-xs-5">
																				<span id="ContentPlaceHolder1_lblMenuLink"
																					class="control-label"> Other Exam Name </span>

																			</div>

																			<div class="col-sm-7">
																				<input name="menuLink" type="text" maxlength="100"
																					id="menu_link" tabindex="4" class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Other Exam Name">
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">State Rank</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="State Rank">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label"> Out of Marks</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Out of Marks">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label">Hall Ticket Number</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Hall Ticket Number">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label"> Percentile</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Percentile">

																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<div class="col-sm-12">
																			<div class="col-sm-5">
																				<span id="ContentPlaceHolder1_lblMenuToolTip"
																					class="control-label"> Other Detail's</span>
																			</div>
																			<div class="col-sm-7">
																				<input name="menuTooltip" type="text" maxlength="40"
																					id="menu_tool_tip" tabindex="5"
																					class="form-control"
																					onkeypress="return CheckAlphaNumeric(event,this)"
																					placeholder="Other Detail's">

																			</div>
																		</div>
																	</div>



																</div>

															</div>


															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="cancel_id" type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="submit" name="submit_create_edit_team"
																			disabled="disabled"
																			class="btn btn-xl btn-primary button-submit font13">
																			<span><span class="" id="submit_button">Save</span></span>
																		</button>
																		<!-- </a>  -->
																	</div>
																</div>
															</div>

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
																				<th>Exam Name</th>
																				<th>Year of Exam</th>
																				<th>All India Rank</th>
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

																				<td>ECET</td>
																				<td>2015</td>
																				<td>0</td>
																			</tr>
																		</tbody>
																	</table>


																</div>
															</div>
															<!-- TABLE CODE END HERE -->

															<!--row 14 div end here -->
														</div>
													</div>
												</div>

											</div>
											<!-- row end here -->
										</div>
										<!-- Entrance Exam Scores end here -->

									</div>
									<!-- tab 7 end here -->


									<!-- tab 8 start here -->
									<div id="tabs-8">
										<div class="row">
											<!--  Entrance Exam Score tab start here -->
											<div class="col-xs-12 col-sm-12">
												<div class="box">
													<div class="box-header">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Document List
																Details</span>
														</div>
														<div class="box-icons">
															<a class="collapse-link"> <i
																class="servicedrop  glyphicon glyphicon-chevron-down"></i>
															</a>


														</div>
														<div class="no-move"></div>
													</div>
													<div class="box-content" style="display: none">
														<!--left row 14 start here -->
														<div class="row my-bg-danger">

															<!--left div start here -->

															<div class="col-md-12">

																<div class="form-horizontal">
																	<div class="form-group">
																		<br>
																		<div class="col-sm-12">
																			<div class="col-sm-12" style="padding-bottom: 10px">
																				<span id="ContentPlaceHolder1_lblModule"
																					class="control-label">Document List<span
																					style="color: #FF0000; font-weight: bold">*</span></span>
																			</div>


																			<c:forEach items="${documentList}" var="document">
																				<div class="col-sm-6">
																					<input type=checkbox name="documentList"
																						id="document-${document.id}"
																						value="${document.id}" /> <label>${document.documentName}</label>
																				</div>
																			</c:forEach>
																		</div>
																	</div>
																</div>










															</div>



															<!--left div end here -->


															<!--right div start here -->

															<!--right div end here -->
															<div class="col-md-12">
																<div class="form-group action-btn-group">
																	<div class="controls2">
																		<span class="left-margin-remove"> <a href="#">
																				<button id="cancel_id" type="reset"
																					class="btn btn-xl btn-default button-submit font13">
																					<span><span class="">Clear</span></span>
																				</button>
																		</a>
																		</span>
																		<!-- <a href="#"> -->
																		<button type="button" name="submit_create_edit_team"
																			class="btn btn-xl btn-primary button-submit font13"
																			id="submit-form-btn">
																			<span><span class="" id="submit_button">Save</span></span>
																		</button>
																		<!-- <button type="button" name="submit_create_edit_team"
																			class="btn btn-xl btn-primary button-submit font13"
																			id="save-document-list-btn">
																			<span><span class="" id="">Save</span></span>
																		</button>  -->
																		<!-- </a>  -->
																	</div>
																</div>
															</div>

															<!--row 14 div end here -->
														</div>
													</div>
												</div>
											</div>

										</div>
										<!-- row end here -->
									</div>
									<!-- Document List Scores end here -->
								</div>
								<!-- tab8 end here -->

								<!-- jaskirat code end here -->
							</form>







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

