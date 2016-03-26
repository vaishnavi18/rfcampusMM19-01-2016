<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Page Not Found</title>

<jsp:include page="../WEB-INF/views/authentication/script.jsp" />
<style>
 h1 {
  text-shadow: 0 1px 0 #ccc,
               0 2px 0 #c9c9c9,
               0 3px 0 #bbb,
               0 4px 0 #b9b9b9,
               0 5px 0 #aaa,
               0 6px 1px rgba(0,0,0,.1),
               0 0 5px rgba(0,0,0,.1),
               0 1px 3px rgba(0,0,0,.3),
               0 3px 5px rgba(0,0,0,.2),
               0 5px 10px rgba(0,0,0,.25),
               0 10px 10px rgba(0,0,0,.2),
               0 20px 20px rgba(0,0,0,.15);
}
</style>



<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<!-- /.header -->
 
	<div id="container" class="fixed-header">

		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<!-- /Page Header -->


				<div class="second-column one-child-container relative " style="padding-top:0px">
					<div id="my_documents_container" style=""
						class="doc-container column-one clearfixs ">
						<div class="">
							<div class="row">
			 	 		  	<h1 style="text-align:center;font-family:verdana; font-size:26px;background:#EE9403;color:white;padding-bottom: 7px">Link To This Particular URL Does Not Exist</h1>
					 			<div class="create_project_tbl">
									<!-- jaskirat code start here -->
								<img style="width:100%;height:60%;" src="${pageContext.request.contextPath}/resources/bootstrap/img/page_not_exist.gif" >
										<!-- jaskirat code end here -->
									</div> 
									     	<h1 style="text-align:center;color:red;font-family:verdana;font-size:25px;font-weight:bold "> <a href="${pageContext.request.contextPath}/success">Page Not Found </a></h1>

 
								</div>
							</div>
						</div>
					</div>
					<!--=== Page Content ===-->
				</div>
			</div>

		</div>
	</div>
	<!-- /.container -->
	<!-- /.container -->
</body>

