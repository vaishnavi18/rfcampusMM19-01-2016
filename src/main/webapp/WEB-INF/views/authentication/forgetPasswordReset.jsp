 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<!--=== CSS ===-->
	
	<jsp:include page="script.jsp" />

	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery UI -->
	<!--<link href="plugins/jquery-ui/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css" />-->
	<!--[if lt IE 9]>
		<link rel="stylesheet" type="text/css" href="plugins/jquery-ui/jquery.ui.1.10.2.ie.css"/>
	<![endif]-->

	<!-- Theme -->
		<link href="${pageContext.request.contextPath}/resources/assets/css/errors-success.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/login.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/my_hor_menu.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/main.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/plugins.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/responsive.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome/font-awesome.min.css">
	<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

	<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css">

	<!--=== JavaScript ===-->
		<link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" rel="stylesheet" />
		<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script> -->

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/libs/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/libs/lodash.compat.min.js"></script>

	<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
		<script src="assets/js/libs/html5shiv.js"></script>
	<![endif]-->

	<!-- Smartphone Touch Events -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/touchpunch/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.move.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.swipe.js"></script>

	<!-- General -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/libs/breakpoints.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/respond/respond.min.js"></script><!-- Polyfill for min/max-width CSS3 Media Queries (only for IE8) -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/cookie/jquery.cookie.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/slimscroll/jquery.slimscroll.horizontal.min.js"></script>

	<!-- Page specific plugins -->
	<!-- Charts -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/blockui/jquery.blockUI.min.js"></script>

	<!-- Forms -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/uniform/jquery.uniform.min.js"></script><!-- Styled radio and checkboxes -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.js"></script> --%><!-- Styled select boxes -->

	<!-- DataTables -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/datatables/DT_bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/datatables/responsive/datatables.responsive.js"></script><!-- optional -->

	<!-- App -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/plugins.form-components.js"></script>
	<script>
	$(document).ready(function(){
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
	});
	
	function check(){
		var p1= $("#new_password").val();
		var p2= $("#renew_password").val();
		if(p1!=p2){
			$("#confirm_div").html('<p> Password Mismatch</p>');
			return false;
		}
	}
	</script>


	<!-- Demo JS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
	<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
	</head>
	
	<body class="breakpoint-1200" >
	<img id="test" src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png"  style=";position:absolute;width:100%;height:100%"> 
           
<!-- Header -->

<div class="header navbar navbar-fixed-top" role="banner">
    <!-- Top Navigation Bar -->
    <div class="container">
        <!-- Logo -->
         <a class="navbar-brand" href="index.html">
            <img src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png" />
        
        </a>
	</div>
</div> 

<!-- Header -->
   
   <div class="form-vertical login-form" style="position:relative;width:100%;height:100%;z-index:200">
 
 	<!-- Left Spacing -->
   <div class="col-sm-3 col-sm-3 col-sm-offset-0" ></div>
   
   <!-- Login div -->
  <div class="col-sm-6 col-sm-6 col-sm-offset-0 my-login-div" style="text-align: center;padding-bottom:5px;margin:8% auto auto">
         <h2 class="login_title" ></h2>
         
         <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="text-center">
                          <img src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png" style=" width: 47%;height: 125px; margin: auto; position: relative;" class="login" height="70">
                          <h3 class="text-center">Reset the New Password?</h3>
                          <p>Please Fill the Details of New Password Below </p>
                           <form class="form" action="../forgetPassword/update" method="post">
                            <div class="panel-body">
                               <fieldset id="confirm_div" style="font-weight:bold;color:red">
                           	</fieldset>
                             
                                <fieldset>
                                  <div class="form-group">
								  <input type="hidden" name="id" value="${id}" >
                                    <div class="input-group">
                                      <span class="input-group-addon"><i class="glyphicon glyphicon-pencil color-blue"></i></span>
                                      <!--EMAIL ADDRESS-->
                                      <input id="new_password"  type="password" name="password" placeholder="Please Enter New Password" class="form-control" required="true">
                                     
                                    </div>
                                   
                                  </div>
                                  
                                    <div class="input-group">
                                      <span class="input-group-addon"><i class="glyphicon glyphicon-pencil color-blue"></i></span>
                                      <!--EMAIL ADDRESS-->
                                      <input id="renew_password"  type ="password" name="cpassword" placeholder="Please Retype the New Password" class="form-control" required="true">
                                     
                                    </div>
                                   </fieldset>
                                  
                                  </div>
                                  
                                  <div class="form-group">
                                    <input id="send_button" class="btn btn-lg btn-primary btn-block" value="Reset " onclick = "return check()" type="submit">
                                  </div>
                                   </form>
                                
                           
                         	 <fieldset id="message_div">
                         	</fieldset> 
                         	
                         
                              
                            </div>
                        </div>
                    </div>
                </div>
            
    </div>
          <!--right spacing  -->
           <div class="col-sm-3 col-sm-3 col-sm-offset-0">
           </div>
  


 
</body>
</html> 
