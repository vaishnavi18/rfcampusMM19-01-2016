<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Staff Details | RITENOW Infra</title>

<jsp:include page="../authentication/script.jsp" />
<script>
$(document).ready(function() {
/* $("#createRegistrationNumber-true").click(function(){
$("#appId").slideDown("slow");
});

$("#createRegistrationNumber-false").click(function(){
$("#appId").slideUp("slow");
}); */
});
</script>

<script>
	$(document)
			.ready(
					function() {

						$(
								"#createRegistrationNumber-${referenceRecord.createRegistrationNumber}")
								.attr('checked', 'checked');
						$(
								"#registrationNumberFormatId-${referenceRecord.registrationNumberFormatId}")
								.attr('checked', 'checked');
						$("#id").val("${referenceRecord.id}");
					});
</script>

</head>
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
						<div class="grid box-filters">
							<div class="table-header">
								<div class="row">
									<div class="create_project_tbl">
										<div class="grid-header text">College Reference</div>
										<div class="text"
											style="position: absolute; left: 496px; top: 44px; color: green; font-size: 20; font-weight: 500;"
											id="message"></div>
									</div>
									<form id="myWizard2" action="./reference" method="post"
										class="form-horizontal" enctype="multipart/form-data">
										<input type="hidden" name="id" value="0" id="id">
										<!--left row 1 1 start here -->
										<!-- General header tab start here -->
										<div class="form-group" style="position: relative;">
											<div class="col-sm-12">
												<div class="col-sm-4"> 
													<span id="ContentPlaceHolder1_lblParent"
														class="control-label">Create Registration Number? <input
														type="radio" name="createRegistrationNumber" value="true"
														id="createRegistrationNumber-true" /> Yes <input
														type="radio" name="createRegistrationNumber" value="false"
														id="createRegistrationNumber-false" /> No
													</span>
												</div>
											</div>
										</div>
										<!-- vaishnavi code start here -->
										<div class="row my-bg-success" id="appId" style="">
											<div class="col-md-12">
												<%-- <form:form action="../feeCollection/standardFee/add"
					method="post" id="add-edit-form" modelAttribute="StandardFeeMasterList"> --%>
												<!-- <input type="hidden" id="id" name="id" value="0" /> -->
												<br>
												<div class="grid box-filters"
													style="position: relative; overflow: auto">
													<table
														class="table table-bordered  table-checkable table-responsive  "
														id="DataTables_Table_0"
														aria-describedby="DataTables_Table_0_info">
														<thead>
															<tr role="row">
																<th class="" role="columnheader" tabindex="0"
																	aria-controls="DataTables_Table_0" rowspan="1"
																	colspan="1" aria-label="">Format</th>
																<th class="" role="columnheader" tabindex="0"
																	aria-controls="DataTables_Table_0" rowspan="1"
																	colspan="1" aria-label="">Example</th>
																<th class="" role="columnheader" tabindex="0"
																	aria-controls="DataTables_Table_0" rowspan="1"
																	colspan="1" aria-label="">Select</th>
															</tr>
														</thead>
														<tbody role="alert" aria-live="polite" aria-relevant="all">
															<c:forEach items="${registrationNumberFormats}"
																var="registrationNumberFormat">
																<tr class="odd">
																	<td class=" ">${registrationNumberFormat.format}</td>
																	<td class=" ">${registrationNumberFormat.example}</td>
																	<td class=" "><input type=radio
																		name="registrationNumberFormatId"
																		id="registrationNumberFormatId-${registrationNumberFormat.id}"
																		value="${registrationNumberFormat.id}"></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
												<%-- </form:form> --%>
											</div>
										</div>
										<!--Button code start here -->
										<div style="text-align: center;">
											<div class="col-sm-12">
												<br>
												<div class="controls2">
													<button type="submit" title="Save" id="submit-btn"
														class="btn btn-xl btn-success button-submit font13">Save</button>


													<button type="button" title="Reset"
														class="btn btn-xl btn-default button-submit font13"
														id="cancel-btn">Reset</button>

												</div>
												<br>
											</div>
										</div>
										<!-- Button code end here -->
										<!-- vaishnavi code end here -->
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

