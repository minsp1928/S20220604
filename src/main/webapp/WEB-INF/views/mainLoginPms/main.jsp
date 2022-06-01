<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
	
	<h4>베스트 상품</h4><p>
	<div class="product_items1">
		<div class="row"> 
			<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
				<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
				<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
				<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
		</div>
	</div>
	<br>
	<br>
	
	<h4>NEW 신상품</h4><p>
	<div class="product_items1">
		<div class="row"> 
			<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
				<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
				<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
				<div class="col-lg-3 col-md-6">
				<div class="card" style="width: 18rem;">
				  <img alt= "상품메인이미지" src="/img/pro_main_photo1.jpg" class="card-img-top" alt="...">
				  <div class="card-body">
				  	<h5 class="card_title">상품이름</h5>
				    <p class="card-text">상품가격</p>
				    <a href="#" class="btn btn-primary">상품상세페이지로 이동</a>
				  </div>
				 </div>
			</div>
	
		</div>
	</div>

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>