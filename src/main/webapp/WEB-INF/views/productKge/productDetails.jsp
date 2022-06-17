<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<% 
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/productBoardWrite.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	
	$(function() {
		
		$(".modal_button").click(function(){
			$(".modal").fadeIn();
		});
		$(".modal_content").click(function(){
			$(".modal").fadeOut();
		});
	});
	
	
	
	// 위시 리스트 추가 아작스	
	function putCheckProduct() {
		
		var user_id = $("#user_id").val()
		alert("user_id->"+user_id);
		// 로그인이 되어 있지 않은 상태라면, 로그인 페이지로 이동하도록 연결
		if (user_id =="") {
			location.href = "/login"
		}
		var pro_num = $("#pro_num").val()
		alert("pro_num->"+pro_num);
		
		$.ajax(
			{
				url:"<%=context%>/inputCheckProduct",
				data:{user_id : user_id, pro_num : pro_num},
				dataType : 'text',
				success:function(data){
					
					if (data == 1) {
						alert("장바구니에 추가 되었습니다.");
					} else alert("이미 추가 되었습니다.");
				}
			});
		}
	
	// 장바구니 추가 아작스
	function putBaskect() {
		
		var user_id = $("#detialsUser_id").val();
		alert("user_id->"+user_id);
		// 로그인이 되어 있지 않다면 로그인 페이지로 이동
		if (user_id =="") {
			location.href = "/login"
		}
		var pro_num = $("#detailsPro_num").val();
		alert("pro_num->"+pro_num);
		
		var quantity = $("#quantity").val();
		alert("quantity->"+quantity);
		
		$.ajax(
			{
				url:"<%=context%>/inputBasket",
				data:{user_id : user_id, pro_num : pro_num, quantity : quantity},
				dataType : 'text',
				success:function(data){
					alert("data;" + data)
					if (data == 1) {
						alert("장바구니에 추가 되었습니다.");
					} else alert("이미 추가 되었습니다.");
				}
			});
		}
	
	
</script>
<style type="text/css">
#out {
width: 80%;
text-align: center;
}

#productimg{
   height: 400px;
   width: 500px;
}

ul detail_Select {
	cursor: pointer;
	list-style: none;
	text-align: center;
	border-top: 1px solid black; border-bottom: 1px solid black; padding: 10px 0;
	float: right;
	border: 2px solid black;
}

ul li {
	display: inline;
	text-transform: capitalize;
	padding: 0 10px; letter-spacing: 10px;
}

ul li a {
	text-decoration: none; color: black;
}

ul li a:hover {
	text-decoration: underline;
	cursor: pointer;
}
#a {
	text-align: left;
}
#a_1 {
	text-align: left;
}

.b {
	text-align: left;
}
#sell_photoImg {
	width: 40px;
	height: 30px;
	border: 1px black;
}
#sell_photoImg {
	margin: 0;
	float: right;
}

.modal {
	position:absolute;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.8);
	top: 0;
	left: 0;
}
.modal_content{
	  width:400px; 
	  height:200px;
	  background:#fff; 
	  border-radius:10px;
	  position:relative; 
	  top:50%; 
	  left:50%;
	  margin-top:-100px; 
	  margin-left:-200px;
	  text-align:center;
	  box-sizing:border-box; 
	  padding:74px 0;
	  line-height:23px; 
	  cursor:pointer;
}



</style>
<link href="css/productDetails.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	
	<div id="out" style="width: 80%">
	
	<div style="display: inline-block; margin-left: 20%">
		<img alt="" id="productimg" src="${pageContext.request.contextPath}/img/${product.pro_photo}">
	</div>
	
	<div style="display: inline-block; width: 400px; margin-top: 0;">
	
	<button class="modal_button">모달창</button>
					<div class="modal">
						<div class="modal_content" title="클릭하면 창이 닫힙니다">
							<img alt="상호이미지" id="sell_photoImg" src="${pageContext.request.contextPath}/img/${product.sell_photo}"><br>
							<input type="button" id="chat_connect_btn" name="chat_connect_button" value="채팅창 연결" onclick = "location.href = '${pageContext.request.contextPath}/chat' ">
							<input type="button" id="make_info_btn" name="make_info_button" value="판매자 정보" onclick = "location.href = '${pageContext.request.contextPath}/makerMyPage' ">
						</div>
					</div>
	
	<form action="insertPayment" method="post" name="pbw" enctype="multipart/form-data">
		<input type="hidden" id="detialsUser_id" name="user_id" value="${user_id}">
		<input type="hidden" id="detailsPro_num" name="pro_num" value="${product.pro_num}">
		<input type="hidden" id="detailsSell_photo" name="sell_photo" value="${product.sell_photo}">
		<input type="hidden" id="detailsPro_price" name="pro_price" value="${product.pro_price}">
		
		<table class="table">
					<tr>
						<td id="a"><b>상호명</b></td>
						<td id="a_1">${product.sell_name}<img alt="상호이미지" id="sell_photoImg" src="${pageContext.request.contextPath}/img/${product.sell_photo}"></td>
					</tr>
					
					
					<tr>
						<td id="a"><b>제품이름</b></td>
						<td id="a_1">${product.pro_title}</td>
					</tr>
					<tr>
						<td id="a"><b>가격</b></td>
						<td id="a_1"><fmt:formatNumber type="currency" value="${product.pro_price}" currencySymbol="\\"/></td>
					</tr>
					<tr>
						<td id="a"><b>재고</b></td>
						<td id="a_1">${product.amount}</td>
					</tr>
					<tr>
					<th>구매수량</th>
						<td>
							<input type="number" class="b" id="quantity" name="quantity" min="1" max="${product.amount}" value="1">
						</td>
					</tr>
					<tr>
					<th></th>
						<td>
							<input type="submit" id="detail_purchase_buttons" name="detail_purchase_buttons" value="구매하기">
							<input type="button" id="detail_basket_buttons" name="detail_basket_buttons" value="장바구니" onclick="putBaskect()">
						</td>
					</tr>
					<div class="detail_buttons">
						<input type="button" id="wish_button" name="wish_button" value="위시리스트" onclick="putCheckProduct()">
					</div>
						
		</table>
	</form>
	</div>
	
	<ul id="detail_Select">
		<li><a href="#detail section"><b>상세 설명</b></a></li>
		<li>|</a></li>
		<li><a href="#review section"><b>후기</b></a></li>
		<li>|</a></li>
		<li><a href="#refund section"><b>배송/환불 규정</b></a></li>
	</ul>
	
	<div id="detail section" class="">
	상세 설명
	<p>${product.pro_write}</p>
	<img alt="detailimg" id="detailimg" src="${pageContext.request.contextPath}/img/${product.pro_pic}">
	</div>
	
	
	<div id="review section" class="">
	<ul id="detail_Select">
		<li><a href="#detail section">상세 설명</a></li>
		<li>|</a></li>
		<li><a href="#review section">후기</a></li>
		<li>|</a></li>
		<li><a href="#refund section">배송/환불 규정</a></li>
	</ul>
	
	후기
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	</div>
	
	
	<div id="refund section" class="">
	<ul id="detail_Select">
		<li><a href="#detail section">상세 설명</a></li>
		<li>|</a></li>
		<li><a href="#review section">후기</a></li>
		<li>|</a></li>
		<li><a href="#refund section">배송/환불 규정</a></li>
	</ul> 
	
	배송/환불 규정
	<img alt="detailimg" id="detailimg" src="${pageContext.request.contextPath}/img/delivery&refund.JPG">
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	</div>
	


	</div>
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>