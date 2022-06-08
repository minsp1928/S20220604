<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

	<h2>주문내역</h2>
	<a href="makerOrderList.jsp">makerOrderList.jsp</a>

	<h2>취소요청</h2>
	<a href="makerRefundList.jsp">makerRefundList.jsp</a>

	<h2>판매내역</h2>
	<a href="makerSellCompleteList.jsp">makerSellCompleteList.jsp</a>

	<h2>상품등록</h2>
	<a href="#">#(고은)</a>

	<h2>나의 등록상품 조회</h2>
	<a href="#">#(고은)</a>

	<h2>메이커프로필</h2>
	<a href="makerMyProfile.jsp">makerMyProfile.jsp</a>
	
	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>