<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Branch Details | RF-Campus</title>

<!--=== CSS ===-->

<style type="text/css">
</style>
<jsp:include page="authentication/script.jsp" />
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js "></script> -->
<script type="text/javascript">
	function setUniversity(id,degree,branch,duration,shortname,longname,degreetype,code,intake1,intake2,intake3,intake4,intake5,totalIntake) {
		$("#branchId").val(id);
		$("#degreeNumber").val(degree).change();
		$("#dept").val(branch).change();
		$("#shortname").val(shortname);
		$("#duration").val(duration);
		$("#longname").val(longname);
		$("#code").val(code);
		
		if(degreetype == "UG"){
			$("#degreeType").val("UNDER_GRADUATE").change();
		}else if(degreetype == "PG"){
			$("#degreeType").val("POST_GRADUATE").change();
		}else if(degreetype == "OT"){
			$("#degreeType").val("OTHER").change();
		}
		
		$("#txt1").val(intake1);
		$("#txt2").val(intake2);
		$("#txt3").val(intake3);
		$("#txt4").val(intake4);
		$("#txt5").val(intake5);
		$("#totalPrice").val(totalIntake);
		$("#add-branch").valid();
		$("#add-branch").attr('action', './branch/update');
		$("#submit-btn").html('Update');
		$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');
		$("#submit-btn").attr('title','Update');

	}

	
</script>

