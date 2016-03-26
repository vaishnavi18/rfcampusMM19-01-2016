
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Student Merit List Generation</title>

<jsp:include page="../authentication/script.jsp" />

<!-- tab code link start here -->
<link
	href="<c:url value="/resources/tab/themes/smoothness/jquery-ui.css"/>"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/my_button.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/tab/jquery-ui.js"></script>
<style>
.ui-sortable-handle {
	margin-top: 2px;
	margin-bottom: 2px;
}
</style>



<!-- validations -->
<script type="text/javascript">
	function copy_group1() {
		var list1 = $('#all_fields');
		var list2 = $('#selected_fields');
		// list2.find('option').remove();
		list1
				.find(":selected")
				.each(
						function() {
							var exist = false;
							var temp1 = $(this).val();
							// alert($('#selected_fields').has('option').length == 0 );
							// alert(temp1)
							list2.children().each(function() {
								// alert("echi"+temp1);
								if (temp1 == $(this).val()) {
									exist = true;
								}
							});
							if (exist == true
									&& $('#selected_fields').has('option').length != 0) {

							} else {
								list2.append($("<option></option>").attr(
										"value", $(this).val()).text(
										$(this).text()));
							}
						});
	}

	function remove_group2() {
		$("#selected_fields").find('option:selected').remove();

	}
	function remove_group3() {
		$("#order_by").find('option:selected').remove();

	}

	function copy_group2() {
		var list1 = $('#selected_fields');
		var list2 = $('#order_by');
		// list2.find('option').remove();
		list1.find(":selected").each(
				function() {
					var exist = false;
					var temp1 = $(this).val();
					// alert($('#selected_fields').has('option').length == 0 );
					// alert(temp1)
					list2.children().each(function() {
						// alert("echi"+temp1);
						if (temp1 == $(this).val()) {
							exist = true;
						}
					});
					if (exist == true
							&& $('#order_by').has('option').length != 0) {

					} else {
						list2.append($("<option value='" + $(this).val() + "'>"
								+ $(this).text() + "</option>"));//.attr("value",$(this).val()).text($(this).text()));
					}
				});
	}

	function move_up() {
		var selected = $("#order_by").find(":selected");
		var before = selected.prev();
		if (before.length > 0)
			selected.detach().insertBefore(before);
	}

	function move_down() {
		var selected = $("#order_by").find(":selected");
		var next = selected.next();
		if (next.length > 0)
			selected.detach().insertAfter(next);
	}
</script>

