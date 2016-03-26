<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Fee Head Details  | RF-Campus</title>

<!--=== CSS ===-->
<title>Enable Hover State on Bootstrap 3 Table Rows</title>

<jsp:include page="../views/authentication/script.jsp" />

<!--===ptu CSS for autoincrement ===-->
<style type="text/css">


</style>
<!--===ptu add row ===-->
<script type="text/javascript">
var excessHeadAvailable=false;
var totalFeeHead = 1;

	function AddRow() {
		var text = '<tr>'
			+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
		+'<input type=\"hidden\" name=\"feeHeads['+totalFeeHead+'].serialNumber\" value="'+totalFeeHead+'">'
		+'F'+totalFeeHead+'</td>'
								+ ''
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+totalFeeHead+'].feeheadLongName\" value=\"\" />'
								+ '</td>'
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+totalFeeHead+'].feeheadShortName\" value=\"\" />'
								+ '</td>' + '</tr>';
		
								
	if(excessHeadAvailable==false){
		$('#feeHeadBody').append(text);
	}else{
		var rowCount = $('#table1 tr').length;
		$( text ).insertAfter( $('#table1 tr:eq('+(rowCount-2)+')') );
	}	
	totalFeeHead++;
	}

	function AddExcessRow() {
		$('#feeHeadBody')
				.append(
						'<tr class=\"excess-fee\">'
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
+'<input type=\"hidden\" name=\"feeHeads['+0+'].serialNumber\" value="'+0+'">'
								+ 'FX</td>'
								+ ''
								+ '<td class=\"sorting\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+0+'].feeheadLongName\" value=\"\" />'
								+ '</td>'
								+ '<td class=\"sorting\" role=\"columnheader\" tabindex=\"0\"'+
			'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
								+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+0+'].feeheadShortName\" value=\"\" />'
								+ '</td>' + '</tr>');
		
		$("#excessFeeHeadButton").attr('disabled','disabled')
		excessHeadAvailable=true;
	}

	/* ===ptu deleting row  === */

	function myFunction() {
		var choice = confirm('Are you sure?');
		if (choice == true) {
			if($('#table1 tr:last').hasClass('excess-fee')){
				excessHeadAvailable=false;
    			$("#excessFeeHeadButton").removeAttr('disabled');
			}else{
				totalFeeHead--;	
			}
			$('#table1 tr:last').remove();
			
		}
		return false;

	}
	/*--------------#####-----------------*/
	function getHead(id)
	{
		totalFeeHead=1;
		$.ajax({
			async:false,
			url:"./feeHeads/getList",
			data:{"id" : id},
			type:"POST",
			success:function(response)
			{
				alert(JSON.stringify(response));
				var headList = JSON.parse(JSON.stringify(response));
				if(JSON.stringify(response)!='[]'){
					$('#feeHeadBody').empty();
					var msg='';
                	$.each(headList, function(index, feeHead){
                		if(feeHead.serialNumber!= 0)
                			{
                			$('#feeHeadBody')
        					.append(
        							'<tr>'
        									+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
    							+'<input type=\"hidden\" name=\"feeHeads['+totalFeeHead+'].serialNumber\" value=\"'+feeHead.serialNumber+'\">'
        									+ feeHead.feeheadCode+'</td>'
        									+ ''
        									+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
        									+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+totalFeeHead+'].feeheadLongName\" value=\"'+feeHead.feeheadLongName+'\" />'
        									+ '</td>'
        									+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
        									+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+totalFeeHead+'].feeheadShortName\" value=\"'+feeHead.feeheadShortName+'\" />'
        									+ '</td>' + '</tr>');
                    		
                    		totalFeeHead++;
                    	
                			}
                		else
                			{
                			msg='<tr>'
								+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
		        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
		    							+'<input type=\"hidden\" name=\"feeHeads['+0+'].serialNumber\" value=\"'+feeHead.serialNumber+'\">'
		    							+ feeHead.feeheadCode+'</td>'
		        									+ ''
		        									+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
		        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
		        									+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+0+'].feeheadLongName\" value=\"'+feeHead.feeheadLongName+'\" />'
		        									+ '</td>'
		        									+ '<td class=\"\" role=\"columnheader\" tabindex=\"0\"'+
		        				'aria-controls=\"DataTables_Table_0\" rowspan=\"1\" colspan=\"1\">'
		        									+ '<input style=\"width:100%;outline:none;border: 0; background-color: #fff;\" type=\"text\" name=\"feeHeads['+0+'].feeheadShortName\" value=\"'+feeHead.feeheadShortName+'\" />'
		        									+ '</td>' + '</tr>';
                			}	
                			
                			
                			
                			}); 
                			
                		if(msg!='')
                			{
                			excessHeadAvailable=true;
                			$('#feeHeadBody')
        					.append(msg);
                			$("#excessFeeHeadButton").attr('disabled','disabled');
                			}
                		
					
                	
				}else
					$('#feeHeadBody').empty();
				
			}
		});
	}
	
</script>


</head>

