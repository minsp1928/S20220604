<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="css/header.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
	<header>
	
<!-- <div class="menu"> css체크용

    <div class="">메뉴</div><p><p>
    <ul>
        <li><a href="#" class="item"><div>프로필</div></a></li>
        <li><a href="#" class="item"><div>데이터사용량</div></a></li>
    </ul>
</div> -->

<!-- <div class="dropdown">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
    Dropdown
  </button>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">S
    <li><button class="dropdown-item" type="button">Action</button></li>
    <li><button class="dropdown-item" type="button">Another action</button></li>
    <li><button class="dropdown-item" type="button">Something else here</button></li>
  </ul>
</div> -->
		<div class="header_category">
			<img alt="카테고리드롭버튼" src="/img/menu_bar.png" id="header_category_button">
			<div class="dropdown_category_content">
				<div id="category_title">상품목록</div>
				<ul>
					<li><a href="#" class="item"><div>채소</div></a></li>
					<li><a href="#" class="item"><div>과일</div></a></li>
					<li><a href="coupon" class="item"><div>곡류</div></a></li>
					<hr>
					<li><a href="#" class="item"><div>베스트 상품</div></a></li>
					<li><a href="#" class="item"><div>신상품</div></a></li>
					<p>
				</ul>
			</div>
		</div>
            
		<div class="header_middle">
			<!-- <span class="search-input"> -->
				<div class="header_middle_searchbar">
					<div class="header_middle_searchbar_underline">
						<input type="text" name="searchbar" id="searchbar" placeholder="Search" onfocus="this.placeholder=''" onblur="this.placeholder='Search'" >
					</div>
				</div>
				
		<!-- 	</span> --> 
			<div class = "header_middle_img">
				<a href="${pageContext.request.contextPath}/main?=${user_id}"><img alt="로고이미지" src="/img/logo_sajomarket.png" id="logo_img"></a>
			</div>
		</div>
		
		<div class="header_login"><!--로그인-->
		<c:choose>
			<c:when test="${user_id ne null }"><!--user_id가 있다면-->
				<div id="shopping_bascket">
				<a href="#">장바구니 이미지 넣으세영</a><!--장바구니로 이동-->
				</div>
				<div class="header_category">
					<img alt="카테고리드롭버튼" src="/img/menu_bar.png" id="header_category_button">
					<div class="dropdown_category_content">
					<div id="header_category_button">내정보</div>
					<ul>
						<li><a href="adminMain" class="item"><div>마이페이지</div></a></li>
						<li><a href="faq?user_id=" class="item"><div>1:1문의</div></a></li>
						<li><a href="notice" class="item"><div>공지사항</div></a></li>
						<li><a href="coupon" class="item"><div>쿠폰</div></a></li>
						<p><p><p><p>
						<li>
							<form action="logout_button" name="logout_button">
								<button id="logout_button">로그아웃</button><!--아이디 비우기-->

							</form>
						</li>
						<p><p><p><p>
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
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>