<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
   String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록 리스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/productBoardWrite.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   var contextPath='${pageContext.request.contextPath}';
   var src='${pageContext.request.contextPath}/images/';
   
   <%-- function getPro_Type() {
      
      $.ajax(
         {
            url:"<%=context%>/pro_type2Products",
            data:{pro_type1 : Vpro_type1, pro_type2 : Vpro_type2},
            dataType: 'text',
            success:function(data){
               
            }
            
         }   
      
      )
      
   } --%>


</script>
<style type="text/css">

.boardTable {
   text-align: center;
    line-height: 1.5;
   width: 80%;
   border-collapse: collapse;
   color: #1c3316;
   padding: 0px;
   font-size: 18px;
   margin-left: auto;
   margin-right: auto;
       display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.pageNum {
   text-align: center;
   padding: 0px;
   margin-left: auto;
   margin-right: auto;
    flex-wrap: wrap;
    justify-content: space-around;
}

ul li {
   display: inline;
   text-transform: capitalize;
   padding: 0 10px; letter-spacing: 10px;
}
#select section {
   float: right;
   position: fixed;
}


</style>
</head>
<body>
   <jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>

   <h2>상품 목록 리스트</h2>
   
   <div class="pro_type2 buttons">
        <c:choose>
         <c:when test="${pro_type1  == 100}">
            <a href="productBoard?pro_type1=100&pro_type2=999" class="typ1 buttons">전체</a>
            <a href="productBoard?pro_type1=100&pro_type2=101" class="typ1 buttons">야채</a>
            <a href="productBoard?pro_type1=100&pro_type2=102" class="typ1 buttons">구황작물</a>
            <p>   
         </c:when>
         
         <c:when test="${pro_type1  ==  200}">
            <a href="productBoard?pro_type1=200&pro_type2=999" class="typ1 buttons">전체</a>
            <a href="productBoard?pro_type1=200&pro_type2=201" class="typ1 buttons">국산과일</a>
            <a href="productBoard?pro_type1=200&pro_type2=202" class="typ1 buttons">수입과일</a>
            <p>   
         </c:when>
         
         <c:when test="${pro_type1  ==  300}">
            <a href="productBoard?pro_type1=300&pro_type2=999"  class="typ1 buttons">전체</a>
            <a href="productBoard?pro_type1=300&pro_type2=301"  class="typ1 buttons">쌀</a>
            <a href="productBoard?pro_type1=300&pro_type2=302"  class="typ1 buttons">대두류</a>
            <p>   
         </c:when>
         </c:choose>
      </div> 
      

   <c:set var="num" value="${pg.total-pg.start+1}"></c:set>
   
   <!-- 강사님께 질문하기 -->
    <div id="select section" >
      
      <ul id="board_array_select">
         <li><a href="changeAllignmentNewest?pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}" class="BoardNewest">최신순</a></li>
         <li>|</a></li>
         <li><a href="changeAllignmentLowest?pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}" class="BoardLowest">최저가</a></li>
         <li>|</a></li>
         <li><a href="changeAllignmentHighest?pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}" class="BoardHighest">최고가</a></li>
      </ul>
      
   </div>
   
   <div class="boardTable">
      <div class="row">
      <c:forEach var="listProduct" items="${listProduct }">
      
      
      
      <div class="col-lg-4">
      
         <div class="card" style="width: 18rem;">
             <img src="${pageContext.request.contextPath}/img/${listProduct.pro_photo}" class="card-img-top" alt="..." height="250rem">
              <div class="card-body">
               <h5 class="card-title">${listProduct.pro_title}</h5>
               <p class="card-price">${listProduct.pro_price}원</p>
              <a href="productDetails?pro_num=${listProduct.pro_num}" class="btn btn-primary">상세 페이지</a>
              </div>
         </div>
      
      </div>
      
         <c:set var="num" value="${num - 1 }"></c:set>
         
      </c:forEach>
      </div>   
   </div>
   
   <div class="pageNum">
      <c:if test="${pg.startPage > pg.pageBlock }">
         <a href="list?currentPage=${pg.startPage-pg.pageBlock}">[이전]</a>
      </c:if>
      <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
         <a href="list?currentPage=${i}">[${i}]</a>
      </c:forEach>
      <c:if test="${pg.endPage < pg.totalPage }">
         <a href="list?currentPage=${pg.startPage+pg.pageBlock}">[다음]</a>
      </c:if>
   </div>






   
    
    
       
    
    
    
    
    



   <jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>