<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
<style type="text/css">
.searchDate {
	display: inline-block;
}
.aa {
	display: inline-block;
}

.bb{
	display: inline-block;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<form action="memberKeyword">
	<table>
		<tr>
			<th>검색어</th>
				<td><select class="aa" name="search">
					<option value="user_id">아이디</option>
					<option value="user_name">이름</option></select> 
					<input class="aa" type="text" name="keyword" value="${keyword }"></td>
			<th>회원구분</th>
				<td><input class="bb" type="radio" name="m_level" value="1" checked="checked"><label>쇼퍼</label>
					<input class="bb" type="radio" name="m_level" value="2"><label>메이커</label>
				</td></tr>	
		<tr>
			<th>가입일</th>
			<td colspan="3"><input type="date" class="searchDate" name="startDate">~<input type="date" class="searchDate" name="endDate"></td></tr>
		<tr><td colspan="4"><input type="submit" value="검색"></td></tr>
	</table>
</form>

<h2>회원정보</h2>
<div id="memberList">
	<table>
		<tr><th>no</th><th>id</th><th>이름</th><th>판매자</th><th>회원상태</th></tr>
	 	<c:forEach var="list" items="${memberList }">
	 		<tr><td>${num }</td>
	 		    <td>${list.user_id}</td>
	 		 	<td>${list.user_name}</td>
	 		 	<td>${list.sell_name }</td>
	 		 	<td>
	 		 		<c:choose>
	 		 			<c:when test="${list.m_level == 3}"> 정지 </c:when>
	 		 			<c:otherwise> 활동중 </c:otherwise>
	 		 		</c:choose>
	 		 	</td>
	 		</tr>
	 		<c:set var="num" value="${num-1 }"></c:set>
	 	</c:forEach>
	</table>
</div>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>