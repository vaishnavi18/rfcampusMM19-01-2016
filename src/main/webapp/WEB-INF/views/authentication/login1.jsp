
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/icons/favicon.ico">
 
<title>Login</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/img/icons/favicon.ico">
 

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

<!-- jQuery UI -->
<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

<!-- Theme -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/errors-success.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/login.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_hor_menu.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/main.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/plugins.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/responsive.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/icons.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/fontawesome/font-awesome.min.css">
<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700"
	rel="stylesheet" type="text/css">

<!--=== JavaScript ===-->
<link
	href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css"
	rel="stylesheet" />
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script> -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/libs/jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/libs/lodash.compat.min.js"></script>

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

<!-- Smartphone Touch Events -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.move.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.swipe.js"></script>

<!-- General -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/libs/breakpoints.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/respond/respond.min.js"></script>
<!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/cookie/jquery.cookie.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>

<!-- Page specific plugins -->
<!-- Charts -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/moment.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/blockui/jquery.blockUI.min.js"></script>

<!-- Forms -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/uniform/jquery.uniform.min.js">
</script>
<!-- Styled select boxes -->

<!-- DataTables -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datatables/DT_bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datatables/responsive/datatables.responsive.js"></script>
<!-- optional -->

<!-- App -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/plugins.form-components.js"></script>
<script>
	$(document).ready(function() {
		"use strict";
		
		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	
		/************ Jquery for Checking validation username and password is Null ************/
		$( "#submit" ).click(function() {
		 	var username = $("#login-username").val();
			var password = $("#login-password").val(); 
			if(username =="" && password==""){			 
			    document.getElementById("MESSAGE").innerHTML = "Enter any username and password!";    
			}
		}); 
		/******************************validation End Here*************************************/
	});
</script>


<!-- Demo JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
<style type="text/css">
.jqstooltip {
	position: absolute;
	left: 0px;
	top: 0px;
	visibility: hidden;
	background: rgb(0, 0, 0) transparent;
	background-color: rgba(0, 0, 0, 0.6);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000,
		endColorstr=#99000000);
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
	color: white;
	font: 10px arial, san serif;
	text-align: left;
	white-space: nowrap;
	padding: 5px;
	border: 1px solid white;
	z-index: 10000;
}

.jqsfield {
	color: white;
	font: 10px arial, san serif;
	text-align: left;
}
</style>
</head>

<body class="breakpoint-1200">
	<img id="test" src="resources/bootstrap/img/login_page_bg.jpg"
		style="position: absolute; width: 100%; height: 100%">

	<!-- Header -->

	<div class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand" href="index.html"> <img
				src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png" alt="logo" />

			</a>
		</div>
	</div>

	<!-- Header -->

	<form id="login_form" class="form-vertical login-form"
		action="<c:url value='j_spring_security_check' />" method="post"
		style="position: absolute; width: 100%; height: 100%; z-index: 200">
        
        
		<!-- Left Spacing -->
		<div
			class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0"></div>

		<!-- Login div -->
		<div
			class="col-xs-6 col-sm-6 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0 my-login-div"
			style="text-align: center;">
			<h4 class="login_title" style="padding: 5px">${error } <span id="MESSAGE"></span></h4>
			  
			<h3 class="grid-header text text-center" style="font-family:PNR">Please Login</h3>
			
			<div class="col-xs-12 col-sm-8 col-lg-8">
				<div style="margin-top: 15px" class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="login-username"
						type="text" class="form-control" name="username" value=""
						placeholder="Please Enter User email/Id" required="required">
				</div>

				<div style="margin-top: 25px" class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="login-password"
						type="password" class="form-control" name="password"
						placeholder="Please Enter Password" required="required">
				</div>


				<div class="row">
					<div class="col-sm-6 col-md-6 ">
						<div class="input-group" >
							<div class="checkbox">
								<label> <input id="remember_me" type="checkbox"
									name="remember_me" value="1"> Remember me
								</label>
							</div>
						</div>
						</div>	
							
							
							<div class="col-sm-6 col-md-6 ">
								<a data-no-turbolink="" href="./forgetPassword"
									style="position: relative; float: right; right: 0px; margin-top: 10px"
									class="lightBlue_link fgt_pwd">Forgot Password?</a>

						</div>
					
				</div>

				<div class="form-group">
					<input style="width:50%;margin:auto"
						class="btn btn-md btn-primary" value="Login" type="submit" id="submit"> 
				</div>
<br>
<a href="./student-login" >Apply online Admission 2016-2017</a>
<br>



			</div>
			<div class="hidden-xs col-sm-4 col-lg-4 mylockbg"
				style="border-radius: 5px">
				<img
					src="${pageContext.request.contextPath}/resources/bootstrap/img/login-lock.png"
					style="height: 165px; width: 150px;background:none" alt="lock" />
			</div>

		</div>
		<!--right spacing  -->
		<div
			class="col-xs-3 col-sm-3 col-md-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 col-lg-offset-0">
		</div>
		
		</form>
		</body></html> 