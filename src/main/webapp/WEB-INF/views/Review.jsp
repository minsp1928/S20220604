<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"></jsp:include>
<script type="text/javascript">

function reviewDelete(vIndex) {
	
		
	if($("#individual_re_user_id"+vIndex).val()
		== document.getElementById('now_user_id').value) {
		
		console.log(document.getElementById('individual_re_user_id'+vIndex).value)
		console.log(document.getElementById('now_user_id').value)
		
		
			var form = document.createElement('form');
		form.setAttribute('method','post');
		form.setAttribute('action', "http://localhost:8989/DeleteReview");
		document.charset = "utf-8"; 
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pro_num");
		hiddenField.setAttribute('value', document.getElementById('now_product').value);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"user_id");
		hiddenField.setAttribute('value', document.getElementById('now_user_id').value);
		form.appendChild(hiddenField);
		} 
		
		document.body.appendChild(form);
		form.submit();
	
		}
	else {
		alert("접근 권한이 없습니다")
	}
}
	

</script>
</head>
<body>

	<c:if test="${reviewCount == 0}">
		<h2>리뷰가 없습니다</h2>
	</c:if>
	
	
	
	<c:if test="${reviewCount > 0}">
		<input type="hidden" id="now_user_id" value="${user_id}">
		<input type="hidden" id="now_product" value="${pro_num}">
		<table>
			<tr>
					<th>별점</th><th>사진</th><th>구매자</th><th>후기 제목</th><th>후기 내용</th>
			</tr>
			<c:forEach var="searchReview" items="${searchReview}" varStatus="status">
				<tr>
					<td><input type="text" id="individual_re_star${status.index}" value="${searchReview.re_star}"></td>
					<%-- <td><img src="${pageContext.request.contextPath}/${searchReview.re_pic}"></img></td> --%>
					<td><input type="text"  id="individual_re_user_id${status.index}" value="${searchReview.user_id}"></td>
					<td><input type="text"  id="individual_re_title${status.index}" value="${searchReview.re_title}"></td>
					<td><input type="text"  id="individual_re_star${status.index}" value="${searchReview.re_content}"></td> 
					<td> <a href="#Coupon_info" class="btn_open">할인쿠폰 선택</a> 
					<div id="Coupon_info" class="pop_wrap" style="display:none;">
  						<div class="pop_inner">
  							<c:forEach var="Coupon" items="${Coupon}" varStatus="status">
  							
  								<table>
  									<tr>
  										<th>쿠폰명</th><th>할인금액</th><th></th>
  									</tr>
  									<tr>
  										<td></td>
  										<td><input type="radio" name="coupon" id="Coupon_name${status.index}" value="${Coupon.cp_name}">${Coupon.cp_name}</td>
  										<td><input type="text" name="coupon" id="Coupon_price${status.index}" value="${Coupon.cp_price}" readonly="readonly"></td>
  										<td><input type="hidden" name="coupon" id="cp_category${status.index}" value="${Coupon.cp_category}">
  										<button type="button" id="CouponBtn" class="btn_close" onclick="DiscountTotal(${status.index})"> 쿠폰선택 </button> 										
  									</tr>
  								</table>
  							
  							</c:forEach>
  	  					<button type="button" class="btn_close">닫기</button>
  						</div>
					</div>
					</td>
					<td><input type="button" onclick="reviewDelete(${status.index})" value="삭제"></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
	


</body>
</html>