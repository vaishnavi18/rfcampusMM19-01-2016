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
<script type="text/javascript"
	src="<c:url value="/resources/plugins/datetimepicker/jquery.datetimepicker.full.js"/>"></script>
<link
	href="<c:url value="/resources/plugins/datetimepicker/jquery.datetimepicker.css"/>"
	rel="stylesheet" type="text/css">
<!--ptu wizard style starts  -->
<!-- tab code link start here -->

<style type="text/css">
.easyWizardSteps {
	list-style: none;
	width: 100%;
	overflow: hidden;
	margin: 0;
	padding: 0;
	border-bottom: 1px solid #ccc;
	margin-bottom: 20px
}

.easyWizardSteps li {
	font-size: 14px;
	font-weight: bold;
	display: inline-block;
	padding: -5px;
	color: #B0B1B3;
	margin-right: 20px;
}

.easyWizardSteps li span {
	font-size: 13px
}

.easyWizardSteps li.current {
	color: black
}

.easyWizardButtons {
	overflow: hidden;
	padding: 10px;
}

.easyWizardButtons button, .easyWizardButtons .submit {
	cursor: pointer;
	padding: 4px 14px
}

.easyWizardButtons .prev {
	float: left
}

.easyWizardButtons .next, .easyWizardButtons .submit {
	float: right;
	padding: 4px 14px
}
</style>
<!--ptu wizard style ends  -->
<!-- tab code link start here -->
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/easy-wizard/jquery.easyWizard.js"></script>

<!-- <script -->
<%-- 	src="${pageContext.request.contextPath}/resources/common/student-info-validate.js"></script> --%>
<!-- ptu wizard jquery -->
<script type="text/javascript">
	$(function() {
		
		jQuery('#dateOfBirthString').datetimepicker({
			  timepicker:false,
			  format:'d/m/Y'
			});
		jQuery('#admissionDateString').datetimepicker({
			  timepicker:false,
			  format:'d/m/Y'
			});
		
		$('.myWizard2').easyWizard({
			buttonsClass : 'btn',
			submitButtonClass : 'btn btn-success',

		});

		$("[data-step]").click(function() {
			var step = $(this).attr('data-step');
			$('.myWizard2').easyWizard('goToStep', step);
		});

	
		

	});

	var studentPhotograph = '';
	var studentSign = '';
	var leftThumb = '';
	var rightThumb = '';
	var formData = new FormData();

	$(document).ready(function() {
		$('#studentImage').on('change', function prepareUpload(event) {
			studentPhotograph = event.target.files;
		});
		$('#studentSignature').on('change', function prepareUpload(event) {
			studentSign = event.target.files;
		});
		$('#rightThumbImage').on('change', function prepareUpload(event) {
			rightThumb = event.target.files;
		});
		$('#leftThumbImage').on('change', function prepareUpload(event) {
			leftThumb = event.target.files;
		});
	});
