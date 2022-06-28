<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/notice.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
	<div class="row">	
		<div class="col-md-2" id="sidebar">
			<div class="flex-shrink-0 p-3 bg-white">
			    <a class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
			      <svg class="bi me-2" width="15" height="18"><use xlink:href="#bootstrap"/></svg>
			      <span class="fs-5 fw-semibold"><h4>고객센터</h4></span>
			    </a>
    			<ul class="list-unstyled ps-0">
			      <li class="mb-1">
			        <button onclick="location.href='notice'" class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
			        	공지사항 
			        </button>
			      </li>
			      <li class="mb-1">
			        <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
			         	1:1문의
			        </button>
			        <div class="collapse" id="dashboard-collapse">
			          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
			            <li><svg class="bi me-2" width="5" height="10"></svg><a href="faq?user_id=${sessionId}" class="link-dark rounded">문의하기</a></li>
			            <li><svg class="bi me-2" width="5" height="10"></svg><a href="interceptor" class="link-dark rounded">나의문의내역</a></li>
			          </ul>
			        </div>
			      </li>
			    </ul>
			 </div> 
		</div>
	
	<div class="col-md-10 p-1" id="main">
		<div class="row">
 			<div class="px-3" id="notice">
 				<h2>공지사항</h2>
 				<span>마켓사조의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</span>
 				<hr>
 			</div>
 			<div class="col-12 col-md-10 offset-md-1">
				<c:set var="num" value="${paging.total - paging.start+1 }"></c:set>
				<table class="table" id="tbl">
					<tr>
						<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
					</tr>
		 			<c:forEach var="list" items="${boardList }">
		 			<tr>
		 				<c:if test= "${list.board_category == 1}"><td>공지</td></c:if>
		 				<c:if test= "${list.board_category == 2}"><td>${num }</td></c:if>
		 		    	<td><a href="noticeDetail?board_num=${list.board_num }">${list.board_subject}</a></td>
		 		 		<td>${list.user_id}</td>
		 		 		<td><fmt:formatDate value="${list.board_reg_date }" pattern="yyyy-MM-dd"/></td>
		 		 		<td>${list.board_hits }</td></tr>
		 		 	<c:set var="num" value="${num-1 }"></c:set> 
		 			</c:forEach>
				</table>
			</div>
			<div id="page" class="col-12 col-md-3 offset-md-6">
				<c:if test="${paging.startPage > paging.pageBlock}">
					<a href="notice?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a href="notice?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${paging.endPage <paging.totalPage }">
					<a href="notice?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
				</c:if>
			</div>			
		</div>
	</div>
</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>