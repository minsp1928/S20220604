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
			<div>
				<img alt="" src="${pageContext.request.contextPath}/upload/${list.pic_change }"> ${list.room_name} 
				<a href="insertParti?room_num=${list.room_num}">${list.room_name}</a> 
			</div>
			<hr>
		</c:forEach>
			<button onclick="location.href='openChatCreate'">오픈채팅만들기</button>
	<c:if test=""></c:if>
	</div>
</body>
</html>