<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정하기</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
div .ModifyProductTable {
	position: absolute; 
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	
	
	<h2>상품 수정하기</h2>
		
		<div  class="ModifyProductTable">
		<form action="ModifyProduct" method="post" name="pbw" enctype="multipart/form-data"> <!-- pbw=productboardwrite -->
				<input type="hidden" name="user_id" value="${product.user_id}">
				<input type="hidden" name="pro_num" value="${product.pro_num}">
				<tr>
					<td>상품 대분류</td>
					<c:if test="${product.pro_type1==100}">채소</c:if>
					<c:if test="${product.pro_type1==200}">과일</c:if>
					<c:if test="${product.pro_type1==300}">곡류</c:if>
				</tr>
				<tr>
					<td>상품 중분류</td>
					<c:if test="${product.pro_type2==101}">야채</c:if>
					<c:if test="${product.pro_type2==102}">구황작물</c:if>
					<c:if test="${product.pro_type2==201}">국산과일</c:if>
					<c:if test="${product.pro_type2==202}">수입과일</c:if>
					<c:if test="${product.pro_type2==301}">쌀</c:if>
					<c:if test="${product.pro_type2==302}">대두류</c:if>
				</tr>
				<tr>
					<td>상품 이름</td>
					<td><input type="text" class="modifyPro_title" name="pro_title" required="required" value="${product.pro_title}"></td>
				</tr>
				<tr>
					<td>판매가격</td>
					<td><input type="number" class="modifyPro_price" name="pro_price" required="required" value="${product.pro_price}"></td>
				</tr>
				<tr>
					<td>상품판매 메인사진</td>
					<td><input type="file" class="modifyPro_photo" name="pro_photoImg" required="required" value="${product.pro_photo}"> <br> 
				</tr>
				<tr>
					<td>상품 상세글</td>
					<td><input type="text" class="modifyPro_write" name="pro_write" required="required" value="${product.pro_write}"></td>
				</tr>
				<tr>
					<td>상품판매 상세사진</td>
					<td><input type="file" class="modifyPro_pic" name="pro_picImg" required="required" value="${product.pro_pic}"> <br> 
				</tr>
				<tr>
					<td>재고</td>
					<td><input type="number" class="modifyAmount" name="amount" required="required" value="${product.amount}"></td>
				</tr>
				<tr>
				<td colspan="2"><input type="submit" value="확인"></td>
				</tr>
				
		</form>
		</div>


	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>	
</body>
</html>