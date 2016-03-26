<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Page not Found</title>

<jsp:include page="../authentication/script.jsp" />
 


<script>
	function set_value(socid) {
		//alert(socid);

		if (socid.trim() != '') {
			$.ajax({
				url : "./society/get-society-module-populated",
				type : "POST",
				data : {
					"socId" : socid
				},
				success : function(response) {
					var text = '';
					//alert(JSON.stringify(response));
					var jsonOb = JSON.parse(JSON.stringify(response));
					if (JSON.stringify(response) != '[]') {

						//making the default list to be unchecked all
						$('input[type="checkbox"]').removeAttr("checked");

						$("#socId").val(jsonOb.socId);
						$("#society_code").val(jsonOb.socCode);
						$("#SocietyName").val(jsonOb.socName);
						$("#Image2").attr(
								'src',
								'./resources/uploads/authorization/society/'
										+ jsonOb.socLogo);
						$("#oldSocietyLogo").val(jsonOb.socLogo);
						$("#RegNo").val(jsonOb.socRegno);
						$("#ChairmanName").val(jsonOb.societyChairman);
						$("#SecretoryName").val(jsonOb.societySecretory);

						$("#City").val(jsonOb.city);
						$("#Address").val(jsonOb.address);
						$("#addId").val(jsonOb.addId);
						$("#Pin").val(jsonOb.pinCode);
						$("#Phone1").val(jsonOb.phone1);
						$("#Phone2").val(jsonOb.phone2);
						$("#Phone3").val(jsonOb.phone3);
						$("#Fax1").val(jsonOb.fax1);
						$("#Fax2").val(jsonOb.fax1);
						$("#Email1").val(jsonOb.email1);
						$("#Email2").val(jsonOb.email2);
						$("#Website").val(jsonOb.website);

						$.each(jsonOb.modules,
								function(index, moduleId) {
									$("#module-" + moduleId).prop("checked",
											"checked");
								});

						$("form").valid();
						$("#society-add-edit-form").prop("action",
								"./society/update-society-module");
						$("#add-update-btn").val('Update').attr("class","btn btn-xl btn-warning button-submit font13");
						

					}
					// 			$("#itemNameId").html(text);
					// 			if(tempItemId != ''){
					// 				$("#society_code").val(socid);
					// 			}

				},
				error : function() {

				}
			});
		}
	}

	$(document).ready(
			function() {
				$("#reset").click(
						function() {
							$("#Image2").attr('src',
									'./resources/No_image_available.svg');
							$("#society-add-edit-form").prop("action",
									"./society/add-society-module");
							$("#add-update-btn").val('Save').attr("class","btn btn-xl btn-success button-submit font13");

						});

				$(".active_n_socialcollege").change(function() {
					if ($(this).is(":checked")) {

						$(this).val(1);
					}
				});

				$("#society-add-edit-form").validate({
					// Specify the validation rules
					rules : {
						socCode : {
							required : true
						//,
						},
						socName : {
							required : true
						//,
						}
					},

					// Specify the validation error messages
					messages : {
						socCode : {
							required : "Please select Society Code"//,
						},
						socName : {
							required : "Please select Society Name"//,
						}
					},

					submitHandler : function(form) {
						form.submit();
					}
				});
			});
</script>
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
						class="doc-container column-one clearfixs ">
						<div class="">
							<div class="row">
								<div class="create_project_tbl">
									<!-- jaskirat code start here -->
								<img style="width:100%;height:60%;" src="${pageContext.request.contextPath}/resources/bootstrap/img/pageNotFound.png" >
										<!-- jaskirat code end here -->
									</div>


								</div>
							</div>
						</div>
					</div>
					<!--=== Page Content ===-->
				</div>
			</div>

		</div>
	<!-- /.container -->
	<!-- /.container -->
</body>

