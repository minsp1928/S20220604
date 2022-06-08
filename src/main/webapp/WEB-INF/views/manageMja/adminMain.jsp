<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <div>
 <h3>판매자 요청 상태</h3>
	<table>
		<tr><th>아이디</th><th>판매자상호명</th><th>연락처</th><th>사업자번호</th><th>요청상태</th></tr>
 		<c:forEach var="seller" items="${seller }">
 		<tr><td>${seller.user_id }</td>
 			<td>${seller.sell_name }</td>
 			<td>${seller.sell_tel }</td>
 			<td>${seller.sell_num }</td>
 			<c:if test="${seller.chk ==0}"><td>대기</td></c:if>
 			<c:if test="${seller.chk ==2 }"><td>반려</td></c:if>
 		</tr>
 		</c:forEach>
	</table>
</div>
<div>
<h1>신규회원</h1>
	<table>
		<tr><th>기간</th><td>${minusdate }</td><td>~</td><td>${sysdate }</td></tr>
		<tr><th>no</th><th>id</th><th>이름</th><th>가입일</th></tr>
	 	<c:forEach var="list" items="${member}">
	 		<tr><td>${num }</td>
	 		    <td>${list.user_id}</td>
	 		 	<td>${list.user_name}</td>
	 		 	<td><fmt:formatDate value="${list.join_date }" pattern="yyyy-MM-dd"/></td>
	 		</tr>
	 		<c:set var="num" value="${num-1 }"></c:set>
	 	</c:forEach>
	</table>
</div>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>