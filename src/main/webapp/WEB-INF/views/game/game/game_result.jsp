<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<div id="chart_div"></div>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current',{'packages': [ 'corechart' ] });
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ '기간', '도박중독자', '도박관리자' ], [ '횟수', 2000, 0 ],
				[ '1', 1600, 400 ], [ '2', 1300, 700 ],
				[ '3', 1100, 900 ],	[ '4', 950, 1050 ], 
				[ '5', 800, 1200 ], [ '6', 700, 1300 ], 
				[ '7', 600, 1400 ],	[ '8', 500, 1500 ],
				[ '9', 400 ,1600 ] 
				]);

		var options = {
			title : 'Company Performance',
			curveType : 'function',
			legend : {
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
</script>
</head>
<body>
<div id="curve_chart" style="width: 900px; height: 500px">
</div>
</body>

</html>