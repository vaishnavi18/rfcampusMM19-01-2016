
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
function copy_group1()
{
 var list1 = $('#group1');
 var list2 = $('#group2');
// list2.find('option').remove();
 list1.find(":selected").each(function () {
	 var exist=false;
	 var temp1=$(this).val();
	// alert($('#group2').has('option').length == 0 );
	// alert(temp1)
	 list2.children().each(function () {
		// alert("echi"+temp1);
	 if(temp1 == $(this).val()){
		 exist=true;
	 }
	 });
	 if(exist==true && $('#group2').has('option').length != 0){
		
  
	 }else{
		 list2.append($("<option></option>").attr("value",$(this).val()).text($(this).text()));
	 }
 });
}

function remove_group2()
{
	$("#group2").find('option:selected').remove();
	 
}
function remove_group3()
{
	$("#group3").find('option:selected').remove();
	 
}


function copy_group2()
{
 var list1 = $('#group2');
 var list2 = $('#group3');
// list2.find('option').remove();
 list1.find(":selected").each(function () {
	 var exist=false;
	 var temp1=$(this).val();
	// alert($('#group2').has('option').length == 0 );
	// alert(temp1)
	 list2.children().each(function () {
		// alert("echi"+temp1);
	 if(temp1 == $(this).val()){
		 exist=true;
	 }
	 });
	 if(exist==true && $('#group3').has('option').length != 0){
		
  
	 }else{
		 list2.append($("<option></option>").attr("value",$(this).val()).text($(this).text()));
	 }
 });
}


function move_up() {
    var selected = $("#group3").find(":selected");
    var before = selected.prev();
    if (before.length > 0)
        selected.detach().insertBefore(before);
}

function move_down() {
    var selected = $("#group3").find(":selected");
    var next = selected.next();
    if (next.length > 0)
        selected.detach().insertAfter(next);
}
	</script>

<link
	href="${pageContext.request.contextPath}/resources/assets/css/select2.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/assets/css/select2.js"></script>



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

								<div class="grid-header text">STUDENT MERIT LIST</div>


							</div>
							<!-- jaskirat code start here -->
							<!-- 	$('div').filter(function)
							return	parseInt($(this).attr('id')>) -->



							<div class="box-header" style="top: 5px;">
								<div class="box-name">
									<i class="fa fa-table"></i> <span><b>Merit List
											Criteria</b></span>
								</div>


							</div>


							<div class="row my-bg-success">
							<br>
								<!--left div start here -->

								<div class="col-md-6">

											<!--for Session Display  -->
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">
															Session <span style="color: #FF0000; font-weight: bold">*</span>
														</div>
													</div>
													<div class="col-sm-7">
														<select id="sessionId" onkeyup="sync()" title="module"
															name="sessionId" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${sessionList}" var="session">
																<option value="${session.id}">${session.sessionName}</option>
															</c:forEach>
														</select> <span id="ContentPlaceHolder1_rfvmodule"
															style="display: none;"></span>
													</div>

												</div>
											</div>




								</div>
								
								
								<div class="col-md-6">

											<!--for Session Display  -->
											<div class="form-group">
												<div class="row">
													<div class="col-sm-4">
														<div id="ContentPlaceHolder1_lblModule"
															class="control-label">
															Session <span style="color: #FF0000; font-weight: bold">*</span>
														</div>
													</div>
													<div class="col-sm-7">
														<select id="sessionId" onkeyup="sync()" title="module"
															name="sessionId" class="form-control">
															<option selected="selected" value="0">Please
																Select</option>
															<c:forEach items="${sessionList}" var="session">
																<option value="${session.id}">${session.sessionName}</option>
															</c:forEach>
														</select> <span id="ContentPlaceHolder1_rfvmodule"
															style="display: none;"></span>
													</div>

												</div>
											</div>




								</div>




								<!--right div end here -->


                           

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


										<select id="group1" multiple class="form-control"
											style="height: 200px; overflow: auto">
											<option value="volvo">Volvo</option>
											<option value="saab">Saab</option>
											<option value="opel">Opel</option>
											<option value="audi">Audi</option>
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
										<button type="button" onclick=" $('#group2').empty();"
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

										<select id="group2" multiple class="form-control"
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
										<button type="button" onclick=" $('#group3').empty();"
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
									<select id="group3" multiple class="form-control"
											style="height: 200px; overflow: auto">
											<option value="volvo">Volvo</option>
											<option value="saab">Saab</option>
										</select>


								</div>
								<div class="col-md-1">
									<p>
										<button onclick="move_up()" type="button"  value="up"
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
							
							
<!-- 							button start here -->
<div class="col-md-12">
															<div class="form-group action-btn-group">
																<div class="controls2">
																
																	<!-- <a href="#"> -->
																	<button type="submit" name="submit_create_edit_team" class="btn btn-xl btn-primary button-submit font13">
																		<span><span class="" id="submit_button">Show Filter</span></span>
																	</button>

																	<button type="submit" name="submit_create_edit_team" class="btn btn-xl btn-success button-submit font13">
																		<span><span class="" id="submit_button">Show Report</span></span>
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

										<table id="tabletwo"
											class="table table-bordered  table-checkable table-responsive  "
											aria-describedby="DataTables_Table_0_info">
											<thead>
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


											</tbody>
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
			$('#group3').append(row3);
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

