<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makerMyPage</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>


    <c:if test="${member.m_level == 2}">
    <div class="container" align="center">
		<div class="row">	
	    <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-truck" viewBox="0 0 16 16">
			  <path d="M0 3.5A1.5 1.5 0 0 1 1.5 2h9A1.5 1.5 0 0 1 12 3.5V5h1.02a1.5 1.5 0 0 1 1.17.563l1.481 1.85a1.5 1.5 0 0 1 .329.938V10.5a1.5 1.5 0 0 1-1.5 1.5H14a2 2 0 1 1-4 0H5a2 2 0 1 1-3.998-.085A1.5 1.5 0 0 1 0 10.5v-7zm1.294 7.456A1.999 1.999 0 0 1 4.732 11h5.536a2.01 2.01 0 0 1 .732-.732V3.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5v7a.5.5 0 0 0 .294.456zM12 10a2 2 0 0 1 1.732 1h.768a.5.5 0 0 0 .5-.5V8.35a.5.5 0 0 0-.11-.312l-1.48-1.85A.5.5 0 0 0 13.02 6H12v4zm-9 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm9 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="makerOrderList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">판매진행중</font>
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
		        <a class="btn btn-secondary" href="makerRefundList">
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
		        <a class="btn btn-secondary" href="makerSellCompleteList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">판매완료</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
    </div><!-- /.row -->
<!--     <hr class="featurette-divider"> -->
    <div class="row">
	    <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16">
			  <path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z"/>
			  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="productBoardWriteForm">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">상품등록</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
	     <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
			  <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="myProductList">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">등록된 상품리스트</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
	     <div class="col-lg-2">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-file-earmark-person" viewBox="-1 0 16 16">
			  <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5v2z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="makerMyProfile">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">메이커프로필</font>
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	    </div>
		</div>
		</div>
	    </c:if>
	   
	   <c:if test="${member.m_level != 2}">
	   <div class="row">
 	   <div class="col-lg-10">
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-file-earmark-person" viewBox="-1 0 16 16">
			  <path d="M11 8a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2v9.255S12 12 8 12s-5 1.755-5 1.755V2a1 1 0 0 1 1-1h5.5v2z"/>
			</svg>
	        <p>
		        <a class="btn btn-secondary" href="makerMyProfile">
			        <font style="vertical-align: inherit;">
				        <font style="vertical-align: inherit;">
					        <font style="vertical-align: inherit;">
					        	<font style="vertical-align: inherit;">메이커프로필</font>
					        	
					        </font>
				        </font>
			        </font>
		        </a>
	        </p>
	        <h2>아직 메이커프로필이 등록되지않았어요 신청해보세요</h2>
	    </div>
	    </div>
	    </c:if>
    <!-- /END THE FEATURETTES -->
</div>

	<%-- 
	<c:if test="${member.m_level == 2}">
		<h2>판매진행중</h2>
		<a href="makerOrderList">판매진행중</a>
	
		<h2>취소승인</h2>
		<a href="makerRefundList">취소승인</a>
	
		<h2>판매완료</h2>
		<a href="makerSellCompleteList">판매완료</a>
		
		<h2>상품등록</h2>
		<a href="productBoardWriteForm">상품등록</a>
	
		<h2>나의 등록상품 조회</h2>
		<a href="myProductList">나의 등록상품 조회</a>
		
		<h2>메이커프로필</h2>
		<a href="makerMyProfile">메이커프로필</a>
	</c:if>
	
	<c:if test="${member.m_level != 2}">
		<h2>메이커프로필</h2>
		<a href="makerMyProfile">메이커프로필</a>	
	</c:if>
	 --%>
	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>