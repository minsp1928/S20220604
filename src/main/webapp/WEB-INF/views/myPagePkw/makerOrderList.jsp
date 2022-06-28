<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makerOrderList</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fnOk2(pay_tot_num) {
	  document.frmOk2.pay_tot_num.value=pay_tot_num;
	  if ("" != pay_tot_num) {
		  document.frmOk2.submit();
	  }
	  else {
		  alert("선택 된 정보가 없습니다 관리자에게 문의 주세요.");
	  }
}
	
	function fnCancel2(pay_tot_num) {
	  document.frmCancel2.pay_tot_num.value=pay_tot_num;
	  if ("" != pay_tot_num) {
		  document.frmCancel2.submit();
	  }
	  else {
		  alert("선택 된 정보가 없습니다 관리자에게 문의 주세요.");
	  }
  }
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

<!--	
	mypage	:	총결제번호(pay_tot_num), 수량(quantity), 출고처리상태(product_status) 
	payment :	구매자아이디(user_id), 총결제 금액(pay_tot), 결제일자(pay_date), 결제상태(pay_state)
	product	:	상품판매번호(pro_num), 상품판매글제목(pro_title)
-->
	<form action="makerOrderListOk" id="frmOk2" name="frmOk2">
		<input type="hidden" id="pay_tot_num" name="pay_tot_num" value=""/>
	</form>
	<form action="makerOrderListCancel" id="frmCancel2" name="frmCancel2">
		<input type="hidden" id="pay_tot_num" name="pay_tot_num" value=""/>
	</form>
	<div class="container" align="center">
		<div class="row">	
			<div id="myPage">
			<h3>판매진행중 리스트</h3>
		 	<table class="table table-hover" id="myPageTbl">
				<tr>
					<th>결제번호</th>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품제목</th>
					<th>구매자(ID)</th>
					<th>수량</th>
					<th>총 결제금액</th>
					<th>결제일자</th>
					<th>결제상태</th>
					<th>출고/취소승인</th>
				</tr>
				<c:choose>
					<c:when test="${listSize > 0}">
					  <c:forEach var="item" items="${listMakerOrder}">
						<tr>
							<td>${item.pay_tot_num}</td>
							<td>${item.pro_num}</td>
							<td><img alt="" id="photoImg" src="${pageContext.request.contextPath}/upload/${item.pro_photo}"></td>
							<td><a href="${path}/productDetails?pro_num=${item.pro_num}">${item.pro_title}</a></td>
							<td><a href="${path}/makerMyProfileView?user_id=${item.user_id}">${item.user_id}</a></td>
							<td>${item.quantity}</td>
							<td>${item.pay_tot}</td>
							<td>${item.pay_date}</td>
							<td>
								${item.order_status_nm}
							</td>
							<td>
								<c:if test="${'1' eq item.order_status}">
								<button name="" onclick="fnOk2('${item.pay_tot_num}'); return false;">출고완료</button>
								</c:if>
								<c:if test="${'2' eq item.order_status}">
								<button name="" onclick="fnCancel2('${item.pay_tot_num}'); return false;">취소완료</button>
								</c:if>
							</td>			
						</tr>
					  </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10">판매진행중인 상품이 없습니다.</td>
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