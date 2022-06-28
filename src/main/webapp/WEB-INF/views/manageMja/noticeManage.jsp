<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/noticeManage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header2.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<div class="container">
	<div class="row">	
		<div class="col-md-2" id="sidebar">
   			<a href="adminMain" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
     				<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
     					<span class="fs-4">Admin</span>
   			</a>
   			<hr>
   			<ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="sellManage?month=0&year=0" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	판매관리
		        </a>
		      </li>
		      <li>
		        <a href="memberManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	회원관리
		        </a>
		      </li>
		      <li>
		        <a href="noticeManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	공  지
		        </a>
		      </li>
		      <li>
		        <a href="couponManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	쿠  폰
		        </a>
		      </li>
		      <li>
		        <a href="bannerManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	배  너
		        </a>
		      </li>
		      <li>
		        <a href="faqManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	1:1문의
		        </a>
		      </li>
		      <li>
		        <a href="chat?user_id&admin" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	채  팅
		        </a>
		      </li>
		    </ul>	 
		</div>
		
		<div class="col-md-8 offset-md-1" id="main">
		<div id="notice"><h3>공지사항</h3></div>
			<c:set var="num" value="${paging.total - paging.start+1 }"></c:set>
			<table class="table" id="tbl">
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
			 		<c:forEach var="list" items="${boardList }">
			 	<tr>
		 			<c:if test= "${list.board_category == 1}"><td>공지</td></c:if>
		 			<c:if test= "${list.board_category == 2}"><td>${num }</td></c:if>
		 		    <td><a href="noticeDeleteForm?board_num=${list.board_num }">${list.board_subject}</a></td>
		 		 	<td>${list.user_id}</td>
		 		 	<td><fmt:formatDate value="${list.board_reg_date }" pattern="yyyy-MM-dd"/></td>
		 		 	<td>${list.board_hits }</td>
		 		 </tr>
			 		<c:set var="num" value="${num-1 }"></c:set> 
			 		</c:forEach>
			</table>
			
			<div class="row">
				<div class="col-md-2" id="newnotice">
					<a href="writeNoticeForm" >새글등록</a>
				</div>
				<div class="col-md-2 offset-md-4" id="page">
					<c:if test="${paging.startPage > paging.pageBlock}">
						<a href="noticeManage?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
						<a href="noticeManage?currentPage=${i }">[${i }]</a>
					</c:forEach>
					<c:if test="${paging.endPage <paging.totalPage }">
						<a href="noticeManage?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
					</c:if>
				</div>
		 	</div>  	
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>