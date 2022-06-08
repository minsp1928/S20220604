<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
<link href="css/mja/cpManage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<div>
	<h1>쿠폰 목록</h1>
		<table id="couponTbl">
			<tr><th>번호</th><th>쿠폰이름</th><th>시작일</th><th>만료일</th><th>유형</th></tr>
		 	<c:forEach var="coupons" items="${coupons }">
		 		<tr>
		 		    <td>${coupons.cp_num}</td>
		 		 	<td>${coupons.cp_name}</td>
		 		 	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupons.st_date}"/></td>
		 		 	<td><fmt:formatDate pattern="yyyy-MM-dd" value="${coupons.end_date }"/></td>
		 			<c:if test= "${coupons.cp_category == 1}"><td>배송비</td></c:if>
		 			<c:if test= "${coupons.cp_category == 2}"><td>금액할인</td></c:if>
		 		</tr>
		 	</c:forEach>
		</table>
</div>
<div>
	<h2>쿠폰 발행</h2>
		<form action="createCoupon">
			<table>
				<tr><th>쿠폰명</th><td><input type="text"	name="cp_name" required="required"></td></tr>
				<tr><th>카테고리</th><td>
					<!-- 아작스 시간 나면 걸기 -->
					<select name="cp_category">
						<option value="1">배송비</option>
						<option value="2">금액할인</option>
					</select></td></tr>
				<tr><th>할인액</th><td>
					<select name="cp_price">
						<option value="1000">1000원</option>
						<option value="2500">2500원</option>
						<option value="3000">3000원</option>
						<option value="5000">5000원</option>
						<option value="10000">10000원</option>	
					</select></td></tr>
				<tr><th>유효기간</th><td><span><input type="date" name="st_date"></span><span>~</span><span><input type="date" name="end_date"></span></td></tr>
				<tr><td colspan="2"><input type="submit" value="발행"></td></tr>
			</table>
		</form>
</div>	
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>