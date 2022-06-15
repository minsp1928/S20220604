<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<html>
<head>
<title>Payment</title>
	<meta charset="UTF-8">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"></jsp:include>
	

<style type="text/css">
*{margin:0; padding:0;}
a{text-decoration:none;}
.wrap{padding:10px;}

.btn_open{font-weight:bold; margin:5px; padding:4px 6px; background:#000; color:#fff;}
.pop_wrap{position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,.5); font-size:0; text-align:center;}
.pop_wrap:after{display:inline-block; height:100%; vertical-align:middle; content:'';}
.pop_wrap .pop_inner{display:inline-block; padding:20px 30px; background:#fff; width:1000px; vertical-align:middle; font-size:15px;}
</style>	
	
</head>
<body>
	<input type="hidden" id="user_id" value="${member.user_id}">
	<table>
		<tr>
			<th>배송정보</th>
		</tr>
		<tr>
			<th>이름: </th>
			<td><input type="text" id="buyer_name" value="${member.user_name}" ></td>
		</tr>
		<tr>
			<th>전화번호: </th>
			<td><input type="text" id="buyer_tel" value="${member.con_tel}" ></td>
		</tr>
		<tr>
			<th>주소: </th>
			<td><input type="text" id="buyer_addr1" value="${member.con_addr1}" readonly="readonly" ></td>
			<td><input type="text" id="buyer_addr2" value="${member.con_addr2}" ></td>
		</tr>	
		<tr>
			<th>요청사항: </th>
			<td><input type="text" id="buyer_req" value="pay_req" ></td>	
		</tr>
	</table>
	
  	
		<table id="pay_product">
			<tr>
			<th>사진</th><th>결제 물품</th><th>수량</th><th>가격</th>
			</tr>
			<c:forEach var="productInfo" items="${productList}" varStatus="status">
			<tr>
				<%-- <td><img src="${pageContext.request.contextPath}/${productList.pro_photo}"></img></td> --%>
				<td>${productInfo.pro_title}></td>
				<td>${productQuantity[status.index]}></td>
				<td>${productQuantity[status.index]} * productInfo.pro_price}></td>
			</tr>
			</c:forEach>  
		</table>			
	

	<table>
		<tr>
			<th>결제</th>
		</tr>
 		<tr>
			<td>총상품가격 <input type="text" id="pay_tot" readonly="readonly" value="${total_price}"></td>
		</tr> 
		
		<tr>
			<td> <a href="#Coupon_info" class="btn_open">할인쿠폰 선택</a> 
				<div id="Coupon_info" class="pop_wrap" style="display:none;">
  					<c:if test="${couponCount == 0}">
  						<div class="pop_inner">
    						<p>보유 중인 쿠폰이 없습니다.</p>
    						<button type="button" class="btn_close">닫기</button>
  						</div>
  					</c:if>
  					
  					<c:if test="${couponCount > 0}">
  					<div class="pop_inner">
  						<c:forEach var="Coupon" items="${Coupon}" varStatus="status">
  							
  								<table>
  									<tr>
  										<th>쿠폰명</th><th>할인금액</th>
  									</tr>
  									<tr>
  										<td></td>
  										<td><input type="radio" name="coupon" id="Coupon_name${status.index}" value="${Coupon.cp_name}">${Coupon.cp_name}</td>
  										<td><input type="text" name="coupon" id="Coupon_price${status.index}" value="${Coupon.cp_price}" readonly="readonly"></td>
  										<td><input type="hidden" name="coupon" id="cp_category${status.index}" value="${Coupon.cp_category}">
  										<td><input type="hidden" name="coupon" id="cp_num${status.index}" value="${Coupon.cp_num}">
  										<button type="button" id="CouponBtn" onclick="DiscountTotal(${status.index})"> 쿠폰선택 </button>
  										
  									</tr>
  								</table>
  							
  						</c:forEach>
  	  						<button type="button" class="btn_close">닫기</button>
  					</div>
  					</c:if>
				</div>
			</td>
			<td id ="selCp_num">0</td>
		</tr> 
		<tr>
			<td>배송비<input type="text" readonly="readonly" id="delivery_fee" value="2500"></td>
		</tr>	
		<tr>
			<td>총결제 금액</td><td id="product_price">${total_price}</td>
		</tr>
		<tr>
			<td>결제방법</td> 
			<td>카카오페이<input type="radio" name="pay" id="kakao" value="Kakao"><br></td>
			<td>토스<input type="radio" name="pay" id="toss" value="Toss"></td>
		</tr>	
		<tr>
			<td>
				<button type="button" id="paybtn" onclick="checkButton()"> 결제하기 </button>
			</td>
		<tr>
	</table>
	
	<script>
	console.log(pro_title)
	var pay_tot = 0;
	var target = document.querySelector('.btn_open');
	var btnPopClose = document.querySelector('.pop_wrap .btn_close');
	
	target.addEventListener('click', function(){
	      targetID = this.getAttribute('href');
	      document.querySelector(targetID).style.display = 'block';
	    });
	
	btnPopClose.addEventListener('click', function(){
	      this.parentNode.parentNode.style.display = 'none';
	    });
	
	const btn1 = document.querySelector('#CouponBtn');        
    const radioButtons1 = document.querySelectorAll('input[name="coupon"]');
    btn1.addEventListener("click", () => {
        let selectedCoupon;
         for (const radioButton1 of radioButtons) { 
             if (radioButton1.checked) {
            	selectedCoupon = radioButton1.value;
                  break;
            } 
        }   
    }); 
    
    function DiscountTotal(vIndex) {
		//                실시간 변화값 Get   cp_category
		var selCoupon_price =   $("#Coupon_price"+vIndex).val();
		var selCp_category =   $("#cp_category"+vIndex).val();
		var pay_tot =	document.getElementById('pay_tot').value - selCoupon_price
						- 2500;
		
    	//alert('vIndex->'+vIndex);
    	//alert('cp_category->'+selCoupon_price);
    	//alert('cp_category->'+selCp_category);
    	
    	document.getElementById('product_price').innerHTML= pay_tot;
    	document.getElementById('selCp_num').innerHTML= selCp_num;
   }
	
	function sendPayment() {
		var form = document.createElement('form');
		form.setAttribute('method','post');
		form.setAttribute('action', "http://localhost:8989/InsertPaymentInfo");
		document.charset = "utf-8";
		
		var date = new Date();
		var str = date.getFullYear()+'/'+date.getMonth()+'/'+date.getDate();

		
	/*	{
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute('type','hidden');
			hiddenField.setAttribute('name',"pay_tot_num");
			hiddenField.setAttribute('value', 46);
			form.appendChild(hiddenField);
		} */
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_tot");
		hiddenField.setAttribute('value', 40000);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");	
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"user_id");
		hiddenField.setAttribute('value',document.getElementById('user_id').value);
		form.appendChild(hiddenField);
		}
	
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_state");
		hiddenField.setAttribute('value', 1);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_name");
		hiddenField.setAttribute('value', document.getElementById('buyer_name').value);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_address");
		hiddenField.setAttribute('value', document.getElementById('buyer_addr1').value+document.getElementById('buyer_addr2').value);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_tell");
		hiddenField.setAttribute('value', document.getElementById('buyer_tel').value);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"cp_state");
		hiddenField.setAttribute('value', 1);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"cp_num");
		hiddenField.setAttribute('value', 1006);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_req");
		hiddenField.setAttribute('value', document.getElementById('buyer_req').value);
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_date");
		hiddenField.setAttribute('value', str);	
		form.appendChild(hiddenField);
		}
		
		document.body.appendChild(form);
		form.submit();
		
	}
	
	function sendOrder() {
		var form = document.createElement('form');
		form.setAttribute('method','post');
		form.setAttribute('action', "http://localhost:8989/InsertOrderInfo");
		document.charset = "utf-8";
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pay_tot_num");
		hiddenField.setAttribute('value', 41);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"pro_num");
		hiddenField.setAttribute('value', 1001);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"quantity");
		hiddenField.setAttribute('value', 4);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"order_status");
		hiddenField.setAttribute('value', 1);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"purchase_status");
		hiddenField.setAttribute('value', 1);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"product_status");
		hiddenField.setAttribute('value', 1);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"refund_status");
		hiddenField.setAttribute('value', 1);	
		form.appendChild(hiddenField);
		}
		
		{
			var hiddenField = document.createElement("input");
		hiddenField.setAttribute('type','hidden');
		hiddenField.setAttribute('name',"refund_reason");
		hiddenField.setAttribute('value', 1);	
		form.appendChild(hiddenField);
		}
		
		
		
		
		document.body.appendChild(form);
		form.submit();
	}
	
	
	
	function checkButton() {    
        if(document.getElementById('kakao').checked) {   
            aaa = 'kakao'
        }   
        else if(document.getElementById('toss').checked) {   
            aaa = 'tosspay'     
        }
   		const btn2 = document.querySelector('#paybtn');        
        const radioButtons2 = document.querySelectorAll('input[name="pay"]');
        btn2.addEventListener("click", () => {
            let selectedPayment;
            for (const radioButton2 of radioButtons) {
                if (radioButton2.checked) {
                	selectedPayment = radioButton2.value;
                    break;
                }
            }
        }); 
        
        var IMP = window.IMP; 
		IMP.init('imp37026602'); 
		sendPayment();
		
		IMP.request_pay({
			
			pg: aaa,
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			
			name: 'admin',
			
			amount: 700,
			
			buyer_name: document.getElementById('buyer_name').value,
			
			buyer_postcode: '555-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// Controller 연결 계속 
				
				
				/* var memberData = $('buyerInfo').serialize();
				location.href="PaymentInsert.do?"+sendData; */
				
				
				
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"></jsp:include>
</body>
</html>