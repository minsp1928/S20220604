<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<h2>1:1 문의하기 </h2>
 	<table>
		<tr><th>번호</th><th>유형</th><th>제목</th><th>작성자</th><th>답변</th></tr>
	 	<c:forEach var="list" items="${faqList }">
	 		<tr><td>${num }</td>
	 			<c:if test= "${list.faq_category == 1}"><td>개인정보</td></c:if>
	 			<c:if test= "${list.faq_category == 2}"><td>신고</td></c:if>
	 			<c:if test= "${list.faq_category == 3}"><td>기타</td></c:if>
	 		    <td><a href="faqDetail?faq_num=${list.faq_num }">${list.faq_subject}</a></td>
	 		 	<td>${list.user_id}</td>
	 		 	<c:if test="${list.faq_check == 1}"><td>답변완료</td></c:if>
	 		 	<c:if test="${list.faq_check == 0}"><td>답변대기</td></c:if></tr>
	 		 <c:set var="num" value="${num-1 }"></c:set> 
	 	</c:forEach>
	</table>
	
	<c:if test="${paging.startPage > paging.pageBlock}">
		<a href="faqManage?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
	</c:if>
	<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
		<a href="faqManage?currentPage=${i }">[${i }]</a>
	</c:forEach>
	<c:if test="${paging.endPage <paging.totalPage }">
		<a href="faqManage?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
	</c:if>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>