<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Payment Type Details  | RF-Campus</title>

<!--=== CSS ===-->
<jsp:include page="../views/authentication/script.jsp" />

<script type="text/javascript">
		function setRecip(rId,code,title)
		{
			$("#id").val(rId);
			$("#paymentType").val(code);
			$("#remark").val(title);
			$("#add-paymenttype").valid();
		    $("#add-paymenttype").attr('action', './paymenttype/update'); 
		    $("#submit-btn").html('Update');
			$("#submit-btn").attr('title','Update');
			$("#submit-btn").attr('class','btn btn-xl btn-warning button-submit font13');
			
		}
    </script>

<script type="text/javascript">
		$(document).ready(function(){
			
			if ("${message}" == "add")
			 { notifysuccess('Payment type created Successfully!!!!');} 
			 
			 else if ("${message}" == "update")
			 { notifyupdate('Payment type Updated Successfully!!');} 
			 else if("${message}" == "errorCreation")
				 {notifyerror('Payment type creation unsuccessfull,try again!');}
			 else if("${message}" == "errorUpdation")
				 {notifyerror('Payment type updation unsuccessfull,try again!');}
			 else if("${message}" != "")
				 {notifyerror('${message}');}
			
			$("#cancel-btn").click(function(){
				validator.resetForm();
				$("#id").val(0);
				$("#paymentType").val('');
				$("#remark").val('');
				$("#add-paymenttype").attr('action', './paymenttype/add');
				$("#submit-btn").html('Save');
				$("#submit-btn").html('Save');	
				$("#submit-btn").attr('title','Save');
				$("#submit-btn").attr('class','btn btn-xl btn-success button-submit font13');
			});
			
			var validator = $("#add-paymenttype").validate({
		        // Specify the validation rules
		        rules: {
		        	paymentType: {
		            	required:true//,
		            },
		            remark: {
		            	required:true//,
		            }
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	paymentType: {
		        		required : ""//,
		        	},
		        	remark: {
		        		required : ""//,
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


							<div class="grid-header text">PAYMENT TYPE MANAGEMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-paymenttype"
										class="form-inline ng-pristine ng-valid" method="post"
										action="./paymenttype/add">
										<input type="hidden" name="id" id="id" value="0">
										<div class="row my-bg-success">
										<div class="form-group">
													<div class="col-sm-12 ">
														<div class="col-sm-3">
															Note <b>:</b> <span style="color: #FF0000">*
																Marked Is Mandatory !</span>
														</div>
													</div>
												</div>
											<!--1st div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-5">
														<div class="control-label">
															Payment Type<span
																style="color: #FF0000; font-weight: bold">*</span>
														</div></div>
														<div class="col-sm-7">
															<input type="text" name="paymentType" id="paymentType"
																class="form-control" maxlength="200"
																placeholder="Please Enter Payment Type" />


														</div>
													</div>

												</div>
											</div>
											<!--1st div end here -->
											<!--2nd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<div class="col-sm-4">
														<div class="control-label">Remark<span
																style="color: #FF0000; font-weight: bold">*</span></div></div>
														<div class="col-sm-8">
															<input type="text" name="remark" id="remark" maxlength="200"
																class="form-control" placeholder="Please Enter Remark" />

														</div>
													</div>
												</div>

											</div>

											<!--2nd div end here -->
											<!--3rd div start here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="">
														<!--Button start here -->

														<div class="col-sm-12">


															<button type="submit" id="submit-btn"
																class="btn btn-xl btn-success button-submit font13"
																title="Save" data-placement="top">Save</button>


															<button type="button" id="cancel-btn"
																class="btn btn-xl btn-cancel button-submit font13"
																title="Reset" data-placement="top">Reset</button>


														</div>
														<!-- Button  end here -->
													</div>
												</div>
											</div>
											<!--3rd div end here -->


											<!-- end of all 3 div row-->



										</div>
									</form>
								</div>
							</div>
						
							<div class="grid-title">
								<div class="pull-left">Payment Type List</div>
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
														aria-label="ID: activate to sort column ascending">Payment
														Title</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Remarks</th>
													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="First Name: activate to sort column ascending">Action</th>
												</tr>
											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<c:forEach items="${paymentTypeList}" var="paymentType">
													<tr class="odd">
														<td class=" "><c:out value="${paymentType.id}" /></td>
														<td class=" "><c:out
																value="${paymentType.paymentType}" /></td>
														<td class=" "><c:out value="${paymentType.remark}" /></td>
														<td class=" ">
															<div class="fa-select" title="Edit"
																onclick="setRecip(${paymentType.id},'${paymentType.paymentType}','${paymentType.remark}')">
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

