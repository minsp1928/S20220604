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

$(document).ready(function(){
	
	setTotalInfo();
	
});

$(".individual_cart_checkbox").on("change", function(){
	setTotalInfo($(".cart_info_td"));
	
});


function setTotalInfo(Vindex){
		
	var totalPrice = 0;
	

	
	$(".cart_info_td").each(function(index, element){
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부	
		/* console.log("index: " + index + "-----i:" + i); */
		totalPrice += parseInt($(element).find(".individual_basket_price").val());
		}
		
	});
	
	$(".totalPrice_span").text(totalPrice.toLocaleString());
	document.getElementById('totalPrice').innerHTML=totalPrice;
		
	
	
}


function buyClick(basketNum) {
		
		var totalPrice = 0;
		var send_array = Array();
		var send_array2 = Array();
		var chkbox = $(".individual_pro_num");
		var chkbox2 = $(".individual_quantity");
		var i = 0;
		var j = 0;
	
		$(".cart_info_td").each(function(index, element){
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
		
		/* console.log("index: " + index + "-----i:" + i); */
		send_array[i++]  =  chkbox[index].value;
		send_array2[j++] = chkbox2[index].value; 
		totalPrice += parseInt($(element).find(".individual_basket_price").val());
		}
		
		});
		
		$("#array").val(send_array);
		$("#array2").val(send_array2);
		/* var pro_num = $("#array").serialize();
		var quantity = $("#array2").serialize(); */
		console.log(send_array);
		console.log(send_array2);
		
		var form = document.createElement('form');
		form.setAttribute('method','post');
		form.setAttribute('action', "http://localhost:8989/BasketFuction");
		document.charset = "utf-8";
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"totalPrice");
		hiddenField.setAttribute('value', totalPrice);
		form.appendChild(hiddenField);
		}
		
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pro_num_list");
		hiddenField.setAttribute('value', send_array);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"quantity_list");
		hiddenField.setAttribute('value', send_array2);
		form.appendChild(hiddenField);
		}
		
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"basket_num");
		hiddenField.setAttribute('value', basketNum);
		form.appendChild(hiddenField);
		}
		
		document.body.appendChild(form);
		form.submit();
		} 
	
</script>
</head>
<body>




	<c:if test="${basketCount == 0}">
		<h1>장바구니가 비었습니다</h1>
	</c:if>
	<c:if test="${basketCount > 0}">
	<table>	
		<c:forEach var="basketItem" items="${basket}" varStatus="status">	
				<tr>
					<td class="cart_info_td">
						<input type="checkbox" class="individual_cart_checkbox" checked="checked" onclick="setTotalInfo(${status.index})">
						<input type="hidden" class="individual_basket_price" value="${basketItem.pro_price * basketItem.basket_amount}">
						<input type="hidden" class="individual_pro_num" value="${basketItem.pro_num}">
						<input type="hidden" class="individual_quantity" value="${basketItem.basket_amount}">
					</td>
					
					<%-- <td><img src="${pageContext.request.contextPath}/${basketItem.pro_photo}"></td> --%>
					<td>상품이름: ${basketItem.pro_title}<td>
					<td>수량: 	${basketItem.basket_amount}</td>
					<td>금액: 	${basketItem.pro_price * basketItem.basket_amount}</td>
				</tr>
		</c:forEach>
	</table>	
		<table>
			<tr>
				<td>총 결제 금액:  </td><td id="totalPrice">0</td><td><input type="button" id="buyClick" onclick="buyClick(${basket_num})"></td>
			</tr>
		</table>
	</c:if>

	
	

</body>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"></jsp:include>
</html>