<body class="breakpoint-1200" style="height: 609px;">
	<!-- Header -->
	<jsp:include page="../views/authentication/header.jsp" />
	<!-- /.header -->

	<div id="container" class="fixed-header">
		<div id="content">
			<div class="layout-container">
				<div class="">
					<!--=== Page Header ===-->
					<jsp:include page="../views/authentication/page-header.jsp" /> 
					<!-- /Page Header -->

					<div class="second-column one-child-container relative ">
						<!--=== Navigation Vertical ===-->

						<!-- /Navigation Vertical -->
						<form:form class="form-inline ng-pristine ng-valid" method="post"
										action="./feeHeads/add" id="add-update-university" modelAttribute="FeeHeadList" >

						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">
							<div class="grid-header text">Fee Head Master</div>
							<div class="grid box-filters">
								<div class="table-header">
									 <input type="hidden" name="id" id="universityId" value="0">
										<div class="row-fluid">
											<div class="span6">
												<table>
													<tr>
														<td class="padding0 no_border"><label
															class="float_left mrgall-01 font13"> <strong
																class="">Receipt For</strong>
														</label></td>
														<td class="no_border"><div
																class=" controls project-input-contr">
																<select name="receiptTypeId" id="" class=" "
																	style="width: 224px; position: relative;">
																	<option selected="selected" value="0">Please
																	Select</option>
																	<c:forEach items="${reciptTypeList}" var="receipt">  
																	<option value="${receipt.id}" onclick="getHead(${receipt.id})">${receipt.receiptTitle} </option>
																	</c:forEach>
																</select>
															</div></td>
													</tr>
												</table>
											</div>

											<div class="span6">
												<table style="width:10%; cellspacing:0 ;cellpadding:0">
													<tr>
														<td class="no_border"
															style="position: relative; left: 55px">
															<button type="button" id="a"
																class="btn btn-xl btn-success button-submit font13"
																onclick="AddRow()">Add Fee Head</button>
														</td>
                                                        <td class="no_border"
															style="position: relative; left: 65px">
															<button type="button" id="excessFeeHeadButton"
																class="btn btn-xl btn-success button-submit font13"
																onclick="AddExcessRow()">Add Excess Head</button>
														</td>
                                                        
														<td class="no_border"
															style="position: relative; left: 75px">
															<button type="button"
																class="btn btn-xl btn-cancel button-submit font13"
																onclick="myFunction()" id="">Delete Fee Head</button>
														</td>
													</tr>
												</table>
											</div>
										</div>
								</div>
							</div>
							<div class="grid-title">
								<div class="pull-left">Fee Head Definition</div>
								<!--<div class="pull-right">
                        <a href="assets-create-reminders-form.html" target="_blank" class="btn btn-xl btn-success button-submit font13">
                          <i class="icon-plus-sign margin_right5"></i>Add
                        </a>
                    </div>-->
								<div class="clear"></div>
							</div>
							<div class="grid-content">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper form-inline" role="grid">
									<div class="row">
										<div class="dataTables_header clearfix">
											<div class="col-md-6"></div>
										</div>
									</div>
									<table
										class="table table-striped table-bordered table-hover table-checkable table-responsive css-serial"
										id="table1" aria-describedby="DataTables_Table_0_info">
										<thead>
											<tr role="row">
												<th style="position: relative; width: 10%" class="sorting"
													role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="PHOTO: activate to sort column ascending">Head</th>
												<th style="position: relative;width:70%" class="sorting"
													role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="ID: activate to sort column ascending">Fee Long Name</th>
												<th style="position: relative;width:20%" class="sorting"
													role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="First Name: activate to sort column ascending">Fee Short Name
													</th>
												<!-- <th class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
													aria-label="First Name: activate to sort column ascending">Action</th> -->
											</tr>
										</thead>

										<tbody  id="feeHeadBody">
										    
										    <c:forEach items="${FeeHeadList.feeHeads}" var="head" varStatus="status">
											<tr>
											    <td id="count" class="sorting" role="columnheader"
													tabindex="0" aria-controls="DataTables_Table_0" rowspan="1"
													colspan="1">&nbsp;</td>
												<td class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
													<input id=""style="width: 100%; outline: none; border: 0; background-color: #fff;"
													type="text" name="feeHeads[${status.index}].feeheadLongName" value="" />
												</td>
												<td class="sorting" role="columnheader" tabindex="0"
													aria-controls="DataTables_Table_0" rowspan="1" colspan="1">
													<input
													style="width: 100%; outline: none; border: 0; background-color: #fff;"
													type="text" name="feeHeads[${status.index}].feeheadShortName" value="" />
												</td>
											</tr>
                                            </c:forEach>
										</tbody>
									</table>
										<div style="position: relative; left: 447px;">
										<input type="submit" class="btn btn-success" value="Submit"></input> <input
											type="button" class="btn btn-default" value="Cancel"></input> 
											<input type="button" class="btn btn-default" value="Report"></input>
									</div>
									
									
									<!-- Modal dialog -->
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
						</form:form>
					</div>
					</div>
					</div>
					</div>
					</div>
</body>

