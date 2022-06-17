<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/memberManage.css" rel="stylesheet" type="text/css">
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
		<div class="col-lg-10">
		<h2>회원정보</h2>
			<form action="memberKeyword">			
			<div class="row">
				<div class="col-4">
			 		<select class="form-select" aria-label="Default select example" name="search">
			 			<option value="user_id">아이디</option>
						<option value="user_name">이름</option>
					</select>
				</div>
				<div class="col-8">
					<input class="aa" type="text" name="keyword" value="${keyword }">
				</div> 
		 	</div>
		 	<div class="row">
		 		<div class="col-4">
		 			<label>회원구분</label>
		 		</div>
		 		<div class="col-2">			 
					<input class="form-check-input" type="radio" name="m_level" id="inlineRadio1" value="1">
				</div>
				<div class="col-2">		
					<label class="form-check-label" for="inlineRadio1">쇼퍼</label>
				</div>
				<div class="col-2">	
					<input class="form-check-input" type="radio" name="m_level" id="inlineRadio2" value="2">
				</div>
				<div class="col-2">	
					<label class="form-check-label" for="inlineRadio2">메이커</label>		
 				</div>
 			</div>
 			<div class="row">
 				<div class="col-4">
			 		<label>가입일 </label>
			 	</div>
			 	<div class="col-3">
			 		<input type="date" class="searchDate" name="startDate">
			 	</div>
			 	<div class="col-2">
			 		<label>~</label>
			 	</div>
			 	<div class="col-3">
			 		<input type="date" class="searchDate" name="endDate">
			 	</div>
			</div>
				<input type="submit" value="검색"> 	
			</form>
		 	<button type="button" id="excelDownload" class="download">엑셀파일다운로드</button>
			<table class="table" id="tableData">
				<tr><th>NO</th><th>ID</th><th>이름</th><th>판매자</th><th></th><th>연락처</th><th>주소</th><th>상태변경</th></tr>
 				<c:forEach var="list" items="${memberList }">
		 		<tr><td>${num }</td>
		 		    <td>${list.user_id}</td>
		 		 	<td>${list.user_name}</td>
		 		 	<td>${list.sell_name }</td>
		 		 	<td>${list.email }
		 		 	<td>${list.con_tel }</td>
		 		 	<td>${list.con_addr1 }</td>
		 		 	<td><a href="memberDetail?user_id=${list.user_id }">
		 		 		<c:choose>
		 		 			<c:when test="${list.m_level == 3}"> 정지 </c:when>
		 		 			<c:otherwise> 활동중 </c:otherwise>
		 		 		</c:choose></a>
		 		 	</td>
		 		</tr>
 				<c:set var="num" value="${num-1 }"></c:set>
 				</c:forEach>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script type="text/javascript" src="js/excel.js"></script>
</body>
</html>