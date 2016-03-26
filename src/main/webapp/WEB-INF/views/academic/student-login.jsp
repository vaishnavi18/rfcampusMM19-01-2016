
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<!--=== CSS ===-->

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

<!--=== JavaScript ===-->
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
	src="${pageContext.request.contextPath}/resources/plugins/uniform/jquery.uniform.min.js"></script>
<!-- Styled radio and checkboxes -->

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
	$(document).ready(function(){
		"use strict";

		App.init(); // Init layout and core plugins
		Plugins.init(); // Init all plugins
		FormComponents.init(); // Init all form-specific plugins
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

<script type="text/javascript">
$(document).ready(function(){
	 $("#formlogin").validate({
	        // Specify the validation rules
	        rules: {
	        	
	        	applicationId: {
	            	required:true//,
	            },
	            password: {
	            	required:true//,
	            },
	        },
	        
	        // Specify the validation error messages
	        messages: {
	        	applicationId: {
	        		required : ""//,
	            },
	            password: {
	            	required:""//,
	            },
	        },
	        
	        submitHandler: function(form) {
	            form.submit();
	        }
	    });
		
});
</script> 
</head>

<body class="breakpoint-1200">
	<img id="test" src="resources/bootstrap/img/minebg.jpg"
		style="position: absolute; width: 100%; height: 100%">

	<!-- Header -->

	<div class="header navbar navbar-fixed-top" role="banner">
		<!-- Top Navigation Bar -->
		<div class="container">
			<!-- Logo -->
			<a class="navbar-brand" href="index.html"> <img
									src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png"
									alt="logo" id="company-logo">

			</a>
		</div>
	</div>

	<!-- Header -->

	<form class="form-vertical login-form" id="formlogin"
		action="./j_spring_security_check" method="post"
		style="position: absolute; width: 100%; height: 100%; z-index: 200">

		<!-- Left Spacing -->
		<div
			class="col-xs-3 col-sm-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-lg-offset-0"></div>

		<!-- Login div -->
		<div
			class="col-xs-6 col-sm-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-lg-offset-0 my-login-div"
			style="text-align: center; padding-bottom: 5px; margin: 8% auto auto">
			<h2 class="login_title"></h2>

			<div class="panel panel-default">
				<div class="panel-body panel-title">
					<div class="text-center">

						<!-- <img src="resources/bootstrap/img/master_logo.png" alt="logo" /> -->

						<!-- class="login" height="70" -->
						<h3 class="grid-header text text-center">Student Login</h3>
						<h4 class="text text-left" style="color: red;visibility: hidden;" id="message"></h4>
						<div class="panel-body">
							<fieldset id="confirm_div" style="font-weight: bold; color: red"></fieldset>
							<fieldset>
								<div class="form-group col-xs-12 col-sm-8 col-lg-8">
									<div style="margin-top: 15px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-user"></i></span> <input
											id="login-username" type="text" class="form-control"
											name="username" value="" placeholder="username or email">
									</div>

									<div style="margin-top: 25px" class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock"></i></span> <input
											id="login-password" type="password" class="form-control"
											name="password" placeholder="password">
									</div>

									<div class="input-group" style="margin-top: 25px">
										<div class="checkbox">
											<label> <input id="login-remember" type="checkbox"
												name="remember" value="1" style="position: absolute;">
												Remember me
											</label>
											<!-- <div class="" style="margin-left:150px;float:right; font-size: 80%;position: absolute;"><a href="#">Forgot password?</a></div> -->
										</div>
									</div>
									<div class="form-group">
										<input style="padding-right: 10px; padding-left: 10px"
											class="btn btn-md btn-primary" value="Login" type="submit"
											onclick="return status()">
									</div>
								</div>
								<div class="hidden-xs col-sm-4 col-lg-4">
									<img
										src="${pageContext.request.contextPath}/resources/bootstrap/img/Lock-the-Folder.jpg"
										style="height: 150px; width: 150px" alt="lock" />
								</div>
							</fieldset>

							<div class="form-group">
								<div class="col-xs-12 col-sm-12 col-lg-12 control">
									<div
										style="border-top: 1px solid #888; padding-top: 15px; font-size: 85%">
										New Student! <a
											href="./academic/application-registration"
											onClick="$('#loginbox').hide(); $('#signupbox').show()">
											Register Here </a>
									</div>
								</div>
							</div>

							<fieldset id="message_div"></fieldset>

							<!--/end form-->

						</div>

					</div>
				</div>
			</div>

		</div>
		<!--right spacing  -->
		<div
			class="col-xs-3 col-sm-3 col-lg-3 col-xs-offset-0 col-sm-offset-0 col-lg-offset-0">
		</div>

	</form>

	<script>
 
 $(document).ready(function () {
	 
	 if("${not empty message}"){
		 $("#message").html("${message}");
		 $("#message").css("visibility", '');
	 }
	 
	  //called when key is pressed in textbox
	  $("#user_number").keypress(function (e) {
		
	     //if the letter is not digit then display error and don't type anything
	     if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57))
	     {
	        //display error message
	       // $("#errmsg").html("Digits Only").show().fadeOut("slow");
	               return false;
	    }
	     
	     if($("#user_number").val().length==12){
	    	 $("#confirm_div").text("maximum digit to enter is 12");
	    	 return false;
	     }
	   });
	  
	  
	 
	});
 
 var total_count=0;
 $("#send_button").click(function(){
	 if($("#user_number").val().length==0){
		 $("#confirm_div").text("Please Enter the Number Below");
	    	 return false;
	 }
	
	 if(total_count==1){
		 $("#message_div").text("Message Has Been Send Already");
		 return false;
	 }
	 var user_number = $("#user_number").val();
     $.ajax({
		url:"./user-number-verfication",
		type:"GET",
		data:{"url_link":"http://192.168.0.117:8089/myapp/sending-message?","user_code" : 7,"user_number" : user_number,"api_id":"msg_9979","application_password":"iitms123$","module_code":"LOGIN"},
		success:function(response){
			$("#confirm_div").empty();
// 			alert(response);
			var json=	JSON.parse((response));
			
		
// 			alert(json.error);
			if(json.error!= 'error'){
				$('#confirm_div').append(
						"<h4 class=\"text-center\">A verification Code have been seen to your device shortly </h4> "
						+ "                         	 <p>Please Enter the verification code Below</p> "
						+ "                         	  <input id=\"verification_code\" placeholder=\"Enter Verfication Code Here\" class=\"form-control\" required=\"true\"> "
						+" <p  id=\"error_verification_message\" style='color:red'></p>"
						+ "<div class=\"form-group\"> "
						+ "                                    <input id=\"confirmation_button\" class=\"btn btn-lg btn-success btn-block\" value=\"verify\" onclick=\"verify_code();\" type=\"button\"> "
						+ "                                  </div>");
				total_count=1;
				$("#user_number").prop('disabled', true);
				}else{
					$('#confirm_div').append( "<p style=\"color:red;font-weight:bold\">This Number and Provided Number Does not Match</p>");
				}
			
				
		},
		error:function(){
			
		}
	});
 });
 
 
 
function verify_code(){
var verification_code=$("#verification_code").val();
	 if(verification_code.length==0){
		 $("#error_verification_message").text("Please Enter the Verfication Code");
	    	 return false;
	 }
	
     $.ajax({
		url:"./user-number-verfication-action",
		type:"GET",
		data:{"verification_code" : verification_code},
		success:function(response){
//			$("#confirm_div").empty();
//  			alert(response);
			var json=	JSON.parse((response));
// 			alert(json);
// 			alert(json.message);
			if(json.message== 'success'){
				document.location.href = './forgetPasswordSMS/reset?est=7'
			}else{
				$('#error_verification_message').html( "<p style=\"color:red;font-weight:bold\">The Provide Code Mismatches the Entered Code</p>");
			}
				
		},
		error:function(){
			
		}
	});
 }
			  
 
 </script>
</body>
</html>
