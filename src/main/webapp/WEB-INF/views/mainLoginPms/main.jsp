<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이거사조마켓</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<div id = coupon_evt>
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"> <!--각각 쿠폰,공지사항으로 가는 이미지링크 -->
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img alt= "쿠폰이벤트배너" src="/img/coupon_banner.jpg" id="coupon_banner_img"class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		      <img alt= "쿠폰이벤트배너" src="/img/coupon_banner.jpg" id="coupon_banner_img"class="d-block w-100">
		    </div>
		    <div class="carousel-item">
		      <img alt= "쿠폰이벤트배너" src="/img/coupon_banner.jpg" id="coupon_banner_img"class="d-block w-100">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	</div>
	<br>
	<br>
	<button onclick="location.href='chat'">채팅버튼</button>
<<<<<<< HEAD
    <button onclick="location.href='chatWithCeller'">판매자 문의하기</button>

=======
	<button onclick="location.href='chatWithCeller'">판매자 문의하기</button>
>>>>>>> origin/chat-ashmjb
	<h4>베스트 상품</h4><p>
	<div class="product_bestTop4list">
		<div class="row"> 
			<c:forEach var="product_bestTop4list" items="${product_bestTop4list }">
				<div class="col-lg-3 col-md-6">
					<div class="card" style="width: 18rem;">
					  <img alt= "상품메인이미지" src="/img/${product_bestTop4list.pro_photo}" class="card-img-top" alt="...">
					  <div class="card-body">
					  	<h5 class="card_title">${product_bestTop4list.pro_title}</h5>
					    <p class="card-text">${product_bestTop4list.pro_price}원</p>
					    <a href="productDetails?pro_num=${product_bestTop4list.pro_num}" class="btn btn-primary">상품상세페이지</a>
					  </div>
					 </div>
				</div>
			</c:forEach>	
			<c:set var="num" value="${num - 1 }"></c:set>
		</div>
	</div>
	<!-------------베스트 상품------------>
	<br>
	<br>
	<br>
	<br>
	
	<h4>NEW신상품</h4><p>
	<div class="product_newTop4list">
		<div class="row"> 
			<c:forEach var="product_newTop4list" items="${product_newTop4list }">
				<div class="col-lg-3 col-md-6">
					<div class="card" style="width: 18rem;">
					  <img alt= "상품메인이미지" src="/img/${product_newTop4list.pro_photo}" class="card-img-top" alt="...">
					  <div class="card-body">
					  	<h5 class="card_title">${product_newTop4list.pro_title}</h5>
					    <p class="card-text">${product_newTop4list.pro_price}원</p>
					    <a href="productDetails?pro_num=${product_newTop4list.pro_num}" class="btn btn-primary">상품상세페이지</a>
					  </div>
					 </div>
				</div>
			</c:forEach>	
			<c:set var="num" value="${num - 1 }"></c:set>
		</div>
	</div>
	


<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>