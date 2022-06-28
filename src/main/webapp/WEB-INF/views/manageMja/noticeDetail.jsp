<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/noticeDetail.css" rel="stylesheet" type="text/css">
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
	
		<div class="col-md-10" id="main">
			<div class="col-12 col-md-2 offset-md-5" id="notice">
				<h3>공지사항</h3>
			</div>
			<div class="col-12 col-md-6 offset-md-3" id="notice2">
				<h6>마켓사조의 새로운 소식들과 유용한 정보들을 한 곳에서 확인하세요.</h6>
			</div>
			
			<div class="col-12 col-md-10 offset-md-1" id="tbl">
				<input type="hidden" value="${bd.board_num}" name="board_num">
				<table class="table">
					<tr><th>글제목</th><td colspan="3">${bd.board_subject}</td></tr>
					<tr><th>작성자</th><td colspan="3">${bd.user_id }</td></tr>
					<tr><th>작성일</th>
						<td><fmt:formatDate value="${bd.board_reg_date }" pattern="yyyy-MM-dd"/></td>
						<th>조회수</th><td>${bd.board_hits }</td></tr>
					<tr><td colspan="4">${bd.board_content}</td></tr>
				</table>
			</div>
			<div class="col-12 col-md-3 offset-md-6" id="page">
				<a href="notice">목록</a>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>