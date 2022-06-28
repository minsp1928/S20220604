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
<link href="css/jsh/Shoppingbasket.css" rel="stylesheet" type="text/css">


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
		
		send_array[i++]  =  chkbox[index].value;
		send_array2[j++] = chkbox2[index].value; 
		totalPrice += parseInt($(element).find(".individual_basket_price").val());
		}
		
		});
		
		/*$("#array").val(send_array);
		$("#array2").val(send_array2);
		 var pro_num = $("#array").serialize();
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
		
function DeleteBasket(vIndex) {
	
	var basketNum = ${basket_num};
	var delete_pro_num = $("#delete_pro_num"+vIndex).val();
	
	var form = document.createElement('form');
	form.setAttribute('method','post');
	form.setAttribute('action', "http://localhost:8989/DeleteBasket");
	document.charset = "utf-8";
	
	{
		var hiddenField = document.createElement("input");
	hiddenField.setAttribute('type','hidden');
	hiddenField.setAttribute('name',"basket_num");
	hiddenField.setAttribute('value', basketNum);
	form.appendChild(hiddenField);
	}
	
	{
		var hiddenField = document.createElement("input");
	hiddenField.setAttribute('type','hidden');
	hiddenField.setAttribute('name',"pro_num");
	hiddenField.setAttribute('value', delete_pro_num);
	form.appendChild(hiddenField);
	}
	
	document.body.appendChild(form);
	form.submit();
	
} 

	
</script>
</head>

<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"></jsp:include>
	<section>
		
		
		<c:if test="${basketCount == 0}">
			<div class="basic">
				<table>
					<tr>
						<td class="basic1">선택</td>
						<td class="basic2">구매물품</td>
						<td class="basic3">구매정보</td>
					</tr>
				</table>
			</div>
			<div class="empty">
			<h1>장바구니가 비었습니다</h1>
			</div>
		</c:if>
		<c:if test="${basketCount > 0}">
			
			<div class="body_size">
			<div class="basic">
				<table>
					<tr>
						<td class="basic1">선택</td>
						<td class="basic2">구매물품</td>
						<td class="basic3">구매정보</td>
					</tr>
				</table>
			</div>
				<c:forEach var="basketItem" items="${basket}" varStatus="status">
				<div class="for_array1">
					<table>	
						<tr>
							<td class="cart_info_td">
								<input type="checkbox" class="individual_cart_checkbox" checked="checked" onclick="setTotalInfo(${status.index})">
								<input type="hidden" class="individual_basket_price" value="${basketItem.pro_price * basketItem.basket_amount}">
								<input type="hidden" class="individual_pro_num" value="${basketItem.pro_num}">
								<input type="hidden" class="individual_quantity" value="${basketItem.basket_amount}">
							</td>
							<td><img src="${pageContext.request.contextPath}/upload/${basketItem.pro_photo}" class="img_size"></td>
						</tr>		
					</table>
				</div>
				<div class="for_array2">
					<table>		
						<tr><td>상품이름: ${basketItem.pro_title}</td></tr>
						<tr><td>수량: 	${basketItem.basket_amount}</td></tr>
						<tr><td>금액: 	${basketItem.pro_price * basketItem.basket_amount}</td></tr>
						<tr><td><input type="hidden" id="delete_pro_num${status.index}" value="${basketItem.pro_num}"></td></tr>
						<tr><td><input type="button" class="button1" onclick="DeleteBasket(${status.index})" value="삭제"></td></tr>
					</table>
				</div>			
				</c:forEach>	
				<table class="buyClick">
					<tr>
						<td>총 결제 금액:  </td><td id="totalPrice">0</td><td><input type="button" class="button2" id="buyClick" onclick="buyClick(${basket_num})" value="구매하기"></td>
					</tr>
				</table>
			</div>
		</c:if>	
	</section>
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"></jsp:include>
</body>

</html>