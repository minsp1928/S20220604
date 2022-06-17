<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/noticeForm.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
	<div class="row">
		<div class="col-lg-2">
   			<a href="adminMain" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
     				<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
     					<span class="fs-4">Admin</span>
   			</a>
   			<hr>
   			<ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="sellManage?month=0&year=0" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
		          	판매관리
		        </a>
		      </li>
		      <li>
		        <a href="memberManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
		          	회원관리
		        </a>
		      </li>
		      <li>
		        <a href="noticeManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
		         	공  지
		        </a>
		      </li>
		      <li>
		        <a href="couponManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
		          	쿠  폰
		        </a>
		      </li>
		      <li>
		        <a href="bannerManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
		         	배  너
		        </a>
		      </li>
		      <li>
		        <a href="faqManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
		         	1:1문의
		        </a>
		      </li>
		      <li>
		        <a href="#" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
		         	채  팅
		        </a>
		      </li>
		    </ul>	 
		</div>
		<div class="col-10 col-lg-8 offset-lg-1" id="one">	
		<h3>공지사항</h3>
			<table class="table">
				<tr>
					<th>글제목</th>
						<td colspan="3">${bd.board_subject}"</td>
				</tr>
				<tr>
					<th>작성일</th>
						<td><fmt:formatDate value="${bd.board_reg_date }" pattern="yyyy-MM-dd"/></td>
					<th>조회수</th>
						<td>${bd.board_hits }</td>
				</tr>
				<tr><td colspan="4">${bd.board_content}</td></tr>
			</table>
			<p>
			<div>
				<a href="noticeManage">목록</a>
				<a href="noticeDelete?board_num=${bd.board_num}">삭제</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>