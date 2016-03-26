<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>Sequence Number Allotment | RF-Campus</title>

<!--=== CSS ===-->
<jsp:include page="../authentication/script.jsp" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/table/RowSorter.js"></script>
<style>
table {
	width: 100%;
	border-collapse: collapse;
    border-spacing: 0;
    white-space: nowrap;
}

table thead th {
/* 	background-color: #c8c8c8; */
/* 	border-bottom-width: 2px; */
/* 	line-height: 18px; */
/* 	font-size: 13px; */
/* 	font-weight: bold; */
/* 	padding: 8px; */
/* 	outline: medium none !important; */
/* 	box-sizing: border-box; */
}
	
	
}

.changed1 {
 	background-color: #ddd; 
	padding: 5px;
}

table button {
	font-size: 80%;
	padding: 5px 10px;
}

table.sorting-table {
	cursor: move;
}

table tr.sorting-row td {
	background-color: #e3f7e3;
}

.sortedRow {
	background-color: #e3f7e3;
}

dd {
	/* 	background-image: ${pageContext.request.contextPath}/resources/loading-gif.gif; */
	
}
</style>
<script type="text/javascript">

	function checkInput(ob, e) {
		var invalidChars = /[^0-9]/gi
		if (invalidChars.test(ob.value)) {
			ob.value = ob.value.replace(invalidChars, "");
		}
		if(e.keyCode == 107){
			var index = $('.inputs').index(ob) - 1;
			$('.inputs').eq(index).focus();
		}
		if(e.keyCode == 13){
			var index = $('.inputs').index(ob) + 1;
			$('.inputs').eq(index).focus();
		}
	}

	$(document)
			.ready(
					function() {
						
						

						var flag;
						if ("${message}" == "update") {
							notifyupdate('Sequence No. Updated Successfully!!');
						} else if ("${message}" == "error") {
							notifyerror('Sequence No. Updation Unsuccessfull,Try Again!');
						}

						$("#submit-btn").click(function() {
							if ($("#update-staff-seq").valid() && flag) {
								$("#seqNumberAllot").submit();
							} else {
								notifyerror('No Records To Save');
							}
						});

						$("#cancel-btn")
								.click(
										function() {
											$("#documentId").val(0);
											$("#staffCategory").val('0');
											$('#DataTables_Table_0')
													.dataTable().fnClearTable();
											$("#submit-btn").html('Save');
											$("#submit-btn").attr('title',
													'Save');
											$("#submit-btn")
													.attr('class',
															'btn btn-xl btn-success button-submit font13');
										});

						jQuery.validator.addMethod('selectcheck', function(
								value) {
							return (value != '' && value != '0');
						}, "");

						var validator = $("#update-staff-seq").validate({
							// Specify the validation rules
							rules : {
								staffCategory : {
									required : true,
									selectcheck : true
								}
							},

							// Specify the validation error messages
							messages : {
								staffCategory : {
									required : "",
									selectcheck : ""
								}
							},

							submitHandler : function(form) {
								form.submit();
							}
						});

						$("#staffCategory")
								.change(
										function() {
											var id = $("#staffCategory").val();

											$
													.ajax({
														async : false,
														url : "./sequenceNumberAllotment/get",
														type : "POST",
														data : {
															"staffCategoryId" : ""
																	+ id
														},

														success : function(
																response) {
															var jsonOb = JSON
																	.parse(JSON
																			.stringify(response));
															var text = '';
															var srno = 0;
															if (JSON
																	.stringify(response) != '[]') {
																var unique = 1;
																$
																		.each(
																				jsonOb,
																				function(
																						index,
																						employee) {
																					for (var i = 0; i < 7; i++) {
																						text += "<tr onclick=\"\" class=\"changed1\" style=\"\">"
																								+ "<td class=\"\"\">"
																								+ "<input class=\"input\" type=\"hidden\" name=\"employeeList["+srno+"].id\" value=\""+employee.id+"\">"
																								+ employee.id
																								+ "</td>"
																								+ "	<td class=\"\"\">"
																								+ employee.firstName
																								+ " "
																								+ employee.middleName
																								+ " "
																								+ employee.lastName
																								+ " "
																								+ unique
																								+ "</td>"
																								+ "	<td class=\"\"\">"
																								+ employee.subdesignationLongName
																								+ " </td>"
																								+ "	<td class=\"\"\">"
																								+ "<input class=\"inputs\" onkeyup=\"checkInput(this, event)\" type=\"text\"  name=\"employeeList["
																								+ srno
																								+ "].sequenceNumber\" value=\""
																								+ employee.sequenceNumber
																								+ "\""
																								+ "onfocus=\"putEvent(this)\" >"
																								+ "</td>"
																								+ "</tr>";
																						srno++;
																						unique++;
																					}
																				});

																$(
																		"#sequenceNumberTableBody")
																		.empty();
																$(
																		"#sequenceNumberTableBody")
																		.html(
																				text);
																flag = true;
															} else {
																notifyerror('No Records Available!!');
																flag = false;

															}

														},
														error : function() {
															alert('error...');
														},
													});

											//alert("hellow");
											/* if(table.fnSettings().aoData.length===0) {
												alert('no data');
												notifyerror('No Records Available!!');
											  } */

											/* resetAllFields(); */
										});
					});
</script>

