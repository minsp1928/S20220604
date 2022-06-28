<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/mja/faqManage.css" rel="stylesheet" type="text/css">
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
		
		<div class="col-md-10" id="main">
			<div class="row">
				<div class="subject">
					<h4>1:1 문의하기 </h4>	
				</div>
			</div>
			<div class="row">
				<form action="faqKeyword">
					<table class="table" id="search">
						<tr>
							<td>
								<select class="form-select" name="search" aria-label="Default select example">
									<option value="faq_num">문의번호</option>
									<option value="faq_subject">글제목</option>
									<option value="user_id">작성자</option>
								</select>
							</td>
							<td>
								<input type="text" name="keyword" value="${keyword }" placeholder="검색어를 입력하세요" id="searchinput"> 
							</td>
							<td>
								<input type="submit" value="검색" id="btn">	
							</td>
						</tr>
					
					</table>	
				</form>
			</div>
			<c:set var="num" value="${paging.total-paging.start+1 }"></c:set>
			<table class="table" id="faqTbl">
				<tr><th>번호</th><th>유형</th><th>제목</th><th>작성자</th><th>답변</th></tr>
			 	<c:forEach var="list" items="${faqList }">
			 		<tr><td>${list.faq_num}</td>
			 			<c:if test= "${list.faq_category == 1}"><td>개인정보</td></c:if>
			 			<c:if test= "${list.faq_category == 2}"><td>신고</td></c:if>
			 			<c:if test= "${list.faq_category == 3}"><td>기타</td></c:if>
			 		    <td><a href="faqDetail?faq_num=${list.faq_num }">${list.faq_subject}</a></td>
			 		 	<td>${list.user_id}</td>
			 		 	<c:if test="${list.faq_check == 1}"><td>답변완료</td></c:if>
			 		 	<c:if test="${list.faq_check == 0}"><td>답변대기</td></c:if></tr>
			 		 <c:set var="num" value="${num-1 }"></c:set> 
			 	</c:forEach>
			</table>	
			<div class="page">
				<c:if test="${paging.startPage > paging.pageBlock}">
					<a href="faqManage?currentPage=${paging.startPage-paging.pageBlock }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<a href="faqManage?currentPage=${i }">[${i }]</a>
				</c:forEach>
				<c:if test="${paging.endPage <paging.totalPage }">
					<a href="faqManage?currentPage=${paging.startPatg+paging.pageBlock }">[다음]</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>