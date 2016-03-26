<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Exception Occurred | RF-Campus</title>


<!--=== CSS ===-->
<jsp:include page="../authentication/script.jsp" />
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '');
						}, "");

					 	var validator = $("#add-update-document").validate({
							// Specify the validation rules
							rules : {
								mothertongue : {
									required : true,
									selectcheck : true
								}
							},

							// Specify the validation error messages
							messages : {
								mothertongue : {
									required : "",
									selectcheck : ""
								}
							},

							submitHandler : function(form) {
								form.submit();
							}
						});

						/** Message Hiding by Sachinmt**/
						$('#message').delay(2000).fadeOut();
						/**--###--**/

						
</script>


</head>

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

							<div class="row">
								<!--Outer row start here -->
								<!-- General Information tab start here -->
								<div class="col-xs-12 col-sm-12">
									<div class="box">
										<div class="box-header">
											<div class="box-name">
												<i class="fa fa-table"></i> <span> Please Expand the
													Tab To View the Details </span><span
													style="font-weight: bold; text-align: right; right: 5%; float: right; position: relative;">
													${url} </span>
											</div>
											<div class="box-icons">
												<a class="collapse-link"> <i
													class="servicedrop  glyphicon glyphicon-chevron-down"></i>
												</a>


											</div>
											<div class="no-move"></div>
										</div>
										<div class="box-content" style="display: none">

											<!--left row 1 1 start here -->
											<!-- General header tab start here -->





											<!-- General header tab end here -->


											<div class="row my-bg-success">
												<!--left div start here -->


												<div class="col-md-12">

													<h1>${datetime}</h1>
													<p style="padding-bottom: 15px">
														<span style="font-weight: bold"> Reason as Defined
															: </span> ${exception}
													</p>

												</div>


												<!--button start here -->
												<div class="col-md-12">
													<div class="form-group action-btn-group">
														<div class="controls2">
															<span class="left-margin-remove"> <a href="#">
																	<button type="button" id="" title="Previous page"
																		name="submit_create_edit_team"
																		onclick="history.go(-1);"
																		class="btn btn-xl btn-success button-submit font13">Previous
																		Page</button>
															</a>
															</span>




														</div>
													</div>
												</div>
												<!--button end here -->
											</div>



											<!-- Server configuration End here -->



											<!--row inner  end here -->


										</div>


										<div class="row">
								   			<div class="create_project_tbl" style="height:60%">
												<!-- jaskirat code start here -->
												<img
													style="width: 76%; height: 96%; margin: auto; padding: 0%; position: relative; left: 13%; top: 5%;padding-bottom: 2%"
													src="${pageContext.request.contextPath}/resources/bootstrap/img/exception.png">
												<!-- jaskirat code end here -->
											</div>

											<h1 id="1"
												style="text-align: center; color: red; font-family: verdana; font-size: 25px; font-weight: bold">Page
												Exception Has Occurred</h1>



										</div>


									</div>
								</div>
							</div>


						</div>
					</div>

					<!-- /.modal -->
				</div>

				<!--=== Page Content ===-->
				<!--=== Managed Tables ===-->

				<!--=== Horizontal Scrolling ===-->

				<!-- /Horizontal Scrolling -->
				<!-- /Page Content -->
			</div>
			<!-- /.container -->

		</div>

	</div>
</body>


<script>
$(document)
.ready(
		function() {
			$(".box-header")
					.click(
							function() {
								$(this).parent().find(
										'.box-content')
										.slideToggle();
								$(this)
										.parent()
										.find(
												'glyphicon glyphicon-chevron-down')
										.hide();
								$(this)
										.parent()
										.find('.servicedrop')
										.toggleClass(
												'glyphicon-chevron-down glyphicon-chevron-up');
		});
			
		});
</script>



</html>

