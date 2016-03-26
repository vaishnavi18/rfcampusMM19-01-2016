<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Excel Import</title>

<jsp:include page="../views/authentication/script.jsp" />

<!-- tab code link start here -->
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>


<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/css/select2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		if("${message}"=="add")
		 notifysuccess("Record Saved Successfully!!");
				
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
				<!--=== Page Header ===-->
				<jsp:include page="../views/authentication/page-header.jsp" />
				<!-- /Page Header -->
				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">

								<div class="grid-header text">EXCEL DATA IMPORT</div>


							</div>
							<!-- jaskirat code start here -->


							<div id="container">
								<div class="row my-bg-success">
									<!--left div start here -->

									<div class="col-md-6">

										<div class="form-horizontal">
											<div class="form-group">
												<br>
												<form method="post" action="reg-excel" enctype="multipart/form-data">
												
												<div class="col-sm-12">
													<div class="col-sm-5">
														<span id="ContentPlaceHolder1_lblModule"
															class="control-label">Upload File<span
															style="color: #FF0000; font-weight: bold">*</span>
														</span>
													</div>
													<div class="col-sm-7">
														<input type="file" class="btn btn-xl btn-info button-submit font13" name="file" /> 
															
															
															<button type="submit" name="file"
																class="btn btn-xl btn-danger button-submit font13">
																<span><span class="">Upload</span></span>
															</button> <br>
													<div id="message"><font face='verdana' size='2' color='green'>${records}</font></div>
													</div>
														
												</div>
												</form>
											</div>
											
											
											<div class="form-group">
												<br>
												 <form method="get" action="downloadExcel">
												
												<div class="col-sm-12">
													 <div class="col-sm-5">
														<!-- <span id="ContentPlaceHolder1_lblModule"
															class="control-label">Download Excel<span
															style="color: #FF0000; font-weight: bold"></span>
														</span> -->
													</div>  
													
													<div class="col-sm-7">														 
														<!-- <button type="submit" name="file"
															class="btn btn-xl btn-warning button-submit font13">
															<span><span class="">Download</span></span>
														</button> -->	
														<!-- <span id="ContentPlaceHolder1_lblModule"
															class="control-label">Download Excel File
															<a href="downloadExcel"><b><i>click here </i></b></a>
														</span>	 -->	
															
												<span id="ContentPlaceHolder1_lblModule" >Download Sample Excel File <a href="downloadExcel"><b><u>click here! </u></b></a></span>
																
																							
													<!-- </div> -->
												</div>
												</div>
												</form>
												</div>
											</div>

										</div>
										
										
										
									</div>
									
									
								</div>
							</div>


							<!-- jaskirat code end here -->


						</div>

					</div>

				</div>

			</div>
			<!--=== Page Content ===-->
		</div>
	

	<!-- /.container -->
	<!-- /.container -->
</body>

