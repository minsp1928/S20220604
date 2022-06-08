<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
$(document).ready(function () {
	const pathArr = location.pathname.split("/");
	const storeId = pathArr[pathArr.length - 1];
	
	const dataInput = document.getElementById("date");
	dataInput.valueAsDate = new Date();
	//getDetail이 true일때 상세보기 가능
	let getDetail = true;
	
	function graphDraw(data, format, title){
		let html = "";
		for(i = 0; i < data.length-1; i++){
			html += 
		}
	} 
})

</script>
<title>Insert title here</title>
<link  href="css/mja/sales.css"  rel="stylesheet" type="text/css">
	<main>
		<section>
  			<div class="today">
  				<span>
  					<span>오늘 매출</span>
  					<span id="today"></span>
  				</span>
  				
  				<button>상세보기</button>
  				
  			</div>
  			
  		</section>
  		
		<section class="detail today_detail">
  			<div>
				<h3 class="sales_today_detail_title">
					<span>매출 상세</span>
					<span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
				</h3>
				
  				<div class="sales_today_detail">
  					<div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div>
  				</div>
  			</div>
  		</section>
	
	
		<section class="graph_section" onselectstart="return false;" > 
			<div class="box">
				<button class="year_btn">연 매출</button>
				<button class="month_btn">이번 달 매출</button>
				<button class="week_btn">이번 주 매출</button>
				<input type="month"name="date" id="date">
				<button class="other_month_search">검색</button>
			
				<h1>1월 총 합계</h1>
				
				<div>(단위 : 만원)</div>
				<div class="graph_box">
					<ul>
					<!-- 
						<li>
							<span class="sales"></span>
							<div class="graph"></div>
							<span class="graph_date"></span>
						</li>
						 -->
					</ul>
				
					<div class="graph_background">
						<div></div>
						<div></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
				</div>
			
			</div>
		</section>
		
		<section class="detail other_detail">
  			<div>
  				<h3 class="sales_today_detail_title">
  					<span id="other_detail_date"></span>
  					<span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
  				</h3>
  				<div class="sales_today_detail">
  					<!-- <div>메뉴</div>
  					<div>수량</div>
  					<div>가격</div> -->
  				</div>
  			</div>
  		</section>
  		
	</main>
</body>
</html>
