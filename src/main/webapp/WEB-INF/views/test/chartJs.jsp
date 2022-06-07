<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id="myChartOne"></canvas>
			</div>
		</div>
		
		<div class="row"> 
			<div class="col-md-6">
				<canvas id="myChartTwo"></canvas>
			</div>
		</div>
	</div>
<script type="text/javascript">
	let myChartOne = document.getElementById('myChartOne').getContext('2d');
	 
	let barChart = new Chart(myChartOne, {
		type : 'bar',		//그래프 종류
		data : {
			labels : ['학원','연구원','출판사', '미디어사','위니브'],
			datasets : [ {
				label : '바울랩 매출액',
				data : [
					10, 100, 100, 200, 1000
					
				]
			}]
		}
	})

</script>
</body>
</html>