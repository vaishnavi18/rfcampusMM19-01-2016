<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>${masterFields.tableCaption}Details | Master software</title>

<!--=== CSS ===-->

<jsp:include page="../views/authentication/script.jsp" />

<script type="text/javascript">
//id,name
function setFormFields()
{
	
	
	$('[name="id"]').val(arguments[0]);
	$('[name="${masterFields.field1Name}"]').val(arguments[1]);
	$('[name="${masterFields.field2Name}"]').val(arguments[2]);
	$('[name="${masterFields.field3Name}"]').val(arguments[3]);
 	//$("#add-update-master").attr('action', './mothertongue/update');
	$("#submit-btn").html('Update');
	$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13')
	$("#submit-btn").attr('title','Update');
	
}
		
		
    </script>

<script type="text/javascript">
		$(document).ready(function(){
			
			if("${not empty message}" == "true")
			{
				var msg= "${message}"
				notifysuccess(msg);
			}
			
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$('[name="id"]').val(0);
				$('[name="${masterFields.field1Name}"]').val('');
				$('[name="${masterFields.field2Name}"]').val('');
				$('[name="${masterFields.field3Name}"]').val('');
				//$("#add-update-document").attr('action', './mothertongue/add');
				$("#submit-btn").html('Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
				$("#submit-btn").attr('title','Save');
				
			});
			
			var field1Required = "${masterFields.field1Name}" != 'null' ? true : false;
			var field2Required = "${masterFields.field2Name}" != 'null' ? true : false;
			var field3Required = "${masterFields.field3Name}" != 'null' ? true : false;
			
			var validator =	$("#add-update-master").validate({
		        // Specify the validation rules
		        rules: {
		        	
		        	field1Name: {
		            	required:field1Required,
		            	lettersonly : "${masterFields.field1IsNumber}"
		            },
		            field2Name: {
		            	required:field2Required,
		            	lettersonly : "${masterFields.field2IsNumber}"
		            },
		            field3Name: {
		            	required:field3Required,
		            	lettersonly : "${masterFields.field3IsNumber}"
		            }
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	/* field1Name: {
		        		required : "Please Enter ${masterFields.pageName}"//,
		            },
		            field2Name: {
		        		required : "Please Enter ${masterFields.pageName}"//,
		            },
		            field3Name: {
		        		required : "Please Enter ${masterFields.pageName}"//,
		            } */
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
							<div class="grid-header text">${masterFields.pageName}
								MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="./master" id="add-update-master">
										<input type="hidden" name="id" value="0"> <input
											type="hidden" name="propertyName"
											value="${masterFields.propertyName}"> <input
											type="hidden" name="entityName"
											value="${masterFields.entityName}"> <input
											type="hidden" name="masterType"
											value="${masterFields.masterType}">

										<div class="row my-bg-success">
											<!--1st div start here -->
											<c:if test="${masterFields.lable1 != 'N'}">
												<div class="col-md-4">
													<div class="form-horizontal">
														<div class="">
															<div class="col-sm-4 lable-set">
																${masterFields.lable1}<span style="color: #FF0000; font-weight: bold">*</span>
																	
															</div>
															<div class="col-sm-6">
																<input type="text" name="${masterFields.field1Name}"
																	class="form-control"
																	placeholder="${masterFields.lable1}" />
															</div>
														</div>
													</div>
												</div>
											</c:if>
											<!--1st div end here -->
											<c:if test="${masterFields.lable2 != 'N'}">
												<div class="col-md-4">
													<div class="form-horizontal">
														<div class="">
															<div class="col-sm-3 lable-set">
																${masterFields.lable2}<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
															<div class="col-sm-6">
																<input type="text" name="${masterFields.field2Name}"
																	class="form-control"
																	placeholder="${masterFields.lable2}" />
															</div>
														</div>

													</div>
												</div>
											</c:if>

											<c:if test="${masterFields.lable3 != 'N'}">
												<div class="col-md-4">
													<div class="form-horizontal">
														<div class="">
															<div class="col-sm-3 lable-set">
																${masterFields.lable3}<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
															<div class="col-sm-6">
																<input type="text" name="${masterFields.field3Name}"
																	class="form-control"
																	placeholder="${masterFields.lable3}" />
															</div>
														</div>

													</div>
												</div>
											</c:if>

											<!--2nd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<!--Button start here -->
														<div class="col-sm-12">
															<button type="submit" id="submit-btn"
																class="btn btn-xl btn-success button-submit font13"
																title="Save" data-placement="top">Save</button>

															<button type="button"
																class="btn btn-xl btn-cancel button-submit font13"
																title="Reset" data-placement="top" id="cancel-btn">Reset</button>
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
								<div class="pull-left">${masterFields.tableCaption}</div>
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
													<c:if test="${masterFields.column1Caption != 'N'}">
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="PHOTO: activate to sort column ascending">${masterFields.column1Caption}
														</th>
													</c:if>

													<c:if test="${masterFields.column2Caption != 'N'}">
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="ID: activate to sort column ascending">${masterFields.column2Caption}
														</th>
													</c:if>

													<c:if test="${masterFields.column3Caption != 'N'}">
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="First Name: activate to sort column ascending">${masterFields.column3Caption}</th>
													</c:if>

													<c:if test="${masterFields.column4Caption != 'N'}">
														<th class="sorting" role="columnheader" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="First Name: activate to sort column ascending">${masterFields.column4Caption}</th>
													</c:if>

												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${masterDataList}" var="masterData">

													<tr class="odd">
														<td class=" "><c:out value="${masterData.id}" /></td>
														<c:if test="${masterFields.field1Name != 'N'}">
															<td class=" "><c:out value="${masterData.field1}" /></td>
														</c:if>

														<c:if test="${masterFields.field2Name != 'N'}">
															<td class=" "><c:out value="${masterData.field2}" /></td>
														</c:if>
														<td class=" ">
															<div class="fa-select" title="Edit"
																onclick="setFormFields(${masterData.id}, '${masterData.field1}', '${masterData.field2}')"
																data-placement="top">
																<i class="fa fa-pencil-square"></i>
															</div>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