<%-- <link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/css/select2.js"></script> --%>
<script type="text/javascript">
	var formData;

	$(document).ready(
			function() {
				$("#show_report_id").click(
						function() {
							var selectedFields = new Array();
							var orderBy = new Array();
							$.each($("#selected_fields option"), function() {
								selectedFields.push($(this).val());
							});

							$.each($("#order_by option"), function() {
								orderBy.push($(this).val());
							});

							var degreeId = $("#degreeId").val();
							var branchNumber = $("#branchNumber").val();
							var casteId = $("#casteId").val();
							var categoryId = $("#categoryId").val();
							var religionId = $("#religionId").val();
							var nationalityId = $("#nationalityId").val();
							var admittedToYear = $("#admittedToYear").val();
							var semesterId = $("#semesterId").val();
							var batchId = $("#batchId").val();
							var paymentType = $("#paymentType").val();
							var bloodGroupId = $("#bloodGroupId").val();
							var motherTongueId = $("#motherTongueId").val();

							var filters = {
								"degreeId" : degreeId,
								"branchNumber" : branchNumber,
								"casteId" : casteId,
								"categoryId" : categoryId,
								"religionId" : religionId,
								"nationalityId" : nationalityId,
								"admittedToYear" : admittedToYear,
								"semesterId" : semesterId,
								"batchId" : batchId,
								"paymentType" : paymentType,
								"bloodGroupId" : bloodGroupId,
								"motherTongueId" : motherTongueId
							};

							formData = new FormData();
							formData.append("filters", JSON.stringify(filters));
							formData.append("selectedFields", new String(selectedFields));
							formData.append("orderBy", new String(orderBy));
							
							//alert(JSON.stringify(filters) + ' - \n'+ new String(selectedFileds) + ' - \n'+new String(orderBy));
							
							$.ajax({
								async : false,
								url : "../utility/student-selected-fields",
								type : "POST",
								data : {"selectedFields" : new String(selectedFields), "orderBy" : new String(orderBy), "filters" : JSON.stringify(filters)},
								//data : formData,
								//processData: false,
								//contentType : 'application/x-www-form-urlencoded;charset=UTF-8',
								success : function(response) {
									//alert(JSON.stringify(response));
									var text = '';
									var tableHeaders = '';
									var tableRows = '';

									var flag = false;

									$.each(response, function(key, value) {
										if (flag == false) {
											flag = true;
											$.each(value, function(key, value) {
												//console.log(key, value);
												tableHeaders += "<th>" + key
														+ "</th>";
											});
										}

										return flag;
									});

									$.each(response, function(key, value) {
										tableRows += "<tr role=\"row\">";

										$.each(value, function(key, value) {
											//console.log(key, value);
											value = value != null ? value : "";
											tableRows += "<td>" + value
													+ "</td>";
										});
										tableRows += "</tr>";
									});

									/*$.each(response, function(index, value){
									alert(JSON.stringify(value));
									}); */

									var text = "<thead>"
											+ "		<tr role=\"row\">" + ""
											+ tableHeaders + "" + "		</tr>"
											+ "	</thead>"
											+ "	<tbody id=\"student-record\">"
											+ tableRows + "" + "	</tbody>";

									$("#selected_field_table").empty().html(
											text);

								},
								error : function() {
									alert('error...');
								},
							});

						});
				
				
				/*$("#show_report_id").click(function(){
				
				var selectedFields = new Array();
				var orderBy = new Array();
				$.each($("#selected_fields option"), function() {
					selectedFields.push($(this).val());
				});

				$.each($("#order_by option"), function() {
					orderBy.push($(this).val());
				});

				var degreeId = $("#degreeId").val();
				var branchNumber = $("#branchNumber").val();
				var casteId = $("#casteId").val();
				var categoryId = $("#categoryId").val();
				var religionId = $("#religionId").val();
				var nationalityId = $("#nationalityId").val();
				var admittedToYear = $("#admittedToYear").val();
				var semesterId = $("#semesterId").val();
				var batchId = $("#batchId").val();
				var paymentType = $("#paymentType").val();
				var bloodGroupId = $("#bloodGroupId").val();
				var motherTongueId = $("#motherTongueId").val();

				var filters = {
					"degreeId" : degreeId,
					"branchNumber" : branchNumber,
					"casteId" : casteId,
					"categoryId" : categoryId,
					"religionId" : religionId,
					"nationalityId" : nationalityId,
					"admittedToYear" : admittedToYear,
					"semesterId" : semesterId,
					"batchId" : batchId,
					"paymentType" : paymentType,
					"bloodGroupId" : bloodGroupId,
					"motherTongueId" : motherTongueId
				};
				
				$("#filters").val(JSON.stringify(filters));
				$("#selectedFields").val(new String(selectedFields));
				$("#orderBy").val(new String(orderBy));
				
				$("#show-report").submit();
				});*/
			});
</script>

