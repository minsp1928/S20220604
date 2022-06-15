<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/faqLoginDetail.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
	<table class="table">
		<tr>
			<th>작성일자</th>	
				<td><fmt:formatDate value="${faq.user_date}" pattern="yyyy-MM-dd"/></td> 
			<th>문의유형</th>
				<c:if test= "${faq.faq_category == 1}"><td>개인정보</td></c:if>
			 	<c:if test= "${faq.faq_category == 2}"><td>신고</td></c:if>
			 	<c:if test= "${faq.faq_category == 3}"><td>기타</td></c:if>
		</tr>
		<tr>
			<th>작성자</th>
				<td>${faq.user_id }</td> 
			<th>제목</th>
				<td>${faq.faq_subject}</td>
		</tr>
		<tr>
			<th>내용</th>
				<td colspan="3">${faq.faq_content}</td>
		</tr>
	
		<!-- 답변완료 -->
		<c:if test="${faq.faq_check==1}">
			<tr id="answer">
				<td><img alt="답변" src="/img/arrow.png" id="arrow">
				<td colspan="3">${faq.admin_content}</td>
			</tr>
		</c:if>
		
				<!-- 답변대기 -->
		<c:if test="${faq.faq_check==0}">
			<tr>
				<td>답변을 기다리는 중</td>
			</tr>
		</c:if>
	</table>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>