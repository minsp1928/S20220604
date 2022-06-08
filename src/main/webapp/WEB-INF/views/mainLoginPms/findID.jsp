<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findID</title>
<link href="css/findID.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>
	<div class="findID">
		<form action="findIdBtn" name="findIdBtn">
				<a href="${pageContext.request.contextPath}/findID">아이디찾기 </a> / <a href="${pageContext.request.contextPath}/findPW">비밀번호찾기 </a> 
				<p>이름</p>
				<input type="text" name="user_name" id="findName" placeholder="이름을 입력해주세요">
				<p>이메일</p>
				<input type="text" name="email" id="findEmail" placeholder="이메일을 입력해주세요">
				<input type="submit" class="idSearch" value="확인"><p>
				<!-- <button id="findID_btn" type="button" onclick="idSearch">확인</button><p> -->
		</form>
		<a href="${pageContext.request.contextPath}login"><button id="login_button">로그인</button></a>
	</div>
	
	<!--아이디는 갖고오는데 값을 안보여줌-->
	
	<!--일치하지 않는경우  -->
	<c:if test="${result == 1 }">ㅁㅁ
		<script>
				opener.document.findform.user_name.value = "";
				opener.document.findform.email.value = "";
			</script>
			<label class="text_label">일치하는 정보가 존재하지 않습니다.</label>
		</c:if>
	
	<!--일치 하는 경우-->
	<c:if test="${check == 0 }">
		<label class="text_label">찾으시는 아이디는' ${user_id}' 입니다.</label>
		<div>
			<input class="chk_btn"
				type="button" value="확인" onclick="closethewindow()">
		</div>
	</c:if>


<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>