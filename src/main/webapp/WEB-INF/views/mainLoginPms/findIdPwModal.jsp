<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findIdPwModal</title>
</head>
<script type="text/javascript">
	$(function () {
		$("#found_modalbtn").click(function(){
			$(".foundback_modal").fadeIn();
		});
		$("#found_userid").click(function(){
			$(".foundback_modal").fadeOut();
		});
	});
</script>

<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>
	<c:choose>
		<c:when test="${user_id ne null }"><!--user_id가 있다면-->
			<button id="found_modalbtn">모달창테스트</button>
				<div class="foundback_modal">
					<div class="found_userid">
						모달창 내용
						아이디는 $user_id 입니다
						이런거 하고프다
					</div>
				</div>
		</c:when>
		<c:when test=${user_id ne null }"></c:when>
	</c:choose>

	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>