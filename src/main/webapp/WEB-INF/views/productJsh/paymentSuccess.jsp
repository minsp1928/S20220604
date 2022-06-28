<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"></jsp:include>
<link href="css/jsh/paymentSuccess.css" rel="stylesheet" type="text/css">
</head>
<body>
   <section>
   
   <div class="successSize">
   <h1 class="info">결제가 완료 되었습니다.</h1>
   <a href="${pageContext.request.contextPath}main"><button class="mainBtn">메인으로</button></a>
   <button onclick="location.href='shopperOrderList'" class="checkBtn">주문내역 확인하기</button>
   </div>
   
   
   
   </section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"></jsp:include>
</body>
</html>