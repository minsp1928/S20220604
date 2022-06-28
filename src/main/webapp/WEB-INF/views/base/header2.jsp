<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/header2.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
	

		<div class="header_category">
			<img alt="카테고리드롭버튼" src="/img/menu_bar.png" id="header_category_button">
			<div class="dropdown_category_content">
				<div id="category_title">상품목록</div>
				<ul>
					<li><a href="productBoard?pro_type1=100&pro_type2=999" class="item"><div>채소</div></a></li>
              		<li><a href="productBoard?pro_type1=200&pro_type2=999" class="item"><div>과일</div></a></li>
              		<li><a href="productBoard?pro_type1=300&pro_type2=999" class="item"><div>곡류</div></a></li>
					<hr class="header_hr">
					<li><a href="productBoardBest" class="item"><div>베스트 상품</div></a></li>
					<li><a href="productBoardNew" class="item"><div>신상품</div></a></li>
					<p>
				</ul>
			</div>
		</div>
            
		<div class="header_middle">
		
			<div class = "header_middle_img">
				<a href="${pageContext.request.contextPath}/index?=${user_id}"><img alt="로고이미지" src="/img/logo_sajomarket.png" id="logo_img"></a>
			</div>
			<!-- <span class="search-input"> -->
			<%-- <form action="searchKeyword" class="searchKeyword">
				<div class="header_middle_searchbar">
					<div class="header_middle_searchbar_underline">
						<input type="text" name="keyword" id="searchbar" value="${keyword }" placeholder="검색어를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='검색어를 입력해주세요'" >
						<!-- <button type="submit">keyword검색</button>버튼이 필요한지 확인중 -->
					</div>
					
				</div>
			</form>	 --%>
		<!-- 	</span> --> 
			
		</div>
		
		<div class="header_login"><!--로그인-->
		<c:choose>
			<c:when test="${sessionId eq 'admin'}"><!--user_id가 있다면-->
				<div id="shopping_bascket">
				<a href="${pageContext.request.contextPath}/ShoppingBasketPage"><img alt="장바구니" src="/img/shoppingcart.png" id="shoppingcartimg"></a><!--장바구니로 이동-->
				</div>
				<div class="header_category_button_login">
               		<button id="header_category_button2">내정보</button>
					<div class="dropdown_category_content2">
					
					<ul>
					
						<li><a href="adminMain" class="item"><div>마이페이지</div></a></li>
						<li><a href="faq?user_id=${sessionId }" class="item"><div>1:1문의</div></a></li>
						<li><a href="notice" class="item"><div>공지사항</div></a></li>
						<li><a href="coupon" class="item"><div>쿠폰</div></a></li>
						<hr class="header_hr">
	                  	<li><a href="logout_button" class="item"><div>로그아웃</div></a></li>
					</ul>
				</div>	<!--마이페이지로 이동-->
				</div>
			</c:when>
			<c:when test="${sessionId ne null && sessionId ne 'admin'}"><!--user_id가 있다면-->
				<div id="shopping_bascket">
				<a href="${pageContext.request.contextPath}/ShoppingBasketPage"><img alt="장바구니" src="/img/shoppingcart.png" id="shoppingcartimg"></a><!--장바구니로 이동-->
				</div>
				<div class="header_category_button_login">
               		<button id="header_category_button2">내정보</button>
					<div class="dropdown_category_content2">
						<ul>
							<li><a href="shopperMyPage" class="item"><div>마이페이지</div></a></li>
							<li><a href="faq?user_id=${sessionId }" class="item"><div>1:1문의</div></a></li>
							<li><a href="notice" class="item"><div>공지사항</div></a></li>
							<li><a href="coupon" class="item"><div>쿠폰</div></a></li>
							<hr class="header_hr">
		                  	<li><a href="logout_button" class="item"><div>로그아웃</div></a></li>
						</ul>
					</div>	<!--마이페이지로 이동-->
				</div>
			</c:when>
			<c:otherwise>
			
				<a href="${pageContext.request.contextPath}login"><button id="login_button">로그인</button></a>
				<a href="${pageContext.request.contextPath}joinAgree"><button id="join_button">회원가입</button></a><!--회원가입으로 연결  -->
			</c:otherwise>
		</c:choose>
		</div>
		
	</header>
	
</body>
</html>