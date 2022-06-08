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
	<a href="shopperOrderList.jsp">shopperOrderList.jsp</a>

	<h2>취소요청</h2>
	<a href="shopperRefundList.jsp">shopperRefundList.jsp</a>

	<h2>구매완료</h2>
	<a href="shopperPurchaseCompletedList.jsp">shopperPurchaseCompletedList.jsp</a>

	<h2>좋아요리스트</h2>
	<a href="shopperFavorateList.jsp">shopperFavorateList.jsp</a>

	<h2>쿠폰</h2>
	<a href="shopperMyCouponList.jsp">shopperMyCouponList.jsp</a>

	<h2>My리뷰</h2>
	<a href="shopperMyReviewList.jsp">shopperMyReviewList.jsp</a>
	
	<h2>My프로필(쇼퍼)</h2>
	<a href="shopperMyProfile.jsp">shopperMyProfile.jsp</a>

	<p> DB체크 : ${total }
	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>