<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<div>
		<c:forEach var="list" items="${openChatList }">
		<div>	사진: <img alt="" src="${pageContext.request.contextPath}/upload/${list.pic_change }"> 제목 : ${list.room_name} </div>
			<hr>
		</c:forEach>
	<c:if test=""></c:if>
	</div>
</body>
</html>