<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/validation/additional-methods.min.js"></script>




<c:set var="myContext" value="${pageContext.request.contextPath}" />
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
<link
	href="${pageContext.request.contextPath}/resources/assets/css/datatables.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/datatables_bootstrap.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_hor_menu.css"
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
<!-- <link -->
<!-- 	href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" -->
<!-- 	rel="stylesheet" /> -->
<!-- <script
	src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script> -->

<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/libs/jquery-1.10.2.min.js"></script> --%>
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
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.js"></script> --%>
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

	});
</script>



<!-- Demo JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/plugins/validation/1.9/jquery.validate.min.js"></script>

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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/smartMenu/menuScript.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/smartMenu/menuCss.css">


<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var url1 = window.location.protocol + "//" + window.location.host
			+ contextPath + "/" + "master1";
	$(document).ready(function() {		
		//jQuery window resize call/event
		if ($("#alertable").val() == 'true') {
			//alert('working')
		} else {
			window.alert = function() {
				return true;
			}
		}
		$("#company-logo").attr('src', window.location.protocol
								+ "//"
								+ window.location.host
								+ contextPath
								+ "/resources/bootstrap/img/master_logo.png");

		$(".module-link").click(function(e) {
			e.preventDefault();
			//alert($(this).attr('for'));
			$("#navbar-collapse-1").empty();
			$.ajax({
				async : false,
				url : url1,
				data : {
					"id" : $(this).attr('for')
				},
				type : "GET",
				success : function(response) {
					var menuList = JSON.parse(JSON.stringify(response));
					 menuText1 = "<ul id=\"main-menu\" class=\"sm sm-blue\">"; 
				 	myRecursiveFunction(0,menuList);
					menuText1 +='</ul>';
//                  alert(menuText1);
					$("#main-nav").html(menuText1);
					$(".project-switcher-btn").click();
					$(function() {  
						$('#main-menu').smartmenus({
							subMenusSubOffsetX: 1,
							subMenusSubOffsetY: -8   
						});
					});
				},
				error : function() {
					alert('Error...');
				}
			});
		});
	});
	var menuText1="";
	function myRecursiveFunction(index,menuList){
		
		var flag=true;
		
		$.each(menuList,function(index, menu){
			
			if (menu.subMenus.length==0){
				menuText1 += '<li><a href=\"'+contextPath + '/' +menu.menuUrl+'\">'
				+ menu.menuName
				+ '</a></li>';
			}else{
				menuText1 += '<li><a href="#">'
				+ menu.menuName
				+ '</a>';
				menuText1 +='<ul>';
				myRecursiveFunction(index, menu.subMenus)
				menuText1 +='</ul></li>';
			}
		});
		
	}

	function userLogout() {
		document.getElementById("logoutForm").submit();
	}

	function showDialog(message) {
		$("#popup-message").html(message);
		$("#myModal").modal('show');

	}
</script>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/awesome/font-awesome.min.css">

<!-- calender css and js start here-->
<link
	href="${pageContext.request.contextPath}/resources/complete-date-picker/datepicker.min.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/bootstrap-datepicker.min.js"></script>

<link
	href="${pageContext.request.contextPath}/resources/complete-date-picker/bootstrap-datepicker3.css"
	rel="stylesheet" type="text/css">



<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/moment.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/complete-date-picker/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/noty/packaged/jquery.noty.packaged.min.js"></script>
<link
	href="<c:url value="/resources/plugins/noty/packaged/animate.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="<c:url value="/resources/plugins/noty/packaged/buttons.css"/>"
	rel="stylesheet" type="text/css">


<script>
	function notifysuccess(message) {
		noty({
			text : message,
			layout : 'center',
			type : 'success',
			modal : true,
			theme : 'defaultTheme',
			animation : {
				open : 'animated fadeIn', // Animate.css class names
				close : 'animated fadeOut',// Animate.css class names
				easing : 'swing',
				speed : 500,
			},
			timeout : 2000,
		});

	}

	function notifyupdate(message) {
		noty({

			text : message,
			layout : 'center',
			type : 'warning',
			modal : true,
			theme : 'defaultTheme',
			/*  buttons     : [
			               {addClass: 'btn btn-primary', text: 'Ok', onClick: function ($noty) {
			                   $noty.close();
			                   noty({dismissQueue: true, force: true, layout: layout, theme: 'defaultTheme', text: 'You clicked "Ok" button', type: 'success'});
			               }
			               },
			               {addClass: 'btn btn-default', text: 'Cancel', onClick: function ($noty) {
			                   $noty.close();
			                   noty({dismissQueue: true, force: true, layout: layout, theme: 'defaultTheme', text: 'You clicked "Cancel" button', type: 'error'});
			               }
			               }
			           ] , */
			animation : {
				open : 'animated fadeIn', // Animate.css class names
				close : 'animated fadeOut',// Animate.css class names
				easing : 'swing',
				speed : 500,
			},
			timeout : 2000,
		});

	}

	function notifycopy(message) {
		noty({
			text : message,
			layout : 'center',
			type : 'success',
			modal : true,
			animation : {
				open : 'animated fadeIn', // Animate.css class names
				close : 'animated fadeOut',// Animate.css class names
				easing : 'swing',
				speed : 500,
			},
			timeout : 2000,
		});

	}

	function notifyerror(message) {
		noty({
			text : message,
			layout : 'center',
			type : 'error',
			modal : true,
			animation : {
				open : 'animated fadeIn', // Animate.css class names
				close : 'animated fadeOut',// Animate.css class names
				easing : 'swing',
				speed : 500,
			},
			timeout : 2000,
		});

	}
</script>
</head>
<body>
	<input type="hidden" id="alertable" value="true" />
</body>
</html>


