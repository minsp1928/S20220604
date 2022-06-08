<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#monthChart {
width: 800px;
height: 600px;
}
#aa{
	display: inline-block;
}
#bb{
	display: inline-block;
}
</style>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>


</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<h1>매출현황</h1>
<div id="monthChart">
 	<div id="aa">
		<a href="sellManage?month=${month }&year=${year-1}">◀</a><input type="text" name="year" id="Ayear" value="${year }">
		<a href="sellManage?month=${month }&year=${year+1}">▶</a>
	 </div>
	 <div id="bb">
	    <a href="sellManage?month=${month-1 }&year=${year}">◀</a><input type="text" name="month" id="Amonth" value="${month }">
	    <a href="sellManage?month=${month+1 }&year=${year}">▶</a>
	 </div>
	
	
	<div >
		<canvas id="canvasMonth"></canvas>
	</div>
</div>
<h1>판매자별 매출 순위</h1>
<div>
	
	
</div>

<script type="text/javascript">
	
	var year = $('#Ayear').val();
	var month = $('#Amonth').val();	
 	alert("year:"+ year);
 	alert("month : " + month);
 	
	var chartLabels = [];
	var chartData   = [];

	//일별 합계
	$.ajax({
	    url: "<%=context%>/monthIncome",
	    data: {year : year, month: month},
	    dataType: "json",
	    success: function (data) {
			$.each(data, function (inx, obj) {
				chartLabels.push(obj.incomedate);
				chartData.push(obj.tot);
			});
			createMonthChart();
			console.log("createMonthChart")
		}
	});
	
	
	var lineChartData = {
			labels :chartLabels,
			datasets : [
				{
					label : "일별합계",
					fillColor : "rbga(151,187,205,0.2)",
					strokeColor : "rbga(151,187,205,1)",
					pointColor : "rbga(151,187,205,1)",
					pointStrokeColor : "#fff",
					pointHighlightFill : "#fff",
					pointHighlightStroke : "#a6d377",
					data : chartData
				}
				
			]
	}
	
	function createMonthChart(){

		let ctx = document.getElementById("canvasMonth").getContext("2d");
		
		let barChart = new Chart(ctx, {
			type : 'bar',
			data : lineChartData
		})
	}	
</script>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>