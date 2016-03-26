<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<style>
#footer {
   position:fixed;
   left:0px;
   bottom:0px;
   height:22px;
   width:100%;
   background:#385495;
   color:white;
   font-family:PNR;
   text-align:center; 
   border-top: 4px solid #BAD402;    
}

#footer .Myfooter{
top:5px;
position:relative; 
}

#footer .Myfooter a{
color:white; 
}
#footer .Myfooter a:hover{
cursor:pointer; 

}
#footer .Myfooter a label:hover{
text-decoration:underline;
}
/* IE 6 */
* html #footer {
   position:absolute;
   top:expression((0-(footer.offsetHeight)+(document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight)+(ignoreMe = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop))+'px');
}
</style>
<!-- Header -->
<header class="header navbar navbar-fixed-top" role="banner">
<div id="footer" class="panel-footer" style="padding: 0px"> 
	<div class="Myfooter"><a href="http://www.iitms.co.in/">
		<label class="copyright" id="lighthouse_label">Master
			Software Group 2016 � All rights reserved.</label></a>
	</div>
	</div> 

	<!-- Top Navigation Bar -->
	<div class="container" style="border-bottom: 3px solid #EF9847">
	<c:set var="myContext" value="${servletContext.getContextPath}" />

		<!-- Only visible on smartphones, menu toggle -->
		<ul class="nav navbar-nav">
			<li class="nav-toggle"><a href="javascript:void(0);" title=""><i
					class="icon-reorder"></i></a></li>
		</ul>

		<a class="navbar-brand" href="#" style="margin-bottom: 1px;"> <img
			src="${pageContext.request.contextPath}/resources/bootstrap/img/master_logo.png"
			alt="logo" id="company-logo"> <!-- <strong>RITENOW</strong>Infra -->
		</a>

		<!-- Sidebar Toggler -->
		<!--<a href="#" class="toggle-sidebar bs-tooltip" data-placement="bottom" data-original-title="Toggle navigation">
				<i class="icon-reorder"></i>
			</a>-->
		<!-- /Sidebar Toggler -->

		<!-- Top Left Menu -->
		<ul class="nav navbar-nav navbar-left" id="my_switch_button">
			<!-- Project Switcher Button -->
			<li class="dropdown"><a href="#"
				class="project-switcher-btn dropdown-toggle"> <i
					class="icon-reorder fontsize_24"></i>
			</a></li>
		</ul>
		<!-- /Top Left Menu -->

		<!-- Top Right Menu -->
		<ul class="nav navbar-nav navbar-right">
			<li><a href="/rfcampuspresentation/success" class="bs-tooltip"
				data-original-title="Admin Dashboard" data-placement="bottom"> <i
					class="icon-home fontsize_24"></i>
			</a></li>
			<!-- User Login Dropdown -->
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown"> <i class="icon-male"></i> <span
					class="username">${pageContext.request.userPrincipal.name}</span> <i
					class="icon-caret-down small"></i>
			</a>
				<ul class="dropdown-menu">
					<li><a href="javascript:userLogout()"><i class="icon-off "></i>
							Sign Out </a></li>
				</ul></li>
			<!-- /user login dropdown -->
			
		</ul>
		
		<!-- /Top Right Menu -->
		<c:url value="/j_spring_security_logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logoutForm">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
	</div>
	<!-- /top navigation bar -->

	<!--=== Project Switcher ===-->
	<div id="project-switcher" class="container project-switcher"
		style="position: relative; margin-top: 0px;">
		<!--<div id="scrollbar">
				<div class="handle"></div>
			</div>-->

		<div class="slimScrollDiv"
			style="position: relative; overflow: hidden; width: 100%; height: auto;">
			<div id="frame" style="overflow: hidden; width: 100%; height: auto;" onmouseleave="collapseMe()">
				<ul class="project-list" style="width: 799px;">
				  <c:forEach items="${sessionScope['scopedTarget.sessionUser'].moduleMap}" var="module">
						<li><a href="#" class="module-link" for="${module.value.menuId}" onclick="set_this_module(this)">
								<span class="image nav-dashboard"><img
								src="<spring:url value="/"/>${module.value.menuLogoUrl}"  
									style="height: 85px; width: 100px;background:none" alt="lock" /></span> <span
								class="title">${module.value.menuName}</span>
						</a></li>
					</c:forEach>
				</ul>
			</div>
			 <div class="slimScrollBar ui-draggable" style="height: 5px; position: absolute; bottom: 1px; opacity: 0.2; display: block; border-radius: 5px; z-index: 99; background: rgb(255, 255, 255);">
        </div><div class="slimScrollRail" style="width: 100%; height: 5px; position: absolute; bottom: 1px; display: none; border-radius: 5px; opacity: 0.2; z-index: 90; background: rgb(51, 51, 51);"></div></div>
    <!-- /#frame --> 
	</div>
	<!-- /#project-switcher -->
	
	<script>
	
	function collapseMe(){
		$("#project-switcher").slideUp();
	}
	
	function set_this_module(me){
 		 $("#frame li ").parent().find('li a.samehover').css('color', 'black');
 		 $("#frame li ").parent().find('li a.samehover').removeClass("samehover");
 
		  $(me).css('color', 'white');
 	      $(me).addClass('samehover');
//  	     $(".project-switcher-btn").click();
		 
	}
	</script> 
</header>
<!-- /.header -->

