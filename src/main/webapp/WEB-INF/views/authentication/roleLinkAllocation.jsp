<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Role Link Allocation | RF-Campus</title>

<!--=== CSS ===-->
<title>Enable Hover State on Bootstrap 3 Table Rows</title>
<jsp:include page="script.jsp" />


<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"> -->
<!-- <script -->
<!-- 	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script> -->

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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery.checkboxtree.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/jquery-ui-1.8.12.custom.css">
<!--[if IE 7]>
		<link rel="stylesheet" href="assets/css/fontawesome/font-awesome-ie7.min.css">
	<![endif]-->

<!--[if IE 8]>
		<link href="assets/css/ie8.css" rel="stylesheet" type="text/css" />
	<![endif]-->

<link
	href="${pageContext.request.contextPath}/resources/awesome/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- <link -->
<!-- 	href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,700" -->
<!-- 	rel="stylesheet" type="text/css"> -->

<style>
#tree3 ul, ol {
	padding: 15px !important;;
}

#tree3 img {
	height: 16px;
	margin-top: -3px;
	position: relative;
	right: 3px;
}

#tree3 span {
	float: left;
	display: inline;
}
</style>
<!--=== JavaScript ===-->
<!-- <link -->
<!-- 	href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" -->
<!-- 	rel="stylesheet" /> -->
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
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.js"></script><!-- Styled select boxes --> --%>

<!-- DataTables -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datatables/jquery.dataTables.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datatables/responsive/datatables.responsive.js"></script>
<!-- optional -->

<!-- App -->

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/plugins.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/plugins.form-components.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/plugins/datatables/DT_bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>

<script type="text/javascript">

function userLogout() {
	document.getElementById("logoutForm").submit();
}
	var contextPath = "${pageContext.request.contextPath}";
	
		$(document).ready(function(){
			$(".module-link").click(function(e){
				//alert("test");
				e.preventDefault();
				var moduleId=0;
				//alert($(this).html());
				$(this).each(function() {
  $.each(this.attributes, function() {
    // this.attributes is not a plain object, but an array
    // of attribute nodes, which contain both the name and value
   // if(this.specified) {
	   if(this.name == 'for'){
		   moduleId=this.value;
	   }
      //alert(this.name +' - '+this.value);
   // }
  });
});
			
				/** Message Hiding by Sachinmt**/
				$('#message').delay(2000).fadeOut();
				/**--###--**/
				
				
				//alert('For : '+ $(this).attr('for'));
				//alert(2);
				$("#navbar-collapse-1").empty();
				//alert(3);
				$.ajax({
					async: false,
					url:"./master1",
					data:{"id" : moduleId},
					type:"GET",
					success:function(response){
						//alert(JSON.stringify(response));
						
						var menuList = JSON.parse(JSON.stringify(response));
					//	alert(menuList);
						var menuText = '';
						$.each(menuList, function(index, menu){
							menuText += '<ul class=\"nav navbar-nav\">'+
							'                    <li class=\"dropdown\">'+
							'                      <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">'+menu.menuName+'<b class=\"caret\"></b></a> '+
							'                        <ul class=\"dropdown-menu\">';
							$.each(menu.submenu, function(index, submenu){
								menuText +='                            <li><a href=\"'+contextPath + '/' +submenu.menuLink+'\">'+submenu.menuName+'</a></li>';
								
							});
							menuText += '                        </ul>'; 
							menuText += '                    </li>'+
							'                    '+
							'                </ul>';
						});
					
						$("#navbar-collapse-1").html(menuText);
						$(".project-switcher-btn").click();
						
					},
					error:function(){
						alert('Error...');
					}
					
				});
				
				//e.preventDefault();
			});
			
		});
	</script>

<script type="text/javascript">
var jsonResponse;
var array= new Array();
    function updateRole(id,roleName)
    {
    	if($.inArray(id, array) == -1){
    		$("#ContentPlaceHolder1_ddlRoleName").append('<option value=\"'+id+'\" >'+roleName+'</option>');
    		array.push(id);
    		$("#ContentPlaceHolder1_ddlRoleName").val(id).change();
    		$("#submit-btn").html('Update');
    		$("#submit-btn").attr("title","Update");
    		$("#submit-btn").attr("class","btn btn-xl btn-warning button-submit font13");
    		
    	}
    		
    $("[type='checkbox']").removeAttr('checked');
    	
    	$.ajax({
    		async:false,
    		url:"./loadMenuAsPerRole",
    		data:{"roleId" : id},
    		type:"POST",
    		success:function(response){
    			jsonResponse = JSON.parse(JSON.stringify(response));
    			/* alert(JSON.stringify(response)); */
    			$.each(jsonResponse, function(index, menu){
    				$("[value=\""+menu.menuId+":"+menu.moduleId+"\"]").attr("checked", "checked");
    			});
    		},
    		error:function(){
    			alert('error');
    		}
    	});
    }
  
   
