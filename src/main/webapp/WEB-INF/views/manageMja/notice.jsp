<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/notice.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
	<div class="row">
		<div class="col-12 col-lg-8 offset-lg-2" id="one">
 			<h2>공지사항</h2>
			<c:set var="num" value="${paging.total - paging.start+1 }"></c:set>
			<table class="table" id="tbl">
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
				</tr>
	 			<c:forEach var="list" items="${boardList }">
	 			<tr>
	 				<c:if test= "${list.board_category == 1}"><td>공지</td></c:if>
	 				<c:if test= "${list.board_category == 2}"><td>${num }</td></c:if>
	 		    	<td><a href="noticeDetail?board_num=${list.board_num }">${list.board_subject}</a></td>
	 		 		<td>${list.user_id}</td>
	 		 		<td><fmt:formatDate value="${list.board_reg_date }" pattern="yyyy-MM-dd"/></td>
	 		 		<td>${list.board_hits }</td></tr>
	 		 	<c:set var="num" value="${num-1 }"></c:set> 
	 			</c:forEach>
			</table>
	
			<div id="two">
				<c:if test="${paging.startPage > paging.pageBlock}">
					<a href="notice?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a href="notice?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${paging.endPage <paging.totalPage }">
					<a href="notice?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>