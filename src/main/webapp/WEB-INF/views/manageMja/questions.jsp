<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/mja/questions.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container" id="one">

	<span id="fafa"><a href="faq?user_id=${sessionId}">문의하기</a></span>  
	<span id="fafa"><a href="questions?user_id=${sessionId}">문의내역</a></span>
	
<h2>나의 문의 내역</h2>
	<c:choose>
		<c:when test="${tot < 1 }">
			문의내역이 없습니다.
		</c:when>
		<c:otherwise>
		 	<table class="table">
				<tr><th>문의번호</th><th>유형</th><th>제목</th><th>답변</th><th>작성일</th></tr>
			 	<c:forEach var="list" items="${faqList }">
			 		<tr><td>${list.faq_num}</td>
			 			<c:if test= "${list.faq_category == 1}"><td>개인정보</td></c:if>
			 			<c:if test= "${list.faq_category == 2}"><td>신고</td></c:if>
			 			<c:if test= "${list.faq_category == 3}"><td>기타</td></c:if>
			 		    <td>${list.faq_subject}</td>			 		   
			 		 	<c:if test="${list.faq_check == 1}"><td>답변완료</td></c:if>
			 		 	<c:if test="${list.faq_check == 0}"><td>답변대기</td></c:if>
			 		 	<td><fmt:formatDate value="${list.user_date }" pattern="yyyy-MM-dd"/></td></tr>
			 	<c:if test="${list.faq_check == 1}">
			 		<tr id="answer">
						<td><img alt="답변" src="/img/arrow.png" id="">
						<td colspan="3">${list.admin_content}</td>
						<td><fmt:formatDate value="${list.admin_date }" pattern="yyyy-MM-dd"/></td>
					</tr>		 	
			 	</c:if>
			 	</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
 	
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>