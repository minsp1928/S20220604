<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
 
<html>
<head>
<title>Payment</title>
   <meta charset="UTF-8">
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
   <script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.8.js"></script>
   <link href="css/jsh/Payment.css" rel="stylesheet" type="text/css">
   
   
</head>
   <body>
   <jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>
      <section class="body_size">
              
         <div class="border">
               <input type="hidden" id="user_id" value="${member.user_id}">
               
               <div class="productTable">
                  <table>
                     <tr class="productHead">
                     <th>사진</th><th>결제 물품</th><th>수량</th><th>가격</th>
                     </tr>
                     <c:forEach var="productInfo" items="${productList}" varStatus="status">
                     <tr class="productTdSpace">
                        <td><img src="${pageContext.request.contextPath}/upload/${productInfo.pro_photo}" class="img_size"></img></td>
                        <td><div class="productTdSpace1">${productInfo.pro_title}</div></td>
                        <td><input type="text" class="productTdSpace2" value="${productQuantity[status.index]}개" readonly="readonly"></td>
                        <td><input type="text" class="productTdSpace3" value="${productQuantity[status.index] * productInfo.pro_price}원" readonly="readonly"></td>
                     </tr>
                     </c:forEach>  
                  </table>         
               </div>
               
               <table class="memberTable">
                  <tr class="memberhead">
                     <th>배송정보</th>
                  </tr>
                     <tr class="memberSpace1">
                        <th>이름: </th>
                        <td><input type="text" id="buyer_name" value="${member.user_name}" min="1" required="required"></td>
                        <!--required="required"없음 : 이름이나 주소를 수정하다가 null만 남겨도 알러트가 없음-->
                     </tr>
                     <tr>
                        <th>전화번호: </th>
                        <td><input type="text" id="buyer_tel" value="${member.con_tel}" placeholder="010-xxxx-xxxx" required="required"></td>
                     </tr>
                     <tr>
                        <th>주소: </th>
                        <td><div id="buyer_addr1">${member.con_addr1}</div></td>
                        <td><div id="buyer_addr2">${member.con_addr2}</div></td>
                     </tr>   
                     <tr>
                        <th>요청사항: </th>
                        <td><input type="text" id="buyer_req" value="" placeholder="요청사항을 입력해주세요" required="required"></td>   
                     </tr>   
               </table>
            
               <table class="paymentTable">
               
                  <tr>
                     <th><div class="paymentHead ">결제</div></th>
                  </tr>
                   <tr>
                     <td><div class="payment1">총상품가격:</div></td>
                     <td><input type="text" id="pay_tot" readonly="readonly" value="${total_price}"></td>
                  </tr>  
            
                  <tr>
                     <td><div class="payment2">배송비: </div></td><td><div class="payment2-2">2500원</div></td>
                  </tr>   
                  <tr>
                     <td class="payment3">총결제 금액: </td><td><input type="text" id="product_price" value="${total_price+2500}" readonly="readonly"></td>
                  </tr>
                  <tr>
                     <td class="payment4">결제방법</td> 
                     <td class="payment4-1">카카오페이<input type="radio" name="pay" id="kakao" value="Kakao"><br></td>
                     <td class="payment4-2">토스<input type="radio" name="pay" id="toss" value="Toss"></td>
                  </tr>   
                  <tr>
                     <td>
                        <button type="button" id="paybtn" onclick="checkButton()"> 결제하기 </button>
                     </td>
                  <tr>
               </table>
               <div class="couponSpace">
               <table>
                  <tr>
                     <td><a href="#Coupon_info" class="btn_open">할인쿠폰 선택</a>
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
                                         <tr class="cpBorder">
                                            <th>쿠폰명</th><th>할인금액</th>
                                         </tr>
                                         <tr>
                                            <td class="coupon1"><input type="hidden" name="coupon" id="Coupon_name${status.index}" value="${Coupon.cp_name}">${Coupon.cp_name}</td>
                                            <td><input type="text" class="coupon2" name="coupon" id="Coupon_price${status.index}" value="${Coupon.cp_price}" readonly="readonly"></td>
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
                     <td><input type="hidden" id="selCp_num" value="0" readonly="readonly"></td>
                  </tr>
               </table>
               </div>
            </div>   
         
      </section>
      <script>
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
       
      /*const btn1 = document.querySelector('#CouponBtn');        
      const radioButtons1 = document.querySelector('input[name="coupon"]');
      btn1.addEventListener("click", () => {
       let selectedCoupon;
          for (const radioButton1 of radioButtons) { 
            if (radioButton1.checked) {
              selectedCoupon = radioButton1.value;
                 break;
           } 
          }   
      });*/
      
       function DiscountTotal(vIndex) {
         //                실시간 변화값 Get   cp_category
         var cpName = $("#Coupon_name"+vIndex).val();
         
         alert("쿠폰: "+cpName+"이 선택 되었습니다.");
         
         var selCoupon_price =   $("#Coupon_price"+vIndex).val();
         var selCp_category =   $("#cp_category"+vIndex).val(); 
         var pay_tot =   document.getElementById('pay_tot').value - selCoupon_price
                     + 2500;/*배송비추가*/
         var selCp_num = $("#cp_num"+vIndex).val();
          //alert('vIndex->'+vIndex);
          //alert('cp_category->'+selCoupon_price);
          //alert('cp_category->'+selCp_category);
          
          document.getElementById('product_price').value = pay_tot;
          document.getElementById('selCp_num').value= selCp_num;
      }
       
      
      function sendPayment() {
         var form = document.createElement('form');
         form.setAttribute('method','post');
         form.setAttribute('action', "http://localhost:8989/InsertPaymentInfo");
         document.charset = "utf-8";
         var use_cupon = document.getElementById('selCp_num').value;
         
         var date = new Date();
         var str = date.getFullYear()+'/'+(date.getMonth()+1)+'/'+date.getDate();
         var i=0;
             var send_array = Array();
              var send_array = ${productNum};
              var basketNum = ${basketNum};
             var send_array2 = Array();
           var send_array2 = ${productQuantity};
         
   
         
         {
            var hiddenField = document.createElement("input");
         hiddenField.setAttribute('type','hidden');
         hiddenField.setAttribute('name',"pay_tot");
         hiddenField.setAttribute('value', document.getElementById('product_price').value);
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
         hiddenField.setAttribute('value', document.getElementById('buyer_addr1').innerHTML+document.getElementById('buyer_addr2').innerHTML);
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
         hiddenField.setAttribute('value', document.getElementById('selCp_num').value);
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
         
         {
            var hiddenField = document.createElement("input");
         hiddenField.setAttribute('type','hidden');
         hiddenField.setAttribute('name',"cp_num");
         hiddenField.setAttribute('value', use_cupon);
         form.appendChild(hiddenField);
         }
         
         {
            var hiddenField = document.createElement("input");
         hiddenField.setAttribute('type','hidden');
         hiddenField.setAttribute('name',"pro_num_list");
         hiddenField.setAttribute('value', send_array);   
         form.appendChild(hiddenField);
         }
         
         {   var hiddenField = document.createElement("input");
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
            
            name: 'Product',
            
            amount: document.getElementById('product_price').value,
            
            buyer_name: document.getElementById('buyer_name').value,
            
            buyer_postcode: '555-456',
            }, function (rsp) {
               console.log(rsp);
            if (rsp.success) {
               var msg = '결제가 완료되었습니다.';
               msg += '결제 금액 : ' + rsp.paid_amount;
            
               
               sendPayment();
               
               
            } else {
               var msg = '결제에 실패하였습니다.';
               msg += '에러내용 : ' + rsp.error_msg;
            }
            alert(msg);
         });
      }
   </script>
   <jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>
   </body>
</html>