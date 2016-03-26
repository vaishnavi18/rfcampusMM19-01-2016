<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Mother Tongue Details  | RF-Campus </title>

<!--=== CSS ===-->
<jsp:include page="authentication/script.jsp" />
<script type="text/javascript">
$(document).ready(function() {
	
	jQuery.validator.addMethod('selectcheck', function(value) {
		return (value != '');
	}, "");
	
	var validator = $("#add-update-document").validate({
        // Specify the validation rules
        rules: {
        	mothertongue: {
            	required:true,
            	selectcheck:true
            }
        },
        
        // Specify the validation error messages
        messages: {
        	mothertongue: {
        		required : "",
        		selectcheck:""
            }
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });
	
	if ("${message}" == "add")
	 { notifysuccess('Degree created Successfully!!');} 
	 
	 else if ("${message}" == "update")
	 { notifyupdate('Record Updated Successfully!!');} 

			
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$("#documentId").val(0); 
				$("#dname").val('');
				$("#add-update-document").attr('action', './mothertongue/add'); 
				$("#submit-btn").html('Save');
				$("#submit-btn").attr('title','Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13')
				
			});
});      
			</script>
			
			<script type="text/javascript">
          function setDocument(did,name)
			{ 
				$("#documentId").val(did); 
				$("#dname").val(name);
			 	$("#add-update-document").attr('action', './mothertongue/update');
				$("#submit-btn").html('Update');
				$("#submit-btn").attr('title','Update');
				$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13')
				
			}
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

							<div class="grid-header text">MOTHER TONGUE MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="./mothertongue/add" id="add-update-document">
										<input type="hidden" name="id" id="documentId" value="0">
										<div class="row">
											<!--1st div start here -->
											<div class="col-md-6">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
														<div class="control-label">Mother Tongue<span
																style="color: #FF0000; font-weight: bold">*</span></div>
														</div>
														<div class="col-sm-6">
															<input type="text" name="mothertongue"
																class="form-control" id="dname"
																placeholder="Please Enter Mothertongue" />


														</div>
													</div>

												</div>
											</div>
											<!--1st div end here -->

											<!--2nd div start here -->
											<div class="col-md-6">
												<div class="form-horizontal">
													<div class="form-group">
													
														<!--Button start here -->
														<div class="col-sm-12">
														
															<button type="submit" id="submit-btn"
																class="btn btn-xl btn-success button-submit font13 "
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
											<!--2nd div end here -->

											<!-- end of all 3 div row-->
										</div>
									</form>
								</div>
							</div>

						
							<div class="grid-title">
								<div class="pull-left">Mother Tongue List</div>
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
														aria-label="ID: activate to sort column ascending">Mother Tongue
													</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${mothertongueList}" var="document">

													<tr class="odd">
														<td class=" "><c:out value="${document.id}" /></td>
														<td class=" "><c:out value="${document.mothertongue}" /></td>
														<td class=" ">
															<div class="fa-select" title="Edit"
																onclick="setDocument(${document.id},'${document.mothertongue}')">
																<span class="fa fa-pencil-square"></span>
															</div></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
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
</body>


</html>

