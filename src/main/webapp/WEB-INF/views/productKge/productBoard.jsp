<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="css/kge/productBoard.css" rel="stylesheet" type="text/css">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<!-- fontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<!-- Css Styles -->
<link rel="stylesheet" href="css/main/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/main/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/main/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/main/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/main/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/main/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/main/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/main/style.css" type="text/css">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   var contextPath='${pageContext.request.contextPath}';
   var src='${pageContext.request.contextPath}/images/';
   
   //위시 리스트 아작스 
   function putCheckProduct(index) {
      
      var user_id = $("#detialsUser_id"+index).val();
      var pro_num = $("#detailsPro_num"+index).val();
   //   alert("pro_num->"+pro_num);
   //   alert("user_id->"+user_id);
      // 로그인이 되어 있지 않은 상태라면, 로그인 페이지로 이동하도록 연결
      if (user_id =="") {
         location.href = "/login";
      }else{
      var pro_num = $("#detailsPro_num"+index).val();
    
      $.ajax(
         {
            url:"<%=context%>/inputCheckProduct",
            data:{user_id : user_id, pro_num : pro_num},
            dataType : 'text',
            success:function(data){
               
               if (data == 1) {
                  alert("위시리스트에 추가 되었습니다.");
               } else alert("이미 추가 되었습니다.");
            }
         });
      }
   }

   //////////////////

         
      // 로그인 체크 function
      function loginCheck(index){
      //   alert("loginCheck start...");

         var user_id = $("#detialsUser_id"+index).val();
      //   alert("user_id->"+user_id);
         // 로그인이 되어 있지 않다면 로그인 페이지로 이동
         if (user_id =="") {
            location.href = "/login";
            return false;
         }
         else return true;
      }
      
      // 장바구니 추가 아작스
         function putBaskect(index) {
        //    alert("putBaskect start...");
            
            // 로그인 체크 function 타기
            loginCheck(index);
            
            var user_id = $("#detialsUser_id"+index).val();
            var pro_num = $("#detailsPro_num"+index).val();
        //    alert("pro_num->"+pro_num);
            
            var quantity = 1;
         //   alert("quantity->"+quantity);
            
            $.ajax(
               {
                  url:"<%=context%>/inputBasket",
                  data:{user_id : user_id, pro_num : pro_num, quantity : quantity},
                  dataType : 'text',
                  success:function(data){
               //      alert("data;" + data)
                     if (data == 1) {
                        alert("장바구니에 추가 되었습니다.");
                     } else alert("이미 추가 되었습니다.");
                  }
               });
            }
      
      //채팅 연결
      function putChatting(index) {
        // alert("putChatting1 start...");
          
          // 로그인 체크 function 타기
          loginCheck(index);
          var pro_num = $("#detailsPro_num"+index).val();
          var pro_title = $("#detialsPro_title"+index).val();
          var user_id = $("#detialsSeller_id"+index).val();
          
       //   alert("pro_num->"+pro_num);
          location.href = "/chatWithCeller?pro_num="+pro_num+"&pro_title="+pro_title+"&user_id="+user_id;
      }

</script>


