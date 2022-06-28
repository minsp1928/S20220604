
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makerMyProfile</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
	
	<div class="container" align="center">
		<div class="row">	
			<div id="myPage">
			<h3>판매자 프로필</h3>
			 	<table class="table table-hover" id="myPageTbl">
					<c:choose>
						<c:when test="${listSize > 0}">
							<c:forEach var="item" items="${makerMyProfileView}">
								<tr>
									<th>판매자</th>
									<td>${item.sell_name}</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td>${item.sell_tel}</td>
								</tr>
								<tr>	
									<th>상호이미지</th>
									<td>${item.sell_photo}</td>
								</tr>
								<tr>	
									<th>사업자번호</th>
									<td>${item.sell_num}</td>
								</tr>
								<tr>
									<th>사업장주소</th>
									<td>${item.sell_addr1}</td>
								</tr>
								<tr>
									<th>사업장상세주소</th>
									<td>${item.sell_addr2}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">프로필이 등록되지 않음.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			<h3></h3>
			<h3>메이커의 판매상품리스트</h3>
			 	<table class="table table-hover" id="myPageTbl">
					<tr>
						<th>상품번호</th>
						<th>상품제목</th>
					</tr>
					<c:choose>
						<c:when test="${listSize > 0}">
						  <c:forEach var="item" items="${listMakerOrder}">
							<tr>
								<td>${item.pro_num}</td>
								<td>${item.pro_title}</td>
							</tr>
						  </c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="2">판매중인 상품이 없습니다.</td>
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