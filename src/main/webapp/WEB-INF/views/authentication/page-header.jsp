<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- jQuery -->

<!-- SmartMenus jQuery init -->

<script type="text/javascript"> 
	$(function() {
		$('#main-menu').smartmenus({
			subMenusSubOffsetX: 1,
			subMenusSubOffsetY: -8   
		});   
	});
</script>

<!--=== Page Header ===-->   
<div class="page-header" style="left: 0px">  
<input type="hidden" id='currentModule' value="${sessionScope['scopedTarget.sessionUser'].getSelectedModule()}">
	<nav id="main-nav" role="navigation">
	</nav> 
</div>

<script>
$(document).ready(function() {		
	//alert(22)
	// e.preventDefault();
 //alert($('#currentModule').val());
  
 
 	var currentModule=$('#currentModule').val();
	$("#navbar-collapse-1").empty();
	$.ajax({
		async : false,
		url : url1,
		data : {
			"id" : currentModule
		},
		type : "GET",
		success : function(response) {
			//alert(response);
			var menuList = JSON.parse(JSON.stringify(response));
			//alert(menuList.toString());
			 menuText1 = "<ul id=\"main-menu\" class=\"sm sm-blue\">"; 
		 	myRecursiveFunction(0,menuList);
			menuText1 +='</ul>';
         // alert(menuText1);
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
 </script>