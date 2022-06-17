<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>

	<c:if test="${msg!=null}">
		${msg}
	</c:if>
	<div class="login_box">
		<h3 class="login_title">로그인</h3><p>
		
		<form action="loginbtn" name="loginbtn">
			<div class="login_id">
				<input type="text" id="user_id" name="user_id" class="text" required="required" placeholder="아이디를 입력하세요">
			</div>
			<div class="login_pw">
				<input type="password" id="user_pw" name="user_pw" class="text" required="required" placeholder="비밀번호를 입력하세요">
			</div>
			<button id="login_btn" onclick="login_btn()">로그인</button><p>
		</form>
	<script type="text/javascript">
	/*-------------아이디확인*-------------*/

		
		
		  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
			  <!-- 네이버 로그인 버튼 노출 영역 -->
			  <div id="naver_id_login"></div>
			  <!-- //네이버 로그인 버튼 노출 영역 -->
			  <script type="text/javascript">
			  	var naver_id_login = new naver_id_login("bGVedUORbqhUvX1hZlzP", "http://localhost:8989/S20220604/mainLoginPms/naverCallback");
			  	var state = naver_id_login.getUniqState();
			  	naver_id_login.setButton("white", 2,40);
			  	naver_id_login.setDomain("http://localhost:8989/S20220604/mainLoginPms/login");
			  	naver_id_login.setState(state);
			  	naver_id_login.setPopup();
			  	naver_id_login.init_naver_id_login();
			  </script>
		
		
		<div class="find_idPw">
			<a href="${pageContext.request.contextPath}/findID" id="find_id">아이디</a> /
			<a href="${pageContext.request.contextPath}/findPW" id="find_pw">비밀번호 찾기</a><!--아이디는 이름과 이메일을 입력하면 그냥 뜨게 하는것으로(할 수있다면 2~3자리 뒤는 *표 표시  -->
		</div>			
											<!--비밀번호는 이름, 아이디, 이메일을 입력하면  이메일 주소로 랜덤값 보내고 비번 업데이트, 비번바꾸라고 알러트띄우기  -->
		
		<a href="${pageContext.request.contextPath}joinAgree">회원가입></a><!--join으로 이동-->
		
	</div>
	
	
		<!--네이버, 카카오톡 로그인 버튼-->




<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>