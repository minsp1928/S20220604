<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

<!--	
	Coupon : 유저아이디(user_id), 쿠폰번호(cp_num), 쿠폰유형(cp_category), 쿠폰명(cp_name), 할인금액(cp_price), 발급일자(st_date), 유효기한(end_date)
-->
	<div class="container" align="center">
		<div class="row">	
			<div id="myPage">
	 		<h3>내 쿠폰리스트</h3>
			 <table class="table table-hover" id="myPageTbl">
				<tr>
					<th>쿠폰번호</th>
					<th>쿠폰유형</th>
					<th>쿠폰명</th>
					<th>할인금액</th>
					<th>발급일자</th>
					<th>유효기한</th>
				</tr>
				<c:choose>
					<c:when test="${listSize > 0}">
					  <c:forEach var="item" items="${listShopperMyCoupon}">
						<tr>
							<td>${item.cp_num}</td>
							<%-- <td>${item.cp_category}</td> --%>
							
							<c:if test= "${item.cp_category == 1}"><td>배송비</td></c:if>
				 			<c:if test= "${item.cp_category == 2}"><td>금액할인</td></c:if> 
				 			
							<td>${item.cp_name}</td>
							<td>${item.cp_price}</td>
							<td>${item.st_date}</td>
							<td>${item.end_date}</td>
						</tr>
					  </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">보유중인 쿠폰이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	</div>
	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>