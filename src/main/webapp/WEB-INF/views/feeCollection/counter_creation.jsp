<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Create Counter | RF-Campus</title>

<!--=== CSS ===-->
<jsp:include page="../authentication/script.jsp" />
<style>
.table>thead>tr>th,
 .table>tbody>tr>th,
  .table>tfoot>tr>th,
   .table>thead>tr>td,
    .table>tbody>tr>td,
     .table>tfoot>tr>td 
{border-top: 0px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	
	
	
	$('#linked').change(function() {
        if($(this).is(":checked")) {
            
        	$("#linked").val("true");
        }
        else
        	$("#linked").val("false");
                
    });
	
	$("#submit-btn").click(function(){
		var flag= true;
		if(jQuery('#add-update-counter input[type=checkbox]:checked').length==0)
			{
			flag = false;
			notifyerror("Choose Atleast One Receipt Type!!")
			}
		if($("#add-update-counter").valid() && flag)
 		{createCounter();}
       });
	
	jQuery.validator.addMethod('selectcheck', function(value) {
		return (value != '' && value != '0');
	}, "");
	
	var validator = $("#add-update-counter").validate({
        // Specify the validation rules
        rules: {
        	counterName: {
            	required:true,
            	selectcheck:true
            },
            printName: {
            	required:true,
            	selectcheck:true
            },
            counterUser: {
            	required:true,
            	selectcheck:true
            }
        },
        
        // Specify the validation error messages
        messages: {
        	counterName: {
            	required:"",
            	selectcheck:""
            },
            printName: {
            	required:"",
            	selectcheck:""
            },
            counterUser: {
            	required:"",
            	selectcheck:""
            }
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });
	
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$(".receipts").removeAttr('checked')
				$("#counterId").val(0); 
				$("#counterName").val('');
				$("#printName").val('');
				$("#counterUser").val('0');
				$("#receiptL").val('');
				$("#submit-btn").html('Save');
				$("#submit-btn").attr('title','Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13')
				
			});
});      
			</script>