</script>
<!-- ptu wizard jquery ends -->
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

	var entranceExamArray = new Array();
	var removedentranceExamOptions = new Array();
	var updateEntranceOperation = false;

	var familyMemberArray = new Array();
	var updateFamilyMemberOperation = false;

	$(function() {
		$("#tabs").tabs();
	});

	$(document)
			.ready(
					function() {
						//						$(".box-header")
						//								.click(
						// 										function() {
						// 											$(this).parent().find(
						// 													'.box-content')
						// 													.slideToggle();
						// 											$(this)
						// 													.parent()
						// 													.find(
						// 															'glyphicon glyphicon-chevron-down')
						// 													.hide();
						// 											$(this)
						// 													.parent()
						// 													.find('.servicedrop')
						// 													.toggleClass(
						// 															'glyphicon-chevron-down glyphicon-chevron-up');
						// 										});

						//	$("#registrationNumber, #password")
						//.keyup(
						//function(event) {

						//if (event.keyCode == 13) {
						var optionLength = $('#qualifyingExamNumber').children(
								'option').length;
						for (var i = 0; i < optionLength - 1; i++) {
							lastQualifyingArray.push({
								"qualifyingExamId" : -1
							});
							entranceExamArray.push({
								"qualifyingExamId" : -1
							});
						}

						optionLength = $('#entranceQualifyingNumber').children(
								'option').length;
						for (var i = 0; i < optionLength - 1; i++) {
							lastQualifyingArray.push({
								"qualifyingExamId" : -1
							});
							entranceExamArray.push({
								"qualifyingExamId" : -1
							});
						}

						$("#temp-btn")
								.click(
										function() {
											var id = $("#registrationNumber")
													.val();
											/* var password = ""
													+ $("#password").val(); */

											//alert(id);
											$
													.ajax({
														async : false,
														url : "../../academic/student/information",
														type : "POST",
														data : {
															"registrationNumber" : ""
																	+ id
														},
														success : function(
																response) {
															//alert(response );
															/* console
																	.log(JSON
																			.stringify(response)); */
															var jsonOb = JSON
																	.parse(JSON
																			.stringify(response))
															if (response != "")
																setStudentData(JSON
																		.stringify(response));
															else
																alert('Invalid Application Id');
														},
														error : function() {
															alert('eror...');
														},
													});
											return false;
											//}
										});

						$("#add-update-student-form")
								.on(
										'submit',
										function(e) {
											//alert('submit');
											e.preventDefault();

											/* General Information */
											var id = $("#id").val();
											var enrollmentNumber = $("#enrollmentNumber").val();
											var title = $("#title").val();
											var studentName = $("#studentName").val();
											var dateOfBirthString = $("#dateOfBirthString").val();
											var gender = $('[name=gender]:checked').val();
											var religionId = $("#religionId").val();
											var categoryId = $("#categoryId").val();
											var casteId = $("#casteId").val();
											var email = $("#email").val();
											var registrationNumber = $("#registrationNumber").val();
											var studentNameInHindi = $("#studentNameInHindi").val();
											var adharCardNumber = $("#adharCardNumber").val();
											var married = $('[name=married]:checked').val();
											var nationalityId = $("#nationalityId").val();
											var admissionCategoryNumber = $("#admissionCategoryNumber").val();
											var bloodGroupId = $("#bloodGroupId").val();
											var studentMobileNumber = $("#studentMobileNumber").val();

											/* admission details */
											var admissionDateString = $("#admissionDateString").val();
											var degreeId = $("#degreeId").val();
											var admittedToYear = $("#admittedToYear").val();
											var paymentType = $("#paymentType").val();
											var studentType = $("#studentType").val();
											var Quota = $("#Quota").val();
											var admissionYear = $("#admissionYear").val();
											var branchNumber = $("#branchNumber").val();
											var semesterId = $("#semesterId").val();
											var stateOfEligibility = $("#stateOfEligibility").val();
											var hosteler = $("#hosteler").val();

											/* Scholarship details */
											var annualIncome = $("#annualIncome").val();
											var urban = $("#urban").val();
											var scholarshipType = $("#scholarshipType").val();
											var scholarshipCategory = $("#scholarshipCategory").val();
											
											/*Personal Details */
											var birthPlace = $("#birthPlace").val();
											var identityMark1 = $("#identityMark1").val();
											var countryDomicile = $("#countryDomicile").val();
											var bankNumber = $("#bankNumber").val();
											var physicallyHandicapped = $('[name=physicallyHandicapped]:checked').val();
											var height = $("#height").val();
											var motherTongueId = $("#motherTongueId").val();
											var visaNumber = $("#visaNumber").val();
											var accountNumber = $("#accountNumber").val();
											var typeOfPhysicallyHandicap = $("#typeOfPhysicallyHandicap").val();
											var weight = $("#weight").val();
											var otherLanguage = $("#otherLanguage").val();
											var passportNumber = $("#passportNumber").val();
											var degreeOfDisability = $("#degreeOfDisability").val();

											/* document list */
											var documentList = $(
													'[name=documentList]:checked')
													.map(function() {
														return this.value;
													}).get();
											documentList = new String(
													documentList);

											/* parents details */
											var fatherName = $("#fatherName").val();
											var fatherDesignation = $("#fatherDesignation").val();
											var fatherEmailid = $("#fatherEmailid").val();
											var fatherOccupationId = $("#fatherOccupationId").val();
											var fatherOfficeAddress = $("#fatherOfficeAddress").val();
											var fatherMobileNumber = $("#fatherMobileNumber").val();
											
											var motherName = $("#motherName").val();
											var motherDesignation = $("#motherDesignation").val();
											var motherEmailid = $("#motherEmailid").val();
											var motherOccupationId = $("#motherOccupationId").val();
											var motherOfficeAddress = $("#motherOfficeAddress").val();
											var motherMobileNumber = $("#motherMobileNumber").val();
											
											var guardianName = $("#guardianName").val();
											var guardianOccupationName = $("#guardianOccupationName").val();
											var guardianEmail = $("#guardianEmail").val();
											var relationWithGuardian = $("#relationWithGuardian").val();
											var guardianPhone = $("#guardianPhone").val();

											/* address details */
											var localPINCode = $("#localPINCode").val();
											var localDistrictId = $("#localDistrictId").val();
											var localStateId = $("#localStateId").val();
											var localTelephone = $("#localTelephone").val();
											var localTown = $("#localTown").val();
											var localCity = $("#localCity").val();
											
											var permenantPINCode = $("#permenantPINCode").val();
											var permenantDistrictId = $("#permenantDistrictId").val();
											var permenantStateId = $("#permenantStateId").val();
											var permenantTelephoneNumber = $("#permenantTelephoneNumber").val();
											var permenantTown = $("#permenantTown").val();
											var permenantCityId = $("#permenantCityId").val();
											
											var guardianPINCode = $("#guardianPINCode").val();
											var guardianDistrict = $("#guardianDistrict").val();
											var guardianStateId = $("#guardianStateId").val();
											var guardianTelephone = $("#guardianTelephone").val();
											var railwayStation = $("#railwayStation").val();
											var localStationName = $("#localStationName").val();
											var guardianTown = $("#guardianTown").val();
											var guardianCity = $("#guardianCity").val();
											var busStation = $("#busStation").val();

											/*HSSC & SSC Details*/
											var yearOfExamHssc = $("#yearOfExamHssc").val();
											var marksObtained = $("#marksObtained").val();
											var outOfMarks = $("#outOfMarks").val();
											var percentage = $("#percentage").val();
											var schoolCollegeName = $("#schoolCollegeName").val();
											var board = $("#board").val();
											var grade = $("#grade").val();
											var percentile = $("#percentile").val();
											var hscPcm = $("#hscPcm").val();
											var hscEng = $("#hscEng").val();
											var hscChe = $("#hscChe").val();
											var hscPcmMax = $("#hscPcmMax").val();
											var hscEngMax = $("#hscEngMax").val();
											var hscCheMax = $("#hscCheMax").val();
											var hscBio = $("#hscBio").val();
											var hscMat = $("#hscMat").val();
											var hscPhy = $("#hscPhy").val();
											var hscBioMax = $("#hscBioMax").val();
											var hscMatMax = $("#hscMatMax").val();
											var hscPhyMax = $("#hscPhyMax").val();

											var sscExamYear = $("#sscExamYear").val();
											var sscMarksObtained = $("#sscMarksObtained").val();
											var sscOutOf = $("#sscOutOf").val();
											var sscPercentage = $("#sscPercentage").val();
											var sscPercentile = $("#sscPercentile").val();
											var sscRollNumber = $("#sscRollNumber").val();
											var sscBoard = $("#sscBoard").val();
											var sscGrade = $("#sscGrade").val();
											var sscAttempts = $("#sscAttempts").val();
											
											var lastQualifyingJsonStr = new Array();

											$
													.each(
															lastQualifyingArray,
															function(index, ob) {
																lastQualifyingJsonStr
																		.push(JSON
																				.stringify(ob));
															});

											entranceExamJsonStr = new Array();

											$.each(entranceExamArray, function(
													index, ob) {
												entranceExamJsonStr.push(JSON
														.stringify(ob));
											});

											

											/*Old Photos*/
											var studentOldPhoto = $(
													"#studentOldPhoto").val();
											var studentOldSignature = $(
													"#studentOldSignature")
													.val();
											var oldRightThumb = $(
													"#oldRightThumb").val();
											var oldLeftThumb = $(
													"#oldLeftThumb").val();

											var studentAdmissionParameters = {
													"enrollmentNumber" : enrollmentNumber,
													"title" : title,
													"studentName" : studentName,
													"dateOfBirthString" : dateOfBirthString,
													"gender" : gender,
													"religionId" : religionId,
													"categoryId" : categoryId,
													"casteId" : casteId,
													"email" : email,
													"registrationNumber" : registrationNumber,
													"studentNameInHindi" : studentNameInHindi,
													"adharCardNumber" : adharCardNumber,
													"married" : married,
													"nationalityId" : nationalityId,
													"admissionCategoryNumber" : admissionCategoryNumber,
													"bloodGroupId" : bloodGroupId,
													"studentMobileNumber" : studentMobileNumber,

													"admissionDateString" : admissionDateString,
													"degreeId" : degreeId,
													"admittedToYear" : admittedToYear,
													"paymentType" : paymentType,
													"studentType" : studentType,
													"Quota" : Quota,
													"admissionYear" : admissionYear,
													"branchNumber" : branchNumber,
													"semesterId" : semesterId,
													"stateOfEligibility" : stateOfEligibility,
													"hosteler" : hosteler,

													"annualIncome" : annualIncome,
													"urban" : urban,
													"scholarshipType" : scholarshipType,
													"scholarshipCategory" : scholarshipCategory,

													"documentList" : documentList,

												"studentOldPhoto" : studentOldPhoto,
												"studentOldSignature" : studentOldSignature
											};

											var studentAddressParameters = {
												"registrationNumber" : registrationNumber,
												"fatherOccupationId" : fatherOccupationId,
												"fatherEducationId" : fatherEducationId,
												"fatherFlatNumber" : fatherFlatNumber,
												"fatherStreetName" : fatherStreetName,
												"fatherOfficeCity" : fatherOfficeCity,
												"fatherOfficeDistrict" : fatherOfficeDistrict,
												"fatherOfficePINCode" : fatherOfficePINCode,
												"fatherEmailid" : fatherEmailid,
												"fatherDesignation" : fatherDesignation,
												"fatherOfficeLocality" : fatherOfficeLocality,
												"fatherOfficeLandmark" : fatherOfficeLandmark,
												"fatherOtherCityName" : fatherOtherCityName,
												"localOtherDistrictName" : localOtherDistrictName,
												"fatherOfficeState" : fatherOfficeState,
												"fatherMobileNumber" : fatherMobileNumber,
												"fatherOfficeNumber" : fatherOfficeNumber,

												"motherEducation" : motherEducation,
												"motherFlatNumber" : motherFlatNumber,
												"motherOfficeStreetName" : motherOfficeStreetName,
												"motherOfficeCity" : motherOfficeCity,
												"motherOfficeDistrict" : motherOfficeDistrict,
												"motherOfficePINCode" : motherOfficePINCode,
												"motherEmailid" : motherEmailid,
												"motherMaidenName" : motherMaidenName,
												"motherDesignation" : motherDesignation,
												"motherOfficeLocality" : motherOfficeLocality,
												"motherOfficeLandmark" : motherOfficeLandmark,
												"motherOtherCityName" : motherOtherCityName,
												"motherOtherDistrictName" : motherOtherDistrictName,
												"motherOfficeState" : motherOfficeState,
												"motherMobileNumber" : motherMobileNumber,
												"motherOfficeNumber" : motherOfficeNumber,

												"localFlatNumber" : localFlatNumber,
												"localStreetName" : localStreetName,
												"localCity" : localCity,
												"localDistrictId" : localDistrictId,
												"localPINCode" : localPINCode,
												"localLocality" : localLocality,
												"localLandmark" : localLandmark,
												"localOthercityName" : localOthercityName,
												"localOtherDistrictName" : localOtherDistrictName,
												"localStateId" : localStateId,
												"localPostOffice" : localPostOffice,

												"permenantFlatNumber" : permenantFlatNumber,
												"permanantStreetName" : permanantStreetName,
												"permenantCityId" : permenantCityId,
												"permenantDistrictId" : permenantDistrictId,
												"permenantPINCode" : permenantPINCode,
												"permenantLocality" : permenantLocality,
												"permanantLandmark" : permanantLandmark,
												"permenantOthercityName" : permenantOthercityName,
												"permenantOtherDistrictName" : permenantOtherDistrictName,
												"permenantStateId" : permenantStateId,
												"permenantPostOffice" : permenantPostOffice,

												"guardianName" : guardianName,
												"guardianOccupationName" : guardianOccupationName,
												"guardianFlatNo" : guardianFlatNo,
												"guardianStreetName" : guardianStreetName,
												"guardianCity" : guardianCity,
												"guardianDistrict" : guardianDistrict,
												"guardianPINCode" : guardianPINCode,
												"relationWithGuardian" : relationWithGuardian,
												"guardianPhone" : guardianPhone,
												"guardianLocality" : guardianLocality,
												"guardianLandmark" : guardianLandmark,
												"guardianOtherCityName" : guardianOtherCityName,
												"guardianOtherDistrictName" : guardianOtherDistrictName,
												"guardianState" : guardianState
											};

											
											var sscHsscDetails = {
													"registrationNumber" : registrationNumber,

													"yearOfExamHssc" : yearOfExamHssc,
													"marksObtained" : marksObtained,
													"outOfMarks" : outOfMarks,
													"percentage" : percentage,
													"schoolCollegeName" : schoolCollegeName,
													"board" : board,
													"grade" : grade,
													"percentile" : percentile,
													"hscPcm" : hscPcm,
													"hscEng" : hscEng,
													"hscChe" : hscChe,
													"hscPcmMax" : hscPcmMax,
													"hscEngMax" : hscEngMax,
													"hscCheMax" : hscCheMax,
													"hscBio" : hscBio,
													"hscMat" : hscMat,
													"hscPhy" : hscPhy,
													"hscBioMax" : hscBioMax,
													"hscMatMax" : hscMatMax,
													"hscPhyMax" : hscPhyMax,

													"sscExamYear" : sscExamYear,
													"sscMarksObtained" : sscMarksObtained,
													"sscOutOf" : sscOutOf,
													"sscPercentage" : sscPercentage,
													"sscPercentile" : sscPercentile,
													"sscRollNumber" : sscRollNumber,
													"sscBoard" : sscBoard,
													"sscGrade" : sscGrade,
													"sscAttempts" : sscAttempts
												};
											var lastQualificationParameter = {
												"lastQualifications" : new String(
														lastQualifyingJsonStr)
											};

											var entranceExamParameter = {
												"entranceExamJson" : new String(
														entranceExamJsonStr)
											};

											formData = new FormData();

											if (studentPhotograph != '') {
												$
														.each(
																studentPhotograph,
																function(key,
																		value) {
																	formData
																			.append(
																					"studentImage",
																					value);
																});
											}

											if (studentSign != '') {
												$
														.each(
																studentSign,
																function(key,
																		value) {
																	formData
																			.append(
																					"studentSignatureImage",
																					value);
																});
											}


											formData
													.append(
															"studentAdmissionParameters",
															JSON
																	.stringify(studentAdmissionParameters));
											formData
													.append(
															"studentAddressParameters",
															JSON
																	.stringify(studentAddressParameters));
											formData
											.append(
													"sscHsscDetails",
													new String(
															sscHsscDetails));
											formData
													.append(
															"lastQualifyingJsonStr",
															new String(
																	lastQualifyingJsonStr));
											formData
													.append(
															"entranceExamJsonStr",
															new String(
																	entranceExamJsonStr));

											/*formData.append("photoLink", $("#photoLink").val());
											formData.append("signatureLink", $("#signatureLink").val());*/
											formData
													.append(
															"studentOldPhoto",
															$(
																	"#studentOldPhoto")
																	.val());
											formData.append(
													"studentOldSignature",
													$("#studentOldSignature")
															.val());
											$
													.ajax({
														async : false,
														url : "../../academic/student/information/add-ajax",
														type : "POST",
														data : formData,
														processData : false,
														contentType : false,
														success : function(
																response) {
															//alert(response);
															if (response != 0) {
																//window.location="../../academic/admission-successful";
																alert('Information Saved Successfully');
															}
														},
														error : function() {
															alert('error...');
														},
													});
										});

						/* $("#submit_button, #submit-form-btn").click(function() {
							submitByButton = true;
							$('#add-update-student-form').submit();
						}); */

						$
								.ajax({
									async : false,
									url : "../../resources/uploads/states.json",
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
													$("#permenantCityId").find(
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
													$("#permenantCityId").find(
															"option:gt(0)")
															.remove();
													break;
												case "guardianStateId":
													$("#guardianDistrict")
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
													$("#permenantCityId")
															.empty().html(
																	cities);
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
												case "guardianDistrict":
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
											$("#guardianStateId").val(
													$("#permenantStateId")
															.val()).change();
											$("#guardianDistrict").val(
													$("#permenantDistrictId")
															.val()).change();
											$("#guardianCity")
													.val(
															$(
																	"#permenantCityId")
																	.val());
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

						/* jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '0');
						}, ""); */

						$("#save-general-information-btn")
								.click(
										function() {
											//alert('Click');
											var id = $("#id").val();
											var enrollmentNumber = $("#enrollmentNumber").val();
											var title = $("#title").val();
											var studentName = $("#studentName").val();
											var dateOfBirthString = $("#dateOfBirthString").val();
											var gender = $('[name=gender]:checked').val();
											var religionId = $("#religionId").val();
											var categoryId = $("#categoryId").val();
											var casteId = $("#casteId").val();
											var email = $("#email").val();
											var registrationNumber = $("#registrationNumber").val();
											var studentNameInHindi = $("#studentNameInHindi").val();
											var adharCardNumber = $("#adharCardNumber").val();
											var married = $('[name=married]:checked').val();
											var nationalityId = $("#nationalityId").val();
											var admissionCategoryNumber = $("#admissionCategoryNumber").val();
											var bloodGroupId = $("#bloodGroupId").val();
											var studentMobileNumber = $("#studentMobileNumber").val();
											//alert("registrationNumber : "+registrationNumber);
											var dataParam = {
													"enrollmentNumber" : enrollmentNumber,
													"title" : title,
													"studentName" : studentName,
													"dateOfBirthString" : dateOfBirthString,
													"gender" : gender,
													"religionId" : religionId,
													"categoryId" : categoryId,
													"casteId" : casteId,
													"email" : email,
													"registrationNumber" : registrationNumber,
													"studentNameInHindi" : studentNameInHindi,
													"adharCardNumber" : adharCardNumber,
													"married" : married,
													"nationalityId" : nationalityId,
													"admissionCategoryNumber" : admissionCategoryNumber,
													"bloodGroupId" : bloodGroupId,
													"studentMobileNumber" : studentMobileNumber
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/basic-information",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response != 0) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						$("#save-parents-details-btn")
								.click(
										function() {
											var registrationNumber = $("#registrationNumber").val();

											var fatherName = $("#fatherName").val();
											var fatherDesignation = $("#fatherDesignation").val();
											var fatherEmailid = $("#fatherEmailid").val();
											var fatherOccupationId = $("#fatherOccupationId").val();
											var fatherOfficeAddress = $("#fatherOfficeAddress").val();
											var fatherMobileNumber = $("#fatherMobileNumber").val();

											var motherName = $("#motherName").val();
											var motherDesignation = $("#motherDesignation").val();
											var motherEmailid = $("#motherEmailid").val();
											var motherOccupationId = $("#motherOccupationId").val();
											var motherOfficeAddress = $("#motherOfficeAddress").val();
											var motherMobileNumber = $("#motherMobileNumber").val();

											var guardianName = $("#guardianName").val();
											var guardianOccupationName = $("#guardianOccupationName").val();
											var guardianEmail = $("#guardianEmail").val();
											var relationWithGuardian = $("#relationWithGuardian").val();
											var guardianPhone = $("#guardianPhone").val();

											var dataParam = {
													"registrationNumber" : registrationNumber,

													"fatherName" : fatherName,
													"fatherDesignation" : fatherDesignation,
													"fatherEmailid" : fatherEmailid,
													"fatherOccupationId" : fatherOccupationId,
													"fatherOfficeAddress" : fatherOfficeAddress,
													"fatherMobileNumber" : fatherMobileNumber,

													"motherName" : motherName,
													"motherDesignation" : motherDesignation,
													"motherEmailid" : motherEmailid,
													"motherOccupationId" : motherOccupationId,
													"motherOfficeAddress" : motherOfficeAddress,
													"motherMobileNumber" : motherMobileNumber,

													"guardianName" : guardianName,
													"guardianOccupationName" : guardianOccupationName,
													"guardianEmail" : guardianEmail,
													"relationWithGuardian" : relationWithGuardian,
													"guardianPhone" : guardianPhone
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/parents-information",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response != 0) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						$("#save-address-details-btn")
								.click(
										function() {
											var registrationNumber = $("#registrationNumber").val();

											var localPINCode = $("#localPINCode").val();
											var localDistrictId = $("#localDistrictId").val();
											var localStateId = $("#localStateId").val();
											var localTelephone = $("#localTelephone").val();
											var localTown = $("#localTown").val();
											var localCity = $("#localCity").val();

											var permenantPINCode = $("#permenantPINCode").val();
											var permenantDistrictId = $("#permenantDistrictId").val();
											var permenantStateId = $("#permenantStateId").val();
											var permenantTelephoneNumber = $("#permenantTelephoneNumber").val();
											var permenantTown = $("#permenantTown").val();
											var permenantCityId = $("#permenantCityId").val();

											var guardianPINCode = $("#guardianPINCode").val();
											var guardianDistrict = $("#guardianDistrict").val();
											var guardianStateId = $("#guardianStateId").val();
											var guardianTelephone = $("#guardianTelephone").val();
											var railwayStation = $("#railwayStation").val();
											var localStationName = $("#localStationName").val();
											var guardianTown = $("#guardianTown").val();
											var guardianCity = $("#guardianCity").val();
											var busStation = $("#busStation").val();

											var dataParam = {
													"registrationNumber" : registrationNumber,

													"localPINCode" : localPINCode,
													"localDistrictId" : localDistrictId,
													"localStateId" : localStateId,
													"localTelephone" : localTelephone,
													"localTown" : localTown,
													"localCity" : localCity,

													"permenantPINCode" : permenantPINCode,
													"permenantDistrictId" : permenantDistrictId,
													"permenantStateId" : permenantStateId,
													"permenantTelephoneNumber" : permenantTelephoneNumber,
													"permenantTown" : permenantTown,
													"permenantCityId" : permenantCityId,

													"guardianPINCode" : guardianPINCode,
													"guardianDistrict" : guardianDistrict,
													"guardianStateId" : guardianStateId,
													"guardianTelephone" : guardianTelephone,
													"railwayStation" : railwayStation,
													"localStationName" : localStationName,
													"guardianTown" : guardianTown,
													"guardianCity" : guardianCity,
													"busStation" : busStation

											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/address-information",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response != 0) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}

													});
										});

						$("#save-admission-details-btn")
								.click(
										function() {

											var registrationNumber = $("#registrationNumber").val();

											var admissionDateString = $("#admissionDateString").val();
											var degreeId = $("#degreeId").val();
											var admittedToYear = $("#admittedToYear").val();
											var paymentType = $("#paymentType").val();
											var studentType = $("#studentType").val();
											var Quota = $("#Quota").val();
											var admissionYear = $("#admissionYear").val();
											var branchNumber = $("#branchNumber").val();
											var semesterId = $("#semesterId").val();
											var stateOfEligibility = $("#stateOfEligibility").val();
											var hosteler = $("#hosteler").val();

											var annualIncome = $("#annualIncome").val();
											var urban = $("#urban").val();
											var scholarshipType = $("#scholarshipType").val();
											var scholarshipCategory = $("#scholarshipCategory").val();

											var dataParam = {
													"registrationNumber" : registrationNumber,

													"admissionDateString" : admissionDateString,
													"degreeId" : degreeId,
													"admittedToYear" : admittedToYear,
													"paymentType" : paymentType,
													"studentType" : studentType,
													"Quota" : Quota,
													"admissionYear" : admissionYear,
													"branchNumber" : branchNumber,
													"semesterId" : semesterId,
													"stateOfEligibility" : stateOfEligibility,
													"hosteler" : hosteler,

													"annualIncome" : annualIncome,
													"urban" : urban,
													"scholarshipType" : scholarshipType,
													"scholarshipCategory" : scholarshipCategory
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/admission-information",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response != 0) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						$("#save-personal-details-btn")
								.click(
										function() {
											var registrationNumber = $("#registrationNumber").val();

											var birthPlace = $("#birthPlace").val();
											var identityMark1 = $("#identityMark1").val();
											var countryDomicile = $("#countryDomicile").val();
											var bankNumber = $("#bankNumber").val();
											var physicallyHandicapped = $('[name=physicallyHandicapped]:checked').val();
											var height = $("#height").val();
											var motherTongueId = $("#motherTongueId").val();
											var visaNumber = $("#visaNumber").val();
											var accountNumber = $("#accountNumber").val();
											var typeOfPhysicallyHandicap = $("#typeOfPhysicallyHandicap").val();
											var weight = $("#weight").val();
											var otherLanguage = $("#otherLanguage").val();
											var passportNumber = $("#passportNumber").val();
											var degreeOfDisability = $("#degreeOfDisability").val();

											//$("#leftThumbTag")
											//$("#rightThumbTag")

											var dataParam = {
													"registrationNumber" : registrationNumber,

													"birthPlace" : birthPlace,
													"identityMark1" : identityMark1,
													"countryDomicile" : countryDomicile,
													"bankNumber" : bankNumber,
													"physicallyHandicapped" : physicallyHandicapped,
													"height" : height,
													"motherTongueId" : motherTongueId,
													"visaNumber" : visaNumber,
													"accountNumber" : accountNumber,
													"typeOfPhysicallyHandicap" : typeOfPhysicallyHandicap,
													"weight" : weight,
													"otherLanguage" : otherLanguage,
													"passportNumber" : passportNumber,
													"degreeOfDisability" : degreeOfDisability,
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/personal-information",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response != 0) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						$("#save-document-list-btn")
								.click(
										function() {
											var registrationNumber = $(
													"#registrationNumber")
													.val();
											var documentList = $(
													'[name=documentList]:checked')
													.map(function() {
														return this.value;
													}).get();
											documentList = new String(
													documentList);
											var jsonStr = new Array();

											$
													.each(
															lastQualifyingArray,
															function(index, ob) {
																jsonStr
																		.push(JSON
																				.stringify(ob));
															});

											var dataParam = {
												"registrationNumber" : registrationNumber,
												"documentList" : documentList//,
												//"array" : new String(jsonStr)
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/document-information",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response == true) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						$("#add-last-qualificaiton-details-btn")
								.click(
										function() {

											text = '';
											if ($("#qualifyingExamNumber").val() == '')
												$("#qualifyingExamNumberLabel")
														.css('visibility',
																'visible');
											else if ($("#lastQualifyingSchoolCollegeName")
													.val() == '')
												$("#schoolCollegeNameLabel")
														.css('visibility',
																'visible');
											else if ($("#lastQualifyingBoard").val() == '')
												$("#boardLabel")
														.css('visibility',
																'visible');
											/* else if ($("#qualifyingExamNumber")
													.val() == 0)
												return false; */
											else {
												text = {
													"qualifyingExamNumber" : $(
															"#qualifyingExamNumber")
															.val(),
													"yearOfExamHssc" : $(
															"#qualifyingYearOfExam")
															.val(),
													"schoolCollegeName" : $(
															"#lastQualifyingSchoolCollegeName")
															.val(),
													"board" : $("#lastQualifyingBoard").val(),
													"marksObtained" : $(
															"#qualifyingMarksObtained")
															.val(),
													"grade" : $("#lastQualifyingGrade").val(),
													"outOfMarks" : $(
															"#qualifyingOutOfMarks")
															.val(),
													"percentage" : $(
															"#qualifyingPercentage")
															.val(),
													"attemptsTaken" : $(
															"#qualifyingAttemptsTaken")
															.val()
												};
												lastQualifyingArray[$(
														"#qualifyingExamNumber")
														.val()] = text;

												if (updateOperation == true) {
													$(
															"#last_qualifying_tr_id_"
																	+ $(
																			"#qualifyingExamNumber")
																			.val())
															.remove();
													updateOperation = false;
												}

												$("#last_qualifying_table")
														.append(
																"<tr class=\"odd\" id=\"last_qualifying_tr_id_"
																		+ $(
																				"#qualifyingExamNumber")
																				.val()
																		+ "\">"
																		+ "<td>"
																		+ "	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateLastQualificaitonDetails("
																		+ $(
																				"#qualifyingExamNumber")
																				.val()
																		+ ")\">"
																		+ "		<span class=\"glyphicon glyphicon-pencil\"></span>"
																		+ "	</button>"
																		+ "	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteLastQualificaitonDetails("
																		+ $(
																				"#qualifyingExamNumber")
																				.val()
																		+ ")\">"
																		+ "		<span class=\"glyphicon glyphicon-remove\"></span>"
																		+ "	</button>"
																		+ "</td>"
																		+ ""
																		+ "<td>"
																		+ $(
																				"#qualifyingExamNumber option[value='"
																						+ $(
																								"#qualifyingExamNumber")
																								.val()
																						+ "']")
																				.text()
																		+ "</td>"
																		+ "<td>"
																		+ $(
																				"#qualifyingYearOfExam")
																				.val()
																		+ "</td>"
																		+ "<td>"
																		+ $(
																				"#lastQualifyingSchoolCollegeName")
																				.val()
																		+ "</td>"
																		+ "<td>"
																		+ $(
																				"#qualifyingPercentage")
																				.val()
																		+ "</td>"
																		+ "<td>"
																		+ $(
																				"#lastQualifyingBoard")
																				.val()
																		+ "</td>"
																		+ "</tr>");

												removedLastQualifyingExamOptions
														.push({
															"id" : $(
																	"#qualifyingExamNumber")
																	.val(),
															"text" : $(
																	"#qualifyingExamNumber option[value='"
																			+ $(
																					"#qualifyingExamNumber")
																					.val()
																			+ "']")
																	.text()
														});
												$(
														"#qualifyingExamNumber option[value='"
																+ $(
																		"#qualifyingExamNumber")
																		.val()
																+ "']")
														.remove();
												$("#qualifyingExamNumber").val(
														0).change();

											}

										});

						$("#save-last-qualificaiton-details-btn")
								.click(
										function() {
											var registrationNumber = $(
													"#registrationNumber")
													.val();
											var jsonStr = new Array();

											$
													.each(
															lastQualifyingArray,
															function(index, ob) {
																jsonStr
																		.push(JSON
																				.stringify(ob));
															});

											var registrationNumber = $("#registrationNumber").val();

											var yearOfExamHssc = $("#yearOfExamHssc").val();
											var marksObtained = $("#marksObtained").val();
											var outOfMarks = $("#outOfMarks").val();
											var percentage = $("#percentage").val();
											var schoolCollegeName = $("#schoolCollegeName").val();
											var board = $("#board").val();
											var grade = $("#grade").val();
											var percentile = $("#percentile").val();
											var hscPcm = $("#hscPcm").val();
											var hscEng = $("#hscEng").val();
											var hscChe = $("#hscChe").val();
											var hscPcmMax = $("#hscPcmMax").val();
											var hscEngMax = $("#hscEngMax").val();
											var hscCheMax = $("#hscCheMax").val();
											var hscBio = $("#hscBio").val();
											var hscMat = $("#hscMat").val();
											var hscPhy = $("#hscPhy").val();
											var hscBioMax = $("#hscBioMax").val();
											var hscMatMax = $("#hscMatMax").val();
											var hscPhyMax = $("#hscPhyMax").val();

											var sscExamYear = $("#sscExamYear").val();
											var sscMarksObtained = $("#sscMarksObtained").val();
											var sscOutOf = $("#sscOutOf").val();
											var sscPercentage = $("#sscPercentage").val();
											var sscPercentile = $("#sscPercentile").val();
											var sscRollNumber = $("#sscRollNumber").val();
											var sscBoard = $("#sscBoard").val();
											var sscGrade = $("#sscGrade").val();
											var sscAttempts = $("#sscAttempts").val();

											
											text = {
													"registrationNumber" : registrationNumber,

													"yearOfExamHssc" : yearOfExamHssc,
													"marksObtained" : marksObtained,
													"outOfMarks" : outOfMarks,
													"percentage" : percentage,
													"schoolCollegeName" : schoolCollegeName,
													"board" : board,
													"grade" : grade,
													"percentile" : percentile,
													"hscPcm" : hscPcm,
													"hscEng" : hscEng,
													"hscChe" : hscChe,
													"hscPcmMax" : hscPcmMax,
													"hscEngMax" : hscEngMax,
													"hscCheMax" : hscCheMax,
													"hscBio" : hscBio,
													"hscMat" : hscMat,
													"hscPhy" : hscPhy,
													"hscBioMax" : hscBioMax,
													"hscMatMax" : hscMatMax,
													"hscPhyMax" : hscPhyMax,

													"sscExamYear" : sscExamYear,
													"sscMarksObtained" : sscMarksObtained,
													"sscOutOf" : sscOutOf,
													"sscPercentage" : sscPercentage,
													"sscPercentile" : sscPercentile,
													"sscRollNumber" : sscRollNumber,
													"sscBoard" : sscBoard,
													"sscGrade" : sscGrade,
													"sscAttempts" : sscAttempts
												};
											
											var dataParam = {
												"registrationNumber" : registrationNumber,
												"lastQualifications" : new String(jsonStr),
												"sscHsscDetails" : JSON.stringify(text),
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/last-qualification",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response == true) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						/* Entrance Exam Details */
						$("#add-entrance-btn")
								.click(
										function() {

											text = '';
											if ($("#entranceQualifyingNumber")
													.val() == 0)
												$(
														"#entranceQualifyingNumberLabel")
														.css('visibility',
																'visible');
											else if ($("#entranceAllIndiaRank")
													.val() == '')
												$("#entranceAllIndiaRankLabel")
														.css('visibility',
																'visible');
											else if ($(
													"#entranceYearOfExamHssc")
													.val() == '')
												$(
														"#entranceYearOfExamHsscLabel")
														.css('visibility',
																'visible');
											else if ($("#entranceMarksObtained")
													.val() == '')
												$("#entranceMarksObtainedLabel")
														.css('visibility',
																'visible');
											else if ($("#entranceStateRank")
													.val() == '')
												$("#entranceStateRankLabel")
														.css('visibility',
																'visible');
											else if ($(
													"#entranceHallTicketNumber")
													.val() == '')
												$(
														"#entranceHallTicketNumberLabel")
														.css('visibility',
																'visible');
											else {
												text = {
													"qualifyingExamNumber" : $(
															"#entranceQualifyingNumber")
															.val(),
													"allIndiaRank" : $(
															"#entranceAllIndiaRank")
															.val(),
													"yearOfExamHssc" : $(
															"#entranceYearOfExamHssc")
															.val(),
													"marksObtained" : $(
															"#entranceMarksObtained")
															.val(),
													"percentage" : $(
															"#entrancePercentage")
															.val(),
													"score" : $(
															"#entranceScore")
															.val(),
													"quotaId" : $(
															"#entranceQuotaId")
															.val(),
													"otherEntranceExam" : $(
															"#entranceOtherEntranceExam")
															.val(),
													"stateRank" : $(
															"#entranceStateRank")
															.val(),
													"outOfMarks" : $(
															"#entranceOutOfMarks")
															.val(),
													"hallTicketNumber" : $(
															"#entranceHallTicketNumber")
															.val(),
													"percentile" : $(
															"#entrancePercentile")
															.val(),
													"otherDetails" : $(
															"#entranceOtherDetails")
															.val()
												};
												//alert($("#entranceQualifyingNumber").val());
												entranceExamArray[$(
														"#entranceQualifyingNumber")
														.val()] = text;

												if (updateEntranceOperation == true) {
													$(
															"#entrance_exam_tr_id_"
																	+ $(
																			"#entranceQualifyingNumber")
																			.val())
															.remove();
													updateOperation = false;
												}

												$("#entrance_exam_table")
														.append(
																"<tr class=\"odd\" id=\"entrance_exam_tr_id_"
																		+ $(
																				"#entranceQualifyingNumber")
																				.val()
																		+ "\">"
																		+ "<td>"
																		+ "	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateEntranceExamDetails("
																		+ $(
																				"#entranceQualifyingNumber")
																				.val()
																		+ ")\">"
																		+ "		<span class=\"glyphicon glyphicon-pencil\"></span>"
																		+ "	</button>"
																		+ "	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteEntranceExamDetails("
																		+ $(
																				"#entranceQualifyingNumber")
																				.val()
																		+ ")\">"
																		+ "		<span class=\"glyphicon glyphicon-remove\"></span>"
																		+ "	</button>"
																		+ "</td>"
																		+ ""
																		+ "	<td>"
																		+ $(
																				"#entranceQualifyingNumber option[value='"
																						+ $(
																								"#entranceQualifyingNumber")
																								.val()
																						+ "']")
																				.text()
																		+ "</td>"
																		+ "	<td>"
																		+ $(
																				"#entranceYearOfExamHssc")
																				.val()
																		+ "</td>"
																		+ "	<td>"
																		+ $(
																				"#entranceAllIndiaRank")
																				.val()
																		+ "</td>"
																		+ "</tr>");

												removedentranceExamOptions
														.push({
															"id" : $(
																	"#entranceQualifyingNumber")
																	.val(),
															"text" : $(
																	"#entranceQualifyingNumber option[value='"
																			+ $(
																					"#entranceQualifyingNumber")
																					.val()
																			+ "']")
																	.text()
														});
												$(
														"#entranceQualifyingNumber option[value='"
																+ $(
																		"#entranceQualifyingNumber")
																		.val()
																+ "']")
														.remove();
												$("#entranceQualifyingNumber")
														.val(0).change();

											}

										});

						$("#save-entrance-btn")
								.click(
										function() {
											var registrationNumber = $(
													"#registrationNumber")
													.val();
											
											text = {
													"registrationNumber" : registrationNumber,
													
													"qualifyingExamNumber" : $(
															"#entranceQualifyingNumber")
															.val(),
													"allIndiaRank" : $(
															"#entranceAllIndiaRank")
															.val(),
													"yearOfExamHssc" : $(
															"#entranceYearOfExamHssc")
															.val(),
													"marksObtained" : $(
															"#entranceMarksObtained")
															.val(),
													"percentage" : $(
															"#entrancePercentage")
															.val(),
													"score" : $(
															"#entranceScore")
															.val(),
													"quotaId" : $(
															"#entranceQuotaId")
															.val(),
													"otherEntranceExam" : $(
															"#entranceOtherEntranceExam")
															.val(),
													"stateRank" : $(
															"#entranceStateRank")
															.val(),
													"outOfMarks" : $(
															"#entranceOutOfMarks")
															.val(),
													"hallTicketNumber" : $(
															"#entranceHallTicketNumber")
															.val(),
													"percentile" : $(
															"#entrancePercentile")
															.val(),
													"otherDetails" : $(
															"#entranceOtherDetails")
															.val()
											};			

											

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/entrance-exam",
														type : "POST",
														data : {"entranceExamJson" : JSON.stringify(text), "registrationNumber" : registrationNumber},
														success : function(
																response) {
															if (response == true) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

						/* Family Member Details  */
						$("#add-family-member")
								.click(
										function() {

											var flag = false;
											var indexToBeUpdate = 0;

											$
													.each(
															familyMemberArray,
															function(index,
																	member) {
																//alert(JSON.stringify(member) +" - "+ $("#familyMemberName").val());
																if (member.familyMemberName == $(
																		"#familyMemberName")
																		.val()
																		.trim()) {
																	flag = true;
																	indexToBeUpdate = index;
																}
															});

											text = '';
											if ($("#familyMemberName").val() == '')
												$("#familyMemberNameLabel")
														.html(
																'Please Enter Family Member Name')
														.css('visibility',
																'visible');
											else if (flag == true) {
												$("#familyMemberNameLabel")
														.html(
																'Family Member Already Added')
														.css('visibility',
																'visible');
											} else if ($("#familyMobile").val() == '')
												$("#familyMobileLabel")
														.css('visibility',
																'visible');
											else if ($("#familyRelation").val() == '')
												$("#familyRelationLabel")
														.css('visibility',
																'visible');
											else {
												text = {
													"familyMemberName" : $(
															"#familyMemberName")
															.val(),
													"familyMemberAddress" : $(
															"#familyMemberAddress")
															.val(),
													"familyMobile" : $(
															"#familyMobile")
															.val(),
													"educationId" : $(
															"#educationId")
															.val(),
													"familyRelation" : $(
															"#familyRelation")
															.val(),
													"familyEmail" : $(
															"#familyEmail")
															.val(),
													"familyDesignation" : $(
															"#familyDesignation")
															.val()
												};
												//alert($("#entranceQualifyingNumber").val());

												var trId = new String($(
														"#familyMemberName")
														.val());
												trId = trId.replace(/[\s]+/g,
														"_");

												if (updateFamilyMemberOperation == true) {
													$(
															"#family_member_tr_id_"
																	+ trId)
															.remove();
													familyMemberArray[indexToBeUpdate] = text;
													updateFamilyMemberOperation = false;
												} else {
													familyMemberArray
															.push(text);
												}

												$("#family_member_table")
														.append(
																"<tr class=\"odd\" id=\"family_member_tr_id_"
																		+ trId
																		+ "\">"
																		+ "<td>"
																		+ "	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateFamilyMemberDetails('"
																		+ trId
																		+ "')\">"
																		+ "		<span class=\"glyphicon glyphicon-pencil\"></span>"
																		+ "	</button>"
																		+ "	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteFamilyMemberDetails('"
																		+ trId
																		+ "')\">"
																		+ "		<span class=\"glyphicon glyphicon-remove\"></span>"
																		+ "	</button>"
																		+ "</td>"
																		+ ""
																		+ "	<td>"
																		+ $(
																				"#familyMemberName")
																				.val()
																		+ "</td>"
																		+ "	<td>"
																		+ $(
																				"#familyRelation option[value='"
																						+ $(
																								"#familyRelation")
																								.val()
																						+ "']")
																				.text()
																		+ "</td>"
																		+ "	<td>"
																		+ $(
																				"#familyMobile")
																				.val()
																		+ "</td>"
																		+ "</tr>");

												$("#familyRelation").val(0)
														.change();

											}

										});

						$("#save-family-member")
								.click(
										function() {
											var registrationNumber = $(
													"#registrationNumber")
													.val();
											var jsonStr = new Array();

											$
													.each(
															familyMemberArray,
															function(index, ob) {
																jsonStr
																		.push(JSON
																				.stringify(ob));
																//alert(JSON.stringify(ob));
															});

											var dataParam = {
												"registrationNumber" : registrationNumber,
												"familyMemberJson" : new String(
														jsonStr)
											};

											$
													.ajax({
														async : false,
														url : "../../academic/student/information/family-member",
														type : "POST",
														data : dataParam,
														success : function(
																response) {
															if (response == true) {
																alert('Saved');
															}
														},
														error : function() {
															alert('Error...');
														}
													});
										});

					});

	function updateLastQualificaitonDetails(id) {
		updateOperation = true;
		var flag = false;

		$.each($("#qualifyingExamNumber option"), function() {
			if ($(this).attr('value') == id)
				flag = true;
		});

		$.each(removedLastQualifyingExamOptions, function(index, option) {
			if (option.id == id && flag == false) {
				$("#qualifyingExamNumber").append(
						"<option value=\""+option.id+"\">" + option.text
								+ "</option>");
			}
			//removedLastQualifyingExamOptions[id] = {"id":-1, "text":""};
		});

		$.each(lastQualifyingArray, function(index, object) {
			if (index == id) {
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

	function deleteLastQualificaitonDetails(id) {
		$("#last_qualifying_tr_id_" + id).remove();
		$.each(removedLastQualifyingExamOptions, function(index, option) {
			if (option.id == id) {
				$("#qualifyingExamNumber").append(
						"<option value=\""+option.id+"\">" + option.text
								+ "</option>");
			}
		});
		lastQualifyingArray[id] = {
			"qualifyingExamId" : -1,
			"text" : ""
		};
	}

	function updateEntranceExamDetails(id) {
		updateEntranceOperation = true;
		var flag = false;

		$.each($("#entranceQualifyingNumber option"), function() {
			if ($(this).attr('value') == id)
				flag = true;
		});

		$.each(removedentranceExamOptions, function(index, option) {
			if (option.id == id && flag == false) {
				$("#entranceQualifyingNumber").append(
						"<option value=\""+option.id+"\">" + option.text
								+ "</option>");
				$("#entranceQualifyingNumber").val(option.id).change();
			}
			//removedLastQualifyingExamOptions[id] = {"id":-1, "text":""};
		});

		$.each(entranceExamArray, function(index, object) {
			if (index == id) {
				$("#entranceQualifyingNumber").val(object.qualifyingNumber)
						.change();
				$("#entranceAllIndiaRank").val(object.allIndiaRank);
				$("#entranceYearOfExamHssc").val(object.yearOfExamHssc);
				$("#entranceMarksObtained").val(object.marksObtained);
				$("#entrancePercentage").val(object.percentage);
				$("#entranceScore").val(object.score);
				$("#entranceQuotaId").val(object.quotaId);
				$("#entranceOtherEntranceExam").val(object.otherEntranceExam);
				$("#entranceStateRank").val(object.stateRank);
				$("#entranceOutOfMarks").val(object.outOfMarks);
				$("#entranceHallTicketNumber").val(object.hallTicketNumber);
				$("#entrancePercentile").val(object.percentile);
				$("#entranceOtherDetails").val(object.otherDetails);
			}
		});
	}

	function deleteEntranceExamDetails(id) {
		$("#entrance_exam_tr_id_" + id).remove();
		$.each(removedentranceExamOptions, function(index, option) {
			if (option.id == id) {
				$("#entranceQualifyingNumber").append(
						"<option value=\""+option.id+"\">" + option.text
								+ "</option>");
			}
		});
		entranceExamArray[id] = {
			"qualifyingExamId" : -1,
			"text" : ""
		};
	}

	function updateFamilyMemberDetails(memberName) {
		updateFamilyMemberOperation = true;
		var flag = false;
		memberName = memberName.replace(/[_]/g, " ");

		$.each(familyMemberArray, function(index, object) {
			if (object.familyMemberName == memberName) {
				$("#familyMemberName").val(object.familyMemberName);
				$("#familyMemberAddress").val(object.familyMemberAddress);
				$("#familyMobile").val(object.familyMobile);
				$("#educationId").val(object.educationId);
				$("#familyRelation").val(object.familyRelation);
				$("#familyEmail").val(object.familyEmail);
				$("#familyDesignation").val(object.familyDesignation);
			}
		});
	}

	function deleteFamilyMemberDetails(memberName) {
		$("#family_member_tr_id_" + memberName).remove();
		$
				.each(familyMemberArray,
						function(index, object) {
							if (object.id != -1
									&& object.familyMemberName.replace(
											/[\s]+/g, '_') == memberName) {
								familyMemberArray[index] = {
									"id" : -1
								};
							}
						});

	}

	function setStudentData(response) {
		//alert(response);
		var jsonOb = JSON.parse(response);
		var studentAdmissionJsonOb = jsonOb.studentAdmissionEntity;
		var studentAddressJsonOb = jsonOb.studentAddressEntity;
		var LastQualifyingExamJsonOb = jsonOb.LastQualifyingExamMasterEntity;

		/* basic-information */
		$("#id").val(studentAdmissionJsonOb.id);
		$("#title").val(studentAdmissionJsonOb.title);
		$("#studentName").val(studentAdmissionJsonOb.studentName);
		$("#dateOfBirthString").val(studentAdmissionJsonOb.dateOfBirthString);
		$("#gender-" + studentAdmissionJsonOb.gender).prop('checked', 'checked');
		$("#religionId").val(studentAdmissionJsonOb.religionId);
		$("#categoryId").val(studentAdmissionJsonOb.categoryId);
		$("#casteId").val(studentAdmissionJsonOb.casteId);
		$("#email").val(studentAdmissionJsonOb.email);
		$("#registrationNumber").val(studentAdmissionJsonOb.registrationNumber);
		$("#studentNameInHindi").val(studentAdmissionJsonOb.studentNameInHindi);
		$("#adharCardNumber").val(studentAdmissionJsonOb.adharCardNumber);
		$("#married-" + jsonOb.studentAdmissionEntity.married).prop('checked','checked');
		$("#nationalityId").val(studentAdmissionJsonOb.nationalityId);
		$("#admissionCategoryNumber").val(studentAdmissionJsonOb.admissionCategoryNumber);
		$("#bloodGroupId").val(studentAdmissionJsonOb.bloodGroupId);
		$("#studentMobileNumber").val(studentAdmissionJsonOb.studentMobileNumber);
		
		$("#studentImageTag").attr(
				'src',
				"../../resources/uploads/academic/admission/"
						+ studentAdmissionJsonOb.studentPhoto);
		$("#studentSignatureTag").attr(
				'src',
				"../../resources/uploads/academic/admission/"
						+ studentAdmissionJsonOb.studentSignature);

		$("#studentOldPhoto").val(studentAdmissionJsonOb.studentOldPhoto);
		$("#studentOldSignature").val(
				studentAdmissionJsonOb.studentOldSignature);
		$("#oldRightThumb").val(studentAdmissionJsonOb.oldRightThumb);
		$("#oldLeftThumb").val(studentAdmissionJsonOb.oldLeftThumb);

		
		/* Parents Details */
		 $("#fatherName").val(studentAddressJsonOb.fatherName);
		 $("#fatherDesignation").val(studentAddressJsonOb.fatherDesignation);
		 $("#fatherEmailid").val(studentAddressJsonOb.fatherEmailid);
		 $("#fatherOccupationId").val(studentAddressJsonOb.fatherOccupationId);
		 $("#fatherOfficeAddress").val(studentAddressJsonOb.fatherOfficeAddress);
		 $("#fatherMobileNumber").val(studentAddressJsonOb.fatherMobileNumber);
		
		 $("#motherName").val(studentAddressJsonOb.motherName);
		 $("#motherDesignation").val(studentAddressJsonOb.motherDesignation);
		 $("#motherEmailid").val(studentAddressJsonOb.motherEmailid);
		 $("#motherOccupationId").val(studentAddressJsonOb.motherOccupationId);
		 $("#motherOfficeAddress").val(studentAddressJsonOb.motherOfficeAddress);
		 $("#motherMobileNumber").val(studentAddressJsonOb.motherMobileNumber);
		
		 $("#guardianName").val(studentAddressJsonOb.guardianName);
		 $("#guardianOccupationName").val(studentAddressJsonOb.guardianOccupationName);
		 $("#guardianEmail").val(studentAddressJsonOb.guardianEmail);
		 $("#relationWithGuardian").val(studentAddressJsonOb.relationWithGuardian);
		 $("#guardianPhone").val(studentAddressJsonOb.guardianPhone);
		
		 
		 /* Address Details */
		 $("#localPINCode").val(studentAddressJsonOb.localPINCode);
		 $("#localStateId").val(studentAddressJsonOb.localStateId).change();
		 $("#localDistrictId").val(studentAddressJsonOb.localDistrictId).change();
		 $("#localCity").val(studentAddressJsonOb.localCity).change();
		 $("#localTelephone").val(studentAddressJsonOb.localTelephone);
		 $("#localTown").val(studentAddressJsonOb.localTown);
		 
		
		 $("#permenantPINCode").val(studentAddressJsonOb.permenantPINCode);
		 $("#permenantStateId").val(studentAddressJsonOb.permenantStateId).change();
		 $("#permenantDistrictId").val(studentAddressJsonOb.permenantDistrictId).change();
		 $("#permenantCityId").val(studentAddressJsonOb.permenantCityId);
		 $("#permenantTelephoneNumber").val(studentAddressJsonOb.permenantTelephoneNumber);
		 $("#permenantTown").val(studentAddressJsonOb.permenantTown);
		 
		
		 $("#guardianPINCode").val(studentAddressJsonOb.guardianPINCode);
		 $("#guardianStateId").val(studentAddressJsonOb.guardianStateId).change();
		 $("#guardianDistrict").val(studentAddressJsonOb.guardianDistrict).change();
		 $("#guardianCity").val(studentAddressJsonOb.guardianCity);
		 $("#guardianTelephone").val(studentAddressJsonOb.guardianTelephone);
		 $("#railwayStation").val(studentAddressJsonOb.railwayStation);
		 $("#localStationName").val(studentAddressJsonOb.localStationName);
		 $("#guardianTown").val(studentAddressJsonOb.guardianTown);
		 
		 $("#busStation").val(studentAddressJsonOb.busStation);
		 
 		/*Admission Details*/
 		$("#admissionDateString").val(studentAdmissionJsonOb.admissionDateString);
		 $("#degreeId").val(studentAdmissionJsonOb.degreeId);
		 $("#admittedToYear").val(studentAdmissionJsonOb.admittedToYear);
		 $("#paymentType").val(studentAdmissionJsonOb.paymentType);
		 $("#studentType").val(studentAdmissionJsonOb.studentType);
		 $("#Quota").val(studentAdmissionJsonOb.Quota);
		 $("#admissionYear").val(studentAdmissionJsonOb.admissionYear);
		 $("#branchNumber").val(studentAdmissionJsonOb.branchNumber);
		 $("#semesterId").val(studentAdmissionJsonOb.semesterId);
		 $("#stateOfEligibility").val(studentAdmissionJsonOb.stateOfEligibility);
		 $("#hosteler").val(studentAdmissionJsonOb.hosteler);
		
		 $("#annualIncome").val(studentAdmissionJsonOb.annualIncome);
		 $("#urban").val(studentAdmissionJsonOb.urban);
		 $("#scholarshipType").val(studentAdmissionJsonOb.scholarshipType);
		 $("#scholarshipCategory").val(studentAdmissionJsonOb.scholarshipCategory);
		 
		 /*Personal Details */
		 $("#birthPlace").val(studentAdmissionJsonOb.birthPlace);
		 $("#identityMark1").val(studentAdmissionJsonOb.identityMark1);
		 $("#countryDomicile").val(studentAdmissionJsonOb.countryDomicile);
		 $("#bankNumber").val(studentAdmissionJsonOb.bankNumber);
		 $('[name=physicallyHandicapped]:checked').val(studentAdmissionJsonOb.physicallyHandicapped);
		 $("#height").val(studentAdmissionJsonOb.height);
		 $("#motherTongueId").val(studentAdmissionJsonOb.motherTongueId);
		 $("#visaNumber").val(studentAdmissionJsonOb.visaNumber);
		 $("#accountNumber").val(studentAdmissionJsonOb.accountNumber);
		 $("#typeOfPhysicallyHandicap").val(studentAdmissionJsonOb.typeOfPhysicallyHandicap);
		 $("#weight").val(studentAdmissionJsonOb.weight);
		 $("#otherLanguage").val(studentAdmissionJsonOb.otherLanguage);
		 $("#passportNumber").val(studentAdmissionJsonOb.passportNumber);
		 $("#degreeOfDisability").val(studentAdmissionJsonOb.degreeOfDisability);
 
 		
		/*--------------------------------------------------------------*/
		

		if (jsonOb.studentAdmissionEntity.otherLanguage != null)
			$.each(jsonOb.studentAdmissionEntity.otherLanguage.split(","),
					function(language) {
						$("#otherLanguage-" + language).attr('checked',
								'checked');
					});

		if (jsonOb.studentAdmissionEntity.documentList != null)
			$.each(jsonOb.studentAdmissionEntity.documentList.split(","),
					function(index, document) {
						//console.log(document);
						$("#document-" + document).attr("checked", "checked");
					});

		if (LastQualifyingExamJsonOb != null) {
			var entranceExamOptions = $("#entranceQualifyingNumber>option")
					.map(function() {
						return $(this).val();
					});
			var lastQualifyingExam = $("#qualifyingExamNumber>option")
			.map(function() {
				return $(this).val();
			});
			
			$.each(LastQualifyingExamJsonOb,
					function(index, lastQualification) {
						if ($.inArray(''
								+ lastQualification.qualifyingExamNumber,
								entranceExamOptions) == -1) {
							setLastQualification(JSON
									.stringify(lastQualification));
						} else if ($.inArray(''
								+ lastQualification.qualifyingExamNumber,
								lastQualifyingExam) != -1){
							setEntranceExam(JSON.stringify(lastQualification));
						}else{
							setSscHsscDetails(JSON.stringify(lastQualification));
						}
					});

		}

		if (jsonOb.familyMemberDetailList != null) {
			setFamilyMembers(JSON.stringify(jsonOb.familyMemberDetailList));
		}
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
						url : "../../resources/uploads/districts.json",
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
						url : "../../resources/uploads/cities.json",
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

	function setLastQualification(lastQualification) {

		lastQualification = JSON.parse(lastQualification);

		// $.each(lastQualificationList, function(index, lastQualification){

		text = {
			"qualifyingExamNumber" : lastQualification.qualifyingExamNumber,
			"yearOfExamHssc" : lastQualification.yearOfExamHssc,
			"schoolCollegeName" : lastQualification.schoolCollegeName,
			"board" : lastQualification.board,
			"marksObtained" : lastQualification.marksObtained,
			"grade" : lastQualification.grade,
			"outOfMarks" : lastQualification.outOfMarks,
			"percentage" : lastQualification.percentage,
			"attemptsTaken" : lastQualification.attemptsTaken
		};
		lastQualifyingArray[lastQualification.qualifyingExamNumber] = text;

		$("#last_qualifying_table")
				.append(
						"<tr class=\"odd\" id=\"last_qualifying_tr_id_"
							+ lastQualification.qualifyingExamNumber
							+ "\">"
								+ "<td>"
								+ "	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateLastQualificaitonDetails("
								+ lastQualification.qualifyingExamNumber
								+ ")\">"
								+ "		<span class=\"glyphicon glyphicon-pencil\"></span>"
								+ "	</button>"
								+ "	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteLastQualificaitonDetails("
								+ lastQualification.qualifyingExamNumber
								+ ")\">"
								+ "		<span class=\"glyphicon glyphicon-remove\"></span>"
								+ "	</button>"
								+ "</td>"
								+ ""
								+ "<td>"
								+ $(
										"#qualifyingExamNumber option[value='"
												+ lastQualification.qualifyingExamNumber
												+ "']").text()
								+ "</td>"
								+ "<td>"
								+ lastQualification.yearOfExamHssc
								+ "</td>"
								+ "<td>"
								+ lastQualification.schoolCollegeName
								+ "</td>"
								+ "<td>"
								+ lastQualification.percentage
								+ "</td>"
								+ "<td>"
								+ lastQualification.board
								+ "</td>" + "</tr>");

		removedLastQualifyingExamOptions.push({
			"id" : lastQualification.qualifyingExamNumber,
			"text" : $(
					"#qualifyingExamNumber option[value='"
							+ lastQualification.qualifyingExamNumber + "']")
					.text()
		});

		$(
				"#qualifyingExamNumber option[value='"
						+ lastQualification.qualifyingExamNumber + "']")
				.remove();
		$("#qualifyingExamNumber").val(0).change();

		// });

	}

	function setSscHsscDetails(sscHsscDetails){
		sscHsscDetails = JSON.parse(sscHsscDetails);
		
		$("#yearOfExamHssc").val(sscHsscDetails.yearOfExamHssc);
		 $("#marksObtained").val(sscHsscDetails.marksObtained);
		 $("#outOfMarks").val(sscHsscDetails.outOfMarks);
		 $("#percentage").val(sscHsscDetails.percentage);
		 $("#schoolCollegeName").val(sscHsscDetails.schoolCollegeName);
		 $("#board").val(sscHsscDetails.board);
		 $("#grade").val(sscHsscDetails.grade);
		 $("#percentile").val(sscHsscDetails.percentile);
		 $("#hscPcm").val(sscHsscDetails.hscPcm);
		 $("#hscEng").val(sscHsscDetails.hscEng);
		 $("#hscChe").val(sscHsscDetails.hscChe);
		 $("#hscPcmMax").val(sscHsscDetails.hscPcmMax);
		 $("#hscEngMax").val(sscHsscDetails.hscEngMax);
		 $("#hscCheMax").val(sscHsscDetails.hscCheMax);
		 $("#hscBio").val(sscHsscDetails.hscBio);
		 $("#hscMat").val(sscHsscDetails.hscMat);
		 $("#hscPhy").val(sscHsscDetails.hscPhy);
		 $("#hscBioMax").val(sscHsscDetails.hscBioMax);
		 $("#hscMatMax").val(sscHsscDetails.hscMatMax);
		 $("#hscPhyMax").val(sscHsscDetails.hscPhyMax);

		 $("#sscExamYear").val(sscHsscDetails.sscExamYear);
		 $("#sscMarksObtained").val(sscHsscDetails.sscMarksObtained);
		 $("#sscOutOf").val(sscHsscDetails.sscOutOf);
		 $("#sscPercentage").val(sscHsscDetails.sscPercentage);
		 $("#sscPercentile").val(sscHsscDetails.sscPercentile);
		 $("#sscRollNumber").val(sscHsscDetails.sscRollNumber);
		 $("#sscBoard").val(sscHsscDetails.sscBoard);
		 $("#sscGrade").val(sscHsscDetails.sscGrade);
		 $("#sscAttempts").val(sscHsscDetails.sscAttempts);
	}
	
	function setEntranceExam(entranceExam) {
		entranceExam = JSON.parse(entranceExam);

		text = '';

		text = {
			"qualifyingExamNumber" : entranceExam.qualifyingExamNumber,
			"allIndiaRank" : entranceExam.allIndiaRank,
			"yearOfExamHssc" : entranceExam.yearOfExamHssc,
			"marksObtained" : entranceExam.marksObtained,
			"percentage" : entranceExam.percentage,
			"score" : entranceExam.score,
			"quotaId" : entranceExam.quotaId,
			"otherEntranceExam" : entranceExam.otherEntranceExam,
			"stateRank" : entranceExam.stateRank,
			"rank" : entranceExam.rank,
			"outOfMarks" : entranceExam.outOfMarks,
			"hallTicketNumber" : entranceExam.hallTicketNumber,
			"percentile" : entranceExam.percentile,
			"otherDetails" : entranceExam.otherDetails
		};
		//alert($("#entranceQualifyingNumber").val());
		entranceExamArray[entranceExam.qualifyingExamNumber] = text;

		$("#entrance_exam_table")
				.append(
						"<tr class=\"odd\" id=\"entrance_exam_tr_id_"
									+ entranceExam.qualifyingExamNumber
									+ "\">"
								+ "<td>"
								+ "	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateEntranceExamDetails("
								+ entranceExam.qualifyingExamNumber
								+ ")\">"
								+ "		<span class=\"glyphicon glyphicon-pencil\"></span>"
								+ "	</button>"
								+ "	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteEntranceExamDetails("
								+ entranceExam.qualifyingExamNumber
								+ ")\">"
								+ "		<span class=\"glyphicon glyphicon-remove\"></span>"
								+ "	</button>"
								+ "</td>"
								+ ""
								+ "	<td>"
								+ $(
										"#entranceQualifyingNumber option[value='"
												+ entranceExam.qualifyingExamNumber
												+ "']").text()
								+ "</td>"
								+ "	<td>"
								+ entranceExam.yearOfExamHssc
								+ "</td>"
								+ "	<td>"
								+ entranceExam.rank
								+ "</td>" + "</tr>");

		removedentranceExamOptions.push({
			"id" : entranceExam.qualifyingExamNumber,
			"text" : $(
					"#entranceQualifyingNumber option[value='"
							+ entranceExam.qualifyingExamNumber + "']").text()
		});
		$(
				"#entranceQualifyingNumber option[value='"
						+ entranceExam.qualifyingExamNumber + "']").remove();
		$("#entranceQualifyingNumber").val(0).change();

	}

	function setFamilyMembers(familyMembersList) {

		familyMembersList = JSON.parse(familyMembersList);

		var flag = false;
		var indexToBeUpdate = 0;

		text = '';

		$
				.each(
						familyMembersList,
						function(index, familyMember) {

							text = {
								"familyMemberName" : familyMember.familyMemberName,
								"familyMemberAddress" : familyMember.familyMemberAddress,
								"familyMobile" : familyMember.familyMobile,
								"educationId" : familyMember.educationId,
								"familyRelation" : familyMember.familyRelation,
								"familyEmail" : familyMember.familyEmail,
								"familyDesignation" : familyMember.familyDesignation
							};
							//alert($("#entranceQualifyingNumber").val());

							familyMemberArray.push(text);

							var trId = new String(familyMember.familyMemberName);
							trId = trId.replace(/[\s]+/g, "_");

							$("#family_member_table")
									.append(
											"<tr class=\"odd\" id=\"family_member_tr_id_"
										+ trId
										+ "\">"
													+ "<td>"
													+ "	<button type=\"button\" class=\"btn btn-success\" onclick=\"updateFamilyMemberDetails('"
													+ trId
													+ "')\">"
													+ "		<span class=\"glyphicon glyphicon-pencil\"></span>"
													+ "	</button>"
													+ "	<button type=\"button\" class=\"btn btn-warning\" onclick=\"deleteFamilyMemberDetails('"
													+ trId
													+ "')\">"
													+ "		<span class=\"glyphicon glyphicon-remove\"></span>"
													+ "	</button>"
													+ "</td>"
													+ ""
													+ "	<td>"
													+ familyMember.familyMemberName
													+ "</td>"
													+ "	<td>"
													+ $(
															"#familyRelation option[value='"
																	+ familyMember.familyRelation
																	+ "']")
															.text()
													+ "</td>"
													+ "	<td>"
													+ familyMember.familyMobile
													+ "</td>" + "</tr>");

						});

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
								id="add-update-student-form" enctype="multipart/form-data"
								class="form-horizontal myWizard2">
								<input type="hidden" name="casteId" id="casteId" value="">
								<input type="hidden" name="studentOldPhoto" id="studentOldPhoto"
									value=""> <input type="hidden"
									name="studentOldSignature" id="studentOldSignature" value="">
								<input type="hidden" name="oldRightThumb" id="oldRightThumb"
									value=""> <input type="hidden" name="oldLeftThumb"
									id="oldLeftThumb" value="">
								<!-- <div id="tabs"> -->
								<!-- <ul>
										<li><a href="#tabs-1">General Information</a></li>
										<li><a href="#tabs-2">Address Details and Contact</a></li>
										<li><a href="#tabs-3">Admission Details</a></li>
										<li><a href="#tabs-4">Personal Information</a></li>
										<li><a href="#tabs-5">Family Member Details</a></li>
										<li><a href="#tabs-6">Student Last Qualification</a></li>
										<li><a href="#tabs-7">Entrance Exam Score</a></li>
										<li><a href="#tabs-8">Documentation List</a></li>
									</ul> -->
								<!-- ptu starts-->
								<section class="step" data-step-title="General Information">
									<!--left row 1 1 start here -->
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
												<!--  Save General Information  -->
												<%-- <form id="general-information-form">	 --%>
												<div class="box-content" style="">
													<!--left row 1 1 start here -->
													<!-- General header tab start here -->

													<div class="box-header" style="top: 5px;">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>General Details</span>
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
																				class="control-label">ID No<span
																				style="color: #FF0000; font-weight: bold">*</span>
																			</span>
																		</div>
																		<div class="col-sm-7">
																			<input name="id" type="text" maxlength="40" id="id"
																				tabindex="3" class="form-control"
																				placeholder="Identification Number" />
																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Enrollment Number <span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<input name="enrollmentNumber" required type="text"
																				value="enroll" maxlength="40" id="enrollmentNumber"
																				tabindex="3" class="form-control"
																				placeholder="Enrollment Number" /> <span
																				id="ContentPlaceHolder1_rfvmodule" style=""></span>
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
																				class="control-label">Date of Birth <span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<input name="dateOfBirthString" required type="text"
																				readonly="readonly" value="12-12-2015"
																				maxlength="40" id="dateOfBirthString" tabindex="3"
																				class="form-control datepicker"
																				placeholder="Date of Birth">

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
																			<input type="radio" required name="gender"
																				checked="checked" id="gender-1" value="1" /> <label>Male</label>
																			<input type="radio" name="gender" id="gender-2"
																				value="2" /> <label>Female</label> <input
																				type="radio" name="gender" id="gender-3" value="3" />
																			<label>Transgender</label>
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
																				data-original-title="Add to Project" id="religionId"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<c:forEach items="${RELIGION_LIST}" var="religion">
																					<option value="${religion.id}">${religion.name}</option>
																				</c:forEach>
																			</select> <span id="ContentPlaceHolder1_rfvmenu" style=""></span>
																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-xs-5">
																			<span id="ContentPlaceHolder1_lblMenuLink"
																				class="control-label">Category</span>

																		</div>

																		<div class="col-sm-7">
																			<select name="categoryId" data-toggle="modal"
																				data-original-title="Add to Project" id="categoryId"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<c:forEach items="${CATEGORY_LIST}" var="category">
																					<option value="${category.id}">${category.name}</option>
																				</c:forEach>
																			</select>

																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Caste<span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="casteId" data-toggle="modal"
																				data-original-title="Add to Project" id="casteId"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<c:forEach items="${CASTE_LIST}" var="caste">
																					<option value="${caste.id}">${caste.name}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>


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
																			src=""
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
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<!-- <span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Password <span
																				style="color: #FF0000; font-weight: bold">*</span></span> -->


																		</div>
																		<div class="col-sm-7">
																			<!-- <input name="password" required type="password"
																				maxlength="40" id="password" tabindex="3"
																				class="form-control" placeholder="Passsword" /> <span
																				id="ContentPlaceHolder1_rfvmodule" style=""></span> -->

																			<button name="temp-btn" type="button" id="temp-btn"
																				class="btn btn-xl btn-primary button-submit font13">
																				<span><span class="" id="">Get Details</span></span>
																			</button>
																		</div>
																	</div>
																</div>


																<div class="form-group">

																	<div class="col-sm-12">
																		<div class="col-sm-5">
																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Registration Number<span
																				style="color: #FF0000; font-weight: bold">*</span>
																			</span>
																		</div>
																		<div class="col-sm-6">
																			<input name="registrationNumber" type="text"
																				maxlength="40" id="registrationNumber" tabindex="3"
																				class="form-control"
																				placeholder="Registration Number" />
																		</div>
																		<!-- <div class="col-sm-1">
																			<label style="top: 7px"
																				class="glyphicon glyphicon-search" title="search"></label>
																		</div> -->
																	</div>
																</div>

																<div class="form-group">

																	<div class="col-sm-12">
																		<div class="col-sm-5">
																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label"> </span>
																		</div>
																		<div class="col-sm-7"></div>

																	</div>
																</div>


																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-xs-5">
																			<span id="ContentPlaceHolder1_lblMenuLink"
																				class="control-label">Student Name ( Hindi )
																				<span style="color: #FF0000; font-weight: bold">*</span>
																			</span>

																		</div>

																		<div class="col-sm-7">
																			<input name="studentNameInHindi" type="text" required
																				value="" maxlength="100" id="studentNameInHindi"
																				tabindex="4" class="form-control"
																				placeholder="Student Name ( Hindi )">

																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-xs-5">
																			<span id="ContentPlaceHolder1_lblMenuLink"
																				class="control-label">Adhar Card Number <span
																				style="color: #FF0000; font-weight: bold">*</span>
																			</span>

																		</div>

																		<div class="col-sm-7">
																			<input name="adharCardNumber" type="text" required
																				value="" maxlength="100" id="adharCardNumber"
																				tabindex="4" class="form-control"
																				placeholder="Adhar Card Number ">

																		</div>
																	</div>
																</div>

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

																			<span id="ContentPlaceHolder1_lblParent"
																				class="control-label">Nationality</span>

																		</div>
																		<div class="col-sm-7">
																			<select name="nationalityId" data-toggle="modal"
																				data-original-title="Add to Project"
																				id="nationalityId" class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<c:forEach items="${NATIONALITY_LIST}"
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
																				<c:forEach items="${CATEGORY_LIST}" var="category">
																					<option value="${category.id}">${category.name}</option>
																				</c:forEach>
																			</select>

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
																				<c:forEach items="${BLOOD_GROUP_LIST}"
																					var="bloodGroup">
																					<option value="${bloodGroup.id}">${bloodGroup.name}</option>
																				</c:forEach>
																			</select>

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
																				maxlength="40" id="studentMobileNumber" tabindex="5"
																				class="form-control"
																				placeholder="Student Mobile Number">
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
																			src=""
																			style="height: 75px; width: 75px;">


																	</div>
																</div>
																<!-- sign end state here -->







															</div>

														</div>




														<!--row 11 div end here -->



														<!--left row 12 basic info start here -->
														<div class="row my-bg-info">

															<!--left div start here -->

															<div class="col-md-6"></div>

															<!--left div end here -->


															<!--right div start here -->

															<div class="col-md-6"></div>

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
																	<button type="button" id="save-general-information-btn"
																		name="submit_create_edit_team"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Save &
																				Continue</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>


													</div>
													<!--row 12 div end here -->

												</div>
												<%-- </form> --%>
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
												<div class="box-content" style="">
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
																				class="control-label"> If Father <span
																				style="color: #FF0000; font-weight: bold">*</span></span>
																		</div>
																		<div class="col-sm-7">
																			<input type=checkbox name="father-details-applicable"
																				id="is-father-details-applicable" /> <label>Yes</label>

																		</div>
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


															<div class="form-horizontal">
																<div class="form-group">

																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label"> Father's Designation<span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<input name="fatherDesignation" type="text"
																				value="f desig" maxlength="40"
																				id="fatherDesignation" tabindex="3"
																				class="form-control"
																				placeholder="Father's Designation" /> <span
																				id="ContentPlaceHolder1_rfvmodule" style=""></span>
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

															<div class="form-group">
																<br>
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblParent"
																			class="control-label"></span>

																	</div>
																	<div class="col-sm-7"></div>
																</div>
															</div>


															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblParent"
																			class="control-label">Father's Occupation</span>

																	</div>
																	<div class="col-sm-7">
																		<select name="fatherOccupationId" data-toggle="modal"
																			data-original-title="Add to Project"
																			id="fatherOccupationId" class="form-control">
																			<option selected="selected" value="0">Please
																				Select</option>
																			<c:forEach items="${OCCUPATION_LIST}"
																				var="occupation">
																				<option value="${occupation.id}">${occupation.name}</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
															</div>


															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label">Father Office Address</span>

																	</div>

																	<div class="col-sm-7">
																		<input name="fatherOfficeAddress" type="text"
																			maxlength="100" id="fatherOfficeAddress" tabindex="4"
																			class="form-control"
																			placeholder="Father Office Address">
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
																			maxlength="100" id="fatherMobileNumber" tabindex="4"
																			class="form-control"
																			placeholder="Father's Mobile Number">
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
																			class="control-label">If Mother<span
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
																		<input name="motherName" type="text" maxlength="40"
																			id="motherName" tabindex="5" class="form-control"
																			placeholder="Mother's Name">
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
																			value="m desig" maxlength="40" id="motherDesignation"
																			tabindex="3" class="form-control"
																			placeholder="Mother's Designation" /> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
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
																		<input name="motherEmailid" type="text" maxlength="40"
																			id="motherEmailid" tabindex="5" class="form-control"
																			placeholder="Mother's Email Id">
																	</div>
																</div>
															</div>




														</div>

													</div>

													<!--left div end here -->


													<!--right div start here -->

													<div class="col-md-6">

														<div class="form-group">
															<br>
															<div class="col-sm-12">
																<div class="col-sm-5">

																	<span id="ContentPlaceHolder1_lblParent"
																		class="control-label"></span>

																</div>
																<div class="col-sm-7"></div>
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">

																	<span id="ContentPlaceHolder1_lblParent"
																		class="control-label">Mother's Occupation</span>

																</div>
																<div class="col-sm-7">
																	<select name="motherOccupationId" data-toggle="modal"
																		data-original-title="Add to Project"
																		id="motherOccupationId" class="form-control">
																		<option selected="selected" value="0">Please
																			Select</option>
																		<c:forEach items="${OCCUPATION_LIST}" var="occupation">
																			<option value="${occupation.id}">${occupation.name}</option>
																		</c:forEach>
																	</select>
																</div>
															</div>
														</div>





														<div class="form-group">

															<div class="col-sm-12">
																<div class="col-sm-5">

																	<span id="ContentPlaceHolder1_lblModule"
																		class="control-label"> Mother's Office Address<span
																		style="color: #FF0000; font-weight: bold">*</span></span>


																</div>
																<div class="col-sm-7">
																	<input name="motherOfficeAddress" type="text"
																		value="m desig" maxlength="40"
																		id="motherOfficeAddress" tabindex="3"
																		class="form-control"
																		placeholder="Mother's Office Address "></input>
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
																		maxlength="100" id="motherMobileNumber" tabindex="4"
																		class="form-control"
																		placeholder="Mother's's Mobile Number">
																</div>
															</div>
														</div>





													</div>



												</div>

												<!-- guardian Address header  tab start here -->


												<div class="box-header" style="top: 5px;">
													<div class="box-name">
														<i class="fa fa-table"></i> <span>guardian Details
														</span>
													</div>


												</div>


												<!--guardian Address header tab end here -->

												<!--left row 1 1 guardian start here -->
												<div class="row my-bg-danger">
													<!--left div start here -->

													<div class="col-md-6">

														<div class="form-horizontal">
															<div class="form-group">
																<br>
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">If Guardian <span
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
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Guardian Name </span>
																	</div>
																	<div class="col-sm-7">
																		<input name="guardianName" type="text" maxlength="40"
																			id="guardianName" tabindex="3" class="form-control"
																			placeholder="Enter Guardian Name" /> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Guardian Occupation </span>
																	</div>
																	<div class="col-sm-7">
																		<input name="guardianOccupationName" type="text"
																			maxlength="40" id="guardianOccupationName"
																			tabindex="3" class="form-control"
																			placeholder="Enter Guardian Occupation" /> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Guardian email </span>
																	</div>
																	<div class="col-sm-7">
																		<input name="guardianEmail" type="text" maxlength="40"
																			id="guardianEmail" tabindex="3" class="form-control"
																			placeholder="Enter Guardian email" /> <span id=""
																			style=""></span>
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
																			class="control-label">Relation With Guardian </span>

																	</div>
																	<div class="col-sm-7">
																		<input name="relationWithGuardian" type="text"
																			maxlength="40" id="relationWithGuardian" tabindex="3"
																			class="form-control"
																			placeholder="Enter Relation With Guardian " /> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Guardian Phone Number</span>


																	</div>
																	<div class="col-sm-7">
																		<input name="guardianPhone" type="text" maxlength="40"
																			id="guardianPhone" tabindex="3" class="form-control"
																			placeholder="Enter Guardian Phone Number" /> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
																	</div>
																</div>
															</div>



														</div>

													</div>


													<!--right div end here -->

												</div>

												<!--row 11 div guardian end here -->


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
																id="save-parents-details-btn"
																class="btn btn-xl btn-primary button-submit font13">
																<span><span class="" id="">Save & Continue</span></span>
															</button>
															<!-- </a>  -->
														</div>
													</div>
												</div>



												<!--row 14 div end here -->


											</div>
											<!-- Parents Detail tab end here -->

										</div>
								</section>
								<!--ptu 1st end  -->
								<!-- Tab1  end here -->

								<!--ptu 2nd  -->

								<section class="step" data-step-title="Contact Details">
									<!--left row 1 1 start here -->
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
												<div class="box-content" style="">

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
															<br>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblMenuToolTip"
																			class="control-label">Pin Code</span>
																	</div>
																	<div class="col-sm-7">
																		<input name="localPINCode" type="text" maxlength="40"
																			id="localPINCode" tabindex="5" class="form-control"
																			placeholder="Enter Pin Code">

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
																				Select District</option>
																		</select>

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
																			class="control-label"> Landline Number</span>

																	</div>

																	<div class="col-sm-7">
																		<input name="localTelephone" type="text"
																			maxlength="100" id="localTelephone" tabindex="4"
																			class="form-control" placeholder="Landline Number">

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

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Villag/Town/City </span>


																		</div>
																		<div class="col-sm-7">
																			<input name="localTown" type="text" maxlength="100"
																				id="localTown" tabindex="4" class="form-control"
																				placeholder="Enter Villag/Town/City">

																		</div>

																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Sub District </span>


																		</div>
																		<div class="col-sm-7">
																			<select name="localCity" data-toggle="modal"
																				data-original-title="Add to Project" id="localCity"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select Sub District</option>
																			</select>

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
															<div class="form-group">
																<br>
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Copy Local Address </span>
																	</div>
																	<div class="col-sm-7">
																		<a href="#" id="copy-local-address">COPY</a> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
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


															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label">District</span>

																	</div>

																	<div class="col-sm-7">
																		<select name="permenantDistrictId" data-toggle="modal"
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
																			class="control-label"> Landline Number</span>

																	</div>

																	<div class="col-sm-7">
																		<input name="permenantTelephoneNumber" type="text"
																			maxlength="100" id="permenantTelephoneNumber"
																			tabindex="4" class="form-control"
																			placeholder="Landline Number">

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

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Villag/Town/City </span>


																		</div>
																		<div class="col-sm-7">
																			<input name="permenantTown" type="text"
																				maxlength="100" id="permenantTown" tabindex="4"
																				class="form-control"
																				placeholder="Enter Villag/Town/City">

																		</div>

																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Sub District </span>


																		</div>
																		<div class="col-sm-7">
																			<select name="permenantCityId" data-toggle="modal"
																				data-original-title="Add to Project"
																				id="permenantCityId" class="form-control">
																				<option selected="selected" value="0">Please
																					Select Sub District</option>
																			</select>

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
															<i class="fa fa-table"></i> <span>guardian Address
																Details </span>
														</div>


													</div>


													<!--guardian Address header tab end here -->

													<!--left row 1 1 guardian start here -->
													<div class="row my-bg-success">
														<!--left div start here -->

														<div class="col-md-6">
															<br>
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
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label">State </span>

																	</div>

																	<div class="col-sm-7">
																		<select name="guardianStateId" data-toggle="modal"
																			data-original-title="Add to Project"
																			id="guardianStateId" class="form-control">
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
																			class="control-label"> Landline Number</span>

																	</div>

																	<div class="col-sm-7">
																		<input name="guardianTelephone" type="text"
																			maxlength="100" id="guardianTelephone" tabindex="4"
																			class="form-control" placeholder="Landline Number">

																	</div>
																</div>
															</div>


															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label"> Near By Railway Station</span>

																	</div>

																	<div class="col-sm-7">
																		<input name="railwayStation" type="text"
																			maxlength="100" id="railwayStation" tabindex="4"
																			class="form-control"
																			placeholder="Near By Railway Station">

																	</div>
																</div>
															</div>


															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-xs-5">
																		<span id="ContentPlaceHolder1_lblMenuLink"
																			class="control-label">Near Local Station</span>

																	</div>

																	<div class="col-sm-7">
																		<input name="localStationName" type="text"
																			maxlength="100" id="localStationName" tabindex="4"
																			class="form-control"
																			placeholder="Near By Local Station">

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

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Villag/Town/City </span>


																		</div>
																		<div class="col-sm-7">
																			<input name="guardianTown" type="text"
																				maxlength="100" id="guardianTown" tabindex="4"
																				class="form-control"
																				placeholder="Enter Villag/Town/City">

																		</div>

																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Sub District </span>


																		</div>
																		<div class="col-sm-7">
																			<select name="guardianCity" data-toggle="modal"
																				data-original-title="Add to Project"
																				id="guardianCity" class="form-control">
																				<option selected="selected" value="0">Please
																					Select Sub District</option>
																			</select>

																		</div>

																	</div>
																</div>



																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-xs-5">
																			<span id="ContentPlaceHolder1_lblMenuLink"
																				class="control-label">Near By Bus Station</span>

																		</div>

																		<div class="col-sm-7">
																			<input name="busStation" type="text" maxlength="100"
																				id="busStation" tabindex="4" class="form-control"
																				placeholder="Near By Bus">

																		</div>
																	</div>
																</div>
															</div>



														</div>

														<!--row 11 div guardian end here -->

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
																		id="save-address-details-btn"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Save &
																				Continue</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>

													</div>
												</div>
											</div>
											<!-- Lacal Address Information tab end here -->
										</div>
								</section>
								<!--ptu2nd end  -->

								<!--ptu 3rd starts  -->

								<section class="step" data-step-title="Admission Details">
									<!--left row 1 1 start here -->
									<div class="row">
										<!--Over all row of this tab Start here-->


										<!--  Admission Detail tab start here -->
										<div class="col-xs-12 col-sm-12">
											<div class="box">
												<div class="box-header">
													<div class="box-name">
														<i class="fa fa-table"></i> <span>Admission Details</span>
													</div>
													<div class="box-icons">
														<a class="collapse-link"> <i
															class="servicedrop  glyphicon glyphicon-chevron-down"></i>
														</a>


													</div>
													<div class="no-move"></div>
												</div>
												<div class="box-content" style="">
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
																				readonly="readonly" required maxlength="100"
																				id="admissionDateString" value="24-12-2015"
																				tabindex="4" class="form-control datepicker"
																				placeholder="Enter Admission Date">
																		</div>
																	</div>
																</div>

																<div class="form-group">

																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Degree<span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="degreeId" required data-toggle="modal"
																				data-original-title="Add to Project" id="degreeId"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select degree</option>
																				<c:forEach items="${DEGREE_LIST}" var="degree">
																					<option value="${degree.id}">${degree.name}</option>
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
																				<c:forEach items="${ACADEMIC_YEAR_LIST}" var="year">
																					<option value="${year.id}">${year.name}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>


																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Payment Type<span
																				style="color: #FF0000; font-weight: bold">*</span></span>
																		</div>
																		<div class="col-sm-7">
																			<select name="paymentType" required
																				data-toggle="modal"
																				data-original-title="Add to Project"
																				id="paymentType" class="form-control">
																				<option selected="selected" value="0">Please
																					Select Payment Type</option>
																				<c:forEach items="${PAYMENT_TYPE_LIST}"
																					var="paymentType">
																					<option value="${paymentType.id}">${paymentType.name}</option>
																				</c:forEach>
																			</select> <span id="ContentPlaceHolder1_rfvmenu" style=""></span>
																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">Student Type<span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="studentType" required
																				data-toggle="modal"
																				data-original-title="Add to Project"
																				id="studentType" class="form-control">
																				<option selected="selected" value="0">Please
																					Select Student Type</option>
																				<option value="1">Home Univarsity</option>
																				<option value="2">Other Univarsity</option>
																			</select> <span id="ContentPlaceHolder1_rfvmenu" style=""></span>
																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">
																		<div class="col-sm-5">
																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Admission Quota<span
																				style="color: #FF0000; font-weight: bold">*</span></span>
																		</div>
																		<div class="col-sm-7">
																			<input type="radio" required name="Quota"
																				checked="checked" value="true" id="scholership-true" />
																			<label>Yes</label> <input type="radio" name="Quota"
																				value="false" id="scholership-false" /> <label>No</label>
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

																			<span id="ContentPlaceHolder1_lblMenuName"
																				class="control-label">year of Admission<span
																				style="color: #FF0000; font-weight: bold">*</span></span>
																		</div>
																		<div class="col-sm-7">
																			<input name="admissionYear" type="text"
																				maxlength="40" id="admissionYear" tabindex="3"
																				class="form-control" placeholder="year of Admission" />
																			<span id="" style=""></span>

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
																			<select name="branchNumber" required
																				data-toggle="modal"
																				data-original-title="Add to Project"
																				id="branchNumber" class="form-control">
																				<option selected="selected" value="0">Please
																					Select Branch</option>
																				<c:forEach items="${BRANCH_LIST}" var="branch">
																					<option value="${branch.id}">${branch.name}</option>
																				</c:forEach>
																			</select> <span id="ContentPlaceHolder1_rfvmenu" style=""></span>
																		</div>
																	</div>
																</div>



																<div class="form-group">

																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label">Semester<span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="semesterId" data-toggle="modal"
																				required data-original-title="Add to Project"
																				id="semesterId" class="form-control">
																				<option selected="selected" value="0">Please
																					Select semester</option>
																				<c:forEach items="${SEMESTER_LIST}" var="semester">
																					<option value="${semester.id}">${semester.name}</option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>

																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblParent"
																				class="control-label">State of eligibility</span>

																		</div>
																		<div class="col-sm-7">
																			<select name="stateOfEligibility" data-toggle="modal"
																				data-original-title="Add to Project"
																				id="stateOfEligibility" class="form-control">
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
																				class="control-label">Hosteler</span>


																		</div>
																		<div class="col-sm-7">
																			<select name="hosteler" data-toggle="modal"
																				data-original-title="Add to Project" id="hosteler"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<option value="1">Yes</option>
																				<option value="2">No</option>
																			</select>
																		</div>
																	</div>
																</div>





															</div>

														</div>


														<!--right div end here -->



													</div>
													<!--row 31 div end here -->


													<!-- mother header Information tab start here -->


													<div class="box-header" style="top: 5px;">
														<div class="box-name">
															<i class="fa fa-table"></i> <span>Scholarship
																Details</span>
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

																			<span id="ContentPlaceHolder1_lblParent"
																				class="control-label">Family Annual Income</span>

																		</div>
																		<div class="col-sm-7">
																			<input name="annualIncome" type="text" maxlength="40"
																				id="annualIncome" tabindex="5" class="form-control"
																				placeholder="Family Annual Income">
																		</div>
																	</div>
																</div>

																<div class="form-group">

																	<div class="col-sm-12">
																		<div class="col-sm-5">

																			<span id="ContentPlaceHolder1_lblModule"
																				class="control-label"> Rural/Urban <span
																				style="color: #FF0000; font-weight: bold">*</span></span>


																		</div>
																		<div class="col-sm-7">
																			<select name="urban" data-toggle="modal"
																				data-original-title="Add to Project" id="urban"
																				class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<option value="false">Rural</option>
																				<option value="true">Urban</option>
																			</select> <span id="ContentPlaceHolder1_rfvmodule" style=""></span>
																		</div>
																	</div>
																</div>







															</div>

														</div>

														<!--left div end here -->


														<!--right div start here -->

														<div class="col-md-6">




															<div class="form-group">
																<br>
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblParent"
																			class="control-label">Scholarship Type</span>

																	</div>
																	<div class="col-sm-7">
																		<select name="scholarshipType" data-toggle="modal"
																			data-original-title="Add to Project"
																			id="scholarshipType" class="form-control">
																			<option selected="selected" value="0">Please
																				Select Scholarship Type</option>
																			<c:forEach items="${SCHOLARSHIP_TYPE_LIST}"
																				var="scholarshipType">
																				<option value="${scholarshipType.id}">${scholarshipType.name}</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
															</div>





															<div class="form-group">

																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Schorlarship Category<span
																			style="color: #FF0000; font-weight: bold">*</span></span>


																	</div>
																	<div class="col-sm-7">
																		<input name="scholarshipCategory" type="text"
																			value="m desig" maxlength="40"
																			id="scholarshipCategory" tabindex="3"
																			class="form-control"
																			placeholder="Schorlarship Category"></input>
																	</div>

																</div>

															</div>

														</div>

														<div class="col-md-12">
															<div class="form-group action-btn-group">
																<div class="controls2">
																	<span class="left-margin-remove"> <a href="#">
																			<button id="reset-admission-details-btn" type="reset"
																				class="btn btn-xl btn-default button-submit font13">
																				<span><span class="">Clear</span></span>
																			</button>
																	</a>
																	</span>
																	<!-- <a href="#"> -->
																	<button type="button" name="submit_create_edit_team"
																		id="save-admission-details-btn"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Save &
																				Continue</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>








													</div>

													<!-- scholarship  detail end here -->


												</div>
											</div>
										</div>
										<!--Over all row of this tab end here-->
									</div>
									<!-- Admission Detail tab end here -->
								</section>
								<!--ptu 3rd end  -->

								<!--ptu 4th starts  -->
								<section class="step" data-step-title="Personal Details">
									<!--left row 1 1 start here -->
									<!-- <div id="tabs-4"> -->
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
												<div class="box-content" style="">
													<!--left row 14 start here -->
													<div class="row row my-bg-info">

														<!--left div start here -->

														<div class="col-md-12">

															<div class="form-horizontal">
																<div class="form-group">
																	<br>
																	<div class="col-sm-12">

																		<div class="col-md-4">
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
																						<span id="ContentPlaceHolder1_rfvmodule" style=""></span>

																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-xs-5">
																						<span id="ContentPlaceHolder1_lblMenuLink"
																							class="control-label">Identification Mark</span>

																					</div>

																					<div class="col-sm-7">
																						<input name="identityMark1" type="text"
																							maxlength="40" id="identityMark1" tabindex="3"
																							class="form-control"
																							placeholder="Identification Mark" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>

																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-xs-5">
																						<span id="ContentPlaceHolder1_lblMenuLink"
																							class="control-label">Country Domicile</span>

																					</div>

																					<div class="col-sm-7">
																						<input name="countryDomicile" type="text"
																							maxlength="40" id="countryDomicile" tabindex="3"
																							class="form-control"
																							placeholder="Country Domicile" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>

																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-xs-5">
																						<span id="ContentPlaceHolder1_lblMenuLink"
																							class="control-label">Bank Name</span>

																					</div>

																					<div class="col-sm-7">
																						<select name="bankNumber" data-toggle="modal"
																							data-original-title="Add to Project"
																							id="bankNumber" class="form-control">
																							<option selected="selected" value="0">Please
																								Select Bank Name</option>
																							<c:forEach items="${BANK_LIST}" var="bank">
																								<option value="${bank.id}">${bank.name}</option>
																							</c:forEach>
																						</select> <span id="ContentPlaceHolder1_rfvmodule" style=""></span>

																					</div>
																				</div>
																			</div>

																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-xs-5">
																						<span id="ContentPlaceHolder1_lblMenuLink"
																							class="control-label">Is PH</span>

																					</div>

																					<div class="col-sm-7">
																						<input type="radio" name="physicallyHandicapped"
																							value="true" id="ph-true" /> <label>Yes</label>
																						<input type="radio" name="physicallyHandicapped"
																							value="false" id="ph-false" /> <label>No</label>
																						<span id="ContentPlaceHolder1_rfvmodule" style=""></span>

																					</div>
																				</div>
																			</div>



																		</div>
																		<div class="col-md-4">


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">
																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Height ( In Cms)</span>
																					</div>
																					<div class="col-sm-7">
																						<input name="height" type="text" maxlength="40"
																							id="height" tabindex="3" class="form-control"
																							placeholder="Height" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>

																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">
																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Mother Tongue </span>
																					</div>
																					<div class="col-sm-7">
																						<select name="motherTongueId" data-toggle="modal"
																							data-original-title="Add to Project"
																							id="motherTongueId" class="form-control">
																							<option selected="selected" value="0">Please
																								Select Bank Name</option>
																							<c:forEach items="${MOTHERTONGUE_LIST}"
																								var="mothertongue">
																								<option value="${mothertongue.id}">${mothertongue.name}</option>
																							</c:forEach>
																						</select> <span id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">
																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Visa No </span>
																					</div>
																					<div class="col-sm-7">
																						<input name="visaNumber" type="text"
																							maxlength="40" id="visaNumber" tabindex="3"
																							class="form-control" placeholder="Visa No" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">
																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Account No </span>
																					</div>
																					<div class="col-sm-7">
																						<input name="accountNumber" type="text"
																							maxlength="40" id="accountNumber" tabindex="3"
																							class="form-control" placeholder="Account No" />
																						<span id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">
																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Type of PH </span>
																					</div>
																					<div class="col-sm-7">
																						<input name="typeOfPhysicallyHandicap" type="text"
																							maxlength="40" id="typeOfPhysicallyHandicap"
																							tabindex="3" class="form-control"
																							placeholder="Type of PH
" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>

																		</div>

																		<div class="col-md-4">

																			<div class="form-group">
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
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>

																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">

																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Other Lang. <span
																							style="color: #FF0000; font-weight: bold">*</span></span>


																					</div>
																					<div class="col-sm-7">
																						<input name="otherLanguage" type="text"
																							maxlength="40" id="otherLanguage" tabindex="3"
																							class="form-control"
																							placeholder="Other Language Known" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">

																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Passport No <span
																							style="color: #FF0000; font-weight: bold">*</span></span>


																					</div>
																					<div class="col-sm-7">
																						<input name="passportNumber" type="text"
																							maxlength="40" id="passportNumber" tabindex="3"
																							class="form-control" placeholder="Passport No" />
																						<span id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5"></div>
																					<div class="col-sm-7"></div>
																				</div>
																			</div>


																			<div class="form-group">
																				<div class="col-sm-12">
																					<div class="col-sm-5">

																						<span id="ContentPlaceHolder1_lblModule"
																							class="control-label">Degree of Disability
																							<span style="color: #FF0000; font-weight: bold">*</span>
																						</span>


																					</div>
																					<div class="col-sm-7">
																						<input name="degreeOfDisability" type="text"
																							maxlength="40" id="degreeOfDisability"
																							tabindex="3" class="form-control"
																							placeholder="Degree of Disability" /> <span
																							id="ContentPlaceHolder1_rfvmodule" style=""></span>
																					</div>
																				</div>
																			</div>

																		</div>





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
																	id="save-personal-details-btn"
																	class="btn btn-xl btn-primary button-submit font13">
																	<span><span class="" id="">Save &
																			Continue</span></span>
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
										<!-- </div> -->
									</div>
									<!--Personal Details end here -->
								</section>
								<!--ptu 4th end  -->
								<!--ptu 5th starts  -->

								<!--ptu 5th end  -->
								<!--ptu 6th starts -->
								<section class="step" data-step-title="Qualificaiton Details">
									<!--left row 1 1 start here -->
									<div class="row">
										<!--Outer row start here -->

										<!--  Student Last Qualificaiton Detail tab start here -->
										<!-- new code start -->
										<!-- new code end -->

										<div class="col-xs-12 col-sm-12">
											<!-- new hsc tab start here -->

											<!-- SSC header Information tab start here -->


											<div class="box-header" style="top: 5px;">
												<div class="box-name">
													<i class="fa fa-table"></i> <span>HSC Details</span>
												</div>


											</div>


											<!-- Ssc header Information tab end here -->

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
																		class="control-label">Year of Exam<span
																		style="color: #FF0000; font-weight: bold">*</span></span>
																</div>
																<div class="col-sm-7">
																	<input name="yearOfExamHssc" type="text" maxlength="40"
																		id="yearOfExamHssc" tabindex="5" class="form-control"
																		placeholder="Year of Exam">
																</div>
															</div>
														</div>





														<div class="form-group">

															<div class="col-sm-12">
																<div class="col-sm-5">

																	<span id="ContentPlaceHolder1_lblModule"
																		class="control-label"> Marks's Obtained<span
																		style="color: #FF0000; font-weight: bold">*</span></span>


																</div>
																<div class="col-sm-7">
																	<input name="marksObtained" type="text" value=""
																		maxlength="40" id="marksObtained" tabindex="3"
																		class="form-control" placeholder=" Marks's Obtained " />
																	<span id="ContentPlaceHolder1_rfvmodule" style=""></span>
																</div>
															</div>
														</div>


														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<span id="ContentPlaceHolder1_lblMenuToolTip"
																		class="control-label">Out of marks </span>
																</div>
																<div class="col-sm-7">
																	<input name="outOfMarks" type="text" maxlength="40"
																		id="outOfMarks" tabindex="5" class="form-control"
																		placeholder="Out Of Marks">
																</div>
															</div>
														</div>

														<div class="form-group">
															<div class="col-sm-12">
																<div class="col-sm-5">
																	<span id="ContentPlaceHolder1_lblMenuToolTip"
																		class="control-label">percentage </span>
																</div>
																<div class="col-sm-7">
																	<input name="percentage" type="text" maxlength="40"
																		id="percentage" tabindex="5" class="form-control"
																		placeholder="percentage">
																</div>
															</div>
														</div>




													</div>

												</div>

												<!--left div end here -->


												<!--right div start here -->

												<div class="col-md-6">

													<div class="form-group">
														<br>
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">School/College Name</span>

															</div>
															<div class="col-sm-7">
																<input name="schoolCollegeName" type="text"
																	maxlength="40" id="schoolCollegeName" tabindex="5"
																	class="form-control" placeholder="School/College Name">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblParent"
																	class="control-label">Board</span>

															</div>
															<div class="col-sm-7">
																<input name="board" type="text" maxlength="40"
																	id="board" tabindex="5" class="form-control"
																	placeholder="School/College Name">
															</div>
														</div>
													</div>





													<div class="form-group">

														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblModule"
																	class="control-label"> Grade<span
																	style="color: #FF0000; font-weight: bold">*</span></span>


															</div>
															<div class="col-sm-7">
																<input name="grade" type="text" value="m desig"
																	maxlength="40" id="grade" tabindex="3"
																	class="form-control" placeholder="Grade "></input>
															</div>

														</div>

													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Percentile</span>

															</div>

															<div class="col-sm-7">
																<input name="percentile" type="text" maxlength="100"
																	id="percentile" tabindex="4" class="form-control"
																	placeholder="Percentile">
															</div>
														</div>
													</div>


												</div>

												<!-- tab 3-4 start here -->
												<!-- tab 3-4-1 start here -->
												<div class="col-md-3">

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-PCM</span>

															</div>

															<div class="col-sm-5">
																<input name="hscPcm" type="text" maxlength="100"
																	id="hscPcm" tabindex="4" class="form-control"
																	placeholder="HSC-PCM">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-ENG</span>

															</div>

															<div class="col-sm-5">
																<input name="hscEng" type="text" maxlength="100"
																	id="hscEng" tabindex="4" class="form-control"
																	placeholder="HSC-ENG">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-CHE</span>

															</div>

															<div class="col-sm-5">
																<input name="hscChe" type="text" maxlength="100"
																	id="hscChe" tabindex="4" class="form-control"
																	placeholder="HSC-CHE">
															</div>
														</div>
													</div>

												</div>

												<!-- tab 3-4-2 start here -->
												<div class="col-md-3">


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-PCM-MAX</span>

															</div>

															<div class="col-sm-5">
																<input name="hscPcmMax" type="text" maxlength="100"
																	id="hscPcmMax" tabindex="4" class="form-control"
																	placeholder="HSC-PCM-MAX">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-ENG-MAX</span>

															</div>

															<div class="col-sm-5">
																<input name="hscEngMax" type="text" maxlength="100"
																	id="hscEngMax" tabindex="4" class="form-control"
																	placeholder="HSC-ENG-MAX">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-CHE-MAX</span>

															</div>

															<div class="col-sm-5">
																<input name="hscCheMax" type="text" maxlength="100"
																	id="hscCheMax" tabindex="4" class="form-control"
																	placeholder="HSC-CHE-MAX">
															</div>
														</div>
													</div>

												</div>

												<!-- tab 3-4-3 start here -->
												<div class="col-md-3">

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-BIO</span>

															</div>

															<div class="col-sm-5">
																<input name="hscBio" type="text" maxlength="100"
																	id="hscBio" tabindex="4" class="form-control"
																	placeholder="HSC-BIO">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-MATHS</span>

															</div>

															<div class="col-sm-5">
																<input name="hscMat" type="text" maxlength="100"
																	id="hscMat" tabindex="4" class="form-control"
																	placeholder="HSC-MATHS">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-PHY</span>

															</div>

															<div class="col-sm-5">
																<input name="hscPhy" type="text" maxlength="100"
																	id="hscPhy" tabindex="4" class="form-control"
																	placeholder="HSC-PHY">
															</div>
														</div>
													</div>


												</div>

												<!-- tab 3-4-4 start here -->
												<div class="col-md-3">

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-BIO-MAX</span>

															</div>

															<div class="col-sm-5">
																<input name="hscBioMax" type="text" maxlength="100"
																	id="hscBioMax" tabindex="4" class="form-control"
																	placeholder="HSC-BIO-MAX">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-sm-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-MATH-MAX</span>
															</div>

															<div class="col-sm-5">
																<input name="hscMatMax" type="text" maxlength="100"
																	id="hscMatMax" tabindex="4" class="form-control"
																	placeholder="HSC-MATHS-MAX">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-7">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">HSC-PHY-MAX</span>

															</div>

															<div class="col-sm-5">
																<input name="hscPhyMax" type="text" maxlength="100"
																	id="hscPhyMax" tabindex="4" class="form-control"
																	placeholder="HSC-PHY-MAX">
															</div>
														</div>
													</div>

												</div>

												<!-- tab 3-4 end here -->




											</div>



											<!-- new hsc tab end here -->

											<!-- new ssc tab start here -->



											<div class="box-header" style="top: 5px;">
												<div class="box-name">
													<i class="fa fa-table"></i> <span>SSC Details</span>
												</div>


											</div>


											<!-- ssc header Information tab end here -->

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
																		class="control-label">Year of Exam<span
																		style="color: #FF0000; font-weight: bold">*</span></span>
																</div>
																<div class="col-sm-7">
																	<input name="sscExamYear" type="text" maxlength="40"
																		id="sscExamYear" tabindex="5" class="form-control"
																		placeholder="Year of Exam">
																</div>
															</div>
														</div>

														<div class="form-horizontal">
															<div class="form-group">

																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label">Marks Obtained<span
																			style="color: #FF0000; font-weight: bold">*</span></span>
																	</div>
																	<div class="col-sm-7">
																		<input name="sscMarksObtained" type="text"
																			maxlength="40" id="sscMarksObtained" tabindex="5"
																			class="form-control" placeholder="Marks Obtained">
																	</div>
																</div>
															</div>



															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblParent"
																			class="control-label">Out of Marks</span>

																	</div>
																	<div class="col-sm-7">
																		<input name="sscOutOf" type="text" maxlength="40"
																			id="sscOutOf" tabindex="5" class="form-control"
																			placeholder="Out of Marks">
																	</div>
																</div>
															</div>

															<div class="form-group">

																<div class="col-sm-12">
																	<div class="col-sm-5">

																		<span id="ContentPlaceHolder1_lblModule"
																			class="control-label"> Percentage<span
																			style="color: #FF0000; font-weight: bold">*</span></span>


																	</div>
																	<div class="col-sm-7">
																		<input name="sscPercentage" type="text" value=""
																			maxlength="40" id="sscPercentage" tabindex="3"
																			class="form-control" placeholder="Percentage" /> <span
																			id="ContentPlaceHolder1_rfvmodule" style=""></span>
																	</div>
																</div>
															</div>


															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<span id="ContentPlaceHolder1_lblMenuToolTip"
																			class="control-label">Percentile</span>
																	</div>
																	<div class="col-sm-7">
																		<input name="sscPercentile" type="text" maxlength="40"
																			id="sscPercentile" tabindex="5" class="form-control"
																			placeholder="Percentile">
																	</div>
																</div>
															</div>




														</div>

													</div>
												</div>
												<!--left div end here -->


												<!--right div start here -->

												<div class="col-md-6">



													<div class="form-group">
														<br>

														<div class="col-sm-12">
															<div class="col-sm-5">

																<span id="ContentPlaceHolder1_lblModule"
																	class="control-label"> Exam Roll No<span
																	style="color: #FF0000; font-weight: bold">*</span></span>


															</div>
															<div class="col-sm-7">
																<input name="sscRollNumber" type="text" value=""
																	maxlength="40" id="sscRollNumber" tabindex="3"
																	class="form-control" placeholder=" Exam Roll No"></input>
															</div>

														</div>

													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Board</span>

															</div>

															<div class="col-sm-7">
																<input name="sscBoard" type="text" maxlength="100"
																	id="sscBoard" tabindex="4" class="form-control"
																	placeholder="Board ">
															</div>
														</div>
													</div>

													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Grade</span>

															</div>

															<div class="col-sm-7">
																<input name="sscGrade" type="text" maxlength="100"
																	id="sscGrade" tabindex="4" class="form-control"
																	placeholder="Grade">
															</div>
														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-12">
															<div class="col-xs-5">
																<span id="ContentPlaceHolder1_lblMenuLink"
																	class="control-label">Attempt</span>

															</div>

															<div class="col-sm-7">
																<input name="sscAttempts" type="text" maxlength="100"
																	id="sscAttempts" tabindex="4" class="form-control"
																	placeholder="Attempt">
															</div>
														</div>
													</div>





												</div>



											</div>

											<!-- new ssc tab end here -->




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




												<div class="box-content" style="">
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
																				<c:forEach items="${qualifyingExamList}" var="exam">
																					<c:if test="${exam.examType != 'e'}">
																						<option value="${exam.id}">${exam.qualifyingExam}</option>
																					</c:if>
																				</c:forEach>
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
																			<input name="yearOfExamHssc" type="text" value="2009"
																				maxlength="40" id="qualifyingYearOfExam"
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
																					maxlength="40" id="qualifyingMarksObtained"
																					tabindex="5" class="form-control"
																					placeholder="Marks Obtained">

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
																				maxlength="40" id="qualifyingOutOfMarks"
																				tabindex="5" class="form-control"
																				placeholder="Out Of Marks">

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
																				maxlength="40" id="qualifyingPercentage"
																				tabindex="5" class="form-control"
																				placeholder="Percentage">
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
																				maxlength="40" id="qualifyingAttemptsTaken"
																				tabindex="5" class="form-control"
																				placeholder="Attempt">
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
																				class="control-label">School / College Name </span>

																		</div>

																		<div class="col-sm-7">
																			<input name="schoolCollegeName" type="text"
																				maxlength="100" id="lastQualifyingSchoolCollegeName"
																				tabindex="4" class="form-control"
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
																				id="lastQualifyingBoard" tabindex="5"
																				class="form-control" placeholder="Board"> <label
																				id="boardLabel"
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
																				id="lastQualifyingGrade" tabindex="5"
																				class="form-control" placeholder="Grade">

																		</div>
																	</div>
																</div>


																<div class="form-group">
																	<div class="col-sm-12">
																		<div class="col-sm-5">
																			<span id="ContentPlaceHolder1_lblMenuToolTip"
																				class="control-label"> percentile</span>
																		</div>
																		<div class="col-sm-7">
																			<input name="percentile" type="text" maxlength="40"
																				id="lastQualifyingPercentile" tabindex="5"
																				class="form-control" placeholder="Percentile">

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
																				id="lastQualifyingGrade" tabindex="5"
																				class="form-control" placeholder="Grade">

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
																		id="add-last-qualificaiton-details-btn"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Add</span></span>
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

																<button type="button" name="submit_create_edit_team"
																	id="save-last-qualificaiton-details-btn"
																	class="btn btn-xl btn-primary button-submit font13">
																	<span><span class="" id="">Save &
																			Continue </span> </span>
																</button>
															</div>
														</div>
														<!-- TABLE CODE END HERE -->


														<!--row 14 div end here -->
													</div>
												</div>
											</div>

										</div>
										<!-- Qualification marks Details end here -->

										<!-- 	</div> -->
										<!-- outer row end  -->

									</div>
									<!-- tab 6 end  -->
								</section>
								<!--ptu 6th end  -->

								<!--ptu 7th starts  -->
								<section class="step" data-step-title="Entrance Details">
									<!--left row 1 1 start here -->
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
												<div class="box-content" style="">
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
																			<select name="entranceQualifyingNumber"
																				data-toggle="modal"
																				data-original-title="Add to Project"
																				id="entranceQualifyingNumber" class="form-control">
																				<option selected="selected" value="0">Please
																					Select</option>
																				<c:forEach items="${qualifyingExamList}" var="exam">
																					<c:if test="${exam.examType == 'e'}">
																						<option value="${exam.id}">${exam.qualifyingExam}</option>
																					</c:if>
																				</c:forEach>
																			</select> <label id="entranceQualifyingNumberLabel"
																				style="color: red; visibility: hidden;">Please
																				Select Entrance Exam</label>
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
																			<input name="entranceAllIndiaRank" type="text"
																				maxlength="40" value="1" id="entranceAllIndiaRank"
																				tabindex="5" class="form-control"
																				placeholder="All India Rank"> <label
																				id="entranceAllIndiaRankLabel"
																				style="color: red; visibility: hidden;">Please
																				Enter All India Rank</label>
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
																			<input name="entranceYearOfExamHssc" type="text"
																				maxlength="40" id="entranceYearOfExamHssc"
																				tabindex="5" class="form-control"
																				placeholder="Out Of Marks"> <label
																				id="entranceYearOfExamHsscLabel"
																				style="color: red; visibility: hidden;">Please
																				Enter Year Of Exam</label>


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
																			<input name="entranceMarksObtained" type="text"
																				maxlength="40" id="entranceMarksObtained"
																				tabindex="5" class="form-control"
																				placeholder="Percentage"> <label
																				id="entranceMarksObtainedLabel"
																				style="color: red; visibility: hidden;">Please
																				Enter Marks Obtained</label>
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
																			<input name="entrancePercentage" type="text"
																				maxlength="40" id="entrancePercentage" tabindex="5"
																				class="form-control" placeholder="Percentage">
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
																			<input name="entranceScore" type="text"
																				maxlength="40" id="entranceScore" tabindex="5"
																				class="form-control" placeholder="Score">
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
																			<select name="entranceQuotaId" data-toggle="modal"
																				data-original-title="Add to Project"
																				id="entranceQuotaId" class="form-control">
																				<option selected="selected" value="0">Please
																					Select Quota</option>
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
																			<input name="entranceOtherEntranceExam" type="text"
																				maxlength="100" id="entranceOtherEntranceExam"
																				tabindex="4" class="form-control"
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
																			<input name="entranceStateRank" type="text"
																				maxlength="40" id="entranceStateRank" tabindex="5"
																				class="form-control" placeholder="State Rank">
																			<label id="entranceStateRankLabel"
																				style="color: red; visibility: hidden;">Please
																				Enter State Rank</label>

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
																			<input name="entranceOutOfMarks" type="text"
																				maxlength="40" id="entranceOutOfMarks" tabindex="5"
																				class="form-control" placeholder="Out of Marks">

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
																			<input name="entranceHallTicketNumber" type="text"
																				maxlength="40" id="entranceHallTicketNumber"
																				tabindex="5" class="form-control"
																				placeholder="Hall Ticket Number"> <label
																				id="entranceHallTicketNumberLabel"
																				style="color: red; visibility: hidden;">Please
																				Enter Hall Ticket Number</label>
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
																			<input name="entrancePercentile" type="text"
																				maxlength="40" id="entrancePercentile" tabindex="5"
																				class="form-control" placeholder="Percentile">

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
																			<input name="entranceOtherDetails" type="text"
																				maxlength="40" id="entranceOtherDetails"
																				tabindex="5" class="form-control"
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
																	<span class="left-margin-remove"> </span>
																	<!-- <a href="#"> -->
																	<button type="button" name="submit_create_edit_team"
																		id="save-entrance-btn"
																		class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="">Save &
																				Continue</span></span>
																	</button>
																	<!-- </a>  -->
																</div>
															</div>
														</div>

														<!-- TABLE CODE START HERE -->

														<!-- TABLE CODE END HERE -->

														<!--row 14 div end here -->
													</div>
												</div>
											</div>

										</div>
										<!-- row end here -->
									</div>
									<!-- Entrance Exam Scores end here -->

									<!-- </div> -->
									<!-- tab 7 end here -->

								</section>
								<!--ptu 7th end  -->
								<!--ptu 8th starts -->
								<section class="step" data-step-title="Document Details">
									<!--left row 1 1 start here -->

									<!-- tab 8 start here -->

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
												<div class="box-content" style="">
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


																		<c:forEach items="${DOCUMENT_LIST}" var="document">
																			<div class="col-sm-6">
																				<input type=checkbox name="documentList"
																					id="document-${document.id}" value="${document.id}" />
																				<label>${document.name}</label>
																			</div>
																		</c:forEach>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-sm-6">
															<div class="form-group">
																<div class="col-sm-12 ">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Permission for Receipts : <span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																</div>
																<br>
																<br>
																<div class="col-md-5">
																	<table class="table table-responsive"
																		style="border-top: #FAFAFA;">
																		<%-- <c:forEach items="${mothertongueList}" var="document"> --%>
																		<c:set var="index" value="0" />
																		<c:forEach items="${nationalityList}" begin="0"
																			step="3">
																			<tr>
																				<c:forEach items="${nationalityList}"
																					var="nationality" begin="${index}"
																					end="${index + 2}">
																					<td
																						style="align: right; float: right; padding-left: 20px; padding-right: 2px;">
																						<input type="checkbox" name="permission"
																						id="permission" value="0"> <c:out
																							value="${nationality.nationality}" />
																					</td>
																				</c:forEach>
																			</tr>
																			<c:set var="index" value="${index + 3}" />
																		</c:forEach>
																	</table>
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
																		id="save-document-list-btn">
																		<span><span class="" id="">Save &
																				Continue</span></span>
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

									<!-- Document List Scores end here -->
									<!-- </div> -->
									<!-- tab8 end here -->
								</section>
								<!--ptu 8th end  -->
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

