<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
<link href="https://getbootstrap.kr/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

<div class="container" align="center">
		<div class="row">	
	    <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
			  <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperOrderList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">구매진행중</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
	     <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-cart-x" viewBox="0 0 16 16">
			  <path d="M7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z"/>
			  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperRefundList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">취소완료</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
	     <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-cart-check" viewBox="0 0 16 16">
			  <path d="M11.354 6.354a.5.5 0 0 0-.708-.708L8 8.293 6.854 7.146a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0l3-3z"/>
			  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperPurchaseCompletedList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">구매완료</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
    </div><!-- /.row -->
    <div class="row">
	    <div class="col-lg-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-bag-heart" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M10.5 3.5a2.5 2.5 0 0 0-5 0V4h5v-.5Zm1 0V4H15v10a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4h3.5v-.5a3.5 3.5 0 1 1 7 0ZM14 14V5H2v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1ZM8 7.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperMyCheckProductList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">위시리스트</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
	     <div class="col-lg-3">
			<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="120" height="120" enable-background="new 0 0 32 32" version="1.1" viewBox="0 0 32 32" xml:space="preserve">
			<g id="Layer_1"/><g id="Layer_2"><g><polyline fill="none" points="    2,7 2,6 30,6 30,26 2,26 2,17   " stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"/>
			<line fill="none" stroke="#000000" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" x1="7" x2="7" y1="6" y2="10"/>
			<line fill="none" stroke="#000000" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" x1="7" x2="7" y1="14" y2="26"/>
			<circle cx="7" cy="12" fill="none" r="2" stroke="#000000" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"/>
			<polyline fill="none" points="9,13 12,14     12,10 9,11   " stroke="#000000" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"/>
			<polyline fill="none" points="5,13 2,14 2,10     5,11   " stroke="#000000" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"/>
			<line fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" x1="21" x2="21" y1="10" y2="12"/>
			<line fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2" x1="21" x2="21" y1="20" y2="22"/>
			<path d="    M19,20h3c1.1,0,2-0.9,2-2s-0.9-2-2-2h-2c-1.1,0-2-0.9-2-2s0.9-2,2-2h3" fill="none" stroke="#000000" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10" stroke-width="2"/>
			</g></g>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperMyCouponList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">My쿠폰</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
	     <div class="col-lg-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-chat-left-text" viewBox="0 0 16 16">
			  <path d="M14 1a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H4.414A2 2 0 0 0 3 11.586l-2 2V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12.793a.5.5 0 0 0 .854.353l2.853-2.853A1 1 0 0 1 4.414 12H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
			  <path d="M3 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 6a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 6zm0 2.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperMyReviewList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">My리뷰</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
 	   <div class="col-lg-3">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-file-earmark-person" viewBox="-1 0 16 16">
			  <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5v2z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="shopperMyProfile">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">My프로필(쇼퍼)</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div></div>
    <!-- /END THE FEATURETTES -->
</div>

<!-- 
			<h2>구매진행중</h2>
			<a href="shopperOrderList">구매진행중</a>
		
			<h2>취소완료</h2>
			<a href="shopperRefundList">취소완료</a>
		
			<h2>구매완료</h2>
			<a href="shopperPurchaseCompletedList">구매완료</a>
		
			<h2>위시리스트</h2>
			<a href="shopperMyCheckProductList">위시리스트</a>
		
			<h2>쿠폰</h2>
			<a href="shopperMyCouponList">쿠폰</a>
		
			<h2>My리뷰</h2>
			<a href="shopperMyReviewList">>My리뷰</a>
			
			<h2>My프로필(쇼퍼)</h2>
			<a href="shopperMyProfile">My프로필(쇼퍼)</a>
			
 -->
	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>