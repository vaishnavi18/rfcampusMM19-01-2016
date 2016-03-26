<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Module Management | RF-Campus</title>
<!--=== CSS ===-->
<jsp:include page="script.jsp" />
<script type="text/javascript"
	src="<c:url value="/resources/common/ajax-call.js"/>"></script>

<script type="text/javascript">
	$(document).ready(function()
	{
		 if ("${message}" == "add")
		 { notifysuccess('Record Saved Successfully!!');} 
		 else if ("${message}" == "update")
		 { notifyupdate('Record Updated Successfully!!');} 
		 
	 jQuery.validator.addMethod('selectcheck', function(value) {
				return (value  != '');
			}, "");
	 jQuery.validator.addMethod("lettersonly", function(value, element) {
			 return this.optional(element) || /^[a-z," "]+$/i.test(value);
		 }, "Numbers or Special Characters not Allowed");
	 jQuery.validator.addMethod("positiveInteger", function(value, element) {
				return this.optional(element) || /^[0-9]*\.?[0-9]+$/.test(value);
			}, "A positive decimal number please");
	 
	   var validator= $("#add-edit-module").validate({
	        // Specify the validation rules
	        rules: {
	            moduleName: {
	            	required:true,
	            	selectcheck: true,
	            	lettersonly: true,
	            },
	            serialNumber: {
	            	required:true,
	            	selectcheck:true,
	            	positiveInteger : true,
	            }
	        },
	        // Specify the validation error messages
	        messages: {
	        	moduleName: {
	        		required : "",
	        		selectcheck : "",
	        		
	        	},
	        	serialNumber: {
	        		required : "",
	        		selectcheck : ""
	        	}
	        },
	        submitHandler: function(form) {
	           form.submit();
	        }
	    });
	  
	   
		$('#active').change(function() {
	        if($(this).is(":checked")) {
	            
	        	$("#active").val(1);
	        }
	                
	    });
		
		$("#submit-btn").click(function(){
			var moduleId = $("#moduleId").val();
			var moduleName = $("#moduleName").val();		
			ajaxParams.url = "./modules/exist";
			ajaxParams.data = {"moduleId":moduleId, "moduleName":moduleName};
			ajaxParams.formType = "module";
			if($("#add-edit-module").valid()){
				var flag = ajaxRequest();
				if(flag == false){ 
					$("#add-edit-module").submit();
				}else{
					return false;
				}
			}
		});
		
		$('#add-edit-module').submit(function() {
			
			if($('#add-edit-module').valid())
			{
				checkModuleAvailability();
				if(flag == false)
				{return false;}
				else
				{this.submit();}
			}
			
			});
		
		/*$("#add-edit-module").on('submit',
				function(e) {
			if(flag == false){
				e.preventDefault();
				//alert('submit prevented');
				checkModuleAvailability();
				//alert('flag : '+flag);
			}
			
			if(flag == true){
				$("#add-edit-module").submit();
			}
			
		});*/
		
		$("#cancel-btn").click(function(){
			 validator.resetForm();
			$("#moduleId").val(0);
			$("#moduleName").val('');
			$("#serialNumber").val('');
			$("#active").prop("checked", false);
			$("#active").val(0);
			$("#submit-btn").html('Save');
			$("#submit-btn").attr("title","Save");
			$("#submit-btn").attr("class","btn btn-xl btn-success button-submit font13");
			$("#add-edit-module").attr("action", "./modules/add");
			$("#error").empty();  
		});
		
		
	});
	
	function updateModule(moduleId, moduleName, active, serialNumber){
			//alert(moduleId +" - "+ moduleName +" - "+ active);
			currentModuleId = moduleId
			console.log(currentModuleId);
			
			$("#moduleId").val(moduleId);
			$("#moduleName").val(moduleName);
			$("#serialNumber").val(serialNumber);
			if(active == 1){
				$("#active").prop("checked", true);
				$("#active").val(1);
			}else{
				$("#active").prop("checked", false);
				$("#active").val(0);
			} 
			
			$("#add-edit-module").validate();
			$("#submit-btn").html('Update');
			$("#submit-btn").attr("class","btn btn-xl btn-warning button-submit font13");
			$("#submit-btn").attr("title","Update");
			$("#add-edit-module").attr("action", "./modules/update");
			
		}
	
	function checkModuleAvailability(){
		var moduleId = $("#moduleId").val();;
		var moduleName = $("#moduleName").val();
		
		ajaxParams.url = "./modules/exist";
		ajaxParams.data = {"moduleId":moduleId, "moduleName":moduleName};
		ajaxParams.formType = "module";
		
		if($("#add-edit-module").valid()){
			
			ajaxRequest();
			/* if(flag == true){
				$("#add-edit-module").submit();
			} */
			
			
		}
	}
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
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix">
							<div class="grid-header text">MODULE MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-edit-module"
										class="form-inline ng-pristine ng-valid" method="post"
										action="./modules/add">
										<input type="hidden" name="moduleId" id="moduleId" value="0">
										<div class="row my-bg-success">
											<!--1st div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
															<div class="control-label">
																Module Name<span style="color: #FF0000;">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input type="text" maxlength="50" class="form-control"
																name="moduleName" id="moduleName" 
																placeholder="Please Enter Name"><span id="error"></span>
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
																Serial No. <span style="color: #FF0000;">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input type="text" maxlength="20" class="form-control"
																id="serialNumber" name="serialNumber"
																placeholder="Please Enter Sr.No">
														</div>
													</div>
												</div>
											</div>
											<!--2nd div end here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
															<div class="control-label"> Active?&nbsp;
															</div>
														</div>
														<div class="col-sm-7">
															<input type="checkbox" name="moduleStatus" id="active">
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
								<div class="pull-left">Module List</div>
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
													<th class="" role="columnheader" tabindex="0"
														aria-controls ="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Sr No: activate to sort column ascending">Sr
														No</th>
													<th class="" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Module Name: activate to sort column ascending">Module
														Name</th>
													<th class="" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Status: activate to sort column ascending">Status</th>
													<th class="" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Action: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all"
												id="role-table-body">
												<c:set var="srno" value="1" />
												<c:forEach items="${allModuleList}" var="module">
													<tr class="odd">
														<td class=" ">${module.serialNumber}</td>
														<td class=" ">${module.moduleName}</td>
														<c:if test="${module.moduleStatus eq 1}">
															<td class=" ">Active</td>
														</c:if>
														<c:if test="${module.moduleStatus eq 0}">
															<td class=" ">Inactive</td>
														</c:if>
														<td>
															<div class="fa-select" title="Edit" data-placement="top"
																onclick="updateModule(${module.moduleId}, '${module.moduleName}', ${module.moduleStatus}, ${module.serialNumber})">
																<span class="fa fa-pencil-square"></span>
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
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
