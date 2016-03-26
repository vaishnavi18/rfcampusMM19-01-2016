<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>University Details  | RF-Campus</title>

<!--=== CSS ===-->

<style>
/* .form-group .col-sm-5{ */
/* top:7px */
/* } */

/* .form-group .col-sm-3{ */
/* top:7px */
/* } */
</style>

<jsp:include page="script.jsp" />

<script type="text/javascript">
		function setUniversity(uid, code, name, active)
		{     
			$("#universityId").val(uid);
			$("#code").val(code);
			$("#uname").val(name);
			if(active == 1){
				$("#active").prop("checked", true);
				$("#active").val(1);
			}else{
				$("#active").prop("checked", false);
				$("#active").val(0);
			} 
			$("#add-update-university").valid();
			$("#add-update-university").attr('action', './university/update');
			$("#submit-btn").html('Update');
			$("#submit-btn").attr("title","Update")
			$("#submit-btn").attr("class","btn btn-xl btn-warning button-submit font13");
			
		}
    </script>

<script type="text/javascript">
		$(document).ready(function(){
			

			 if ("${message}" == "add")
			 { notifysuccess('Record Saved Successfully!!');} 
			 
			 else if ("${message}" == "update")
			 { 
				 notifyupdate('Record Updated Successfully!!');
			 } 
			 else 
			 { 
				 $("#error").empty().html("&nbsp; <br> ${message}");    
					document.getElementById("error").style.color = "red";
			 } 
			
			$('#active').change(function() {
		        if($(this).is(":checked")) {
		            
		        	$("#active").val(1);
		        }
		                
		    });
			
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$("#universityId").val(0);
				$("#code").val('');
				$("#uname").val('');
				$("#add-update-university").attr('action', './university/add');
				$("#active").prop("checked", false);
				$("#active").val(0);
				$("#submit-btn").html('Save');
				$("#submit-btn").attr("class","btn btn-xl btn-success button-submit font13");
				$("#error").empty();
				
			});
			
			jQuery.validator.addMethod("positiveInteger", function(value, element) {
				return this.optional(element) || /^[0-9]*\.?[0-9]+$/.test(value);
			}, "A positive decimal number please");
	 
			 jQuery.validator.addMethod("lettersonly", function(value, element) {
				 return this.optional(element) || /^[a-z," "]+$/i.test(value);
			 }, "Numbers or Special Characters not Allowed");
			
			var validator = $("#add-update-university").validate({
		        // Specify the validation rules
		        rules: {
		        	universityCode: {
		            	required:true,
		            	positiveInteger : true,
		            },
		            universityName: {
		            	required:true,
		            	lettersonly : true
		            }
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	universityCode: {
		        		required : ""
		        	},
		        	universityName: {
		        		required : ""
		            }
		        },
		        
		        submitHandler: function(form) {
		            form.submit();
		        }
		    });
			
		});
		
		
	</script>
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="page-header.jsp" />
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">


							<div class="grid-header text">UNIVERSITY MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="./university/add" id="add-update-university">
										<input type="hidden" name="id" id="universityId" value="0">
										<div class="row ">
											<!--1st div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">


													<div class="form-group">
														
														<div class="col-sm-5">
															<div class="control-label">
																University/Board Code<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div> 
														</div>
														<div class="col-sm-7">

															<input name="universityCode" type="text" maxlength="30"
																id="code" class="form-control"
																placeholder="Please Enter Code"><span id="error"></span>

														</div>
													</div>

												</div>
											</div>
											<!--1st div end here -->
											<!--2nd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">

														<div class="col-sm-5">
															<div class="control-label">
																University/Board Name <span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input name="universityName" type="text" maxlength="250"
																id="uname" class="form-control"
																placeholder="Please Enter University Name">

														</div>
													</div>
												</div>

											</div>

											<!--2nd div end here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
															<div class="control-label">
																Active<span style="color: #FF0000; font-weight: bold"></span> 
															</div>
														</div>
														<div class="col-sm-7">
															<input type="checkbox" name="active" id="active"
																value="1" /> <label>Yes</label>
															
														</div>
													</div>
												</div>
											</div>
											<!--Button start here -->
											<div class="form-horizontal">
												<div class="" style="text-align: center">

													<div class="col-sm-12">


														<button type="submit" id="submit-btn" title="Save"
															class="btn btn-xl btn-success button-submit font13">Save</button>


														<button type="button" title="Reset"
															class="btn btn-xl btn-cancel button-submit font13"
															id="cancel-btn">Reset</button>


													</div>
												</div>
											</div>
											<!--Button  end here -->

										</div>
									
									</form>
								</div>


							</div>
						
							<div class="grid-title">
								<div class="pull-left">University List</div>
								<!--<div class="pull-right">
                        <a href="assets-create-reminders-form.html" target="_blank" class="btn btn-xl btn-success button-submit font13">
                          <i class="icon-plus-sign margin_right5"></i>Save
                        </a>
                    </div>-->
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
										style="height: auto; position: relative; overflow: auto; max-width: 100%">
										<table
											class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="PHOTO: activate to sort column ascending">University
														/ Board Code</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">University
														/ Board Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Status</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${universityList}" var="university">
													<tr class="odd">
														<td class=" "><c:out
																value="${university.universityCode}" /></td>
														<td class=" "><c:out
																value="${university.universityName}" /></td>
														<c:choose>
															<c:when test="${university.active eq 1}">
																<td class=" ">active</td>
															</c:when>
															<c:otherwise>
																<td class=" ">inactive</td>
															</c:otherwise>
														</c:choose>
														<td class=" ">
															<div class="fa-select" title="Edit"
																onclick="setUniversity(${university.id}, '${university.universityCode}', '${university.universityName}', ${university.active})">
																<span class="fa fa-pencil-square" ></span>
															</div>

														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>

								<!-- Modal dialog -->

								<!-- /.modal -->
							</div>

							<!--=== Page Content ===-->
							<!--=== Managed Tables ===-->

							<!--=== Horizontal Scrolling ===-->

							<!-- /Horizontal Scrolling -->
							<!-- /Page Content -->
						</div>
						<!-- /.container -->

					</div>
				</div>
			</div>
		</div>
	</div>
</body>

