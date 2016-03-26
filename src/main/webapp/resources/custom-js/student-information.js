/**
 * @Author Roshan Kuhite
 */

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
								
								/* Last Qualification Details */
								var lastQualifyingJsonStr = new Array();

								$
										.each(
												lastQualifyingArray,
												function(index, ob) {
													lastQualifyingJsonStr
															.push(JSON
																	.stringify(ob));
												});

								/* Entrance Exam Details */
								var entranceQualifyingNumber = $("#entranceQualifyingNumber").val();
								var entranceAllIndiaRank = $("#entranceAllIndiaRank").val();
								var entranceYearOfExamHssc = $("#entranceYearOfExamHssc").val();
								var entranceMarksObtained = $("#entranceMarksObtained").val();
								var entrancePercentage = $("#entrancePercentage").val();
								var entranceScore = $("#entranceScore").val();
								var entranceQuotaId = $("#entranceQuotaId").val();
								var entranceOtherEntranceExam = $("#entranceOtherEntranceExam").val();
								var entranceStateRank = $("#entranceStateRank").val();
								var entranceOutOfMarks = $("#entranceOutOfMarks").val();
								var entranceHallTicketNumber = $("#entranceHallTicketNumber").val();
								var entrancePercentile = $("#entrancePercentile").val();
								var entranceOtherDetails = $("#entranceOtherDetails").val();
								
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
									"guardianPhone" : guardianPhone,
									
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
								
								var entranceQualifyingNumber = $("#entranceQualifyingNumber").val();
								var entranceAllIndiaRank = $("#entranceAllIndiaRank").val();
								var entranceYearOfExamHssc = $("#entranceYearOfExamHssc").val();
								var entranceMarksObtained = $("#entranceMarksObtained").val();
								var entrancePercentage = $("#entrancePercentage").val();
								var entranceScore = $("#entranceScore").val();
								var entranceQuotaId = $("#entranceQuotaId").val();
								var entranceOtherEntranceExam = $("#entranceOtherEntranceExam").val();
								var entranceStateRank = $("#entranceStateRank").val();
								var entranceOutOfMarks = $("#entranceOutOfMarks").val();
								var entranceHallTicketNumber = $("#entranceHallTicketNumber").val();
								var entrancePercentile = parseInt($("#entrancePercentile").val());
								var entranceOtherDetails = $("#entranceOtherDetails").val();
								
								var entranceExamDetails = {
										"qualifyingExamNumber" : entranceQualifyingNumber,
										"allIndiaRank" : entranceAllIndiaRank,
										"yearOfExamHssc" : entranceYearOfExamHssc,
										"marksObtained" : entranceMarksObtained,
										"percentage" : entrancePercentage,
										"score" : entranceScore,
										"quotaId" : entranceQuotaId,
										"otherEntranceExam" : entranceOtherEntranceExam,
										"stateRank" : entranceStateRank,
										"outOfMarks" : entranceOutOfMarks,
										"hallTicketNumber" : entranceHallTicketNumber,
										"percentile" : entrancePercentile,
										"otherDetails" : entranceOtherDetails
								};
								
								var lastQualificationParameter = {
									"lastQualifications" : new String(
											lastQualifyingJsonStr)
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
										JSON
										.stringify(sscHsscDetails));
								formData
								.append(
										"entranceExamJsonStr",
										JSON
										.stringify(entranceExamDetails));
								formData
										.append(
												"lastQualifyingJsonStr",
												new String(
														lastQualifyingJsonStr));
								

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
											data : JSON.stringify(dataParam),
											contentType: "application/json",
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
											data : JSON.stringify(dataParam),
											contentType: "application/json",
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
											data : JSON.stringify(dataParam),
											contentType: "application/json",
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
											data : JSON.stringify(dataParam),
											contentType: "application/json",
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
											data : JSON.stringify(dataParam),
											contentType: "application/json",
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
$("#enrollmentNumber").val(studentAdmissionJsonOb.enrollmentNumber);
$("#title").val(studentAdmissionJsonOb.title);
$("#studentName").val(studentAdmissionJsonOb.studentName);
var d = new Date(studentAdmissionJsonOb.dateOfBirth);
$("#dateOfBirthString").val(d.getDate()+ '-' + (d.getMonth() + 1) + '-' + d.getFullYear());
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
	"../../images/"
			+ studentAdmissionJsonOb.studentPhoto);
$("#studentSignatureTag").attr(
	'src',
	"../../images/"
			+ studentAdmissionJsonOb.studentSignature);

$("#studentOldPhoto").val(studentAdmissionJsonOb.studentOldPhoto);
$("#studentOldSignature").val(
	studentAdmissionJsonOb.studentOldSignature);
//$("#oldRightThumb").val(studentAdmissionJsonOb.oldRightThumb);
//$("#oldLeftThumb").val(studentAdmissionJsonOb.oldLeftThumb);


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
d = new Date(studentAdmissionJsonOb.admissionDate);
$("#admissionDateString").val(d.getDate()+ '-' + (d.getMonth() + 1) + '-' + d.getFullYear());
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
$("#ph-"+studentAdmissionJsonOb.physicallyHandicapped).attr('checked', 'checked')
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