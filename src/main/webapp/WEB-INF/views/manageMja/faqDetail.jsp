<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/faqDetail.css" rel="stylesheet" type="text/css">
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
		<div class="col-10 col-lg-6 offset-lg-2" id="one">	
		<h1>1:1문의 답변하기 </h1>
		<!-- 이메일... -->
		<form action="faqAnswer?login_check=${faq.login_check }">
			<input type="hidden" value="${faq.faq_num }" name="faq_num">
			<input type="hidden" value="${faq.login_check }" name="login_check">
			<input type="hidden" value="${faq.faq_subject}" name="faq_subject">
			<input type="hidden" value="${faq.faq_email }" name="faq_email">
			<table class="table">
				<tr>
					<th>작성일자</th>	
						<td><fmt:formatDate value="${faq.user_date}" pattern="yyyy-MM-dd"/></td> 
					<th>문의유형</th>
						<c:if test= "${faq.faq_category == 1}"><td>개인정보</td></c:if>
					 	<c:if test= "${faq.faq_category == 2}"><td>신고</td></c:if>
					 	<c:if test= "${faq.faq_category == 3}"><td>기타</td></c:if>
				</tr>
				<tr>
					<th>작성자</th>
						<td>${faq.user_id }</td> 
					<th>제목</th>
						<td>${faq.faq_subject}</td>
				</tr>
				<tr>
					<th>내용</th>
						<td colspan="3">${faq.faq_content}</td>
				</tr>
				
				<!-- 답변대기 -->
				<c:if test="${faq.faq_check==0}">
					<tr>
						<th>답변내용</th>
							<td colspan="3"><textarea rows="5" cols="60" name="admin_content"></textarea></td>
					</tr>
					<tr>
						<td><a href="faqManage">목록</a></td>
						<td colspan="3"><input type="submit" value="답변하기"></td>
					</tr>
				</c:if>
				
				<!-- 답변완료 -->
				<c:if test="${faq.faq_check==1}">
					<tr>
						<th>답변</th>
							<td colspan="3">${faq.admin_content}</td>
					</tr>
					<tr>
						<td><a href="faqManage">목록</a></td>
						<td colspan="3"></td>
					</tr>
				</c:if>
			</table>
		</form>
	 	</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>