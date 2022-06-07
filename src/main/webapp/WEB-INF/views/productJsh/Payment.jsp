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
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
</jsp:include>
</head>
<body>
	<table>
		<tr>
			<th>결제</th>
		</tr>
		<tr>
			<td>총상품가격</td>
		</tr>
		<tr>
			<td>할인쿠폰</td>
		</tr>
		<tr>
			<td>배송비</td>
		</tr>	
		<tr>
			<td>총결제 금액</td>
		</tr>
		<tr>
			<td>결제방법</td> 
			<td>카카오페이<input type="radio" name="pay" id="kakao" value="Kakao"><br></td>
			<td>토스<input type="radio" name="pay" id="toss" value="Toss"></td>
		</tr>	
		<tr>
			<td>
				<button type="button" id="btn" onclick="checkButton()"> 결제하기 </button>
			</td>
		<tr>
	</table>
	
	<script>
	function checkButton() {    
        if(document.getElementById('kakao').checked) {   
            aaa = 'kakao'
        }   
        else if(document.getElementById('toss').checked) {   
            aaa = 'tosspay'     
        }
    	const btn = document.querySelector('#btn');        
        const radioButtons = document.querySelectorAll('input[name="pay"]');
        btn.addEventListener("click", () => {
            let selectedPayment;
            for (const radioButton of radioButtons) {
                if (radioButton.checked) {
                	selectedPayment = radioButton.value;
                    break;
                }
            }
        });
        
        var IMP = window.IMP; 
		IMP.init('imp37026602'); 
        
		IMP.request_pay({

			pg: aaa,
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			
			name: '주문명 : 아메리카노',
			
			amount: 2000,
			
			buyer_name: '이름',
			
			buyer_postcode: '123-456',
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	}
</script>

</body>
</html>