<script type="text/javascript">

          
        function setCounter(id,counterName,counterPrintName,counterUserId,receiptIds)
  		{
        	$("#counterId").val(id);
  			$("#counterName").val(counterName);
  			$("#printName").val(counterPrintName);
  			$("#counterUser").val(counterUserId);
  			$("#receiptL").val(receiptIds);
  			//alert(receiptIds);
  			$(".receipts").removeAttr('checked');
  			
  			var receipts = new String(receiptIds).trim().split(',');
  			
  			for(var i = 0; i < receipts.length; i++){
  				$("#permission-"+receipts[i].trim()).prop("checked", true);
  				//alert(receipts[i] + ' - ' + $("#permission-"+receipts[i].trim()).prop("checked"));
  			}
  			
  			
  			$("#add-update-counter").valid();
  			$("#submit-btn").html('Update');
  			$("#submit-btn").attr('title','Update');
  			$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');
  			
  		}
			</script>
	<script type="text/javascript">
	 
	 function createCounter(){
		 if( $("#add-update-counter").valid())
		 { var id=$("#counterId").val();
		 var counterName=$("#counterName").val();
         var printName=$("#printName").val();
         var counterUser=$("#counterUser").val();
         var receiptPrevList=$("#receiptL").val();
         var receiptPermission='';
         var link;
         if(id==0)
        	{
              link="../feeCollection/counter_creation/add";        	
        	}
        else
        	{
        	link="../feeCollection/counter_creation/update";
        	}
         
         $.each($(".receipts"), function(){
        	 if($(this).is(":checked") == true){ 
        		 receiptPermission += $(this).val() + ',';
        		 }  
        	 });
         
         var formData = new FormData();
         formData.append("id",id);
     	formData.append("counterName", counterName);
     	formData.append("printName", printName);
     	formData.append("counterUser",counterUser);
     	formData.append("receiptType", receiptPermission);  
     	formData.append("receiptPrevList", receiptPrevList);
     	$
    	.ajax({
    		async : false,
    		url : link,
    		type : "POST",
    		data : formData,
    		processData: false,
           contentType: false,
    		success : function(response) {
    			
    			if (response == "add")
    			 { notifysuccess("Counter Created Successfully!!");} 
    			 else if (response == "update")
    			 { notifyupdate("Counter Updated Successfully!!");} 
    			 else if(response == "error")
    				 {notifyerror('Counter Creation Unsuccessfull,Try Again!');}
    			 else if(response == "updateerror")
    			 {notifyerror('Counter Updation Unsuccessfull,Try Again!');}
    			 else if(response == "exist")
    				 {notifyerror('Counter Already Assigned To User');} 
    			if(response != 0){
    				 setTimeout(function(){
                         location.reload();
                    }, 3000); 
    			}
    		},
    		error : function() {
    			//alert('error...');
    		},
    	});
     	
	 }
	 }
	  </script>	
			
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="../authentication/page-header.jsp" />
					<!-- /Page Header -->
					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->
						<!-- /Navigation Vertical -->
						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">

							<div class="grid-header text">COUNTER DEFINITION</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form class="form-inline ng-pristine ng-valid" method="post"
										action="../feeCollection/counter_creation/add" id="add-update-counter">
									 <input type="hidden" name="id" id="counterId" value="0"> 
									  <input type="hidden" name="receiptL" id="receiptL" value=""> 
										<div class="row">
										<div class="form-group">
													<div class="col-sm-12 ">
														<div class="col-sm-3">
															Note <b>:</b> <span style="color: #FF0000">*
																Marked Is Mandatory !</span>
														</div>
													</div>
												</div>
											<!--1st div start here -->
											<div class="col-sm-6">
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
															<div class="control-label">
																Counter Name<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-6">
															<input type="text" name="counterName"
																class="form-control" id="counterName"
																placeholder="Please Enter Counter Name" />
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
															<div class="control-label">
																Short Print Name<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-6">
															<input type="text" name="printName" class="form-control"
																id="printName" placeholder="Please Enter Short Name" />
														</div>
													</div>
												</div>
												<div class="form-group">
													<div class="">
														<div class="col-sm-4 ">
															<div class="control-label">
																Counter User<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-6">
															<select id="counterUser" name="counterUser"
																class="form-control">
																<option selected="selected" value="0">Please
																	Select Counter User</option>
																 <c:forEach items="${userList}" var="user">
																	<option value="${user.id}">${user.name}</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</div>

											</div>
											<!--1st div end here -->
											<!--2nd div start here -->
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
													<br><br>
													<div class="col-md-5">
														<table class="table table-responsive" style="border-top: #FAFAFA;" id="permissiontable">
															<c:set var="index" value="0" />
															<c:forEach items="${receiptTypeList}" begin="0" step="3">
																<tr>
																	 <c:forEach items="${receiptTypeList}" var="receipt" begin="${index}" end="${index + 2}"> 
																		<td
																			style="align: right; float: right; padding-left: 20px; padding-right: 2px;">
																			<input type="checkbox" name="reciptType" id="permission-${receipt.id}" class="receipts"
																			value="${receipt.id}"> <c:out value="${receipt.receiptTitle}" />
																		</td>
																	 </c:forEach> 
																</tr>
																<c:set var="index" value="${index + 3}" />
															</c:forEach>
														</table>
													</div>
												</div>
											</div>
											<!--2nd div end here -->
											<div class="col-sm-12">
												<div class="form-horizontal">
													<div class="form-group">
														<!--Button start here -->
														<div style="text-align: center;">
															<button type="button" id="submit-btn"
																class="btn btn-xl btn-success button-submit font13 "
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
								<div class="pull-left">List of Counters</div>
								<div class="clear"></div>
							</div>
							<div class="grid-content">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper form-inline" role="grid">
									<div class="row">
										<div class="dataTables_header clearfix">
											<div class="col-sm-6"></div>
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
													<th class="sorting" role="columnheader" tabindex="0" style="text-align:center; "
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Sr.no: activate to sort column ascending">Sr.no</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Counter Name: activate to sort column ascending">Counter
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Print Name: activate to sort column ascending">Print
														Name</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Counter User: activate to sort column ascending">Counter
														User</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Permissions for Receipts: activate to sort column ascending">Permissions
														for Receipts</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="Action: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
											
											<c:set var="srno" value="1" />
											 <c:forEach items="${counterList}" var="counter">
											       
													<tr class="odd">
														<td style="text-align:center; "><c:out value="${srno}" /></td>
														<td class=" "><c:out value="${counter.counterName}" /></td>
														<td class=" "><c:out value="${counter.counterPrintName}" /></td>
														<td class=" "><c:out value="${counter.counterUserName}" /></td>
														<td class=" "><c:out value="${counter.receiptCodes}" /></td>
														<td class=" ">
															<div class="fa-select" title="Edit" 
															onclick="setCounter(${counter.id},'${counter.counterName}','${counter.counterPrintName}',${counter.counterUserId},'${counter.receiptIds}')">
																
					<span class="fa fa-pencil-square"></span>
															</div>
														</td>
													</tr>
													<c:set var="srno" value="${srno + 1}" />
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
			<!-- /.container -->
		</div>
	</div>
</body>




										