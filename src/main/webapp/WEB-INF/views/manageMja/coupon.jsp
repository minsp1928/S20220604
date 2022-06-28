<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<%
   String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/coupon.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
   <div class="row">      
      <div  id="coupon">
         <h3>진행중인 쿠폰</h3>
         <h6>마켓사조에서 준비한 다양한 쿠폰으로 합리적인 쇼핑하세요.</h6>
         <hr>
      </div>

      <input type="hidden" id="user_id" name="user_id" value="${user_id}"> 
      <c:forEach var="cp" items="${cpList }" varStatus="status">
         <div class="col-md-4">                    
            <img src="/img/coupon_default.png" class="card-img-top" alt="쿠폰이미지">
            <div class="card-body">
                 <h5 class="card-title">${cp.cp_name }</h5>
                 <p class="card-text"> 
                    <fmt:parseDate value=" ${cp.st_date }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
                    ~
                    <fmt:parseDate value=" ${cp.end_date }" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                    <fmt:formatDate value="${date }" pattern="yyyy-MM-dd"/>
                 <p>
               <input type="hidden" id="cp_num${status.index }" name="cp_num" value="${cp.cp_num }">
                 <div id="downBtn"><button type="button" class="btn btn-primary btn-sm" onclick="couponDown(${status.index})">쿠폰다운</button></div>
            </div><p>
         </div>   
      </c:forEach>
       
       <div class="row">
         <div class="col-12 col-md-2 offset-md-6" id="page">
            <c:if test="${paging.startPage > paging.pageBlock}">
               <a href="coupon?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
            </c:if>
            <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
               <a href="coupon?currentPage=${i }">[${i }]</a>
            </c:forEach>
            <c:if test="${paging.endPage <paging.totalPage }">
               <a href="coupon?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
            </c:if>
         </div>
      </div>
   </div>   
</div>    
<script type="text/javascript">
   function couponDown(Vindex) {
      console.log(Vindex);
      var user_id = $("#user_id").val();
      var cp_num = $("#cp_num"+Vindex).val();
      $.ajax({
         url: "<%=context%>/downloadCoupon",
         data:{user_id: user_id, cp_num : cp_num},
         dataType:'text',
         success:function(data){
            if(data == "alreadyIn"){
               alert("이미 쿠폰이 있습니다.")
            } else {
               alert(user_id + "님 쿠폰 다운이 완료되었습니다.")
            }
         }
         
      });
   }
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>