</head>
<body>
   <jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>
	<div id="title_margin" style="margin-top: 70px;">
	   <div class="section-title">
	   		<c:choose>
	   			<c:when test="${pro_type1  == 100}">
	   				<h2>채소</h2>
	   			</c:when>
	   			<c:when test="${pro_type1  == 200}">
	   				<h2>과일</h2>
	   			</c:when>
	   			<c:when test="${pro_type1  == 300}">
	   				<h2>곡식</h2>
	   			</c:when>
	   		
	   		</c:choose>                
	   </div>
	 </div>  
   <div class="pro_type2_buttons">
        <c:choose>
         <c:when test="${pro_type1  == 100}">

            <a href="productBoard?pro_type1=100&pro_type2=999" class="typ1_buttons">전체&nbsp;</a>
            &nbsp;&nbsp;
            <a href="productBoard?pro_type1=100&pro_type2=101" class="typ1_buttons">&nbsp;야채&nbsp;</a>
            &nbsp;&nbsp;
            <a href="productBoard?pro_type1=100&pro_type2=102" class="typ1_buttons">&nbsp;구황작물</a>
            <p>   
         </c:when>
         
         <c:when test="${pro_type1  ==  200}">

            <a href="productBoard?pro_type1=200&pro_type2=999" class="typ1_buttons">전체&nbsp;</a>
            <a href="productBoard?pro_type1=200&pro_type2=201" class="typ1_buttons">&nbsp;국산과일&nbsp;</a>
            <a href="productBoard?pro_type1=200&pro_type2=202" class="typ1_buttons">&nbsp;수입과일</a>
            <p>   
         </c:when>
         
         <c:when test="${pro_type1  ==  300}">

            <a href="productBoard?pro_type1=300&pro_type2=999"  class="typ1_buttons">전체&nbsp;</a>
            <a href="productBoard?pro_type1=300&pro_type2=301"  class="typ1_buttons">&nbsp;쌀</a>
            <a href="productBoard?pro_type1=300&pro_type2=302"  class="typ1_buttons">&nbsp;대두류</a>
            <p>   
         </c:when>
         </c:choose>
      </div> 
  

   <c:set var="num" value="${pg.total-pg.start+1}"></c:set>

   
   <input type="hidden" name="currentPage" value="${pg.currentPage }">
   
   
   <!-- for each로 돌려서 상품 목록 보여주기 -->
   <div class="boardTable">
   
      <div id="select_section" class="select_section">
         
         <ul id="board_array_select">
            <li><a href="changeAllignmentNewest?pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}" id="BoardNewest"><b>최신순</b></a></li>
            <li>|</li>
            <li><a href="changeAllignmentLowest?pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}" id="BoardLowest"><b>최저가</b></a></li>
            <li>|</li>
            <li><a href="changeAllignmentHighest?pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}" id="BoardHighest"><b>최고가</b></a></li>
         </ul>
         
      </div>
      
 <section class="featured_spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <c:forEach var="listProduct" items="${listProduct }" varStatus="status">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="/upload/${listProduct.pro_photo}" height="250rem">
                            <ul class="featured__item__pic__hover">
                                <li><a href="javascript:putCheckProduct(${status.index});"><i class="far fa-heart" ></i></a></li>
                                <li><a href="javascript:putBaskect(${status.index});"><i class="fas fa-cart-arrow-down"></i></a></li>
                                <li><a href="javascript:putChatting(${status.index});"><i class="far fa-comments" ></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a id="item_a" href="productDetails?pro_num=${listProduct.pro_num}">${listProduct.pro_title}</a></h6>
                            <h6 id="item_context">${listProduct.pro_write}</h6>
                            <h5><fmt:formatNumber value="${listProduct.pro_price}" pattern="#,###"/>원</h5>               
                            <input type="hidden" id="detialsPro_title${status.index}" name="pro_title" value="${listProduct.pro_title}">
                            <input type="hidden" id="detialsSeller_id${status.index}" name="sellerUser_id" value="${listProduct.user_id}"><!-- 판매자 아이디-->
                            <input type="hidden" id="detialsUser_id${status.index}" name="user_id" value="${sessionId}"><!-- 구매자 아이디-->
                           <input type="hidden" id="detailsPro_num${status.index}" name="pro_num" value="${listProduct.pro_num}">
                        </div>
                    </div>
                </div>
            </c:forEach>   
         <c:set var="num" value="${num - 1 }"></c:set>  
            </div>
        </div>
    </section>
   
   <div class="pageNum">
      <c:if test="${pg.startPage > pg.pageBlock }">
         <a class="pageNumi" href="productBoard?currentPage=${pg.startPage-pg.pageBlock}&pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}">[이전]</a>
      </c:if>
      <c:forEach var="i" begin="${pg.startPage}" end="${pg.endPage}">
         <a class="pageNumi" href="productBoard?currentPage=${i}&pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}">[${i}] </a>
      </c:forEach>
      <c:if test="${pg.endPage < pg.totalPage }">
         <a class="pageNumi" href="productBoard?currentPage=${pg.startPage+pg.pageBlock}&pro_type1=${product.pro_type1}&pro_type2=${product.pro_type2}">[다음]</a>
      </c:if>
   </div>
</div>


   <jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
      <jsp:param value="" name=""/>
   </jsp:include>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>