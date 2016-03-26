<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>session counter configuration</title>
<jsp:include page="../authentication/script.jsp" />
<!-- tab code link start here -->
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	
		jQuery.validator.addMethod('selectcheck', function(value) {
			return (value != '0');
		}, "");
	var validator = $("#add-degree").validate({
        // Specify the validation rules
        rules: {
        	acadamicSessionId: {
            	required:true,
            	selectcheck : true,
            },
            userName: {
            	required:true,
            	selectcheck : true
            }
        },
        
        // Specify the validation error messages
        messages: {
        	acadamicSessionId: {
        		required : "",
        		selectcheck:""
        	},
        	userName: {
        		required : "",
        		selectcheck:""
            }
        },
        
        submitHandler: function(form) {
            form.submit();
        }
    });
	
	$("#cancel-btn").click(function(){
		validator.resetForm();
		$("#acadamicSessionId").val('0');
		$("#userName").val('0');
		$('#matrixtable').dataTable().fnClearTable();
		attr('action', './showRecords');
	});
	
	$("#show-btn").click(function() {
		if ($("#add-degree").valid())
		{$("#add-degree").submit();}
	});
	
	});
	
	</script>
<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<jsp:include page="../authentication/page-header.jsp" />
				<!-- /Page Header -->
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">
								<div class="grid-header text">Session Counter
									Configuration</div>
							</div>

							<!-- jaskirat code start here -->
							<div class="grid box-filters">
								<div class="table-header">
									<form id="add-degree" class="form-inline ng-pristine ng-valid"
										method="get" action="./showRecords" novalidate="novalidate">
										<input type="hidden" name="id" id="receiptId" value="0">
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
														<div class="col-sm-5 ">
															<div class="control-label">
																Academic Session<span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">

															<select name="acadamicSessionId" id="acadamicSessionId"
																class="form-control">
																<option  selected="selected" value="0">Please
																	Select Batch</option>
																<c:forEach items="${academicSessionList}" var="session">
																	<option value="${session.id}">${session.sessionName}</option>
																</c:forEach>
															</select>
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
																User Name <span
																	style="color: #FF0000; font-weight: bold">*</span>
															</div>
														</div>
														<div class="col-sm-7">
															<select name="userName" id="userName"
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

											<!--2nd div end here -->
											<div class="col-md-4">
												<div class="form-horizontal">
													<div class="form-group">
														<!--Button start here -->
														<div class="col-sm-12">
															<button type="button" id="show-btn"
																class="btn btn-xl btn-primary button-submit font13"
																title="Show" data-placement="top">Show</button>
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

							<c:if test="${receiptsMatrix!=null}">
								<form id="add-degree" class="form-inline ng-pristine ng-valid"
									method="post" action="./updateReceiptsNumber"
									novalidate="novalidate">
									<div class="grid-title">
										<div class="pull-left">Session Counter Configuration</div>
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
											<div class=""
												style="position: relative; overflow: auto; max-width: 100%;">
												<table style="text-align: center" id="matrixtable"
													class=" dataTables_header table table-striped table-bordered table-responsive datatable dataTable"
													id="DataTables_Table_0" aria-describedby="DataTables_Table_0_info">
													<thead>
														<tr role="row" style="">
															<th style="text-align: center" class="sorting" role="columnheader"
																tabindex="0" aria-controls="DataTables_Table_0"
																rowspan="1" colspan="1" aria-label="PHOTO: activate to sort column ascending"></th>
															<c:forEach items="${paymentModes}" var="paymentmode">
																<th style="text-align: center" class="sorting" role="columnheader"
																	tabindex="0" aria-controls="DataTables_Table_0"
																	rowspan="1" colspan="1"
																	aria-label="ID: activate to sort column ascending">${paymentmode.paymentModeShortCode}</th>
															</c:forEach>
														</tr>
													</thead>

													<tbody role="alert" aria-live="polite" aria-relevant="all">
														<c:set var="tmpCount" value="0" scope="page" />
														<c:set var="skipRecord" value="false" scope="page" />
														<c:forEach items="${receiptTypes}" var="receipt"
															varStatus="listitr">
															<tr class="odd">
																<td style="">${receipt.receiptTitle}</td>
																<c:forEach items="${receiptsMatrix[listitr.index]}"
																	var="curColumn" varStatus="theCount">
																	<c:if test="${!skipRecord}">
																		<td style=""><c:if test="${empty curColumn}">
																				<c:set var="curColumn" value="0" />
																			</c:if> <input name=${"rcpt"} ${tmpCount} type="text"
																			style="width: 50%" class="form-control"
																			value="${curColumn}" /></td>
																		<c:set var="tmpCount" value="${tmpCount + 1}"
																			scope="page" />
																	</c:if>
																	<c:set var="skipRecord" value="${!skipRecord}"
																		scope="page" />
																</c:forEach>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-horizontal">
											<div class="form-group">
												<!--Button start here -->
												<div class="col-sm-12">
													<button type="submit" id="submit-btn"
														class="btn btn-xl btn-success button-submit font13"
														title="Save" data-placement="top">Save</button>
												</div>
												<!-- Button  end here -->
											</div>
										</div>
									</div>
									<!-- jaskirat code end here -->
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->
	<!-- /.container -->
</body>