</script>


<!-- Demo JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-1.4.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery-ui-1.8.12.custom.min.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/jquery.checkboxtree.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script> --%>
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

<script>
var array = new  Array();
    $(document).ready(function()
    {
    	
    	$.ajax({
			async:false,
			url:"./showModulePerMenu",
			type:"GET",
			success:function(response){
				var jsonOb = JSON.parse(JSON.stringify(response));
				var text = "";
				$.each(response, function(index, object){
					text += "<li><input tabindex=\"5\" type=\"checkbox\"><label>"+object.moduleName+"</label>"+
					"			<ul>";
					$.each(object.mainMenu, function(index, mainMenu){
						text += "				<li><input type=\"checkbox\" value=\""+mainMenu.menuId+":"+object.moduleId+"\" name=\"moduleIds\"><label>"+mainMenu.menuName+"</label>"+
						"					<ul>";
						$.each(mainMenu.subMenu, function(index, subMenu){
							text += "						<li><input type=\"checkbox\" value=\""+subMenu.menuId+":"+object.moduleId+"\" name=\"moduleIds\"><label>"+subMenu.menuName+"</label>";
						});
						
						text += "					</ul>"+
						"					</li>";
						
					});
					 
					text += "			</ul>"+"			</li>";
				});
				
				$('#tree3').empty().html(text);
				//$('#tree3').checkboxTree();
				 $('#tree3').checkboxTree({
					    onCheck: {
					        node: 'expand'
					    },
					    onUncheck: {
					        node: 'collapse'
					    },
					    collapseImage: 'resources/bootstrap/img/downArrow.gif',
					    expandImage: 'resources/bootstrap/img/rightArrow.gif',
					    
					    	 initializeChecked: 'expanded',
					    	    initializeUnchecked: 'collapsed'
					});
			},
			error:function(){
				
			}
		});
    	
    	//$('#ContentPlaceHolder1_ddlRoleName').change(function(){alert('click');});
    
    	$('#ContentPlaceHolder1_ddlRoleName').change(function(){
    		//alert('click');
    		$("[type='checkbox']").removeAttr("checked");
    	});
    	
    	

        var check_flag="true";
        $('#my_switch_button').click(function(){
       	
       	 if(check_flag=='true'){
       	 jQuery('#project-switcher').addClass('container project-switcher open');
       	 jQuery('#project-switcher').css('display','block');
       	 check_flag="false";
             }else{
       	 jQuery('#project-switcher').removeClass('open');
       	 jQuery('#project-switcher').css('display','none');
       	 check_flag="true";
        }
        });
    	
       /*  $("#cancel-btn").click(function(){
        	
        	alert("hellow");
        	//$("#ContentPlaceHolder1_ddlRoleName").val('');
        	/* validator.resetForm(); */
    		//$("#submit-btn").html('Save');
    		//$("#submit-btn").attr("title","Save");
    		//$("#submit-btn").attr("class","btn btn-xl btn-success button-submit font13");
    		// $("#add-edit-alloc").attr("action", "./not-allocate-role");
    		/* $("#ContentPlaceHolder1_ddlRoleName").empty();     
    		//$("#ContentPlaceHolder1_ddlRoleName").val(" ");
    		
    		
    	}); */
        $("#cancel-btn").click(function(){
        	
        	
        	$("#ContentPlaceHolder1_ddlRoleName").val('');
        	$("[name='moduleIds']").prop("checked", false);
			$("[name='moduleIds']").val(0);  	
			 var isChecked = $(this).is(":checked");
			if (isChecked) {
                $(this).attr("checked", "checked");
            } else {
                $(this).removeAttr("checked");
            }
        	/* validator.resetForm(); */
    		//$("#submit-btn").html('Save'); 
    		//$("#submit-btn").attr("title","Save");
    		//$("#submit-btn").attr("class","btn btn-xl btn-success button-submit font13");
    		// $("#add-edit-alloc").attr("action", "./not-allocate-role");
    		/* $("#ContentPlaceHolder1_ddlRoleName").empty();    */
    		//$("#ContentPlaceHolder1_ddlRoleName").val(" ");
    		
    		
    	});
    });

