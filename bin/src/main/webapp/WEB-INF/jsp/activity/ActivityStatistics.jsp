<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../admin/AdminstyleHead.jsp"%>
	<!-- Chart.js v2.4.0 -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>

	<div class="row">
		<div class="col-xl-8 col-lg-7">
			<!-- Donut Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Donut Chart</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div class="chart-pie pt-4">
							<div class="chartjs-size-monitor">
								<div class="chartjs-size-monitor-expand">
									<div class=""></div>
								</div>
								<div class="chartjs-size-monitor-shrink">
									<div class=""></div>
								</div>
							</div>
							<canvas id="myPieChart"
								style="display: block; height: 253px; width: 358px;" width="447"
								height="316" class="chartjs-render-monitor"></canvas>
						</div>
						<hr>
						
					</div>
				</div>
			</div>
		</div>
	</div>


		<script>
			var activity = ${activity};
			console.log(activity);

			var xValues = [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
					"九月", "十月", "十一月", "十二月" ];
			var yValues = [ activity[0], activity[1], activity[2], activity[3],
					activity[4], activity[5], activity[6], activity[7],
					activity[8], activity[9], activity[10], activity[11] ];
			var barColors = [ "#b91d47", "#00aba9", "#2b5797", "#e8c3b9",
					"#1e7145", "#0d6efd", "#6610f2", "#6f42c1", "#d63384",
					"#20c997", "#fd7e14", "#ffc107" ];

			new Chart("myPieChart", {
				type : "pie",
				data : {
					labels : xValues,
					datasets : [ {
						backgroundColor : barColors,
						data : yValues
					} ]
				},
				options : {
					title : {
						display : false,
						text : "World Wide Wine Production 2018"
					}
				}
			});

			var ctx = document.getElementById("myPieChart");
			var myPieChart = new Chart(ctx, {
				type : 'doughnut',
				data : {
					labels : [ "一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月",
							"九月", "十月", "十一月", "十二月" ],
					datasets : [ {
						data : [ activity[0], activity[1], activity[2],
								activity[3], activity[4], activity[5],
								activity[6], activity[7], activity[8],
								activity[9], activity[10], activity[11] ],
						backgroundColor : [ '#4e73df', '#1cc88a', '#36b9cc' ],
						hoverBackgroundColor : [ '#2e59d9', '#17a673',
								'#2c9faf' ],
						hoverBorderColor : "rgba(234, 236, 244, 1)",
					} ],
				},
				options : {
					maintainAspectRatio : false,
					tooltips : {
						backgroundColor : "rgb(255,255,255)",
						bodyFontColor : "#858796",
						borderColor : '#dddfeb',
						borderWidth : 1,
						xPadding : 15,
						yPadding : 15,
						displayColors : false,
						caretPadding : 10,
					},
					legend : {
						display : false
					},
					cutoutPercentage : 80,
				},
			});
		</script>

		<%@ include file="../admin/AdminstyleFoot.jsp"%>
</body>
</html>