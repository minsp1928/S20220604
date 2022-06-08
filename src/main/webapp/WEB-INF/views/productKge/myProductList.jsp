<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyProductList</title>
<link href="css/myProductList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	
	<section>
		<h2 class=myProductList>나의 상품등록 리스트</h2>
			
			<div  class="myProductListTable">
			<table>
				<tr>
					<th>상품번호</th><th>상품판매글제목</th><th>작성일</th><th>재고</th><th>판매량</th><th>기능</th> 
				</tr>
				<c:if test="${listSize > 0 }">
					<c:forEach var="listMyProduct" items="${listMyProduct}">
						<tr>
						 	<td>${listMyProduct.pro_num}</td> 
						 	<td>${listMyProduct.pro_title}</td>
							<td>${listMyProduct.pro_date}</td>
							<td>${listMyProduct.amount}</td>
							<td>${listMyProduct.sell_amount}</td>
							<td><button class="Tbtn" onclick="location.href='productBoardModify?pro_num=${listMyProduct.pro_num}'">수정</button>
								<button class="Tbtn" onclick="location.href='delete?pro_num=${listMyProduct.pro_num}'">삭제</button></td>
								
						</tr>
					</c:forEach>
				</c:if>	
			</table>
			</div>
			<c:if test="${listSize == 0}">
				상품이 없습니다.
			</c:if>
		</section>
	
	
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>

</body>
</html>