</head>

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
						class=" doc-container column-one clearfixs ">
						<div class="row">
							<div class="create_project_tbl">

								<div class="grid-header text">STUDENTS SELECTED FIELD REPORT</div>


							</div>
							<!-- jaskirat code start here -->
							<!-- 	$('div').filter(function)
							return	parseInt($(this).attr('id')>) -->

							<div class="box-header" style="top: 5px;">
								<!-- <div class="box-name">
									<i class="fa fa-table"></i> <span><b>Merit List
											Criteria</b></span>
								</div> -->


							</div>

						<c:set var="counter" value="1" />
						<c:forEach items="${academicProperties}" var="property" varStatus="loop">
						<div class="row my-bg-success">
								<br>
								<!--left div start here -->

							<c:if test="${(counter%2 == 0) && (property.restriction != 'N')}">
								<div class="col-md-6">

									<!--for Session Display  -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-4">
												<div id="ContentPlaceHolder1_lblModule"
													class="control-label">
													${property.displayPropertyName} <!-- <span style="color: #FF0000; font-weight: bold">*</span> -->
												</div>
											</div>
											<div class="col-sm-7">
												<select id="${property.restriction}" name="${property.restriction}" class="form-control">
													<option selected="selected" value="0">Please
														Select</option>
													<c:forEach items="${property.masterData}" var="master">
														<option value="${master.id}">${master.name}</option>
													</c:forEach>
												</select> <span id="ContentPlaceHolder1_rfvmodule"
													style="display: none;"></span>
											</div>

										</div>
									</div>
								</div>
							</c:if>
								
							<c:if test="${(counter%2 != 0)  && (property.restriction != 'N')}">
								<div class="col-md-6">

									<!--for Session Display  -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-4">
												<div id="ContentPlaceHolder1_lblModule"
													class="control-label">
													${property.displayPropertyName}<!-- <span style="color: #FF0000; font-weight: bold">*</span> -->
												</div>
											</div>
											<div class="col-sm-7">
												<select id="${property.restriction}" name="${property.restriction}"
													class="form-control">
													<option selected="selected" value="0">Please
														Select</option>
													<c:forEach items="${property.masterData}" var="master">
														<option value="${master.id}">${master.name}</option>
													</c:forEach>
												</select> <span id="ContentPlaceHolder1_rfvmodule"
													style="display: none;"></span>
											</div>

										</div>
									</div>
								</div>
								</c:if>
								<!--right div end here -->
							</div>
							<c:set var="counter" value="${counter + 1}" />
						</c:forEach>

							
								
								
								
							</div>
							
							
							<!-- All shift tabel code start here -->
							<div class="row my-bg-success">
								<br>
								<div class="col-md-3">
									<!-- TABLE CODE START HERE -->
									<div class="col-md-12">



										<table id="menu_table"
											class="table table-bordered  table-checkable table-responsive  "
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th style="width: 85px">Group 1</th>
													<th>Filter Name</th>
												</tr>
											</thead>
										</table>


										<select id="all_fields" multiple class="form-control"
											style="height: 200px; overflow: auto">
											<c:forEach items="${academicProperties}"
												var="academicProperty">
												<option value='${academicProperty}'>${academicProperty.displayPropertyName}</option>
											</c:forEach>
										</select>


									</div>
									<!-- TABLE CODE END HERE -->

								</div>



								<div class="col-md-1">
									<!-- TABLE CODE START HERE -->
									<p>
										<button onclick="copy_group1();" type="button"
											class="btn btn-success btn-lg">
											<span class="glyphicon glyphicon-circle-arrow-right"></span>
										</button>
									</p>
									<p>
										<button type="button" onclick="remove_group2()"
											class="btn btn-primary btn-lg">
											<span class="glyphicon glyphicon-circle-arrow-Left"></span>
										</button>
									</p>
									<p>
										<button type="button"
											onclick=" $('#selected_fields').empty();"
											class="btn btn-danger btn-lg">
											<span class="glyphicon glyphicon glyphicon-refresh"></span>
										</button>
									</p>
									<!-- TABLE CODE END HERE -->

								</div>

								<div class="col-md-3">
									<!-- TABLE CODE START HERE -->
									<div class="col-md-12">

										<table id="menu_table"
											class="table table-bordered  table-checkable table-responsive  "
											aria-describedby="DataTables_Table_0_info">
											<thead>
												<tr role="row">
													<th>Selected Fields</th>
												</tr>
											</thead>
										</table>

										<select id="selected_fields" multiple class="form-control"
											style="height: 200px; overflow: auto">

										</select>




									</div>
									<!-- TABLE CODE END HERE -->

								</div>

								<div class="col-md-1">
									<!-- TABLE CODE START HERE -->
									<p>
										<button onclick="copy_group2();" type="button"
											class="btn btn-success btn-lg">
											<span class="glyphicon glyphicon-circle-arrow-right"></span>
										</button>
									</p>
									<p>
										<button type="button" onclick="remove_group3()"
											class="btn btn-primary btn-lg">
											<span class="glyphicon glyphicon-circle-arrow-Left"></span>
										</button>
									</p>
									<p>
										<button type="button" onclick=" $('#order_by').empty();"
											class="btn btn-danger btn-lg">
											<span class="glyphicon glyphicon glyphicon-refresh"></span>
										</button>

									</p>
									<!-- TABLE CODE END HERE -->

								</div>


								<div class="col-md-3">
									<table id="menu_table"
										class="table table-bordered  table-checkable table-responsive  "
										aria-describedby="DataTables_Table_0_info">
										<thead>
											<tr role="row">
												<th style="width: 85px">Ordered By</th>
											</tr>
										</thead>
									</table>
									<select id="order_by" multiple class="form-control"
										style="height: 200px; overflow: auto">

									</select>


								</div>
								<div class="col-md-1">
									<p>
										<button onclick="move_up()" type="button" value="up"
											class="btn btn-success btn-lg">
											<span class="glyphicon glyphicon-circle-arrow-up"></span>
										</button>
									</p>
									<p>
										<button type="button" onclick="move_down()"
											class="btn btn-success btn-lg">
											<span class="glyphicon glyphicon-circle-arrow-down"></span>
										</button>
									</p>

								</div>
							</div>


							<!-- button start here -->
							<div class="col-md-12">
								<div class="form-group action-btn-group">
									<div class="controls2">

										<!-- <a href="#"> -->
										<!-- <button type="button" name="submit_create_edit_team"
											class="btn btn-xl btn-primary button-submit font13">
											<span><span class="" id="">Show Filter</span></span>
										</button> -->

										<button type="button" id="show_report_id"
											name="submit_create_edit_team"
											class="btn btn-xl btn-success button-submit font13">
											<span><span class="" id="">Show Report</span></span>
										</button>
										<!-- </a>  -->
									</div>
								</div>
							</div>
							<!-- button end here -->

							<!-- Al SHift table end eher -->
							<!--Table list start here -->
							<div class="row my-bg-success">
								<!-- TABLE CODE START HERE -->
								<div class="col-md-6">

									<div class=""
										style="height: 295px; position: relative; overflow: auto; margin-top: 10px">

										<table id="selected_field_table"
											class="table table-bordered  table-checkable table-responsive  "
											aria-describedby="DataTables_Table_0_info">
											<!-- <thead>
												<tr role="row">

													<th>Field Name</th>
													<th>Condition</th>

												</tr>
											</thead>
											<tbody id="student-record">
												<tr role="row">

													<td>Field1</td>
													<td><select class="form-control"><option></option>
													</select>
													</d>
												</tr>


											</tbody> -->
										</table>

									</div>
								</div>
								<!-- TABLE CODE END HERE -->


							</div>

						</div>

					</div>

					<!--=== Page Content ===-->
				</div>
			</div>
		</div>
		
		
		<form action="../utility/student-selected-fields/report" id="show-report" method="post">
			<input type="hidden" name="filters" id="filters" value="">
			<input type="hidden" name="selectedFields" id="selectedFields" value="">
			<input type="hidden" name="orderBy" id="orderBy" value="">
		</form> 
		
	</div>

	<script>
		function add_to_filter() {
			var condition = document.getElementById("conditionId").value;
			var operator = document.getElementById("operatorId").value;
			var conditionValue = document.getElementById("conditionValue").value;
			var value = condition + "#" + operator + "#" + conditionValue;

			var condition_is = $(
					"#conditionId option[value='" + $("#conditionId").val()
							+ "']").text()
					+ ' ' + operator + ' ' + conditionValue;

			/*if(tbl1=='numberof'){
				 condition_is = ' Number of Student ' + ' ' + tbl1 + '  ' + value_is;
			}else{
			
			condition_is = tbl + '   '+tbl1 + ' ' + value_is ;
			}*/
			var row3 = ""
					+ "<tr class=\"odd\" > "
					+ " "
					+ "<td style=\"width: 120px\"><input type=\"checkbox\" class=\"all-conditions\""
		    	 + "id=\"restriction\" name=\"restriction\" value='"+value+"' /> "
					+ "<label>Condition</label></td> "
					+ "<td><input type=\"hidden\" "
		    	 + "id=\"group_three_value_1\" value='' /> "
					+ ""
					+ condition_is
					+ " "
					+ "</td> "
					+ "																					 "
					+ "<td> "
					+ "<button type=\"button\" onclick=\"remove_this(this)\" class=\"btn btn-warning\"> "
					+ "<span class=\"glyphicon glyphicon-remove\"></span> "
					+ "</button> " + "</td> " + " " + "</tr>";
			// 	     }
			$('#order_by').append(row3);
		}
		function remove_this(row) {

			row.closest('tr').remove();
		}

		/* function add_filter(row)
		{
			row.add()
			return $(this).attr("id")
		}) 
		 */
	</script>
	<!-- /.container -->
	<!-- /.container -->
</body>

