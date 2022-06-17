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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>

	<div>
	</table>
		입력된 부서번호 :<c:if test="${product.pro_type1!=null}">${product.pro_type1}</c:if><p>
	         입력된 부서명   :<c:if test="${product.pro_type1!=null}">${product.pro_type1}</c:if><p> 
	         입력된 부서위치 :<c:if test="${product.user_id!=null}">${product.user_id}</c:if><p> 
	         입력된 부서위치 :<c:if test="${product.pro_price!=null}">${product.pro_price}</c:if><p> 
	         입력된 부서위치 :<c:if test="${product.pro_title!=null}">${product.pro_title}</c:if><p> 
	         입력된 부서위치 :<c:if test="${product.pro_write!=null}">${product.pro_write}</c:if><p> 
	         입력된 부서위치 :<c:if test="${product.pro_photo!=null}"><img alt="UpLoad결과" src="${pageContext.request.contextPath}/upload/${product.pro_photo}"></c:if><p> 
	         입력된 부서위치 :<c:if test="${product.pro_pic!=null}"><img alt="UpLoad결과" src="${pageContext.request.contextPath}/upload/${product.pro_pic}"></c:if><p> 
	         입력된 부서위치 :<c:if test="${product.amount!=null}">${product.amount}</c:if><p> 
	
	
	</div>






	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>