<script type="text/javascript">
	function setDocument(did, name) {
		$("#documentId").val(did);
		$("#dname").val(name);
		$("#add-update-document").attr('action',
				'./sequenceNumberAllotment/update');
		$("#submit-btn").html('Update');
		$("#submit-btn").attr('title', 'Update');
		$("#submit-btn").attr('class',
				'btn btn-xl btn-warning button-submit font13')

	}
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

						<div id="my_documents_container" style=""
							class="doc-container column-one clearfix ">

							<div class="grid-header text">SEQUENCE NUMBER ALLOTMENT</div>
							<div class="grid box-filters">
								<div class="table-header">
									<form id="update-staff-seq"
										class="form-inline ng-pristine ng-valid" method="post"
										action="">
										<input type="hidden" name="id" id="documentId" value="0">
										<div class="row">
											<div class="form-horizontal">
												<div class="col-md-6">
													<div class="form-group">
														<div class="">
															<div class="col-sm-4 ">
																<div class="control-label">
																	Select Staff <span
																		style="color: #FF0000; font-weight: bold">*</span>
																</div>
															</div>
															<div class="col-sm-6">
																<select name="staffCategory" id="staffCategory"
																	class="form-control">
																	<option selected="selected" value="0">Please
																		Select...</option>
																	<c:forEach items="${staffCategoryList}" var="session">
																		<option value="${session.id}">${session.staffCategory}</option>
																	</c:forEach>
																</select>
															</div>
														</div>

													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>

							<form action="./sequenceNumberAllotment/update" method="post"
								modelAttribute="employeeMasterDTOList" id="seqNumberAllot">
								<div class="grid-title">
									<div class="pull-left">Sequence Number Allotment</div>
									<div class="clear"></div>
								</div>
								<div class="grid-content">
									<div class="grid box-filters" role="">
										<div class="table-header"
											style="position: relative; overflow: auto; max-width: 100%; padding: 0px">
											<div class="row col-md-12">
												<br>
												<div class="col-md-10" style="min-width: 100%; padding: 1%">
													<table class="table table-bordered  table-checkable table-responsive" id="tableSort"
														>
														<thead> 
															<tr class="customers" role="row">
																<th>IdNo</th>
																<th>Name</th>
																<th>Designation</th>
																<th>Seq. No</th>
															</tr>
														</thead>

														<tbody id="sequenceNumberTableBody">
															
														</tbody>

													</table>
													<br>
												</div>
												
											</div>
											
										</div>
										
										<div class="col-sm-12">
											<br>
											<div class="form-horizontal">
												<div class="form-group">

													<!-- Button start here -->
													<div class="col-sm-12" style="text-align: center">

														<button type="button" id="submit-btn"
															class="btn btn-xl btn-success button-submit font13 "
															title="Save" data-placement="top">Save</button>

														<button type="button"
															class="btn btn-xl btn-cancel button-submit font13"
															title="Reset" data-placement="top" id="cancel-btn">Reset</button>


													</div>
													<!-- Button  end here -->

												</div>
											</div>
										</div>

									</div>
								</div>
							</form>

						</div>
					</div>

				</div>


			</div>

		</div>
		<!-- /.container -->

	</div>
<script type="text/javascript">

	function putEvent(data){
		var currentTD = data.parentNode;
		var currentRow = currentTD.parentNode;  
		console.log("putEvent")
		var oldNumber = parseInt($(data).val());
		
		$(data).focusout(function(){
			
			var newNumber = parseInt($(data).val());
			console.log(newNumber + "NEW NUMBER");
			
			if(!isNaN(newNumber)){
				if(oldNumber != newNumber){
					perform(data);
				}
			}else{
				$(currentRow).css("background-color", "red");   
				console.log("dass");
			}
			
			$(data).unbind('focusout');
		});
	}

	var table = document.getElementById("tableSort");
	RowSorter(table, {
		handler : 'td',
		onDrop : function(tbody, row, new_index, old_index) {
			$(row).css("background-color", "#e3f7e3");
			var rows = tbody.rows, length = rows.length, i = 1;
			for (; i <= length; i++) {
				$(rows[i - 1]).find("td:nth-child(4) input").val("" + i);
			}
		},
	});

	function perform(row) {
		console.log("PERFORM")
		var currentTD = row.parentNode;
		var currentRow = currentTD.parentNode;

		var newIndex = $(currentRow).find("td:nth-child(4) input").val();
		var firstIndex = $('#tableSort > tbody > tr').find(
				"td:nth-child(4) input").val();
		var lastIndex;

		$('#tableSort > tbody > tr').each(function() {
			lastIndex = $(this).find("td:nth-child(4) input").val();
		});

		if (parseInt(newIndex) >= 1
				&& parseInt(newIndex) <= parseInt(lastIndex)) {

			$(currentRow).remove();

			var count = 1;
			$('#tableSort > tbody > tr').each(function() {
				$(this).find("td:nth-child(4) input").val(count);
				count++;
			});

			var insertAfter = true;
			var lastRow;
			$('#tableSort > tbody > tr').each(function() {

				if (insertAfter == true) {

					if ($(this).find("td:nth-child(4) input")
							.val() == newIndex) {
						var nowRow = $(this);
						insertAfter = false;
						$(this).before(currentRow);
						$(currentRow).css("background-color",
								"#e3f7e3");

					} else {
						insertAfter = true;
						lastRow = $(this);
					}
				}
			});

			if (insertAfter == true) {
				$(lastRow).after(currentRow);
				$(currentRow).css("background-color", "#e3f7e3");
			}

		}
		var count = 1;
		$('#tableSort > tbody > tr').each(function() {
			$(this).find("td:nth-child(4) input").val(count);
			count++;
		});
		$(currentRow).css("background-color", "#e3f7e3");
	}
</script>

</body>


</html>

