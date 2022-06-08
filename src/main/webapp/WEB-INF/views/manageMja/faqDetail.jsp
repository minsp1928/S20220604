<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<h1>1:1문의 답변하기 </h1>
<!-- 이메일... -->
<form action="faqAnswer?login_check=${faq.login_check }">
	<input type="hidden" value="${faq.faq_num }" name="faq_num">
	<input type="hidden" value="${faq.login_check }" name="login_check">
	<input type="hidden" value="${faq.faq_subject}" name="faq_subject">
	<input type="hidden" value="${faq.faq_email }" name="faq_email">
	<table>
		<tr><th>작성일자</th><td><fmt:formatDate value="${faq.user_date}" pattern="yyyy-MM-dd"/></td></tr>
		<tr><th>문의유형</th>
			<c:if test= "${faq.faq_category == 1}"><td>개인정보</td></c:if>
		 	<c:if test= "${faq.faq_category == 2}"><td>신고</td></c:if>
		 	<c:if test= "${faq.faq_category == 3}"><td>기타</td></c:if>
		</tr>
		<tr><th>작성자</th><td>${faq.user_id }</td></tr>
		<tr><th>제목</th><td>${faq.faq_subject}</td></tr>
		<tr><th>내용</th><td>${faq.faq_content}</td></tr>
		
		<!-- 답변대기 -->
		<c:if test="${faq.faq_check==0}">
			<tr><th>답변내용</th><td><textarea rows="5" cols="20" name="admin_content"></textarea></td></tr>
			<tr><td><a href="faqManage">목록</a></td><td><input type="submit" value="답변하기"></td></tr>
		</c:if>
		
		<!-- 답변완료 -->
		<c:if test="${faq.faq_check==1}">
			<tr><th>답변</th><td>${faq.admin_content}</td></tr>
			<tr><td colspan="2"><a href="faqManage">목록</a></td></tr>
		</c:if>
	</table>
</form>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>