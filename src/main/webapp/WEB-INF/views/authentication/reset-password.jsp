
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Reset Password</title>
<jsp:include page="script.jsp" />

<style>
.separator {
	border-right: 1px solid #dfdfe0;
}

.icon-btn-save {
	padding-top: 0;
	padding-bottom: 0;
}

.input-group {
	margin-bottom: 10px;
}

.btn-save-label {
	position: relative;
	left: -12px;
	display: inline-block;
	padding: 6px 12px;
	background: rgba(0, 0, 0, 0.15);
	border-radius: 3px 0 0 3px;
}
</style>

<script type="text/javascript">

$(document).ready(function(){
	
	jQuery.validator.addMethod('selectcheck', function(value) {
		return (value == $("#password").val());
	}, "");

	$("#password-reset-form").validate({
		// Specify the validation rules
		rules : {
			password : {
				required : true
			//,
			},
			password1 : {
				required : true,
				selectcheck:true
			//,
			}
		},

		// Specify the validation error messages
		messages : {
			password : {
				required : "Please Enter Password"//,
			},
			password1 : {
				required : "Please Re Enter Password",
				selectcheck:"Entered Password Dosent Match"
			}
		},

		submitHandler : function(form) {
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
				src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png" alt="logo" />

			</a>
		</div>
	</div>

	<!-- Header -->


	<!-- Left Spacing -->
	<div class="col-sm-3 col-sm-3 col-sm-offset-0"></div>

	<!-- Login div -->
	<div class="col-sm-6 col-sm-6 col-sm-offset-0 my-login-div"
		style="text-align: center; padding: 60px; z-index: 10;">
		<h2 class="login_title"></h2>

		<div class="panel panel-default">
			<div class="panel-body">
				<div class="text-center">
					<!--  <img src="https://cloud.digitalocean.com/assets/cloud-logo-0efc9110ac89b1ea38fc7ee2475a3e87.svg" class="login" height="70"> -->
					<h3 class="text-center">Reset Password</h3>
					<!--  <p>If you have forgotten your password - reset it here.</p> -->
					<div class="panel-body">
						<fieldset id="confirm_div" style="font-weight: bold; color: red">${status}
						</fieldset>
						<form class="form" action="./change-password" id="password-reset-form"
							method="post">
							<!--start form-->
							<!--add form action as needed-->
							<fieldset>
								<div class="form-group">
									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock color-blue"></i></span>
										<!--EMAIL ADDRESS-->
										<input id="password" placeholder="Enter Password"
											class="form-control" name="password" type="password"
											>
									</div>

									<div class="input-group">
										<span class="input-group-addon"><i
											class="glyphicon glyphicon-lock color-blue"></i></span>
										<!--EMAIL ADDRESS-->
										<input id="emailInput1" placeholder="Re-Enter Password"
											class="form-control" name="password1" type="password"
											>
									</div>
								</div>
								<div class="form-group">
									<input class="btn btn-lg btn-primary btn-block" value="Reset"
										type="submit">
								</div>
							</fieldset>
						</form>
						<!--/end form-->

					</div>
				</div>
			</div>
		</div>

	</div>
	<!--right spacing  -->
	<div class="col-sm-3 col-sm-3 col-sm-offset-0"></div>



</body>
</html>
