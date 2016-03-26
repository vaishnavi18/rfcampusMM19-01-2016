<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page session="true"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<title>RFCampus</title>

<jsp:include page="script.jsp" />


<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/plugins.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/responsive.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/icons.css">
<link href="${pageContext.request.contextPath}/resources/assets/css/fontawesome/font-awesome.min.css"
	rel="stylesheet">


<script
	src="${pageContext.request.contextPath}/resources/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/assets/js/libs/lodash.compat.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/touchpunch/jquery.ui.touch-punch.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/event.swipe/jquery.event.move.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/resources/plugins/easy-pie-chart/jquery.easy-pie-chart.min.js"
	type="text/javascript"></script>

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


				<div class="second-column one-child-container relative ">
					<div id="my_documents_container" style=""
						class="doc-container column-one clearfixs ">
						<div class="">
							<div class="row">
								<div class="create_project_tbl">
									<!-- jaskirat code start here -->
									<div class="col-sm-12">
										<div style="margin-top: 15px;max-width:100%;overflow:auto" class="status-update-container"
											id="">
											<ul class="stats " style="table-layout:auto">
												<li class="">
													<div class="visual">
														<div class="circle-state-icon">
															<img alt="Staff"
																src="${mycontext}resources/assets/img/icons/staff_icon.png">
														</div>
														<div data-bar-color="#4cc5cd" data-size="150"
															data-percent="40" class="circular-chart easyPieChart"
															style="width: 150px; height: 150px; line-height: 150px;">
															40%
															<canvas height="150" width="150"></canvas>
														</div>
													</div> <span class="number">3,000</span> <span class="title">Total
														Staff</span>
												</li>
												<li class="">
													<div class="visual">
														<div class="circle-state-icon">
															<img alt="New Staff"
																src="${mycontext}resources/assets/img/icons/new_staff_icon.png">
														</div>
														<div data-bar-color="#b9baba" data-size="150"
															data-percent="10" class="circular-chart easyPieChart"
															style="width: 150px; height: 150px; line-height: 150px;">
															10%
															<canvas height="150" width="150"></canvas>
														</div>
													</div> <span class="number">50</span> <span class="title">Total
														New Staff</span>
												</li>
												<li class="">
													<div class="visual">
														<div class="circle-state-icon">
															<img alt="Attendance"
																src="${mycontext}resources/assets/img/icons/attendance-icon.png">
														</div>
														<div data-bar-color="#e25856" data-size="150"
															data-percent="95" class="circular-chart easyPieChart"
															style="width: 150px; height: 150px; line-height: 150px;">
															95.4%
															<canvas height="150" width="150"></canvas>
														</div>
													</div> <span class="number">95.4%</span> <span class="title">Monthly
														Attendance</span>
												</li>
												<li class="">
													<div class="visual">
														<div class="circle-state-icon">
															<img alt="Salaries"
																src="${mycontext}resources/assets/img/icons/work-done-icon.png">
														</div>
														<div data-bar-color="#8fc556" data-size="150"
															data-percent="85" class="circular-chart easyPieChart"
															style="width: 150px; height: 150px; line-height: 150px;">
															85%
															<canvas height="150" width="150"></canvas>
														</div>
													</div> <span class="number">45,0000000</span> <span class="title">Monthly
														Salaries</span>
												</li>
											</ul>
										</div>
									</div>
									<!-- jaskirat code end here -->
									<div id="get-started" class=""
										style="padding-bottom: 35px;">
										<div class="row">
											<div class="">
											<div class="row-fluid">
														<hr>
													</div>

													<div class="lContentbox_heading relative">
														<h4>
															<i class="icon-user"></i> Staff Distribution
														</h4>
													</div>
													<div class="row-fluid">
														<div class="col-sm-12">
															<div class="box-table">
																<div class="box-table-header">
																	<h3 class="title">Department</h3>
																</div>
																<div class="box-table-content padded">
																	<div class="containertable db-blank-state"
																		style="width: 100%;">
																		<div id="st_department"
																			style=" height: 320px; margin: 0 auto"
																			data-highcharts-chart="0">
																			<div class="highcharts-container" id="highcharts-0"
																				style="position: relative; overflow: auto; width:100% ; height: 320px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Signika, serif; background: url(&quot;http://www.highcharts.com/samples/graphics/sand.png&quot;);">
																				<svg version="1.1"
																					style="font-family: Signika, serif; font-size: 12px;"
																					xmlns="http://www.w3.org/2000/svg" width="1087"
																					height="300">
																					<desc>Created with Highcharts 4.2.1</desc>
																					<defs>
																					<clipPath id="highcharts-1">
																					<rect x="0" y="0" width="1052" height="170"></rect></clipPath></defs>
																					
																					<g class="highcharts-grid" zIndex="1"></g>
																					<g class="highcharts-grid" zIndex="1">
																					<path fill="none" d="M 61 215.5 L 1113 215.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 158.5 L 1113 158.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 102.5 L 1113 102.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 44.5 L 1113 44.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path></g>
																					<g class="highcharts-axis" zIndex="2">
																					<path fill="none" d="M 210.5 215 L 210.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 361.5 215 L 361.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 511.5 215 L 511.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 661.5 215 L 661.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 811.5 215 L 811.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 962.5 215 L 962.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 1113.5 215 L 1113.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 60.5 215 L 60.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 61 215.5 L 1113 215.5"
																						stroke="#C0D0E0" stroke-width="1" zIndex="7"></path></g>
																					<g class="highcharts-axis" zIndex="2">
																					<text x="24.34375" zIndex="7" text-anchor="middle"
																						transform="translate(0,0) rotate(270 24.34375 130)"
																						class=" highcharts-yaxis-title"
																						style="color:#707070;fill:#707070;" y="130">
																					<tspan>Population (millions)</tspan></text></g>
																					<g class="highcharts-series-group" zIndex="3">
																					<g
																						class="highcharts-series highcharts-series-0 highcharts-tracker"
																						zIndex="0.1"
																						transform="translate(61,45) scale(1 1)" style=""
																						clip-path="url(#highcharts-1)">
																					<rect x="38.5" y="36.5" width="73" height="134"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="38.5" y="36.5" width="73" height="134"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="38.5" y="36.5" width="73" height="134"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="38.5" y="36.5" width="73" height="134"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="188.5" y="79.5" width="73" height="91"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="188.5" y="79.5" width="73" height="91"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="188.5" y="79.5" width="73" height="91"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="188.5" y="79.5" width="73" height="91"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="339.5" y="90.5" width="73" height="80"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="339.5" y="90.5" width="73" height="80"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="339.5" y="90.5" width="73" height="80"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="339.5" y="90.5" width="73" height="80"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="489.5" y="91.5" width="73" height="79"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="489.5" y="91.5" width="73" height="79"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="489.5" y="91.5" width="73" height="79"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="489.5" y="91.5" width="73" height="79"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="639.5" y="99.5" width="73" height="71"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="639.5" y="99.5" width="73" height="71"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="639.5" y="99.5" width="73" height="71"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="639.5" y="99.5" width="73" height="71"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="790.5" y="101.5" width="73" height="69"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="790.5" y="101.5" width="73" height="69"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="790.5" y="101.5" width="73" height="69"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="790.5" y="101.5" width="73" height="69"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="940.5" y="103.5" width="73" height="67"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="940.5" y="103.5" width="73" height="67"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="940.5" y="103.5" width="73" height="67"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="940.5" y="103.5" width="73" height="67"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect></g>
																					<g class="highcharts-markers highcharts-series-0"
																						zIndex="0.1"
																						transform="translate(61,45) scale(1 1)"
																						clip-path="none"></g></g>
																					<text x="562" text-anchor="middle"
																						class="highcharts-title" zIndex="4"
																						style="color:black;font-size:16px;font-weight:bold;fill:black;width:1059px;"
																						y="22">Department</text>
																					<g
																						class="highcharts-data-labels highcharts-series-0 highcharts-tracker"
																						zIndex="6" visibility="visible"
																						transform="translate(61,45) scale(1 1)"
																						opacity="1" style="">
																					<text x="83.33333333333333" y="46.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 83.33333333333333 46.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>23.7</tspan></text>
																					<text x="233.33333333333334" y="89.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 233.33333333333334 89.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>16.1</tspan></text>
																					<text x="384.3333333333333" y="100.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 384.3333333333333 100.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>14.2</tspan></text>
																					<text x="534.3333333333334" y="101.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 534.3333333333334 101.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>14</tspan></text>
																					<text x="684.3333333333334" y="109.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 684.3333333333334 109.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>12.5</tspan></text>
																					<text x="835.3333333333334" y="111.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 835.3333333333334 111.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>12.1</tspan></text>
																					<text x="985.3333333333334" y="113.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 985.3333333333334 113.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>11.8</tspan></text></g>
																					<g
																						class="highcharts-axis-labels highcharts-xaxis-labels"
																						zIndex="7">
																					<text x="139.20698652799885"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 139.20698652799885 232)"
																						y="232" opacity="1">
																					<tspan>Banglore</tspan></text>
																					<text x="289.4927008137131"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 289.4927008137131 232)"
																						y="232" opacity="1">
																					<tspan>Chennai</tspan></text>
																					<text x="439.7784150994273"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 439.7784150994273 232)"
																						y="232" opacity="1">
																					<tspan>Rajasthan</tspan></text>
																					<text x="590.0641293851417"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 590.0641293851417 232)"
																						y="232" opacity="1">
																					<tspan>Ajmer</tspan></text>
																					<text x="740.3498436708559"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 740.3498436708559 232)"
																						y="232" opacity="1">
																					<tspan>Mumbai</tspan></text>
																					<text x="890.6355579565702"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 890.6355579565702 232)"
																						y="232" opacity="1">
																					<tspan>Hyderabad</tspan></text>
																					<text x="1040.9212722422847"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 1040.9212722422847 232)"
																						y="232" opacity="1">
																					<tspan>Delhi</tspan></text></g>
																					<g
																						class="highcharts-axis-labels highcharts-yaxis-labels"
																						zIndex="7">
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="220" opacity="1">0</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="163" opacity="1">10</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="106" opacity="1">20</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="50" opacity="1">30</text></g>
																					<g class="highcharts-tooltip" zIndex="8"
																						style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;"
																						transform="translate(44,-9999)" opacity="0"
																						visibility="visible">
																					<path fill="none"
																						d="M 3 0 L 183 0 C 186 0 186 0 186 3 L 186 41 C 186 44 186 44 183 44 L 99 44 93 50 87 44 3 44 C 0 44 0 44 0 41 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.049999999999999996"
																						stroke-width="5" transform="translate(1, 1)"
																						width="186" height="44"></path>
																					<path fill="none"
																						d="M 3 0 L 183 0 C 186 0 186 0 186 3 L 186 41 C 186 44 186 44 183 44 L 99 44 93 50 87 44 3 44 C 0 44 0 44 0 41 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.09999999999999999"
																						stroke-width="3" transform="translate(1, 1)"
																						width="186" height="44"></path>
																					<path fill="none"
																						d="M 3 0 L 183 0 C 186 0 186 0 186 3 L 186 41 C 186 44 186 44 183 44 L 99 44 93 50 87 44 3 44 C 0 44 0 44 0 41 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.15" stroke-width="1"
																						transform="translate(1, 1)" width="186"
																						height="44"></path>
																					<path fill="rgba(249, 249, 249, .85)"
																						d="M 3 0 L 183 0 C 186 0 186 0 186 3 L 186 41 C 186 44 186 44 183 44 L 99 44 93 50 87 44 3 44 C 0 44 0 44 0 41 L 0 3 C 0 0 0 0 3 0"></path>
																					<text x="8" zIndex="1"
																						style="font-size:12px;color:#333333;fill:#333333;"
																						y="20">
																					<tspan style="font-size: 10px">Banglore</tspan>
																					<tspan x="8" dy="15">Population in 2008: </tspan>
																					<tspan style="font-weight:bold" dx="0">23.7 millions</tspan></text></g>
																					<text x="1113" text-anchor="end" zIndex="8"
																						style="cursor:pointer;color:#909090;font-size:9px;fill:#909090;"
																						y="295">Highcharts.com</text></svg>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="row-fluid">
														<hr>
													</div>

													<div class="lContentbox_heading relative">
														<h4>
															<i class="icon-calendar"></i> Attendance
														</h4>
													</div>
													<div class="row-fluid">
														<div class="col-sm-6 col-sx-12">
															<div class="box-table">
																<div class="box-table-header">
																	<h3 class="title pull-left">Attendance Percentage</h3>
																	
																</div>
																<div class="box-table-content padded">
																	<div class="containertable db-blank-state"
																		style="width: 100%;">
																		<div id="st_attendance"
																			style=" height: 320px; margin: 0 auto"
																			data-highcharts-chart="3">
																			<div class="highcharts-container" id="highcharts-6"
																				style="position: relative; overflow: auto; width: 100%; height: 320px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Signika, serif; background: url(&quot;http://www.highcharts.com/samples/graphics/sand.png&quot;);">
																				<svg version="1.1"
																					style="font-family: Signika, serif; font-size: 12px;"
																					xmlns="http://www.w3.org/2000/svg" width="532"
																					height="300">
																					<desc>Created with Highcharts 4.2.1</desc>
																					<defs>
																					<clipPath id="highcharts-7">
																					<rect x="0" y="0" width="528" height="240"></rect></clipPath></defs>
																					
																					<rect x="9.5" y="44.5" width="522" height="241"
																						strokeWidth="-1" stroke="#C0C0C0" stroke-width="1"
																						fill="none" zIndex="1"></rect>
																					<g class="highcharts-series-group" zIndex="3">
																					<g
																						class="highcharts-series highcharts-series-0 highcharts-tracker"
																						zIndex="0.1"
																						transform="translate(10,45) scale(1 1)"
																						style="cursor:pointer;">
																					<g class="highcharts-shadow">
																					<g class="highcharts-shadow"
																						transform="translate(0,0)">
																					<path fill="none"
																						d="M 263.9835024705007 39.000001680052364 A 81 81 0 0 1 291.91135856913223 43.960825472488665 L 264 120 A 0 0 0 0 0 264 120 Z"
																						stroke="black" stroke-width="5"
																						stroke-linejoin="round"
																						transform="translate(1, 1)" isShadow="true"
																						stroke-opacity="0.049999999999999996" r="81"
																						x="264" y="120"></path>
																					<path fill="none"
																						d="M 263.9835024705007 39.000001680052364 A 81 81 0 0 1 291.91135856913223 43.960825472488665 L 264 120 A 0 0 0 0 0 264 120 Z"
																						stroke="black" stroke-width="3"
																						stroke-linejoin="round"
																						transform="translate(1, 1)" isShadow="true"
																						stroke-opacity="0.09999999999999999" r="81"
																						x="264" y="120"></path>
																					<path fill="none"
																						d="M 263.9835024705007 39.000001680052364 A 81 81 0 0 1 291.91135856913223 43.960825472488665 L 264 120 A 0 0 0 0 0 264 120 Z"
																						stroke="black" stroke-width="1"
																						stroke-linejoin="round"
																						transform="translate(1, 1)" isShadow="true"
																						stroke-opacity="0.15" r="81" x="264" y="120"></path></g>
																					<g class="highcharts-shadow"
																						transform="translate(0,0)">
																					<path fill="none"
																						d="M 291.98738377530844 43.98877484599001 A 81 81 0 1 1 263.8874926250162 39.00007813528106 L 264 120 A 0 0 0 1 0 264 120 Z"
																						stroke="black" stroke-width="5"
																						stroke-linejoin="round"
																						transform="translate(1, 1)" isShadow="true"
																						stroke-opacity="0.049999999999999996" r="81"
																						x="264" y="120"></path>
																					<path fill="none"
																						d="M 291.98738377530844 43.98877484599001 A 81 81 0 1 1 263.8874926250162 39.00007813528106 L 264 120 A 0 0 0 1 0 264 120 Z"
																						stroke="black" stroke-width="3"
																						stroke-linejoin="round"
																						transform="translate(1, 1)" isShadow="true"
																						stroke-opacity="0.09999999999999999" r="81"
																						x="264" y="120"></path>
																					<path fill="none"
																						d="M 291.98738377530844 43.98877484599001 A 81 81 0 1 1 263.8874926250162 39.00007813528106 L 264 120 A 0 0 0 1 0 264 120 Z"
																						stroke="black" stroke-width="1"
																						stroke-linejoin="round"
																						transform="translate(1, 1)" isShadow="true"
																						stroke-opacity="0.15" r="81" x="264" y="120"></path></g></g>
																					<path fill="#f45b5b"
																						d="M 263.9835024705007 39.000001680052364 A 81 81 0 0 1 291.91135856913223 43.960825472488665 L 264 120 A 0 0 0 0 0 264 120 Z"
																						stroke="#FFFFFF" stroke-width="1"
																						stroke-linejoin="round" transform="translate(0,0)"></path>
																					<path fill="#8085e9"
																						d="M 291.98738377530844 43.98877484599001 A 81 81 0 1 1 263.8874926250162 39.00007813528106 L 264 120 A 0 0 0 1 0 264 120 Z"
																						stroke="#FFFFFF" stroke-width="1"
																						stroke-linejoin="round" transform="translate(0,0)"></path></g>
																					<g class="highcharts-markers highcharts-series-0"
																						zIndex="0.1"
																						transform="translate(10,45) scale(1 1)"></g></g>
																					<text x="274" text-anchor="middle"
																						class="highcharts-title" zIndex="4"
																						style="color:black;font-size:16px;font-weight:bold;fill:black;width:484px;"
																						y="22">
																					<tspan>Attendance Percentage</tspan></text>
																					<g
																						class="highcharts-data-labels highcharts-series-0 highcharts-tracker"
																						zIndex="6" visibility="visible"
																						transform="translate(10,45) scale(1 1)"
																						opacity="1" style="cursor:pointer;">
																					<path fill="none"
																						d="M 288.4780771052583 10.722351268515972 C 283.4780771052583 10.722351268515972 282.07425172830267 18.598217843758064 280.1439918349888 29.42753438471594 L 278.21373194167495 40.25685092567382"
																						stroke="#f45b5b" stroke-width="1"></path>
																					<path fill="none"
																						d="M 239.5219228947418 229.27764873148405 C 244.5219228947418 229.27764873148405 245.92574827169724 221.40178215624195 247.85600816501113 210.57246561528407 L 249.78626805832502 199.7431490743262"
																						stroke="#8085e9" stroke-width="1"></path>
																					<g zIndex="1" style="cursor:pointer;"
																						transform="translate(293,1)">
																					<text x="5" zIndex="1"
																						style="font-size:11px;font-weight:bold;color:black;text-shadow:0 0 6px #FFFFFF, 0 0 3px #FFFFFF;fill:black;text-rendering:geometricPrecision;"
																						y="16">
																					<tspan style="font-weight:bold">Leave</tspan>
																					<tspan dx="0">: 5.6 %</tspan></text></g>
																					<g zIndex="1" style="cursor:pointer;"
																						transform="translate(147,219)">
																					<text x="5" zIndex="1"
																						style="font-size:11px;font-weight:bold;color:black;text-shadow:0 0 6px #FFFFFF, 0 0 3px #FFFFFF;fill:black;text-rendering:geometricPrecision;"
																						y="16">
																					<tspan style="font-weight:bold">Present</tspan>
																					<tspan dx="0">: 94.4 %</tspan></text></g></g>
																					<g class="highcharts-legend" zIndex="7">
																					<g zIndex="1">
																					<g></g></g></g>
																					<g class="highcharts-tooltip" zIndex="8"
																						style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;"
																						transform="translate(0,-9999)">
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.049999999999999996"
																						stroke-width="5" transform="translate(1, 1)"></path>
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.09999999999999999"
																						stroke-width="3" transform="translate(1, 1)"></path>
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.15" stroke-width="1"
																						transform="translate(1, 1)"></path>
																					<path fill="rgba(249, 249, 249, .85)"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"></path>
																					<text x="8" zIndex="1"
																						style="font-size:12px;color:#333333;fill:#333333;"
																						y="20"></text></g>
																					<text x="538" text-anchor="end" zIndex="8"
																						style="cursor:pointer;color:#909090;font-size:9px;fill:#909090;"
																						y="295">Highcharts.com</text></svg>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<div class="col-sm-6 col-sx-12">
															<div class="box-table">
																<div class="box-table-header">
																	<h3 class="title">Project Site</h3>
																</div>
																<div class="box-table-content padded">
																	<div class="containertable db-blank-state"
																		style="width: 100%;">
																		<div id="st_projectsite"
																			style=" height: 320px; margin: 0 auto"
																			data-highcharts-chart="1">
																			<div class="highcharts-container" id="highcharts-2"
																				style="position: relative; overflow: auto; width: 100%; height: 320px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Signika, serif; background: url(&quot;http://www.highcharts.com/samples/graphics/sand.png&quot;);">
																				<svg version="1.1"
																					style="font-family: Signika, serif; font-size: 12px;"
																					xmlns="http://www.w3.org/2000/svg" width="532"
																					height="300">
																					<desc>Created with Highcharts 4.2.1</desc>
																					<defs>
																					<clipPath id="highcharts-3">
																					<rect x="0" y="0" width="477" height="170"></rect></clipPath></defs>
																					
																					<g class="highcharts-grid" zIndex="1"></g>
																					<g class="highcharts-grid" zIndex="1">
																					<path fill="none" d="M 61 215.5 L 538 215.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 130.5 L 538 130.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 44.5 L 538 44.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path></g>
																					<g class="highcharts-axis" zIndex="2">
																					<path fill="none" d="M 128.5 215 L 128.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 196.5 215 L 196.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 264.5 215 L 264.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 333.5 215 L 333.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 401.5 215 L 401.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 469.5 215 L 469.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 538.5 215 L 538.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 60.5 215 L 60.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 61 215.5 L 538 215.5"
																						stroke="#C0D0E0" stroke-width="1" zIndex="7"></path></g>
																					<g class="highcharts-axis" zIndex="2">
																					<text x="24.34375" zIndex="7" text-anchor="middle"
																						transform="translate(0,0) rotate(270 24.34375 130)"
																						class=" highcharts-yaxis-title"
																						style="color:#707070;fill:#707070;" y="130">
																					<tspan>Population (millions)</tspan></text></g>
																					<g class="highcharts-series-group" zIndex="3">
																					<g
																						class="highcharts-series highcharts-series-0 highcharts-tracker"
																						zIndex="0.1"
																						transform="translate(61,45) scale(1 1)" style=""
																						clip-path="url(#highcharts-3)">
																					<rect x="17.5" y="69.5" width="33" height="101"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="17.5" y="69.5" width="33" height="101"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="17.5" y="69.5" width="33" height="101"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="17.5" y="69.5" width="33" height="101"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="85.5" y="102.5" width="33" height="68"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="85.5" y="102.5" width="33" height="68"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="85.5" y="102.5" width="33" height="68"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="85.5" y="102.5" width="33" height="68"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="153.5" y="110.5" width="33" height="60"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="153.5" y="110.5" width="33" height="60"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="153.5" y="110.5" width="33" height="60"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="153.5" y="110.5" width="33" height="60"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="221.5" y="21.5" width="33" height="149"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="221.5" y="21.5" width="33" height="149"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="221.5" y="21.5" width="33" height="149"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="221.5" y="21.5" width="33" height="149"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="289.5" y="117.5" width="33" height="53"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="289.5" y="117.5" width="33" height="53"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="289.5" y="117.5" width="33" height="53"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="289.5" y="117.5" width="33" height="53"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="357.5" y="119.5" width="33" height="51"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="357.5" y="119.5" width="33" height="51"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="357.5" y="119.5" width="33" height="51"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="357.5" y="119.5" width="33" height="51"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="426.5" y="145.5" width="33" height="25"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="426.5" y="145.5" width="33" height="25"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="426.5" y="145.5" width="33" height="25"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="426.5" y="145.5" width="33" height="25"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect></g>
																					<g class="highcharts-markers highcharts-series-0"
																						zIndex="0.1"
																						transform="translate(61,45) scale(1 1)"
																						clip-path="none"></g></g>
																					<text x="274" text-anchor="middle"
																						class="highcharts-title" zIndex="4"
																						style="color:black;font-size:16px;font-weight:bold;fill:black;width:484px;"
																						y="22">
																					<tspan>Project Site</tspan></text>
																					<g
																						class="highcharts-data-labels highcharts-series-0 highcharts-tracker"
																						zIndex="6" visibility="visible"
																						transform="translate(61,45) scale(1 1)"
																						opacity="1" style="">
																					<text x="42.333333333333336" y="79.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 42.333333333333336 79.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>23.7</tspan></text>
																					<text x="110.33333333333333" y="112.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 110.33333333333333 112.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>16.1</tspan></text>
																					<text x="178.33333333333334" y="120.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 178.33333333333334 120.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>14.2</tspan></text>
																					<text x="246.33333333333334" y="31.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 246.33333333333334 31.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>35</tspan></text>
																					<text x="314.3333333333333" y="127.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 314.3333333333333 127.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>12.5</tspan></text>
																					<text x="382.3333333333333" y="129.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 382.3333333333333 129.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>12.1</tspan></text>
																					<text x="451.3333333333333" y="155.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 451.3333333333333 155.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>5.8</tspan></text></g>
																					<g
																						class="highcharts-axis-labels highcharts-xaxis-labels"
																						zIndex="7">
																					<text x="98.13555795657028"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 98.13555795657028 232)"
																						y="232" opacity="1">
																					<tspan>Banglore</tspan></text>
																					<text x="166.27841509942743"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 166.27841509942743 232)"
																						y="232" opacity="1">
																					<tspan>Chennai</tspan></text>
																					<text x="234.42127224228454"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 234.42127224228454 232)"
																						y="232" opacity="1">
																					<tspan>Rajasthan</tspan></text>
																					<text x="302.5641293851417"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 302.5641293851417 232)"
																						y="232" opacity="1">
																					<tspan>Ajmer</tspan></text>
																					<text x="370.7069865279988"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 370.7069865279988 232)"
																						y="232" opacity="1">
																					<tspan>Mumbai</tspan></text>
																					<text x="438.849843670856"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 438.849843670856 232)"
																						y="232" opacity="1">
																					<tspan>Hyderabad</tspan></text>
																					<text x="506.9927008137131"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 506.9927008137131 232)"
																						y="232" opacity="1">
																					<tspan>Delhi</tspan></text></g>
																					<g
																						class="highcharts-axis-labels highcharts-yaxis-labels"
																						zIndex="7">
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:171px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="220" opacity="1">0</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:171px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="135" opacity="1">20</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:171px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="50" opacity="1">40</text></g>
																					<g class="highcharts-tooltip" zIndex="8"
																						style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;"
																						transform="translate(0,-9999)">
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.049999999999999996"
																						stroke-width="5" transform="translate(1, 1)"></path>
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.09999999999999999"
																						stroke-width="3" transform="translate(1, 1)"></path>
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.15" stroke-width="1"
																						transform="translate(1, 1)"></path>
																					<path fill="rgba(249, 249, 249, .85)"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"></path>
																					<text x="8" zIndex="1"
																						style="font-size:12px;color:#333333;fill:#333333;"
																						y="20"></text></g>
																					<text x="538" text-anchor="end" zIndex="8"
																						style="cursor:pointer;color:#909090;font-size:9px;fill:#909090;"
																						y="295">Highcharts.com</text></svg>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>

													<div class="row-fluid">
														<hr>
													</div>

													<div class="lContentbox_heading relative">
														<h4 class="pull-left">
															<i class="icon-user"></i> Payroll
														</h4>
														<div class="drop pull-right">
														
														</div>
													</div>
													<div class="row-fluid">
														<div class="span12">
															<div class="box-table">
																<div class="box-table-header">
																	<h3 class="title">Department</h3>
																</div>
																<div class="box-table-content padded">
																	<div class="containertable db-blank-state"
																		style="width: 100%;">
																		<div id="st_payrolldepartment"
																			style=" height: 320px; margin: 0 auto"
																			data-highcharts-chart="2">
																			<div class="highcharts-container" id="highcharts-4"
																				style="position: relative; overflow: auto; width: 100%; height: 320px; text-align: left; line-height: normal; z-index: 0; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); font-family: Signika, serif; background: url(&quot;http://www.highcharts.com/samples/graphics/sand.png&quot;);">
																				<svg version="1.1"
																					style="font-family: Signika, serif; font-size: 12px;"
																					xmlns="http://www.w3.org/2000/svg" width="1087"
																					height="300">
																					<desc>Created with Highcharts 4.2.1</desc>
																					<defs>
																					<clipPath id="highcharts-5">
																					<rect x="0" y="0" width="1052" height="170"></rect></clipPath></defs>
																					
																					<g class="highcharts-grid" zIndex="1"></g>
																					<g class="highcharts-grid" zIndex="1">
																					<path fill="none" d="M 61 215.5 L 1113 215.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 130.5 L 1113 130.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path>
																					<path fill="none" d="M 61 44.5 L 1113 44.5"
																						stroke="#D8D8D8" stroke-width="1" zIndex="1"
																						opacity="1"></path></g>
																					<g class="highcharts-axis" zIndex="2">
																					<path fill="none" d="M 210.5 215 L 210.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 361.5 215 L 361.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 511.5 215 L 511.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 661.5 215 L 661.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 811.5 215 L 811.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 962.5 215 L 962.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 1113.5 215 L 1113.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 60.5 215 L 60.5 225"
																						stroke="#C0D0E0" stroke-width="1" opacity="1"></path>
																					<path fill="none" d="M 61 215.5 L 1113 215.5"
																						stroke="#C0D0E0" stroke-width="1" zIndex="7"></path></g>
																					<g class="highcharts-axis" zIndex="2">
																					<text x="24.34375" zIndex="7" text-anchor="middle"
																						transform="translate(0,0) rotate(270 24.34375 130)"
																						class=" highcharts-yaxis-title"
																						style="color:#707070;fill:#707070;" y="130">
																					<tspan>Population (millions)</tspan></text></g>
																					<g class="highcharts-series-group" zIndex="3">
																					<g
																						class="highcharts-series highcharts-series-0 highcharts-tracker"
																						zIndex="0.1"
																						transform="translate(61,45) scale(1 1)" style=""
																						clip-path="url(#highcharts-5)">
																					<rect x="38.5" y="69.5" width="73" height="101"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="38.5" y="69.5" width="73" height="101"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="38.5" y="69.5" width="73" height="101"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="38.5" y="69.5" width="73" height="101"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="188.5" y="102.5" width="73" height="68"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="188.5" y="102.5" width="73" height="68"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="188.5" y="102.5" width="73" height="68"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="188.5" y="102.5" width="73" height="68"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="339.5" y="110.5" width="73" height="60"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="339.5" y="110.5" width="73" height="60"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="339.5" y="110.5" width="73" height="60"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="339.5" y="110.5" width="73" height="60"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="489.5" y="21.5" width="73" height="149"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="489.5" y="21.5" width="73" height="149"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="489.5" y="21.5" width="73" height="149"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="489.5" y="21.5" width="73" height="149"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="639.5" y="117.5" width="73" height="53"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="639.5" y="117.5" width="73" height="53"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="639.5" y="117.5" width="73" height="53"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="639.5" y="117.5" width="73" height="53"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="790.5" y="119.5" width="73" height="51"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="790.5" y="119.5" width="73" height="51"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="790.5" y="119.5" width="73" height="51"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="790.5" y="119.5" width="73" height="51"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect>
																					<rect x="940.5" y="145.5" width="73" height="25"
																						stroke="black" stroke-width="5" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.049999999999999996"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="940.5" y="145.5" width="73" height="25"
																						stroke="black" stroke-width="3" fill="none" rx="0"
																						ry="0" isShadow="true"
																						stroke-opacity="0.09999999999999999"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="940.5" y="145.5" width="73" height="25"
																						stroke="black" stroke-width="1" fill="none" rx="0"
																						ry="0" isShadow="true" stroke-opacity="0.15"
																						transform="translate(1, 1)" r="0"></rect>
																					<rect x="940.5" y="145.5" width="73" height="25"
																						stroke="#FFFFFF" stroke-width="1" fill="#f45b5b"
																						rx="0" ry="0"></rect></g>
																					<g class="highcharts-markers highcharts-series-0"
																						zIndex="0.1"
																						transform="translate(61,45) scale(1 1)"
																						clip-path="none"></g></g>
																					<text x="562" text-anchor="middle"
																						class="highcharts-title" zIndex="4"
																						style="color:black;font-size:16px;font-weight:bold;fill:black;width:1059px;"
																						y="22">
																					<tspan>Payroll Department</tspan></text>
																					<g
																						class="highcharts-data-labels highcharts-series-0 highcharts-tracker"
																						zIndex="6" visibility="visible"
																						transform="translate(61,45) scale(1 1)"
																						opacity="1" style="">
																					<text x="83.33333333333333" y="79.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 83.33333333333333 79.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>23.7</tspan></text>
																					<text x="233.33333333333334" y="112.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 233.33333333333334 112.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>16.1</tspan></text>
																					<text x="384.3333333333333" y="120.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 384.3333333333333 120.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>14.2</tspan></text>
																					<text x="534.3333333333334" y="31.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 534.3333333333334 31.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>35</tspan></text>
																					<text x="684.3333333333334" y="127.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 684.3333333333334 127.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>12.5</tspan></text>
																					<text x="835.3333333333334" y="129.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 835.3333333333334 129.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>12.1</tspan></text>
																					<text x="985.3333333333334" y="155.5" r="0"
																						padding="5" zIndex="1"
																						transform="translate(0,0) rotate(-90 985.3333333333334 155.5)"
																						style="color:#FFFFFF;font-size:13px;font-weight:bold;text-shadow:0 0 3px black;font-family:Verdana, sans-serif;fill:#FFFFFF;text-rendering:geometricPrecision;"
																						text-anchor="end">
																					<tspan>5.8</tspan></text></g>
																					<g
																						class="highcharts-axis-labels highcharts-xaxis-labels"
																						zIndex="7">
																					<text x="139.20698652799885"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 139.20698652799885 232)"
																						y="232" opacity="1">
																					<tspan>Banglore</tspan></text>
																					<text x="289.4927008137131"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 289.4927008137131 232)"
																						y="232" opacity="1">
																					<tspan>Chennai</tspan></text>
																					<text x="439.7784150994273"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 439.7784150994273 232)"
																						y="232" opacity="1">
																					<tspan>Rajasthan</tspan></text>
																					<text x="590.0641293851417"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 590.0641293851417 232)"
																						y="232" opacity="1">
																					<tspan>Ajmer</tspan></text>
																					<text x="740.3498436708559"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 740.3498436708559 232)"
																						y="232" opacity="1">
																					<tspan>Mumbai</tspan></text>
																					<text x="890.6355579565702"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 890.6355579565702 232)"
																						y="232" opacity="1">
																					<tspan>Hyderabad</tspan></text>
																					<text x="1040.9212722422847"
																						style="color:#6e6e70;cursor:default;font-size:13px;font-family:Verdana, sans-serif;fill:#6e6e70;width:300px;text-overflow:ellipsis;"
																						text-anchor="end"
																						transform="translate(0,0) rotate(-45 1040.9212722422847 232)"
																						y="232" opacity="1">
																					<tspan>Delhi</tspan></text></g>
																					<g
																						class="highcharts-axis-labels highcharts-yaxis-labels"
																						zIndex="7">
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="220" opacity="1">0</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="135" opacity="1">20</text>
																					<text x="46"
																						style="color:#6e6e70;cursor:default;font-size:11px;fill:#6e6e70;width:361px;text-overflow:clip;"
																						text-anchor="end" transform="translate(0,0)"
																						y="50" opacity="1">40</text></g>
																					<g class="highcharts-tooltip" zIndex="8"
																						style="cursor:default;padding:0;pointer-events:none;white-space:nowrap;"
																						transform="translate(0,-9999)">
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.049999999999999996"
																						stroke-width="5" transform="translate(1, 1)"></path>
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.09999999999999999"
																						stroke-width="3" transform="translate(1, 1)"></path>
																					<path fill="none"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"
																						isShadow="true" stroke="black"
																						stroke-opacity="0.15" stroke-width="1"
																						transform="translate(1, 1)"></path>
																					<path fill="rgba(249, 249, 249, .85)"
																						d="M 3 0 L 13 0 C 16 0 16 0 16 3 L 16 13 C 16 16 16 16 13 16 L 3 16 C 0 16 0 16 0 13 L 0 3 C 0 0 0 0 3 0"></path>
																					<text x="8" zIndex="1"
																						style="font-size:12px;color:#333333;fill:#333333;"
																						y="20"></text></g>
																					<text x="1113" text-anchor="end" zIndex="8"
																						style="cursor:pointer;color:#909090;font-size:9px;fill:#909090;"
																						y="295">Highcharts.com</text></svg>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<!-- /.col-md-12 -->
										</div>
									</div>


								</div>


							</div>
						</div>
					</div>


					<!-- 						new code here -->



				</div>
				<!--=== Page Content ===-->
			</div>
		</div>

	
	<!-- /.container -->
	<!-- /.container -->
</body>