<script type="text/javascript">
	$(document).ready(function() {
		
		 if ("${message}" == "add")
		 { notifysuccess('Branch created Successfully!!');} 
		 
		 else if ("${message}" == "update")
		 { notifyupdate('Record Updated Successfully!!');} 
		 else if("${message}" == "error")
			 {notifyerror('Branch creation unsuccessfull,try again!');}
		 else if ("${message}" != "")
		 {notifyerror('${message}');}
		
		$('.price').keyup(function () {
			 
		    // initialize the sum (total price) to zero
		    var sum = 0;
		     
		    // we use jQuery each() to loop through all the textbox with 'price' class
		    // and compute the sum for each loop
		    $('.price').each(function() {
		        sum += Number($(this).val());
		    });
		     
		    // set the computed value to 'totalPrice' textbox
		    $('#totalPrice').val(sum);
		     
		});
		

		$('#active').change(function() {
			if ($(this).is(":checked")) {

				$("#active").val(1);
			}

		});
		$("#cancel-btn").click(function() {
			validator.resetForm();
			$("#branchId").val(0);
			$("#degreeNumber").val('').change();
			$("#dept").val('').change();
			$("#shortname").val('');
			$("#duration").val(0);
			$("#longname").val('');
			$("#code").val(0);
			$("#degreeType").val('');
			$("#txt1").val(0);
			$("#txt2").val(0);
			$("#txt3").val(0);
			$("#txt4").val(0);
			$("#txt5").val(0);
			$("#totalPrice").val(0);
			$("#add-branch").attr('action', './branch/add');
			$("#submit-btn").html('Save');
			$("#submit-btn").attr('title','Save');
			$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
		});

		jQuery.validator.addMethod('selectcheck', function(value) {
			return (value != '0' && value != '');
		}, "");
		
		jQuery.validator.addMethod("lettersonly", function(value, element) {
			 return this.optional(element) || /^[a-z," "]+$/i.test(value);
		}, "Numbers or Special Characters not Allowed");
		
		var validator = $("#add-branch").validate({
			// Specify the validation rules
			rules : {
				branchDegreeNumber : {
					required : true,
					selectcheck:true,
				
				},
				branchDegreeType : {
					required : true,
					selectcheck:true
				
				},
				deptNo : {
					required : true,
					selectcheck:true
				
				},
				branchDuration : {
					required : true,
					selectcheck:true,
					number : true
				
				},
				branchShortName : {
					required : true,
					selectcheck:true
				
				},
				branchLongName : {
					required : true,
					selectcheck:true
					
					},
					
		        branchCode : {
						required : true,
						selectcheck:true,
						
			        }
						
			},

			// Specify the validation error messages
			messages : {
				branchDegreeNumber : {
					required : "",
					selectcheck: "",
				
				},
				branchDegreeType : {
					required : "",
					selectcheck: ""
				
				},
				deptNo : {
					required : "",
					selectcheck: ""
				
				},
				branchDuration : {
					required : "",
					selectcheck: ""
				
				},
				branchShortName : {
					required : "",
					selectcheck: ""
				
				},
				branchLongName : {
					required : "",
					selectcheck: ""
					
					},
					
		        branchCode : {
						required : "",
						selectcheck: ""
						
			        }
						
			},

			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="authentication/page-header.jsp" />
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">
							<div class="grid-header text">BRANCH MANAGEMENT</div>
							<!-- <div class="tab-pane active" id="tab_general"> -->
								<div
									class="two-child-containers clearfixs column-one-contents info-container-page">
									<div class="grid box-filters">
										<div class="table-header">
											<form class="form-inline ng-pristine ng-valid" method="post"
												action="./branch/add" id="add-branch">
												<input type="hidden" name="id" id="branchId"
													value="0">
												<div class="row my-bg-success">
													<!--1st div start here -->
													<div class="col-md-6">
														<div class="form-horizontal">
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Degree<span style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<select name="branchDegreeNumber" class="form-control"
																			id="degreeNumber">
																			<option selected="selected" value="0">Please
																				Select</option>
																			<c:forEach items="${degreeList}" var="degree">
																				<option
																					value="${degree.id
																	}">${degree.degreeName}
																				</option>
																			</c:forEach>
																		</select>


																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			UG/PG/OT <span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<select name="branchDegreeType" class="form-control"
																			id="degreeType">
																			<option selected="selected" value="0">Please
																				Select</option>
																			<option value="UNDER_GRADUATE">UG</option>
																			<option value="POST_GRADUATE">PG</option>
																			<option value="OTHER">OT</option>
																		</select>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Department<span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<select name="deptNo" class="form-control" id="dept">
																			<option selected="selected" value="0">Please
																				Select</option>
																			<c:forEach items="${departmentList}" var="department">
																				<option
																					value="${department.departmetId
																	}">${department.departmentName}
																				</option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Duration <span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40" value="0"
																			name="branchDuration" class="form-control"
																			id="duration"  />
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Short Name <span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40"
																			name="branchShortName" class="form-control"
																			id="shortname"  />
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Long Name <span
																				style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="100"
																			name="branchLongName" class="form-control"
																			id="longname"  />
																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Code <span style="color: #FF0000; font-weight: bold">*</span>
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40" name="branchCode"
																			class="form-control" value="0" id="code"  />
																	</div>

																</div>

															</div>
														</div>
													</div>
													<!--1st div end here -->

													<!--2nd div start here -->
													<div class="col-md-6">
														<div class="form-horizontal">
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Intake In Round I
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40"
																			class="form-control price" name="branchIntakeRound1"
																			id="txt1" value="0" />

																	</div>
																</div>
															</div>

															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Intake In Round II 
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40"
																			class="form-control price" name="branchIntakeRound2"
																			id="txt2" value="0" />

																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Intake In Round III 
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40"
																			class="form-control price" name="branchIntakeRound3"
																			id="txt3" value="0" />

																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Intake In Round IV
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40"
																			class="form-control price" name="branchIntakeRound4"
																			id="txt4" value="0" />
																	</div>
																</div>
															</div>
															<div class="form-group">
																<div class="col-sm-12">
																	<div class="col-sm-5">
																		<div class="control-label">
																			Intake In Round V
																		</div>
																	</div>
																	<div class="col-sm-7">
																		<input type="text" maxlength="40"
																			class="form-control price" name="branchIntakeRound5"
																			id="txt5" value="0" /> <input type="hidden"
																			value="0" name="branchTotalIntake" id="totalPrice" />
																	</div>
																</div>
															</div>

														</div>

													</div>

													<!--2nd div end here -->


													<!--Button start here -->
													<div class="form-horizontal">
														<div class="" style="text-align: center">

															<div class="col-sm-12">


																<button type="submit" id="submit-btn" title="Save"
																	class="btn btn-xl btn-success button-submit font13">Save</button>


																<button type="button" title="Reset"
																	class="btn btn-xl btn-cancel button-cancel font13"
																	id="cancel-btn">Reset</button>
																
																<button type="button" title="Report"
																	class="btn btn-xl btn-cancel button-submit font13"
																	id="report-btn">Report</button>

															</div>
														</div>
													</div>
													<!--Button  end here -->

													<!-- end of all 3 div row-->

												</div>

											</form>
										</div>
									</div>
								</div>
							<!-- </div> -->

							

							<div class="grid-title">
								<div class="pull-left">Branch List</div>
								<div class="pull-right"></div>
								<div class="clear"></div>
							</div>
							<div class="grid-content">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper form-inline" role="grid">
									<div class="row">
										<div class="dataTables_header clearfix">
											<div class="col-md-6"></div>
										</div>
									</div>
									<div class="dataTables_header"
										style="position: relative; overflow: auto; max-width: 100%">
										<table
											class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="PHOTO: activate to sort column ascending">Sr
														No</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Short
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Long
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Degree
														Type</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Total
														Intake</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
										<c:set var="srno" value="1" />
												<c:forEach items="${branchList}" var="branch">
													<tr class="odd">
<%-- value="${branch.admissionDegreeMasterEntity.degreeName} --%>
														<td class=" "><c:out
																value="${srno}" /></td>
														<td class=" "><c:out
																value="${branch.branchShortName}" /></td>
														<td class=" "><c:out value="${branch.branchLongName}" /></td>
														<td class=" "><c:out
																value="${branch.branchDegreeType}" /></td>
														<td class=" "><c:out
																value="${branch.branchTotalIntake}" /></td>
														<td class=" ">
														<div class="fa-select" title="Edit"
																onclick="setUniversity(${branch.id},${branch.branchDegreeNumber},${branch.deptNo},${branch.branchDuration},'${branch.branchShortName}','${branch.branchLongName}','${branch.branchDegreeType}','${branch.branchCode}',${branch.branchIntakeRound1},${branch.branchIntakeRound2},${branch.branchIntakeRound3},${branch.branchIntakeRound4},${branch.branchIntakeRound5},${branch.branchTotalIntake})">
																<span class="fa fa-pencil-square" ></span>
															</div>
															
														</td>
													</tr>
														<c:set var="srno" value="${srno+1}" />
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>  
							</div>
						</div>
						<!-- /General Information -->
					</div>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container -->
</body>