jQuery.validator.addMethod('selectcheck', function(
		value) {
	return (value != "");
}, "");

 var vaidator= $("#add-edit-alloc").validate({

	// Specify the validation rules
	rules : {
		roleId : {
			required : true,
			selectcheck : true
		}
	},

	// Specify the validation error messages
	messages : {
		roleId : {
			required : true,
			selectcheck : ""
		}
	},

	submitHandler : function(form) {
		form.submit();
	}
});
 

</script>
</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">

		<div id="content">
			<div class="layout-container">
				<!--=== Page Header ===-->
				<jsp:include page="page-header.jsp" />
				<!-- /Page Header -->
				<form action="./not-allocate-role" method="post" id="add-edit-alloc">
					<!-- roleMenuAlloc -->
					<div
						class="second-column one-child-container relative padding-top-75px">

						<div id="my_documents_container"
							style="margin-left: 0px; margin: auto; width: 90%"
							class="column-one clearfixs;">
							<div class="">
								<div class="row">
									<div class="col-md-12">
										<fieldset class="scheduler-border">
											<!-- <legend class="scheduler-border">Role Allocation</legend>-->
											<div class="grid-header text">Role Allocation</div>

											<div class="form-group">
												<div class="col-sm-12 ">
													Note <b>:</b> <span style="color: #FF0000">* Marked
														Is Mandatory !</span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-horizontal">

													<div class="form-group">
														<div class="col-sm-4">
															Role Name <span style="color: #FF0000; font-weight: bold">*</span>
														</div>
														<div class="col-sm-8">
															<select id="ContentPlaceHolder1_ddlRoleName" tabindex= "1"
																name="roleId"  class="form-control" required>
																<option selected="selected" value="0">Please
																	Select</option>
																<c:forEach items="${notAllocatedRoleList}"
																	var="roleList">
																	<option value="${roleList.roleId}">${roleList.roleName}</option>

																</c:forEach>
															</select> <span id="ContentPlaceHolder1_rfvRoleName"
																style="display: none;"></span> <br>
															<button type="submit" title="Save"
																class="btn btn-xl btn-success button-submit font13"
																id="submit-btn" tabindex= "2">Save</button>

															<button type="button" title="Reset" id="cancel-btn"
																class="btn btn-xl btn-default button-cancel font13"
																data-dismiss="modal"  >Reset</button>

														</div>
													</div>
													<!-- <div class="help-block"></div> -->
													<div class="form-group">
														<div class="col-sm-4"></div>
														<div class="col-sm-8"></div>
													</div>

													<div class="row">
														<div class="DocumentList"
															style="position: relative; top: -7px">
															<table
																class="table table-striped table-bordered table-hover table-checkable table-responsive">
																<thead>
																	<tr>
																		<th>Select</th>
																		<th>Role Name</th>

																	</tr>
																</thead>
																<tbody>
																	<c:forEach items="${allocatedRoleList}"
																		var="allocatedList">
																		<tr tabindex=4>
																			<td class="">
																				<%-- <input type="button" class="btn btn-primary" name="ctl00$ContentPlaceHolder1$rptRole$ctl01$btnEdit" value="Select" id="ContentPlaceHolder1_rptRole_btnEdit_0" tabindex="11" title="Edit Record" onclick="updateRole(${allocatedList.roleId},'${allocatedList.roleName}')"/> --%>
																				<div class="fa-select" title="Edit Record"
																					onclick="updateRole(${allocatedList.roleId},'${allocatedList.roleName}')" >
																					<span class="fa fa-pencil-square"></span>
																				</div>
																			</td>
																			<td style="width: 95%; text-align: left"><c:out
																					value="${allocatedList.roleName}" /></td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>

														</div>
													</div>

												</div>
											</div>
											<div class="col-md-6">

												<ul id="tree3"
													style="position: relative; padding-top: 10px; padding-left: 20%; width: 100%"
													class="ui-widget-daredevel-checkboxTree ui-widget ui-widget-content">

												</ul>

											</div>

										</fieldset>
									</div>
								</div>

							</div>
						</div>
					</div>
				</form>
				<!--=== Page Content ===-->
			</div>

		</div>
	</div>
	<!-- /.container -->
	<!-- /.container -->



	<script>






</script>


</body>
</html>
