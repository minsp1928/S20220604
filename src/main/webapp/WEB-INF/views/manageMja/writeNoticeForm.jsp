<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<h2>공지사항 등록</h2>
	<form action="writeNotice">
		<table>
			<tr><th>카테고리</th><td>
				<select name="board_category">
					<option value="1">공지</option>
					<option value="2">일반</option>
				</select></td></tr>
			<tr><th>글제목</th><td><input type="text" name="board_subject"></td></tr>
			<tr><th>내용</th><td><textarea rows="20" cols="20" name="board_content"></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
		</table>
	</form>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>