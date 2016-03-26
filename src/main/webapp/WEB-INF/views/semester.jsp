<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Semester Details | RF-Campus</title>

<!--=== CSS ===-->
<title>Enable Hover State on Bootstrap 3 Table Rows</title>

<jsp:include page="../views/authentication/script.jsp" />
 
<script type="text/javascript">
		function setRecip(id,name,fullname,oddeven)
		{
			$("#receiptId").val(id);
			$("#receiptCode").val(name);
			$("#receiptTitle").val(fullname);
			if(oddeven==1)
			{$("#semesterOdd").prop('checked',true);}
			else if(oddeven==2)
			{$("#semesterEven").prop('checked',true);}
			$("#add-semester").valid();
		    $("#add-semester").attr('action', './semester/update');
			$("#submit-btn").html('Update');
			$("#submit-btn").attr('title','Update');
			$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');
			
		}
    </script>

<script type="text/javascript">
		$(document).ready(function(){	
			
			if ("${message}" == "add")
			 { notifysuccess('Semester created Successfully!!!!');} 
			 else if ("${message}" == "update")
			 { notifyupdate('SemesterUpdated Successfully!!');} 
			 else if("${message}" == "errorCreation")
				 {notifyerror('Semester creation unsuccessfull,try again!');}
			 else if("${message}" == "errorUpdation")
				 {notifyerror('Semester updation unsuccessfull,try again!');}
			 else if("${message}" != "")
				 {notifyerror('${message}');}
			
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$("#receiptId").val(0);
				$("#receiptCode").val('');
				$("#receiptTitle").val('');
				$("#semesterOdd").prop('checked', false);
				$("#semesterEven").prop('checked',false);
				$("#add-semester").attr('action', './semester/add');
				$("#submit-btn").html('Save');	
				$("#submit-btn").attr('title','Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
			});
		
			
			jQuery.validator.addMethod('selectcheck', function(value) {
				return (value != '');
			}, "");
			
		var validator=	$("#add-semester").validate({
		        // Specify the validation rules
		        rules: {
		        	semesterName: {
		            	required:true,
						selectcheck:true//,
		            },
		            semesterFullName: {
		            	required:true,
						selectcheck:true//,
		            },
		            semesterOddEven: {
		        	required:true,
					selectcheck:true//  
		          }
		        },
		        // Specify the validation error messages
		        messages: {
		        	semesterName: {
		        		required : "",
						selectcheck: ""//,
		        	},
		        	semesterFullName: {
		        		required : "",
						selectcheck: ""//,
		            },
		            semesterOddEven:{
		            	required: "",
						selectcheck: ""
		            }
		        },
		        
		        submitHandler: function(form) {
		            form.submit();
		        }
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


							<div class="grid-header text">SEMESTER MANAGEMENT</div>
							<div class="grid box-filters">
								<div  class="table-header">
									<form id="add-semester"
										class="form-inline ng-pristine ng-valid" method="post"
										action="./semester/add">
										<input type="hidden" name="id" id="receiptId"
											value="0">
										<div class="row my-bg-success">
											<!--1st div start here -->
											<div class="col-md-4">
											<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
														<div class="control-label">Semester Name<span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>
														</div>
														<div class="col-sm-7">
															<input type="text" name="semesterName" id="receiptCode" class="form-control"
															placeholder="Please Enter Semester  Name" />
														</div>
													</div>

												</div>
											</div>
											<!--1st div end here -->
											<!--2nd div start here -->
											<div class="col-md-4">
											<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-6">
														<div class="control-label">
															Semester Full Name <span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>
														</div>
														<div class="col-sm-6">
															<input type="text" name="semesterFullName" class="form-control"
															placeholder="Please Enter Semester Full Name"
																id="receiptTitle"/>

														</div>
													</div>
												</div>
											</div>

											<!--2nd div end here -->
											<!--3rd div start here -->
											<div class="col-md-4">
											<div class="form-horizontal">
											 <div class="form-group">
												<div class="col-sm-12">
												<span
																style="color: #FF0000; font-weight: bold">*</span>
													<label class="radio-inline" style="float: left;font-size: 14px;text-align: right;"> 														
													<input type="radio" name="semesterOddEven" class=""	id="semesterOdd" value="1">Odd Semester
													
													</label>
													<label class="radio-inline" style="float: left;font-size: 14px;text-align: right;">
													<input type="radio" name="semesterOddEven" class=""	id="semesterEven" value="2">Even Semester
													
													</label>
												</div>
													
											 </div>
											</div>
											</div>
											<!--3rd div end here -->
											<!--Button start here -->
											<div class="form-horizontal">
												<div class="" style="text-align: center">

													<div class="col-sm-12">

														<button type="submit" id="submit-btn"
															class="btn btn-xl btn-success button-submit font13" title="Save" data-placement="top">Save</button>

														<button type="button"
															class="btn btn-xl btn-cancel button-submit font13" title="Reset" data-placement="top"
															id="cancel-btn">Reset</button>


													</div>
												</div>
											</div>
											<!--Button  end here -->

										</div>
										<!-- end of all 3 div row-->
									</form>
								</div>
							</div>
							
							
							<div class="grid-title">
								<div class="pull-left">Semester List</div>
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
										style=" position: relative; overflow: auto; max-width: 100%">
									<table
										class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
										id="DataTables_Table_0"
										aria-describedby="DataTables_Table_0_info">
										<thead>
											<tr role="row">
												<th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="PHOTO: activate to sort column ascending">Id</th>
												<th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="ID: activate to sort column ascending">Semester
													Name</th>
												<th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="First Name: activate to sort column ascending">Semester
													Full Name</th>
												<th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="First Name: activate to sort column ascending">Odd/Even</th>
												<th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="First Name: activate to sort column ascending">Action</th>
											</tr>
										</thead>

										<tbody role="alert" aria-live="polite" aria-relevant="all">
											<c:forEach items="${semesterList}" var="semester">
												<tr class="odd">
													<td class=" "><c:out value="${semester.id}" /></td>
													<td class=" "><c:out value="${semester.semesterName}" /></td>
													<td class=" "><c:out
															value="${semester.semesterFullName}" /></td>
													<td class=" "><c:out
															value="${semester.semesterOddEven}" /></td>
													<td class=" "><div class="fa-select" title="Edit" 
																onclick="setRecip(${semester.id},'${semester.semesterName}','${semester.semesterFullName}',${semester.semesterOddEven})">
																<span class="fa fa-pencil-square"></span>
															</div>
												   </td>
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


</html>
