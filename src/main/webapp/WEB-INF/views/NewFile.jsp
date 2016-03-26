<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">

<title>DataTables Bootstrap 3 example</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/r/bs-3.3.5/jq-2.1.4,dt-1.10.8/datatables.min.css">

<script type="text/javascript"
	src="https://cdn.datatables.net/r/bs-3.3.5/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('#example').DataTable();
	});
</script>
</head>
<body>
	<div class="container">

		<div class="dataTables_wrapper form-inline dt-bootstrap no-footer"
			id="example_wrapper">
			<div class="row">
				<div class="col-sm-6">
					<div id="example_length" class="dataTables_length">
						<label>Show <select class="form-control input-sm"
							aria-controls="example" name="example_length">
								<option value="10">10</option>
								<option value="25">25</option>
								<option value="50">50</option>
								<option value="100">100</option>
						</select> entries
						</label>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="dataTables_filter" id="example_filter">
						<label>Search:<input aria-controls="example"
							placeholder="" class="form-control input-sm" type="search">
						</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
					<table style="width: 100%;" aria-describedby="example_info"
						role="grid" id="example"
						class="table table-striped table-bordered dataTable no-footer"
						cellspacing="0" width="100%">
						<thead>
							<tr role="row">
								<th aria-sort="ascending"
									aria-label="Name: activate to sort column descending"
									style="width: 256px;" colspan="1" rowspan="1"
									aria-controls="example" tabindex="0" class="sorting_asc">Name</th>
								<th aria-label="Position: activate to sort column ascending"
									style="width: 400px;" colspan="1" rowspan="1"
									aria-controls="example" tabindex="0" class="sorting">Position</th>
								<th aria-label="Office: activate to sort column ascending"
									style="width: 197px;" colspan="1" rowspan="1"
									aria-controls="example" tabindex="0" class="sorting">Office</th>
								<th aria-label="Salary: activate to sort column ascending"
									style="width: 154px;" colspan="1" rowspan="1"
									aria-controls="example" tabindex="0" class="sorting">Salary</th>
							</tr>
						</thead>
						<tbody>
							<tr class="odd" role="row">
								<td class="sorting_1">Airi Satou</td>
								<td>Accountant</td>
								<td>Tokyo</td>
								<td>$162,700</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Angelica Ramos</td>
								<td>Chief Executive Officer (CEO)</td>
								<td>London</td>
								<td>$1,200,000</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Ashton Cox</td>
								<td>Junior Technical Author</td>
								<td>San Francisco</td>
								<td>$86,000</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Bradley Greer</td>
								<td>Software Engineer</td>
								<td>London</td>
								<td>$132,000</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Brenden Wagner</td>
								<td>Software Engineer</td>
								<td>San Francisco</td>
								<td>$206,850</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Brielle Williamson</td>
								<td>Integration Specialist</td>
								<td>New York</td>
								<td>$372,000</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Bruno Nash</td>
								<td>Software Engineer</td>
								<td>London</td>
								<td>$163,500</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Caesar Vance</td>
								<td>Pre-Sales Support</td>
								<td>New York</td>
								<td>$106,450</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Cara Stevens</td>
								<td>Sales Assistant</td>
								<td>New York</td>
								<td>$145,600</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Cedric Kelly</td>
								<td>Senior Javascript Developer</td>
								<td>Edinburgh</td>
								<td>$433,060</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Charde Marshall</td>
								<td>Regional Director</td>
								<td>San Francisco</td>
								<td>$470,600</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Colleen Hurst</td>
								<td>Javascript Developer</td>
								<td>San Francisco</td>
								<td>$205,500</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Dai Rios</td>
								<td>Personnel Lead</td>
								<td>Edinburgh</td>
								<td>$217,500</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>$112,000</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Doris Wilder</td>
								<td>Sales Assistant</td>
								<td>Sidney</td>
								<td>$85,600</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Finn Camacho</td>
								<td>Support Engineer</td>
								<td>San Francisco</td>
								<td>$87,500</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Fiona Green</td>
								<td>Chief Operating Officer (COO)</td>
								<td>San Francisco</td>
								<td>$850,000</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Garrett Winters</td>
								<td>Accountant</td>
								<td>Tokyo</td>
								<td>$170,750</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Gavin Cortez</td>
								<td>Team Leader</td>
								<td>San Francisco</td>
								<td>$235,500</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Gavin Joyce</td>
								<td>Developer</td>
								<td>Edinburgh</td>
								<td>$92,575</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Gloria Little</td>
								<td>Systems Administrator</td>
								<td>New York</td>
								<td>$237,500</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Haley Kennedy</td>
								<td>Senior Marketing Designer</td>
								<td>London</td>
								<td>$313,500</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Hermione Butler</td>
								<td>Regional Director</td>
								<td>London</td>
								<td>$356,250</td>
							</tr>
							<tr class="even" role="row">
								<td class="sorting_1">Herrod Chandler</td>
								<td>Sales Assistant</td>
								<td>San Francisco</td>
								<td>$137,500</td>
							</tr>
							<tr class="odd" role="row">
								<td class="sorting_1">Hope Fuentes</td>
								<td>Secretary</td>
								<td>San Francisco</td>
								<td>$109,850</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-5">
					<div aria-live="polite" role="status" id="example_info"
						class="dataTables_info">Showing 1 to 25 of 57 entries</div>
				</div>
				<div class="col-sm-7">
					<div id="example_paginate"
						class="dataTables_paginate paging_simple_numbers">
						<ul class="pagination">
							<li id="example_previous"
								class="paginate_button previous disabled"><a tabindex="0"
								data-dt-idx="0" aria-controls="example" href="#">Previous</a></li>
							<li class="paginate_button active"><a tabindex="0"
								data-dt-idx="1" aria-controls="example" href="#">1</a></li>
							<li class="paginate_button "><a tabindex="0" data-dt-idx="2"
								aria-controls="example" href="#">2</a></li>
							<li class="paginate_button "><a tabindex="0" data-dt-idx="3"
								aria-controls="example" href="#">3</a></li>
							<li id="example_next" class="paginate_button next"><a
								tabindex="0" data-dt-idx="4" aria-controls="example" href="#">Next</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
	// For demo to fit into DataTables site builder...
	$('#example')
		.removeClass( 'display' )
		.addClass('table table-striped table-bordered');
</script>

</body>
</html>