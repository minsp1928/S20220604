<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<link href="css/mja/sellManage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header2.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<div class="container">
	<div class="row">	
		<div class="col-md-2" id="sidebar">
   			<a href="adminMain" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
     				<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
     					<span class="fs-4">Admin</span>
   			</a>
   			<hr>
   			<ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="sellManage?month=0&year=0" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	판매관리
		        </a>
		      </li>
		      <li>
		        <a href="memberManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	회원관리
		        </a>
		      </li>
		      <li>
		        <a href="noticeManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	공  지
		        </a>
		      </li>
		      <li>
		        <a href="couponManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	쿠  폰
		        </a>
		      </li>
		      <li>
		        <a href="bannerManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	배  너
		        </a>
		      </li>
		      <li>
		        <a href="faqManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	1:1문의
		        </a>
		      </li>
		      <li>
		        <a href="chat?user_id&admin" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	채  팅
		        </a>
		      </li>
		    </ul>	 
		</div>
		
		<div class="col-md-10" id="main">
		
			<div id="title">매출현황</div><p><p>	
		
			<div class="row" id="day">		 
				<div class="col-md-1 offset-md-3"><a href="sellManage?month=${month }&year=${year-1}">◀</a></div>
				<div class="col-md-1"><input type="text" name="year" id="Ayear" value="${year }"></div>
				<div class="col-md-1"><a href="sellManage?month=${month }&year=${year+1}">▶</a></div>
			    <div class="col-md-1"><a href="sellManage?month=${month-1 }&year=${year}">◀</a></div>
			    <div class="col-md-1"><input type="text" name="month" id="Amonth" value="${month }"></div>
			    <div class="col-md-1"><a href="sellManage?month=${month+1 }&year=${year}">▶</a></div>	 	 		 	
			</div><p>
			<div class="row" id="chart">
				<div class="col-8 col-md-6">
					<div class="yearChart">
						<canvas id="canvasYear"></canvas>
					</div>
				</div>
				<div class="col-4 col-md-6">	
					<div class="monthChart">
						<canvas id="canvasMonth"></canvas>
					</div>
				</div>
			</div>
			<div class="sellDiv">판매자별 매출 순위</div>
				<div class="sell">
					<table class="table" id="selltbl">
						<tr><th>순위</th><th>상호명</th><th>판매자</th><th>매출액</th><th>사업장</th><th>연락처</th></tr>
						<c:forEach var="seller" items="${list }">
						<tr><td>${num }</td>
							<td>${seller.sell_name }</td>
							<td>${seller.user_name }</td>
							<td><fmt:formatNumber value="${seller.income}" pattern="#,###"/>원</td>
							<td>${seller.sell_addr1}</td>
							<td>${seller.sell_tel }</td>
						</tr>
						<c:set var="num" value="${num+1 }"></c:set>
						</c:forEach>
					</table>
				</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	var year = $('#Ayear').val();
	var month = $('#Amonth').val();	
	
	//alert("첫번째");
	var chartLabels = [];
	var chartData   = [];
	
	//일별 합계
	$.ajax({
	    url: "<%=context%>/yearIncome",
	    data: {year : year, month: month},
	    dataType: "json",
	    success: function (data) {
			$.each(data, function (inx, obj) {
				chartLabels.push(obj.incomedatey);
				chartData.push(obj.toty);
			});
			createYearChart();
			console.log("createYearChart")
		}
	});

	var lineChartData = {
			labels :chartLabels,
			datasets : [
				{
					label : "월별합계",
					fillColor : "#1c3316",
					strokeColor : "#5d6d68 ",
					pointColor : "#b0d282",
					pointStrokeColor : "#f4f1e9",
					pointHighlightFill : "#f4f1e9",
					pointHighlightStroke : "#a6d377",
					data : chartData
				}
				
			]
	}
	
	function createYearChart(){
	
		let ctx = document.getElementById("canvasYear").getContext("2d");
		
		let barChart = new Chart(ctx, {
			type : 'bar',
			data : lineChartData
		})
	}	
	

	var year = $('#Ayear').val();
	var month = $('#Amonth').val();	
	
	//alert("두번째");
	var chartLabels2 = [];
	var chartData2   = [];

	//일별 합계
	$.ajax({
	    url: "<%=context%>/monthIncome",
	    data: {year : year, month: month},
	    dataType: "json",
	    success: function (data) {
			$.each(data, function (inx, obj) {
				chartLabels2.push(obj.incomedatem);
				chartData2.push(obj.totm);
			});
			createMonthChart();
			console.log("createMonthChart")
		}
	});
	
	var lineChartData2 = {
			labels :chartLabels2,
			datasets : [
				{
					label : "일별합계",
					fillColor : "#b0d282",
					strokeColor : "#b0d282",
					pointColor : "#b0d282",
					pointStrokeColor : "#a6d377",
					pointHighlightFill : "#a6d377",
					pointHighlightStroke : "#a6d377",
					data : chartData2
				}
				
			]
	}
	
	function createMonthChart(){

		let ctx2 = document.getElementById("canvasMonth").getContext("2d");
		
		let barChart2 = new Chart(ctx2, {
			type : 'bar',
			data : lineChartData2
		})
	}	
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>