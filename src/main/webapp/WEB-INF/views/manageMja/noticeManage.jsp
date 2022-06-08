<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<h2>공지사항</h2>
	<c:set var="num" value="${paging.total - paging.start+1 }"></c:set>
	<table>
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
	 	<c:forEach var="list" items="${boardList }">
	 		<tr>
	 			<c:if test= "${list.board_category == 1}"><td>공지</td></c:if>
	 			<c:if test= "${list.board_category == 2}"><td>${num }</td></c:if>
	 		    <td><a href="noticeUpdateForm?board_num=${list.board_num }">${list.board_subject}</a></td>
	 		 	<td>${list.user_id}</td>
	 		 	<td><fmt:formatDate value="${list.board_reg_date }" pattern="yyyy-MM-dd"/></td>
	 		 	<td>${list.board_hits }</td></tr>
	 		 <c:set var="num" value="${num-1 }"></c:set> 
	 	</c:forEach>
	</table>
	
	<c:if test="${paging.startPage > paging.pageBlock}">
		<a href="noticeManage?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<a href="noticeManage?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.endPage <paging.totalPage }">
		<a href="noticeManage?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
	</c:if>
 
	<form action="writeNoticeForm">
		<input type="submit" value="새글등록">
	</form>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>