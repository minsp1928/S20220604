<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>
로그인
아이디를 입력하세요
비밀번호를 입력하세요
아이디 / 비밀번호찾기
로그인
회원가입
<h3 class="login_title">로그인</h3>
	<div class="login_id">
		<input type="text" name="user_id" class="text" required="required" placeholder="아이디를 입력하세요">
	
	</div>
	<div class="login_pw">
		<input type="password" name="user_ps" class="text" required="required">
	</div>
	<div class="find_idPw">
		<a href="#">아이디</a> / <a href="#">비밀번호 찾기</a><!--아이디는 이름과 이메일을 입력하면 그냥 뜨게 하는것으로(할 수있다면 2~3자리 뒤는 *표 표시  -->
	</div>												<!--비밀번호는 이름, 아이디, 이메일을 입력하면  이메일 주소로 랜덤값 보내고 비번 업데이트, 비번바꾸라고 알러트띄우기  -->
	<input type="button" >




<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>