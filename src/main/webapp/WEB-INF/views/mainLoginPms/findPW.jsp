<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPW</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>

<div class="findPW">
		<form action="findPwBtn" name="findPwBtn">
				<a href="/findID">아이디찾기 </a> / <a href="/findPW">비밀번호찾기 </a> 
				<p>이름</p>
				<input type="text" name="inputName" id="inputName" class="custom-control-input"
					 placeholder="이름을 입력해주세요">
				<p>아이디</p>
				<input type="text" name="inputId" id="inputId" class="custom-control-input"
					 placeholder="아이디를 입력해주세요">
				<p>이메일</p>
				<input type="text" name="inputEmail" id="inputEmail" class="custom-control-input"
					 placeholder="이메일을 입력해주세요">
				<!-- <input type="submit" class="idSearch" value="확인"><p> -->
				<button id="findID_btn" type="button" onclick="searchPW()">확인</button><p>
		</form>
		<a href="${pageContext.request.contextPath}login"><button id="login_button">로그인</button></a>
	</div>


<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>