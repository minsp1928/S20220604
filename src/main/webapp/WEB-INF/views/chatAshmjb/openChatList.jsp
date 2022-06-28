<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/openChatAsh.css"  rel="stylesheet" type="text/css"> 
<script type="text/javascript">
	window.opener.location.reload();
</script>
</head>
<body>	
	<div>
		<div class="createOpenChatBtnDiv">
			<button class="btn openChatBtn" onclick="location.href='openChatCreate'">오픈채팅만들기</button>
		</div>
	
		<c:forEach var="list" items="${openChatList }">
			<div class="ListWrap">
				<img class="ListImg" alt="" src="${pageContext.request.contextPath}/upload/${list.pic_change }" > 
				<a class="ListAtag" href="insertParti?room_num=${list.room_num}">${list.room_name}</a> 
			</div>
			<hr>
		</c:forEach>
			<div class="pageNum">
				<c:if test="${pg.startPage > pg.pageBlock }">
					<a href="openChatList?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
					<a href="openChatList?currentPage=${i}">[${i}] </a>
				</c:forEach>
				<c:if test="${pg.endPage < pg.totalPage }">
					<a href="openChatList?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
				</c:if>
			</div>
		<!-- <button class="windowCloseBtn" onclick="window.close();">닫기</button> -->
	</div>
</body>
</html>