<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Merit List Details</title>

<!--=== CSS ===-->
<title>List of All Merit List</title>



	<%-- <jsp:include page="../authentication/script.jsp" /> --%>
<link rel="stylesheet"
	href="<c:url value="/resources/awesome/font-awesome.min.css"/>">
<jsp:include page="../authentication/script.jsp" />


<script type="text/javascript">
	$(document).ready(function() {

		$('#active').change(function() {
			if ($(this).is(":checked")) {

				$("#active").val(1);
			}
			
			/* for reversing the merit list order */
			/* $("#reverse").reverse(function(){
				merit.reverse();
				console.log("merit");
			 
		}) */

		});
		
			$("#cancel-btn").click(function() {
			$("#listId").val(0);
			$("#listName").val('');
			$("#createdBy").val('');
			$("#preparationDate").val('');

			$("#add-update-university").attr('action', './university/add');
			$("#active").prop("checked", true);
			$("#active").val(1);
			$("#submit-btn").html('Save');

		});

		$("#add-update-university").validate({
			// Specify the validation rules
			rules : {
				universityCode : {
					required : true
				//,
				},
				universityName : {
					required : true
				//,
				}
			},

			// Specify the validation error messages
			messages : {
				universityCode : {
					required : ""//,
				},
				universityName : {
					required : ""//,
				}
			},

			submitHandler : function(form) {
				form.submit();
			}
		});

	});
</script>
</head>
<style>
.fa-view {
	width: 40px;
	font-size: 20px;
	display: inline-block;
	color: #398C0A;
}

.fa-view:hover {
	width: 40px;
	font-size: 21px;
	display: inline-block;
	color: #398C0A;
	cursor: default;
}
</style>
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


							<div class="grid-header text">MERIT LIST MANAGEMENT</div>

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
														aria-label="PHOTO: activate to sort column ascending">Sr.No</th>

													<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Merit
														List Name</th>
														
														
														<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Created By
														</th>

	
														<th class="sorting" role="columnheader" tabindex="0"
														aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
														aria-label="ID: activate to sort column ascending">Preparation Date and Time
														</th>


												</tr>


											</thead>

											<tbody role="alert" aria-live="polite" aria-relevant="all">
									<c:set var="srno" value="1"  />
									
												<c:forEach items="${meritList}" var="merit" >
												<!-- reverse1 -->
													<!-- merit.reverse(); -->
													<!-- console.log(merit); -->
													<tr>
														<td>${srno}</td>
														<td><a
															href="../academic/studentMeritList/show-merit-list?merit-list-id=${merit.listNumber}">${merit.listName}</a></td>
													<td>${merit.createdBy}</td>
													<td>${merit.preparationDate}</td>
													</tr>
													<c:set var="srno" value="${srno + 1}"/>
													
												</c:forEach>


											</tbody>
										</table>
									</div>
								</div>

								<!-- Modal dialog -->

								<!-- /.modal -->
							</div>
							</br>
							<a href="../studentMeritList"><u>Click Here</u></a> to Generate New Merit List.
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
		</div>
	</div>
</body>

