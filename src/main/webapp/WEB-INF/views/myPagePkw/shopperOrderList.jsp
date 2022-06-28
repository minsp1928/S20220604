<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopperOrderList</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function fnCancel(pay_tot_num) {
	  document.frmCancel.pay_tot_num.value=pay_tot_num;
	  if ("" != pay_tot_num) {
		  document.frmCancel.submit();
	  }
	  else {
		  alert("선택 된 정보가 없습니다 관리자에게 문의 주세요.");
	  }
  }

 	function fnOk(pay_tot_num) {
	  document.frmOk.pay_tot_num.value=pay_tot_num;
	  if ("" != pay_tot_num) {
		  document.frmOk.submit();
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
	mypage :	총결제번호(pay_tot_num), 상품판매번호(pro_num), 수량(quantity), 주문처리상태(order_status), 구매확정(purchase_status) 
	결제(주문) :	총결제 금액(pay_tot), 결제일자(pay_date)
	상품판매 :		판매자아이디(user_id), 상품판매글제목(pro_title)
-->
	
	<form action="shopperOrderListCancel" id="frmCancel" name="frmCancel">
		<input type="hidden" id="pay_tot_num" name="pay_tot_num" value=""/>
	</form>
	<form action="shopperOrderListOk" id="frmOk" name="frmOk">
		<input type="hidden" id="pay_tot_num" name="pay_tot_num" value=""/>
	</form>
	
	<div class="container" align="center">
		<div class="row">	
			<div id="myPage">
	 		<h3>쇼퍼 주문리스트</h3>
			 	<table class="table table-hover" id="myPageTbl">
				<tr>
					<th>결제번호</th>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품제목</th>
					<th>판매자(ID)</th>
					<th>수량</th>
					<th>총 결제금액</th>
					<th>결제일자</th>
					<th>주문처리상태</th>
					<th>구매확정/취소</th>
				</tr>
				<c:choose>
					<c:when test="${listSize > 0}">
					  <c:forEach var="item" items="${listShopperOrder}">
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
								<button name="" onclick="fnCancel('${item.pay_tot_num}'); return false;">취소</button>
								</c:if>
								<c:if test="${'4' eq item.order_status}">
								<button name="" onclick="fnOk('${item.pay_tot_num}'); return false;">구매확정</button>
								</c:if>
							</td>					
						</tr>
					  </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="10">구매진행중인 상품이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</table>
				<%--<table class="table table-hover" id="sellTbl">
					<c:set var="num" value="${1 }"></c:set>
					<tr><th>번호</th><th>상호명</th><th>아이디</th><th>사업자번호</th><th>사업장</th><th>연락처</th><th>요청</th></tr>
		 			<c:forEach var="seller" items="${seller }" varStatus="status">
		 			<tr><td><input type="hidden" id="user_id${status.index }" value="${seller.user_id }">${num }</td>
		 				<td>${seller.sell_name }</td>
		 				<td>${seller.user_id }</td>
		 				<td>${seller.sell_num }</td>
		 				<td>${seller.con_addr1 }</td>
		 				<td>${seller.sell_tel }</td>
		 				<td>
		 					<input type="button" id="btn${status.index }" onclick="approve(${status.index })" value="승인/반려">
		 				</td>
		 			</tr>
	 				<c:set var="num" value="${num + 1 }"></c:set>
	 				</c:forEach>
				</table> --%>
			</div>
			</div>
		</div>

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>