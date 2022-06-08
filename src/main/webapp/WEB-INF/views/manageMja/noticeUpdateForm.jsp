<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<h3>공지사항</h3>
	<input type="hidden" value="${bd.board_num}" name="board_num">
	<form action="">
		<table>
			<tr><th>글제목</th><td colspan="3"><input type="text" name="board_subject">${bd.board_subject}</td></tr>
			<tr><th>작성일</th>
				<td><fmt:formatDate value="${bd.board_reg_date }" pattern="yyyy-MM-dd"/></td>
				<th>조회수</th><td>${bd.board_hits }</td></tr>
			<tr><td colspan="4"><input type="text" name="board_content">${bd.board_content}</td></tr>
			<tr><td colspan="4"><input type="submit" value="수정하기"></td></tr>
		</table>
	</form>
	<a href="noticeManage">목록</a>
</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>