<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>shopperMyReviewList</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>

<!--	
	review : 상품번호(pro_num), 리뷰제목(re_title), 별점(re_star)
	Product : 상품이미지(pro_photo), 상품판매글제목(pro_title), 유저아이디(user_id)
-->
	<div class="container" align="center">
		<div class="row">	
			<div id="myPage">
	 		<h3>나의 리뷰</h3>
			 <table class="table table-hover" id="myPageTbl">
				<tr>
					<th>상품번호</th>
					<th>상품이미지</th>
					<th>상품판매글제목</th>
					<th>판매자(ID)</th>
					<th>리뷰제목</th>
					<th>별점</th>
				</tr>
				<c:choose>
					<c:when test="${listSize > 0}">
					  <c:forEach var="item" items="${listShopperMyReview}">
						<tr>
							<td>${item.pro_num}</td>
							<td><img alt="" id="photoImg" src="${pageContext.request.contextPath}/upload/${item.pro_photo}"></td>
							<td><a href="${path}/productDetails?pro_num=${item.pro_num}">${item.pro_title}</a></td>
							<td><a href="${path}/makerMyProfileView?user_id=${item.user_id}">${item.user_id}</a></td>
							<td>${item.re_title}</td>
							<td>${item.re_star}</td>
						</tr>
					  </c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6">나의 작성 리뷰가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
	</div>	

	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>