<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Receipt Details  | RF-Campus</title>

<!--=== CSS ===-->
<jsp:include page="../views/authentication/script.jsp" />

<script type="text/javascript">
		function setRecip(rId,code,title,belongTo,link,accountNo)
		{
			$("#receiptId").val(rId);
			$("#receiptCode").val(code);
			$("#receiptTitle").val(title);
			$("#receiptbelongto").val(belongTo);
			$("#linked").val(link);
			$("#accountNo").val(accountNo);
			if(link == true){
				$("#linked").prop("checked", true);
				$("#linked").val(true);
			}else{
				$("#linked").prop("checked", false);
				$("#linked").val(false);
			} 
			$("#add-receipt").valid();
			$("#add-receipt").attr('action', './receipttype/update');
			$("#submit-btn").html('Update');
			$("#submit-btn").attr('title','Update');
			$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');
			
		}
    </script>

<script type="text/javascript">
		$(document).ready(function(){
			
			 if ("${message}" == "add")
			 { notifysuccess('Receipt Created Successfully!!');} 
			 
			 else if ("${message}" == "update")
			 { notifyupdate('Record Updated Successfully!!');} 
			 else if("${message}" == "error")
				 {notifyerror('Receipt creation unsuccessfull,try again!');}
			 else if("${message}" != "")
				 {notifyerror('${message}');}
			
			$('#linked').change(function() {
		        if($(this).is(":checked")) {
		            
		        	$("#linked").val("true");
		        }
		        else
		        	$("#linked").val("false");
		                
		    });
			
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$("#receiptId").val(0);
				$("#receiptCode").val('');
				$("#receiptTitle").val('');
				$("#receiptbelongto").val('');
				$("#accountNo").val('');
				$("#add-receipt").attr('action', './receipttype/add');
				$("#linked").prop("checked", false);
				$("#linked").val("false");
				$("#submit-btn").html('Save');	
				$("#submit-btn").attr('title','Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
				
			});
			
			jQuery.validator.addMethod('selectcheck', function(value) {
				return (value != '');
			}, "");
			var validator = $("#add-receipt").validate({
		        // Specify the validation rules
		        rules: {
		        	receiptCode: {
		            	required:true,
		            	selectcheck: true
		            },
		            receiptFor: {
		            	required:true,
		            	selectcheck: true
		            },
		            accountNumber: {
		            	required:true,
		            	selectcheck: true,
		            	number : true
		            },
		            receiptTitle: {
		            	required:true,
		            	selectcheck: true
		            }
		            
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	receiptCode: {
		        		required : "",
		        		selectcheck: ""
		        	},
		        	receiptFor: {
		        		required : "",
		        		selectcheck: ""
		            },
		        	accountNumber: {
		            	required: "",
		            	selectcheck: ""
		            },
		            receiptTitle: {
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


							<div class="grid-header text">RECEIPT MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-receipt" class="form-inline ng-pristine ng-valid"
										method="post" action="./receipttype/add">
										<input type="hidden" name="id" id="receiptId" value="0">
										<div class="row my-bg-success">
											<!--1st div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
															<div class="control-label">
																Receipt Code<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input type="text" name="receiptCode" placeholder="Please Enter Receipt Code"
																class="form-control" id="receiptCode" maxlength="200"/>


														</div>
													</div>

												</div>
												<div class="form-group">
													<div class="col-sm-5">
														<div class="control-label">
															Account No <span
																style="color: #FF0000; font-weight: bold">*</span>
														</div>
													</div>
													<div class="col-sm-7">
														<input type="text" name="accountNumber" placeholder="Please Enter Account Number"
															class="form-control" id="accountNo" maxlength="200">
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
																Receipt Title <span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<input type="text" name="receiptTitle" placeholder="Please Enter Receipt Name"
																class="form-control" id="receiptTitle" maxlength="200">

														</div>
													</div>


													<div class="form-group">
														<div class="col-sm-8">
															<div class="control-label">
																Link Accounts?&nbsp;<input type="checkbox" name="Linked" id="linked"
																value="false" />
															</div>
														</div>
													</div>







												</div>

											</div>

											<!--2nd div end here -->
											<!--3rd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
															<div class="control-label">
																Receipt For<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7 ">
															<select name="receiptFor" id="receiptbelongto"
																class="form-control">
																<option value="">Please Select </option>
																<option value="Academic">Academic</option>
																<option value="Hostel">Hostel</option>
																<option value="Mess">Mess</option>
																<option value="Miscellaneous">Miscellaneous</option>
															</select>

														</div>

													</div>
												</div>
											</div>
											<!--3rd div end here -->

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

											<!-- end of all 3 div row-->

										</div>
									</form>
								</div>
							</div>
							
							<div class="grid-title">
								<div class="pull-left">Receipt Type List</div>

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
										style="height: 295px; position: relative; overflow: auto; max-width: 100%">
										<table
											class=" dataTables_header table table-striped table-bordered table-hover table-checkable table-responsive datatable dataTable"
											id="DataTables_Table_0"
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="PHOTO: activate to sort column ascending">Receipt
														Code</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Receipt
														Title</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Receipt
														belongs to</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${receiptTypeList}" var="receipt">
													<tr class="odd">
														<td class=" "><c:out value="${receipt.receiptCode}" /></td>
														<td class=" "><c:out value="${receipt.receiptTitle}" /></td>
														<td class=" "><c:out value="${receipt.receiptFor}" /></td>
														<td class=" ">
															<div class="fa-select" title="Edit"
																onclick="setRecip(${receipt.id},'${receipt.receiptCode}','${receipt.receiptTitle}','${receipt.receiptFor}',${receipt.linked},'${receipt.accountNumber}')">
																<span class="fa fa-pencil-square"></span>
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

