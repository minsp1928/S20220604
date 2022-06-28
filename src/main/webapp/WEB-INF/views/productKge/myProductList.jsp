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
<link href="css/kge/myProductList.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   var contextPath='${pageContext.request.contextPath}';
   var src='${pageContext.request.contextPath}/images/';

   function getProductDelete(Vpro_num) {
     // alert("pro_num->"+Vpro_num);
      
      $.ajax(
            {
               url:"<%=context%>/ProductDelete",   
               data:{pro_num : Vpro_num},
               dataType:'text',
               success:function(data) {
                  if(data =='1') {
                   //  alert("ajax getProductDelete 성공");
                     $('#proList'+Vpro_num).remove();
                  }
               }
            }
      );
   }
   // 수정 페이지로 이동
   function getProductModifyForm(vPro_num) {
   //   alert("getProductModifyForm pro_num->"+vPro_num);
      var sendData = 'pro_num='+vPro_num;
      location.href="productModifyForm?"+sendData;
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
   
   <section>
      <br>
      <br>
      <h1 class=myProductList><b>나의 상품등록 리스트</b></h1>
         <br>
         <div  class="myProductListTable">
         <table id="mylistTable">
            <tr>
               <th class="listHead"><b>상품번호&nbsp;&nbsp;</b></th><th class="listHead"><b>상품판매글제목&nbsp;&nbsp;</b></th><th class="listHead"><b>작성일&nbsp;&nbsp;</b></th><th class="listHead"><b>재고&nbsp;&nbsp;</b></th><th class="listHead"><b>판매량&nbsp;&nbsp;</b></th><th class="listHead"><b>기능</b></th> 
            </tr>
            <c:if test="${listSize > 0 }">
               <c:forEach var="listMyProduct" items="${listMyProduct}">
                  <tr class="proList${listMyProduct.pro_num}" id="proList${listMyProduct.pro_num}">
                      <td class="proList">${listMyProduct.pro_num}&nbsp;</td> 
                      <td class="proList">${listMyProduct.pro_title}&nbsp;&nbsp;</td>
                     <td class="proList">${listMyProduct.pro_date}&nbsp;&nbsp;</td>
                     <td class="proList">${listMyProduct.amount}&nbsp;&nbsp;</td>
                     <td class="proList">${listMyProduct.sell_amount}&nbsp;&nbsp;</td>
                     <td>
                        <button id="listMyProduct-button" onclick="getProductModifyForm(${listMyProduct.pro_num})">수정</button>
                        <button id="listMyProduct-button" onclick="getProductDelete(${listMyProduct.pro_num})">삭제</button>
                     </td>
                        
                  </tr>
               </c:forEach>
            </c:if>   
         </table>
         </div>
         <c:if test="${listSize == 0}">
            - 상품이 없습니다 -
         </c:if>
      </section>
   
   
   <jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>

</body>
</html>