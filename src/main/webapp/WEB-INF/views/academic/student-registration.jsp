<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Registration</title>

<jsp:include page="../authentication/script.jsp" />
<!-- <link rel="stylesheet" -->
<!-- 	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"> -->

<script>
	$(document).ready(
			function() {
				jQuery.validator.addMethod('selectcheck', function(value) {
					return (value != "");
				}, "");

				jQuery.validator.addMethod("letterswithbasicpunc", function(
						value, element) {
					return this.optional(element)
							|| /^[a-z\-.,()'"\s]+$/i.test(value);
				}, "Letters or punctuation only please");

				var validator = $("#myWizard2").validate({
					// Specify the validation rules
					rules : {
						studentName : {
							required : true,
							selectcheck : true,
							letterswithbasicpunc : true
						},
						fatherName : {
							required : true,
							selectcheck : true,
							letterswithbasicpunc : true
						},
						lastName : {
							required : true,
							selectcheck : true,
							letterswithbasicpunc : true
						},
						motherName : {
							required : true,
							selectcheck : true,
							letterswithbasicpunc : true
						},
						motherTongueId : {
							required : true,
						},
						dob : {
							date : true,
							required : true,
						},
						gender : {
							required : true,
						},
						casteId : {
							required : true,
						},
						categoryId : {
							required : true,
						},
						nationalityId : {
							required : true,
						},
						mobileNumber : {
							required : true,
							minlength : 10,
							maxlength : 12,
							number : true
						},
						permanentTelephoneStd : {
							minlength : 2,
							maxlength : 6,
							number : true
						},
						permanentTelephone : {
							minlength : 6,
							maxlength : 7,
							number : true
						},
						emailId : {
							email : true,
							required : true,
						},
						countryId : {
							required : true,
						},
						stateId : {
							required : true,
						},
						pincode : {
							minlength : 6,
							maxlength : 6,
							required : true
						},
						address : {
							required : true,

						},
						sscTotal : {
							required : true,
							number : true,
						},
						sscOutof : {
							required : true,
							number : true,
						},
						sscMaths : {
							required : true,
							number : true,
						},
						sscMathsMaximum : {
							required : true,
							number : true,
						},
						hscTotal : {
							required : true,
							number : true,
						},
						hscOutOf : {
							required : true,
							number : true,
						},
						ophysics : {
							required : true,
							number : true,
						},
						tphysics : {
							required : true,
							number : true,
						},
						ochemistry : {
							required : true,
							number : true,
						},
						tchemistry : {
							required : true,
							number : true,
						},
						omaths : {
							required : true,
							number : true,
						},
						tmaths : {
							required : true,
							number : true,
						},
						sscPassingYear : {
							required : true,
							number : true,
						},
						hscPassingYear : {
							required : true,
							number : true,
						},
						entranceExamId : {
							required : true,
						},
						entranceExamRollNumber : {
							required : true,
						},
						entranceExamYear : {
							required : true,
						},
						entranceExamScore : {
							required : true,
							number : true,
						},
						entranceExamRank : {
							required : true,
						},
					},

					// Specify the validation error messages
					messages : {
						studentName : {
							required : "Please enter name",
							selectcheck : "",
							letterswithbasicpunc : "Please enter valid name"
						},
						fatherName : {
							required : "Please enter name",
							selectcheck : "",
							letterswithbasicpunc : "Please enter valid name"
						},
						lastName : {
							required : "Please enter name",
							selectcheck : "",
							letterswithbasicpunc : "Please enter valid name"
						},
						motherName : {
							required : "Please enter name",
							selectcheck : "",
							letterswithbasicpunc : "Please enter valid name"
						},
						motherTongueId : {
							required : "Please select mother tounge",
						},
						dob : {
							date : "Select valid date",
							required : "Please select date",
						},
						gender : {
							required : "Please choose gender",
						},
						casteId : {
							required : "Please choose caste",
						},
						categoryId : {
							required : "Please choose category",
						},
						nationalityId : {
							required : "Please select nationality",
						},
						mobileNumber : {
							required : "Please enter mobile number",
							minlength : "Please enter valid mobile number",
							maxlength : "Please enter valid mobile number",
							number : "Please enter valid mobile number"
						},
						permanentTelephoneStd : {
							minlength : "Please enter valid mobile number",
							maxlength : "Please enter valid mobile number",
							number : "Please enter valid mobile number"
						},
						permanentTelephone : {
							minlength : "Please enter valid mobile number",
							maxlength : "Please enter valid mobile number",
							number : "Please enter valid mobile number"
						},
						emailId : {
							email : "Please enter valid email address",
							required : "Please enter email address"
						},
						countryId : {
							required : "Please select country",
						},
						stateId : {
							required : "Please select",
						},
						pincode : {
							minlength : "Please enter valid pincode",
							maxlength : "Please enter valid pincode",
							required : "Please enter pincode"
						},
						address : {
							required : "Please enter address"
						},
						sscTotal : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						sscOutof : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						sscMaths : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						sscMathsMaximum : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						hscTotal : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						hscOutOf : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						ophysics : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						tphysics : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						ochemistry : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						tchemistry : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						omaths : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						tmaths : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						sscPassingYear : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						hscPassingYear : {
							required : "Please enter valid values",
							number : "Please enter valid values",
						},
						entranceExamId : {
							required : "Please select exam",
						},
						entranceExamRollNumber : {
							required : "Please enter roll no ",
						},
						entranceExamYear : {
							required : "Please select Year",
						},
						entranceExamScore : {
							required : "Please enter score",
							number : "Please enter valid score",
						},
						entranceExamRank : {
							required : "Please enter rank",
						},

					},

					submitHandler : function(form) {
						form.submit();
					}

				});
				// 	$("#myWizard2").valid();
				$('#studentPhoto').change(function(event) {
					var tmppath = URL.createObjectURL(event.target.files[0]);
					$('#studentImage').fadeIn("slow").attr('src', tmppath);
				});

				$('#signaturePhoto').change(function(event) {
					var tmppath = URL.createObjectURL(event.target.files[0]);
					$('#signatureImage').fadeIn("slow").attr('src', tmppath);
				});

			});


							var staticContents = {
								"statesLoaded" : false,
								"districtsLoaded" : false,
								"citiesLoaded" : false,
								"stateJson" : {},
								"districtJson" : {},
								"cityJson" : {}
							};

							var branchOptions = '';
							var preferenceCount = 1;
							var numberOfBranches = 0;

							var motherTongue = "${student.motherTongueId}";
							var cast = "${student.casteId}";
							var category = "${student.categoryId}";
							var nationality = "${student.nationalityId}";
							var state = "${student.stateId}";
							var district = "${student.districtId}";
							var city = "${student.cityId}";
							var gender = "${student.gender}";
							var degreeId = "${student.degreeId}";
							var degreeOtions;
							var preferenceIds = '';
							var automaticPreferenceAppend = false;
							var optionToBeSelected = 0;

							$('#confirm_div').css('display', 'none');
							//var branches = "${branchList}";
							//alert(preferenceCount);
							preferenceCount = 1;

							setTimeout(function() {
								$("#message").remove();
							}, 5000);

							$(document)
							.ready(
									function() {
										$(function() {
							
							$('#finalSubmission').change(
									function() {
										if ($(this).is(":checked")) {

											//if (confirm("No Updation will take place afterword") == true){
											$("#finalSubmission").val('true');
											$('[type=submit]').html(
													'Final Submit');
											$('#confirm_div')
													.css('display', '');
											//}

										} else {
											$("#finalSubmission").val('false');
											$("#finalSubmission").removeAttr(
													'checked');
											$('[type=submit]').html('Submit');
											$('#confirm_div').css('display',
													'none');
										}

									});

							$
									.ajax({
										async : false,
										url : "../academic/admission-notification/active-branch-list",
										type : "POST",
										success : function(response) {
											//	alert(JSON.stringify(response));
											var jsonOb = JSON.parse(JSON
													.stringify(response));
											var text = "<option selected=\"selected\" value=\"0\">Please Select Degree</option>";
											$
													.each(
															jsonOb,
															function(index,
																	degree) {
																//alert(degreeId+' = '+degree.degreeTypeId)

																if (degreeId == degree.branchDegreeNumber) {
																	text += "<option value=\""+degree.branchId+"\">"
																			+ degree.branchShortName
																			+ "</option>";
																	numberOfBranches++;
																}

															});
											$("#preferences").empty()
													.html(text);
											degreeOtions = text;
											//alert(text);
											//staticContents.statesLoaded = true;
											//staticContents.stateJson = jsonOb; 
										},
										error : function() {
										},
									});
										});
									});
							if ("${not empty preferenceList}" == "true") {
								//alert('preference');
								automaticPreferenceAppend = true;
								preferences = preferenceIds.split(",");
								preferences = preferences.slice(0,
										preferences.length - 1);

								for (var preferenceId = 0; preferenceId < preferences.length; preferenceId++) {
									//alert(preferenceCount == 1);
									if (preferences[preferenceId] != "") {
										optionToBeSelected = preferences[preferenceId];
										if (preferenceCount == 1) {
											$("#preferences").val(
													preferences[preferenceId]);
										} else {
											append_preferecence();
										}
										preferenceCount++;
										//alert(preferenceCount + ' - '+ preferences[preferenceId]);
									}

								}
								automaticPreferenceAppend = false;
								optionToBeSelected = 0;
								//preferenceCount--;
								//alert(preferenceCount);
							}
							
							function append_preferecence() {

								if(typeof preferenceCount === 'undefined'){
									preferenceCount = 1;
								}
								
								alert('preferenceCount : '+ preferenceCount);
								 	if(automaticPreferenceAppend == false)
										preferenceCount++; 
								if (preferenceCount <= numberOfBranches) {
									var varname1 = "<div class=\"form-group\"> "
											+ "												<div class=\"col-sm-12\"> "
											+ "													<div class=\"col-sm-3\"> "
											+ "														<span id=\"ContentPlaceHolder1_lblParent\" "
									+ "															class=\"control-label\">Preference "
											+ preferenceCount
											+ "</span> "
											+ "													</div> "
											+ "													<div class=\"col-sm-3\"> "
											+ "														<select name=\"preferences\" data-toggle=\"modal\" "
									+ "															data-original-title=\"Add to Project\" id=\"preferences-"+preferenceCount+"\" "
									+ "															class=\"form-control branch-preference\"> "
											+ degreeOtions
											+ "															 "
											+ "														</select> "
											+ "													</div> "
											+ "													<div class=\"col-sm-2\"> "
											+ "														<i class=\"glyphicon glyphicon-plus\" "
											+ "														onclick=\"append_preferecence()\"	style=\"font-size: 20px; color: #1D9D74; text-shadow: 2px 2px 4px #83878D;\"></i> "
											+ "														<i class=\"glyphicon glyphicon-minus\" "
											+ "														onclick=\"remove_this(this)\"	style=\"font-size: 20px; color: #E3052E; text-shadow: 2px 2px 4px #83878D;\"></i> "
											+ "													</div> " + "												</div> "
											+ "											</div>";
									$('#preference_div').append(varname1);

									if (optionToBeSelected != 0) {
										$("#preferences-" + preferenceCount).val(optionToBeSelected)
												.change();
									}

									if (automaticPreferenceAppend == false)
										preferenceCount++;
								}
								/*else
									{
									preferenceCount--;
									}*/

							}

							if ("${student.finalSubmission}" == "true") {
								$("#studentName").attr("disabled", "disabled");
								$("#fatherName").attr("disabled", "disabled");
								$("#lastName").attr("disabled", "disabled");
								$("#motherName").attr("disabled", "disabled");
								$("#studentPhoto").attr("disabled", "disabled");
								$("#motherTongueId").attr("disabled",
										"disabled");
								$("#dob").attr("disabled", "disabled");
								$("#gender-1").attr("disabled", "disabled");
								$("#gender-2").attr("disabled", "disabled");
								$("#gender-3").attr("disabled", "disabled");
								$("#gender-${student.gender}").attr("checked",
										"checked");
								$("#casteId").attr("disabled", "disabled");
								$("#categoryId").attr("disabled", "disabled");
								$("#nationalityId")
										.attr("disabled", "disabled");
								$("#signaturePhoto").attr("disabled",
										"disabled");
								$("#mobileNumber").attr("disabled", "disabled");
								$("#permanentTelephoneStd").attr("disabled",
										"disabled");
								$("#permanentTelephone").attr("disabled",
										"disabled");
								$("#emailId").attr("disabled", "disabled");
								$("#countryId").attr("disabled", "disabled");
								$("#stateId").attr("disabled", "disabled");
								$("#districtId").attr("disabled", "disabled");
								$("#cityId").attr("disabled", "disabled");
								$("#pincode").attr("disabled", "disabled");
								$("#sscPassingYear").attr("disabled",
										"disabled");
								$("#sscTotal").attr("disabled", "disabled");
								$("#sscOutof").attr("disabled", "disabled");
								$("#sscMaths").attr("disabled", "disabled");
								$("#hscPassingYear").attr("disabled",
										"disabled");
								$("#hscTotal").attr("disabled", "disabled");
								$("#hscOutOf").attr("disabled", "disabled");
								$("#hscPhysics").attr("disabled", "disabled");
								$("#hscPhysicsMax")
										.attr("disabled", "disabled");
								$("#hscChemestry").attr("disabled", "disabled");
								$("#hscChemestryMax").attr("disabled",
										"disabled");
								$("#hscMaths").attr("disabled", "disabled");
								$("#hscMathsMax").attr("disabled", "disabled");
								$("#entranceExamId").attr("disabled",
										"disabled");
								$("#entranceExamRollNumber").attr("disabled",
										"disabled");
								$("#entranceExamYear").attr("disabled",
										"disabled");
								$("#entranceExamScore").attr("disabled",
										"disabled");
								$("#entranceExamRank").attr("disabled",
										"disabled");
								$("#sscMarksheet").attr("disabled", "disabled");
								$("#hscMarksheet").attr("disabled", "disabled");
								$("#entranceScorecard").attr("disabled",
										"disabled");
								$("#leavingCertificate").attr("disabled",
										"disabled");
								$("#nationalityCertificate").attr("disabled",
										"disabled");
								$("#migrationCertificate").attr("disabled",
										"disabled");
								$("#castCertificate").attr("disabled",
										"disabled");
								$("#preferences").attr("disabled", "disabled");
								$("#sscMathsMaximum").attr("disabled",
										"disabled");
								$("#degreeId").attr("disabled", "disabled");
								$("#address").attr("disabled", "disabled");
								$(".btn-success").attr("disabled", "disabled");
								$("#add-new-preference-btn").attr("disabled",
										"disabled");
								$("[name=preferences]").attr("disabled",
										"disabled");
								$("#finalSubmission").val('true');
								$("#finalSubmission").attr("disabled",
										"disabled");
							}
					

	$(document)
			.ready(
					function() {

						//entranceExamYear
						var d = new Date();
						var currentYear = d.getFullYear();
						var text = '';
						for (var i = currentYear; i >= currentYear - 10; i--) {
							text += '<option value="'+i+'">' + i + '</option>';
						}
						$("#entranceExamYear").append(text);

						$(function() {

							$("#stateId")
									.change(
											function() {

												var stateId = $(this).val();

												$
														.ajax({
															async : false,
															url : "../master/district?stateId="
																	+ stateId,
															type : "GET",
															success : function(
																	response) {
																var jsonOb = JSON
																		.parse(JSON
																				.stringify(response));
																var text = "<option  value=\"0\">Please Select</option>";
																$
																		.each(
																				jsonOb,
																				function(
																						index,
																						districtOb) {
																					text += "<option value=\""+districtOb.id+"\">"
																							+ districtOb.name
																							+ "</option>";
																				});
																$("#districtId")
																		.empty()
																		.html(
																				text);
															},
															error : function() {
															},
														});
												/*var stateId = $(this).val();
												var stateName = $(this).attr("name");
												var districts;
												if (stateId != 0) {
													districts = loadDistricts(stateId);

													$("#districtId").empty().html(districts);
													$("#cityId").find("option:gt(0)").remove();
												} else {
													$("#districtId").find("option:gt(0)").remove();
													$("#cityId").find("option:gt(0)").remove();
												}*/
											});
						});
					});

	$(document)
			.ready(
					function() {

						$(function() {
							$("#districtId")
									.change(
											function() {

												var district = $(this).val();

												$
														.ajax({
															async : false,
															url : "../master/city?districtId="
																	+ district,
															type : "GET",
															success : function(
																	response) {
																var jsonOb = JSON
																		.parse(JSON
																				.stringify(response));
																var text = "<option  value=\"0\">Please Select</option>";
																$
																		.each(
																				jsonOb,
																				function(
																						index,
																						cityOb) {
																					text += "<option value=\""+cityOb.id+"\">"
																							+ cityOb.name
																							+ "</option>";
																				});
																$("#cityId")
																		.empty()
																		.html(
																				text);
															},
															error : function() {
															},
														});
												/*var districtId = $(this).val();
												var districtName = $(this).attr("name");
												var cities = '';
												if (districtId != 0) {
													cities = loadCities(districtId);

													$("#cityId").empty().html(cities);
												} else {
													$("#cityId").find("option:gt(0)").remove();
												}*/
											});
						});
					});

	//temp
	// 	$("#motherTongueId").val(motherTongue).change();
	// 	$("#categoryId").val(category).change();
	// 	$("#casteId").val(cast).change();
	// 	$("#nationalityId").val(nationality).change();
	// 	$("#stateId").val(state).change();
	// 	$("#districtId").val(district).change();
	// 	$("#cityId").val(city).change();
	// 	$("#gender-" + gender).attr("checked", "checked");
	// 	$("#degreeId").val(degreeId).change();
	// 	$("#message").html("${message}");

	$(document).ready(function() {

		$(function() {
			$('body').on('change', '.branch-preference', function() {
				var selectedBranch = $(this).val();
				var count = 0;
				//alert('selectedBranch : '+selectedBranch);
				if (selectedBranch != 0) {
					$.each($(".branch-preference"), function() {
						if ($(this).val() == selectedBranch) {
							count++;
						}
					});

					if (count > 1) {
						alert('You have already selected this branch');
						$(this).val('0').change();
					}

				}
			});
		});
	});

	$(document)
			.ready(
					function() {

						$(function() {
							function loadDistricts(stateId) {
								var text = '';

								if (staticContents.districtsLoaded == true) {
									text = "<option selected=\"selected\" value=\"0\">Please Select District</option>";
									$
											.each(
													staticContents.districtJson,
													function(index, districtOb) {
														if (districtOb.stateId == stateId)
															text += "<option value=\""+districtOb.id+"\">"
																	+ districtOb.districtName
																	+ "</option>";
													});
								} else {
									$
											.ajax({
												async : false,
												url : "../resources/uploads/districts.json",
												type : "GET",
												success : function(response) {
													//alert(JSON.stringify(response));
													var jsonOb = JSON
															.parse(JSON
																	.stringify(response));
													text = "<option selected=\"selected\" value=\"0\">Please Select District</option>";
													$
															.each(
																	jsonOb,
																	function(
																			index,
																			districtOb) {
																		if (districtOb.stateId == stateId)
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
						});
					});

	$(document)
			.ready(
					function() {

						$(function() {
							function loadCities(districtId) {
								var text = '';

								if (staticContents.citiesLoaded == true) {
									text = "<option selected=\"selected\" value=\"0\">Please Select City</option>";
									$
											.each(
													staticContents.cityJson,
													function(index, cityOb) {
														if (cityOb.districtId == districtId)
															text += "<option value=\""+cityOb.id+"\">"
																	+ cityOb.cityName
																	+ "</option>";
													});
								} else {
									$
											.ajax({
												async : false,
												url : "../resources/uploads/cities.json",
												type : "GET",
												success : function(response) {
													//alert(JSON.stringify(response));
													var jsonOb = JSON
															.parse(JSON
																	.stringify(response));
													text = "<option selected=\"selected\" value=\"0\">Please Select City</option>";
													$
															.each(
																	jsonOb,
																	function(
																			index,
																			cityOb) {
																		if (cityOb.districtId == districtId)
																			text += "<option value=\""+cityOb.id+"\">"
																					+ cityOb.cityName
																					+ "</option>";
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
						});
					});

	

	//degreeId
</script>

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
	font-size: 18px;
	display: inline-block;
	padding: 10px;
	color: #B0B1B3;
	margin-right: 20px;
}

.easyWizardSteps li span {
	font-size: 24px
}

.easyWizardSteps li.current {
	color: #000
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/tab/themes/smoothness/jquery-ui.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">

<script
	src="${pageContext.request.contextPath}/resources/plugins/easy-wizard/jquery.easyWizard.js"></script>
<script>
	function pcm_total() {
		var ophysics = parseFloat($('#ophysics').val())
		if (isNaN(ophysics)) {
			ophysics = 0;
		}

		var ochemistry = parseFloat($('#ochemistry').val())
		if (isNaN(ochemistry)) {
			ochemistry = 0;
		}

		var omaths = parseFloat($('#omaths').val())
		if (isNaN(omaths)) {
			omaths = 0;
		}

		var pcm_total = omaths + ochemistry + ophysics;
		$("#my_pcm_total").text(pcm_total);

	}

	function pcm_ttotal() {
		var tphysics = parseFloat($('#tphysics').val())
		if (isNaN(tphysics)) {
			tphysics = 0;
		}

		var tchemistry = parseFloat($('#tchemistry').val())
		if (isNaN(tchemistry)) {
			tchemistry = 0;
		}

		var tmaths = parseFloat($('#tmaths').val())
		if (isNaN(tmaths)) {
			tmaths = 0;
		}

		var pcm_ttotal = tmaths + tchemistry + tphysics;

		$("#my_pcm_ttotal").text(pcm_ttotal);

	}

	$(function() {
		$('#myWizard2').easyWizard({
			buttonsClass : 'btn',
			submitButtonClass : 'btn btn-success',

		});

		if ("${student.finalSubmission}" == "true") {
			$(".btn-success").addClass("print-btn");
			$(".btn-success").removeClass("btn-success");
			$(".print-btn").html("Print");
		}

		$("[data-step]").click(function() {
			var step = $(this).attr('data-step');
			$('#myWizard2').easyWizard('goToStep', step);
		});

		/*$("[data-step]").dblclick(function() {
			var step = $(this).attr('data-step');
			$('#myWizard2').easyWizard('goToStep', step);
		});*/
	});

	$(function() {
		$("#dob").datepicker({
			showOn : "both",
			dateFormat : "dd/mm/yy",
			buttonText : "<i  class='icon-calendar my_cal'></i>",
			buttonImageOnly : false,
			constrainInput : true,
		});

	});
	$(function() {
		//$("#entranceExamId").val("${student.entranceExamId}").change();
		//$("#entranceExamYear").val("${student.entranceExamYear}").change();
		$("#gender-${student.gender}").attr("checked", "checked");
		//$("#countryId").val("${student.countryId}").change();
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


								<div class="grid-header text">
									Student Registration
									<div class="glyphicon glyphicon-print"
										style="font-size: 20px; color: #1D9D74; float: right; right: 2%"></div>
								</div>
								<div class="text"
									style="position: absolute; left: 496px; top: 44px; color: green; font-size: 20; font-weight: 500;"
									id="message">${message}</div>

							</div>

							<form id="myWizard2" action="../academic/student-registration"
								method="post" class="form-horizontal"
								enctype="multipart/form-data">
								<input type="hidden" name="id" value="${student.id }" id="id">
								<input type="hidden" name="sessionId" value="2015"
									id="sessionId"> <input type="hidden"
									name="applicationId" value="${student.applicationId }"
									id="applicationId"> <input type="hidden"
									name="photoLink" value="${student.photoLink}" id="photoLink">
								<input type="hidden" name="signatureLink"
									value="${student.signatureLink}" id="signatureLink">
								<section class="step" data-step-title="Personal Details">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->


									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Personal Information</span>
										</div>


									</div>


									<!--  General header tab end here -->


									<div class="row my-bg-success">
										<!--left div start here -->

										<div class="col-md-6">

											<div class="form-horizontal">
												<!-- <div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Identification Number <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-6">
															<input name="menuName" type="text" maxlength="40"
																id="menu_name" tabindex="3" class="form-control"
																readonly="readonly"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Identification Number" />
																<input type="hidden" name="sessionId" value="2015">
														</div>
														<div class="col-sm-1">
															<label style="top: 7px"
																class="glyphicon glyphicon-search" title="search"></label>
														</div>
													</div>
												
												</div> -->
												<br>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">Student First Name<span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>
														<div class="col-sm-7">
															<input title="Email is required !" name="studentName"
																type="text" maxlength="40" id="studentName" 
																class="form-control" placeholder="Student First Name"
																value="${student.studentName}"> <span
																id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>

														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">Student Middle Name<span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>
														<div class="col-sm-7">
															<input name="fatherName" type="text" maxlength="40"
																id="fatherName" class="form-control"
																placeholder="Student Middle Name"
																value="${student.fatherName}"> <span
																id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>

														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">Student Last Name<span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>
														<div class="col-sm-7">
															<input name="lastName" type="text" maxlength="40"
																id="lastName" class="form-control"
																placeholder="Student Last Name"
																value="${student.lastName}"> <span
																id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>

														</div>
													</div>
												</div>

												<!-- <div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblMenuName"
																class="control-label">Father Name <span
																style="color: #FF0000; font-weight: bold">*</span></span>


														</div>
														<div class="col-sm-7">
															<input name="fatherName" type="text" maxlength="40"
																id="menu_name" tabindex="3" class="form-control"
																onkeypress="return CheckAlphaNumeric(event,this)"
																placeholder="Father Name"> <span
																id="ContentPlaceHolder1_rfvmenu" style="display: none;"></span>
														</div>
													</div>
												</div> -->
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-xs-5">
															<span id="ContentPlaceHolder1_lblMenuLink"
																class="control-label">Mother Name <span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>

														<div class="col-sm-7">
															<input name="motherName" type="text" maxlength="100"
																id="motherName" class="form-control"
																placeholder="Mother Name" value="${student.motherName}">


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
															<input type="file" name="studentPhoto" id="studentPhoto"
																title="Please Select Photo" onchange="">

														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-5"></div>
													<div class="col-sm-7">

														<img id="studentImage" style="border: 1px solid #A9E6F9"
															src="<c:url value="../images/${student.photoLink}"/>"
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

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Mother Tongue <span
																style="color: #FF0000; font-weight: bold">*</span></span>


														</div>
														<div class="col-sm-7">
															<select name="motherTongueId" id="motherTongueId"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${MOTHERTONGUE_LIST}"
																	var="mothertongue">
																	<option value="${mothertongue.id}">${mothertongue.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>

												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">Date of Birth<span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>
														<div class="col-sm-7">
															<input name="dob" type="text" maxlength="40" id="dob"
																readonly="readonly" class="form-control"
																placeholder="Date of Birth" value="${student.dob}" />
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
															<span id="ContentPlaceHolder1_lblMenuLink"
																class="control-label">Caste <span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>

														<div class="col-sm-7">
															<select name="casteId" id="casteId" class="form-control">
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
														<div class="col-xs-5">
															<span id="ContentPlaceHolder1_lblMenuLink"
																class="control-label">Category <span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>

														<div class="col-sm-7">
															<select name="categoryId" id="categoryId"
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
														<div class="col-xs-5">
															<span id="ContentPlaceHolder1_lblMenuLink"
																class="control-label">Nationality <span
																style="color: #FF0000; font-weight: bold">*</span></span>

														</div>

														<div class="col-sm-7">
															<select name="nationalityId" id="nationalityId"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${NATIONALITY_LIST}" var="nationality">
																	<option value="${nationality.id}">${nationality.name}</option>
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
																class="control-label">Signature</span>
														</div>
														<div class="col-sm-7">
															<input type="file" name="signaturePhoto"
																id="signaturePhoto" title="Please Select Signature">
															<!-- onchange="showImage()"> -->

														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-5"></div>
													<div class="col-sm-7">

														<img id="signatureImage" style="border: 1px solid #A9E6F9"
															src="<c:url value="../images/${student.signatureLink}"/>"
															style="height: 75px; width: 75px;">


													</div>
												</div>
												<!-- photo end state here -->


											</div>

										</div>

										<!--right div end here -->
									</div>
								</section>
								<section class="step" data-step-title="Contact/Address Details">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->


									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Contact Details</span>
										</div>

									</div>
									<!-- General header tab end here -->
									<div class="row my-bg-success" style="">
										<!--left div start here -->

										<div class="col-md-6">

											<div class="form-horizontal">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Permanent Mobile Number <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<input name="mobileNumber" type="text"
																value="${student.mobileNumber }" maxlength="40"
																id="mobileNumber" class="form-control"
																placeholder="Permanent Mobile Number" />
														</div>

													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">Permanent Landline Number</span>

														</div>
														<div class="col-sm-2">
															<input name="permanentTelephoneStd"
																value="${student.permanentTelephoneStd}" type="text"
																maxlength="5" id="permanentTelephoneStd"
																class="form-control" placeholder="Code">

														</div>
														<div class="col-sm-5">
															<input name="permanentTelephone"
																value="${student.permanentTelephone }" type="text"
																maxlength="10" id="permanentTelephone" 
																class="form-control" placeholder="Number">

														</div>
													</div>
												</div>

											</div>

										</div>


										<!--left div end here -->

										<!--right div start here -->

										<div class="col-md-6">

											<div class="form-horizontal" style="top: 5px">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Email <span
																style="color: #FF0000; font-weight: bold">*</span></span>


														</div>
														<div class="col-sm-7">
															<input name="emailId" value="${student.emailId }"
																type="text" maxlength="150" id="emailId" 
																class="form-control" placeholder="Email ">
														</div>
													</div>
												</div>


											</div>

										</div>

										<!--right div end here -->
									</div>



									<!--left row 1 1 start here -->
									<!-- General header tab start here -->


									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Address Details</span>
										</div>


									</div>


									<!-- General header tab end here -->


									<div class="row my-bg-success" style="">
										<!--left div start here -->

										<div class="col-md-6">

											<div class="form-horizontal">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label"> Country <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<select name="countryId" id="countryId"
																class="form-control">
																<option value="0">Please Select</option>
																<c:forEach items="${COUNTRY_LIST}" var="country">
																	<option value="${country.id}">${country.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">State<span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<select name="stateId" id="stateId" class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${STATE_LIST}" var="state">
																	<option value="${state.id}">${state.name}</option>
																</c:forEach>
															</select>
														</div>

													</div>
												</div>
												<div class="form-group">
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblParent"
																class="control-label">District</span>
														</div>
														<div class="col-sm-7">
															<select name="districtId" id="districtId"
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
																class="control-label">City</span>
														</div>
														<div class="col-sm-7">
															<select name="cityId" id="cityId" class="form-control">
																<option selected="selected" value="0">Please
																	Select</option>

															</select>
														</div>
													</div>
												</div>

											</div>
											<!-- country -->
										</div>
										<!--left div end here -->

										<!--right div start here -->
										<div class="col-md-6">

											<div class="form-horizontal" style="top: 5px">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Pincode <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<input name="pincode" type="text" maxlength="10"
																value="${student.pincode }" id="pincode" 
																class="form-control" placeholder="Pincode ">
														</div>
													</div>
												</div>
											</div>
											<div class="form-horizontal" style="top: 5px">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-5">

															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Address <span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>
														<div class="col-sm-7">
															<div class="input-group">
																<textarea class="form-control custom-control" cols="40"
																	rows="5" style="resize: none" name="address"
																	id="address">
																			${student.address}
																			</textarea>
															</div>
														</div>
													</div>
												</div>
											</div>

										</div>
										<!--right div end here -->
									</div>
								</section>
								<section class="step"
									data-step-title="Education/Documents Details">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->
									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Education/Documents
												Details<span style="color: #FF0000; font-weight: bold">*</span>
											</span>
										</div>
									</div>
									<!-- General header tab end here -->
									<div class="row my-bg-success">
										<!--left div start here -->

										<!-- TABLE CODE START HERE -->
										<div class="col-md-12">

											<div class=""
												style="height: auto; position: relative; overflow: auto; margin-top: 10px">

												<table id="menu_table"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th>Education</th>
															<th>year</th>
															<th>Subject</th>
															<th>Marks</th>
															<th>Out of</th>
														</tr>
													</thead>
													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<tr class="odd">
															<td>10th</td>
															<td><input name="sscPassingYear" type="text"
																maxlength="10" id="sscPassingYear" 
																class="form-control" placeholder="year of passing "
																value="${student.sscPassingYear }"></td>
															<td>Over all</td>
															<td><input name="sscTotal" type="number"
																value="${student.sscTotal }" maxlength="5" id="sscTotal"
																class="form-control"
																placeholder="Total Marks"></td>
															<td><input name="sscOutof" type="number"
																value="${student.sscOutof }" maxlength="5" id="sscOutof"
															    class="form-control" placeholder="Out of"></td>
														</tr>
														<tr class="odd">
															<td></td>
															<td></td>
															<td>Maths</td>
															<td><input name="sscMaths" type="number"
																value="${student.sscMaths}" maxlength="5" id="sscMaths"
																class="form-control"
																placeholder="Total Marks"></td>
															<td><input name="sscMathsMaximum" type="number"
																value="${student.sscMathsMaximum}" maxlength="5"
																id="sscMathsMaximum" class="form-control"
																placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td>12th</td>
															<td><input name="hscPassingYear"
																value="${student.hscPassingYear }" type="text"
																maxlength="5" id="hscPassingYear" 
																class="form-control" placeholder="Year of Passing "></td>
															<td>Total Marks</td>
															<td><input name="hscTotal" type="number"
																value="${student.hscTotal}" id="hscTotal" maxlength="5"
																class="form-control"
																placeholder="Total Marks"></td>
															<td><input name="hscOutOf" type="number"
																value="${student.hscOutOf}" maxlength="5"
																class="form-control" id="hscOutOf" placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td></td>
															<td></td>
															<td>Physics</td>
															<td><input name="hscPhysics" type="number"
																value="${student.hscPhysics }" maxlength="5"
																id="ophysics" class="form-control"
																onkeyup="pcm_total()" onclick="pcm_total()"
																placeholder="Total Marks"></td>
															<td><input name="hscPhysicsMax" type="number"
																value="${student.hscPhysicsMax }" maxlength="5"
																id="tphysics" class="form-control"
																onkeyup="pcm_ttotal()" onclick=" pcm_ttotal()"
																placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td></td>
															<td></td>
															<td>Chemistry</td>
															<td><input name="hscChemestry" type="number"
																value="${student.hscChemestry}" maxlength="5"
																id="ochemistry" class="form-control"
																onkeyup=" pcm_total()" onclick="pcm_total()"
																placeholder="Total Marks"></td>
															<td><input name="hscChemestryMax" type="number"
																value="${student.hscChemestryMax }" maxlength="5"
																id="tchemistry" class="form-control"
																onkeyup=" pcm_ttotal()" onclick=" pcm_ttotal()"
																placeholder="Out of"></td>
														</tr>
														<tr class="even">
															<td></td>
															<td></td>
															<td>Maths</td>
															<td><input name="hscMaths" type="number"
																value="${student.hscMaths}" maxlength="5" id="omaths"
																class="form-control" onkeyup=" pcm_total()"
																onclick="pcm_total()" placeholder="Total Marks"></td>
															<td><input name="hscMathsMax" type="number"
																value="${student.hscMathsMax }" maxlength="5"
																id="tmaths" class="form-control"
																onkeyup=" pcm_ttotal()" onclick=" pcm_ttotal()"
																placeholder="Out of"></td>
														</tr>

														<tr class="even">
															<td></td>
															<td></td>
															<td>PCM Total</td>
															<td style="text-align: left" id="my_pcm_total"></td>
															<td style="text-align: left" id="my_pcm_ttotal"></td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- table div -->

											<div class=""
												style="height: auto; position: relative; overflow: auto; margin-top: 10px">

												<table id="menu_table"
													class="table table-bordered  table-checkable table-responsive  "
													aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row">
															<th>Exam<span
																style="color: #FF0000; font-weight: bold">*</span></th>
															<th>Roll Number<span
																style="color: #FF0000; font-weight: bold">*</span></th>
															<th>year<span
																style="color: #FF0000; font-weight: bold">*</span></th>
															<th>Score<span
																style="color: #FF0000; font-weight: bold">*</span></th>
															<th>All India Rank<span
																style="color: #FF0000; font-weight: bold">*</span></th>
														</tr>
													</thead>

													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<tr class="odd">
														<tr class="even">
															<td><select name="entranceExamId"
																id="entranceExamId" class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>
																	<c:forEach items="${qualifyingExamList}" var="entrance">
																		<c:if test="${entrance.examType == 'e'}">
																			<option value="${entrance.id}">${entrance.qualifyingExam}</option>
																		</c:if>
																	</c:forEach>
															</select></td>
															<td><input name="entranceExamRollNumber"
																value="${student.entranceExamRollNumber }" type="text"
																maxlength="10" id="entranceExamRollNumber"
																class="form-control" placeholder="Roll Number "></td>

															<td><select name="entranceExamYear"
																id="entranceExamYear" class="form-control">
																	<option selected="selected" value="0">Please
																		Select</option>

															</select></td>
															<td><input name="entranceExamScore" type="text"
																value="${student.entranceExamScore}" maxlength="10"
																id="entranceExamScore" class="form-control"
																placeholder="Out of"></td>
															<td><input name="entranceExamRank" type="text"
																value="${student.entranceExamRank}" maxlength="10"
																id="entranceExamRank" class="form-control"
																placeholder="All India Rank "></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!--left div end here -->

										<!--right div start here -->

										<%-- <div class="col-md-12">

													<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-12" style="padding-bottom: 10px">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Degree<span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>


														<div class="col-sm-6">
															<select name="degreeId"
																id="degreeId" class="form-control" >
																	<option selected="selected" value="0">Please
																		Select Degree</option>

															</select>
														</div>
														
													</div>
												</div>
												
											<div class="form-horizontal">
												<div class="form-group">
													<br>
													<div class="col-sm-12">
														<div class="col-sm-12" style="padding-bottom: 10px">
															<span id="ContentPlaceHolder1_lblModule"
																class="control-label">Document List<span
																style="color: #FF0000; font-weight: bold">*</span></span>
														</div>


														<div class="col-sm-6">
															<input type=checkbox name="sscMarksheet" value="${student.sscMarksheet }"/> <label>SSC
															</label>
														</div>
														<div class="col-sm-6">
															<input type=checkbox name="hscMarksheet" value="${student.hscMarksheet }"/> <label>HSC</label>
														</div>

														<div class="col-sm-6">
															<input type=checkbox name="entranceScorecard" value="${student.entranceScorecard}" /> <label>Entrance
																Exam Score Acknowledgement</label>
														</div>
														<div class="col-sm-6">
															<input type=checkbox name="leavingCertificate" value="${student.leavingCertificate }"/> <label>Leaving
																Certificate </label>
														</div>

														<div class="col-sm-6">
															<input type=checkbox name="domicileCertificate" value="${student.domicileCertificate}" /> <label>Domicile
																Certificate</label>
														</div>
														<div class="col-sm-6">
															<input type=checkbox name="nationalityCertificate" value="${student.nationalityCertificate}" /> <label>Nationality
																Certificate</label>
														</div>
														<div class="col-sm-6">
															<input type=checkbox name="migrationCertificate" value="${student.migrationCertificate }" /> <label>Migration
																Certificate</label>
														</div>
														<div class="col-sm-6">
															<input type=checkbox name="castCertificate" value="${student.castCertificate }" /> <label>Cast
																Certificate</label>
														</div>
													</div>
												</div>
											</div>

										</div> --%>

										<!--right div end here -->
									</div>
								</section>
								<section class="step" data-step-title="Branch Preference ">
									<!--left row 1 1 start here -->
									<!-- General header tab start here -->
									<div class="box-header" style="top: 5px;">
										<div class="box-name">
											<i class="fa fa-table"></i> <span>Branch Preference</span>
										</div>
									</div>
									<!-- General header tab end here -->
									<div class="row my-bg-success">
										<!--left div start here -->

										<!-- TABLE CODE START HERE -->
										<div class="col-md-12 style=" id="preference_div"
											style="margin-top: 12px;">


											<div class="form-group">

												<div class="col-sm-12">
													<div class="col-sm-3">

														<span id="ContentPlaceHolder1_lblParent"
															class="control-label">Preference 1</span>
													</div>

													<div class="col-sm-3">

														<c:set var="branchOptions"
															value="<option selected='selected' value='0'>Please Select Branch</option>" />
														<c:set var="count" value="0" />
														<select name="preferences" data-toggle="modal"
															data-original-title="Add to Project" id="preferences"
															class="form-control branch-preference">
															<option selected="selected" value="0">Please
																Select</option>

														</select>

														<script type="text/javascript">
															branchOptions = "${branchOptions}";
															numberOfBranches = "${count}";
														</script>
													</div>


													<div class="col-sm-2">
														<i class="glyphicon glyphicon-plus"
															onclick="append_preferecence()"
															style="font-size: 20px; color: #1D9D74; text-shadow: 2px 2px 4px #83878D;"></i>

													</div>


												</div>

											</div>
											<!-- end of form group -->





										</div>



										<div class="col-sm-12">
											<div class="col-sm-3">

												<span id="ContentPlaceHolder1_lblParent"
													class="control-label"><h2>Terms & Conditions</h2></span>
											</div>

											<div class="col-sm-5">

												<div id="terms-pane"
													style="overflow: scroll; height: 200px; border: 1px solid #d7d7d7; border-radius: 4px">
													<p>
													<h3>PLEASE READ THIS LEGAL STATEMENT CAREFULLY BEFORE
														USING THIS SITE.</h3>
													<br> This may have changed since your last visit to
													this site. Your use of this site and the information
													available on this site are subject to the following terms
													and conditions. By entering this site, you are
													acknowledging your consent to these terms and conditions.
													If you do not accept these terms and conditions, then do
													not use this site.
													</p>
													<p>Copyright Unless otherwise noted, all content
														included on this site, such as text, graphics, logos,
														button icons, images, audio clips and software, is the
														property of either CSS Industries, Inc., or its consumer
														product subsidiaries (collectively "CSS"), CSS' licensors
														or its trademark suppliers and protected by the U.S. and
														international copyright laws and all rights are reserved.
														Similarly, the compilation of all content on this site is
														the exclusive property of CSS and protected by such
														copyright laws. All software used on this site is the
														property of CSS or its software suppliers is protected by
														the same laws and all rights are reserved. Reproduction,</p>
													<p>Trademarks All trademarks not owned by CSS that
														appear on this site are the property of their respective
														owners.</p>
													<p>Applicable Law/Jurisdiction By visiting this
														website, you agree that the laws of the Commonwealth of
														Pennsylvania without regard to principles of conflict of
														laws, will govern this agreement and any dispute of any
														sort that might arise between you and CSS. Any action
														brought to enforce this agreement or matters related to
														this site must be brought in either the state or federal
														courts in Pennsylvania and you consent to such
														jurisdiction and venue. Any claim or cause of action you
														have with respect to the use of this site must be
														commenced within one (1) year after the claim arises.</p>

													<!-- many more... -->
												</div>

											</div>
										</div>

										<!-- end of form group -->
										<div class="col-sm-12">
											<div class="form-group">
												<div class="col-sm-3"></div>
												<div class="col-sm-7">
													<input type=checkbox name="finalSubmission" value="false"
														id="finalSubmission" /> <label><b>I agree to
															the above terms</b></label>
												</div>
											</div>


										</div>
										<div id="confirm_div" class="col-xs-12 col-sm-12 bg-primary"
											style="height: 37px; border-radius: 5px; text-align: center; padding: 10px;">(There
											Would Be no More Change Would Be Allowed After Final Submit
											is Done)</div>


									</div>


									<!-- success div end here -->
								</section>
								<div class="form-group">
									<div class="col-md-12">
										<div class="col-sm-12" align="center">
											<input type="submit" name="submit" value="Save" onclick=""
												id="add-update-btn" title="Save"
												class="btn btn-xl btn-success button-submit font13">
											<input type="reset" name="reset" value="Reset" id="reset"
												title="Reset"
												class="btn btn-xl btn-default button-cancel font13">
										</div>

									</div>

								</div>
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
	<script>
		$(document)
				.ready(
						function() {
							/* $(".easyWizardButtons")
							.append("<button type=\"button\" id='final_submit' class=\"next btn btn-warning\"  style='display:none'  >Final Submit</button>") */;
						});

		$(document).ready(function() {
			/*	$("#finalSubmission")
						.click(
								function() {
									$("#confirm_div").fadeToggle(
											4000);
									$("#final_submit").fadeToggle(
									);
								});*/
		});
		function remove_this(row) {
			row.closest('.form-group').remove();
			preferenceCount--;
		}
	</script>

	<c:forEach items="${preferenceList}" var="preferenceId">
		<script type="text/javascript">
			preferenceIds += "${preferenceId}" + ",";
		</script>
	</c:forEach>
</body>
</html>
