<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<script type="text/javascript">
	var chartLabels = [];
	var chartData = [];
	
	$.getJSON("<%=context%>/incomeList", function (data) {
		$.each(data, function (inx, obj) {
			chartLabels.push(obj.dd);
			chartData.push(obj.income);
		});
		createChart();
		console.log("create Chart")
	});
	
	var lineChartData = {
			labels :chartLabels,
			datasets : [
				{
					label : "Date Income",
					fillColor : "rbga(151,187,205,0.2)",
					strokeColor : "rbga(151,187,205,1)",
					pointColor : "rbga(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "rbga(151,187,205,1)",
					data : chartData
				}
				
			]
	}
	
	function createChart(){

		let ctx = document.getElementById("canvas").getContext("2d");
		
		let barChart = new Chart(ctx, {
			type : 'bar',
			data : lineChartData
		})
	}	
		

</script>
</head>
<body>
<h1>dateIncome</h1>
<div style="width:60%">
	<div>
		<canvas id="canvas" height="450" width="600"></canvas>
	</div>
</div>
</body>
</html>