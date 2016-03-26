<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Registration Successful</title>
<jsp:include page="../authentication/script.jsp" />
</head>
<body>
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
								<div class="grid-header text">Registration Successful</div>
							</div>
							<h4>Your Credential has been sent to your mail address</h4>
							<br>
							<%-- <h4>Password : ${applicationPassword}</h4><br> --%>
							<br> <a href="../academic/student-registration/login">Back
								to Login</a>
						</div>
					</div>
				</div>
			</div>
			<!--=== Page Content ===-->
		</div>
	</div>
</body>
</html>