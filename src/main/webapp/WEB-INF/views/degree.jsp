<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Degree Details | RF-Campus</title>

<!--=== CSS ===-->


<jsp:include page="../views/authentication/script.jsp" />

<script type="text/javascript">
		function setRecip(id,name,code)
		{
		 	$("#receiptId").val(id);
			$("#degreeName").val(name);
			$("#degreeCode").val(code);
			 $("#add-degree").validate(); 
			$("#add-degree").attr('action', './degree/update'); 
			$("#submit-btn").html('Update');
			$("#submit-btn").attr('title','Update');
			$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');
			
		}
	</script>

<script type="text/javascript">
		$(document).ready(function(){
			
			if ("${message}" == "add")
			 { notifysuccess('Degree created Successfully!!');} 
			 
			 else if ("${message}" == "update")
			 { notifyupdate('Record Updated Successfully!!');} 
			 else if("${message}" == "errorCreation")
				 {notifyerror('Degree creation unsuccessfull,try again!');}
			 else if("${message}" == "errorUpdation")
				 {notifyerror('Degree Updation unsuccessfull,try again!');}
			 else if ("${message}" != "")
				 {notifyerror('${message}');}
			
			jQuery.validator.addMethod("lettersonly", function(value, element) {
				 return this.optional(element) || /^[a-z," "]+$/i.test(value);
			}, "Numbers or Special Characters not Allowed");
			
			jQuery.validator.addMethod('selectcheck', function(value) {
				return (value != "");
			}, "");
			
			jQuery.validator.addMethod('isValidDegreeName', function(value) {
				var alphaExp = /^[a-zA-Z. ]+$/;
	            if(value != null && value.match(alphaExp)) {
	                return true;
	            } else {
	                return false;
	            }
			}, true);
			
			var validator = $("#add-degree").validate({
		        // Specify the validation rules
		        rules: {
		        	degreeName: {
		            	required:true,
		            	selectcheck:true,
		            	isValidDegreeName: true
		            },
		            degreeCode: {
		            	required:true,
		            	selectcheck:true,
		            	number : true
		            }
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	degreeName: {
		        		required : "Please Enter Degree Name",
		        		selectcheck: "",
		        		isValidDegreeName: "Please enter valid Degree Name"
		        	},
		        	degreeCode: {
		        		required : "Please Enter Degree Code",
		        		selectcheck:"",
		        		number : "Please enter valid code"
		            }
		        },
		        
		        submitHandler: function(form) {
		            form.submit();
		        }
		    });
			
			$("#submit-btn").click(function(){
				$("#add-degree").valid();
				$("#add-degree").submit();
			});
			
			
			$("#cancel-btn").click(function(){
				 validator.resetForm();
				$("#receiptId").val(0);
				$("#degreeName").val('');
				$("#degreeCode").val('');
				$("#add-degree").attr('action','./degree/add');
				$("#submit-btn").html('Save');
				$("#submit-btn").attr('title','Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
				
			});
			
			
			$("form").submit(function(){
				$("#linked").prop("checked", true);
			});
			
		});
		
		
	</script>
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../views/authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="../views/authentication/page-header.jsp" />
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">


							<div class="grid-header text">DEGREE MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-degree" class="form-inline ng-pristine ng-valid"
										method="post" action="./degree/add">
										<input type="hidden" name="id" id="receiptId"
											value="0">
										<div class="row my-bg-success">
											<!--1st div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5 ">
															<div class="control-label">Degree Name<span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>
														</div>
														<div class="col-sm-7">

															<input type="text" name="degreeName" class="form-control"
																id="degreeName" placeholder="Please Enter Degree Name" />

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
															<div class="control-label">Degree Code <span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>
														</div>
														<div class="col-sm-7">
															<input type="text" name="degreeCode" class="form-control"
																id="degreeCode" placeholder="Please Enter Degree Code" />

														</div>
													</div>
												</div>

											</div>

											<!--2nd div end here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<!--Button start here -->
														<div class="col-sm-12">

															<button type="button" id="submit-btn"
																class="btn btn-xl btn-success button-submit font13"
																title="Save" data-placement="top">Save</button>


															<button type="button"
																class="btn btn-xl btn-cancel button-submit font13"
																title="Reset" data-placement="top"
																id="cancel-btn">Reset</button>


														</div>
														<!-- Button  end here -->
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>

							</div>
							
							<div class="grid-title">
								<div class="pull-left">Degree List</div>
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
										style="position: relative; overflow: auto; max-width: 100%">
										<table
											class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="PHOTO: activate to sort column ascending">Degree Id</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Degree
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Degree
														code</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${degreeList}" var="degree">
													<tr class="odd">
														<td class=" "><c:out value="${degree.id}" /></td>
														<td class=" "><c:out value="${degree.degreeName}" /></td>
														<td class=" "><c:out value="${degree.degreeCode}" /></td>
														<td class=" ">
														<div  title="Edit" data-placement="top" class="fa-select"
															onclick="setRecip(${degree.id},'${degree.degreeName}','${degree.degreeCode}')">
															<span class="fa fa-pencil-square"></span>
														</div></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>

									<!-- Modal dialog -->

									<!-- /.modal -->
								</div>
							</div>
						</div>

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
</body>

