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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	var contextPath='${pageContext.request.contextPath}';

	function getProductDelete(Vpro_num) {
		alert("pro_num->"+Vpro_num);
		
		$.ajax(
				{
					url:"<%=context%>/ProductDelete",	
					data:{pro_num : Vpro_num},
					dataType:'text',
					success:function(data) {
						if(data =='1') 
						alert("ajax getProductDelete 성공");
						$('#proList'+Vpro_num).remove();
					}
				}
		);
	}
	// 수정 페이지로 이동
	function getProductModifyForm(vPro_num) {
		alert("getProductModifyForm pro_num->"+vPro_num);
		var sendData = 'pro_num='+vPro_num;
		location.href="productModifyForm?"+sendData;
	}
</script>
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
						<tr id="proList${listMyProduct.pro_num}">
						 	<td>${listMyProduct.pro_num}</td> 
						 	<td>${listMyProduct.pro_title}</td>
							<td>${listMyProduct.pro_date}</td>
							<td>${listMyProduct.amount}</td>
							<td>${listMyProduct.sell_amount}</td>
							<td>
								<button class="Tbtn" onclick="getProductModifyForm(${listMyProduct.pro_num})">수정</button>
								<button class="Tbtn" onclick="getProductDelete(${listMyProduct.pro_num})">삭제</button>
							</td>
								
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