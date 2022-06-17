<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %> 
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/admin.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 
 	function approve(Vindex) {
 		var user_id = $("#user_id"+Vindex).val();
 		alert(user_id);
        Swal.fire({
            title: user_id,
            text: "님 판매자 요청을 승인하시겠습니까?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '승인',
            cancelButtonText: '반려'
        }).then((result) => {
            	if (result.isConfirmed) {
            		$.ajax({
   							url:"<%= context%>/sellerApprove",
   							data: {user_id:user_id},
   							dataType:'text',
   							success:function(data){
   								alert("승인되었습니다.");
   								$('#btn'+Vindex).val('승인');
   							}
   							});		
            	} else {
   					$.ajax({
					url:"<%= context%>/sellerReject",
					data: {user_id:user_id},
					dataType:'text',
					success:function(data){
						alert("반려되었습니다.")
						$('#btn'+Vindex).val('반려');
					}
					});
				} 
        })
	}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<div class="container">
	<div class="row">
	
		<div class="col-lg-2" id="sidebar">
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
		
		<div class="col-lg-10" id="main">		
			<div class="row" id="one">
				<div class="col-12 col-lg-3" id="member">
					<h3>회원현황</h3>
				</div>
			</div>
			<div class="row" id="memberStatus">
				<div class="col-4 col-lg-4" id="ms"><i class="fa-solid fa-user"></i> 총 회원 수 : ${memNum }</div>
				<div class="col-4 col-lg-4" id="ms"><i class="fa-solid fa-store"></i> 판매자 요청 대기 : ${sellerNum }</div>
				<div class="col-4 col-lg-4" id="ms"><i class="fa-solid fa-person-arrow-up-from-line"></i> 신규회원 : ${newMemNum }</div>
			</div>
	 		
	 		<div id="seller">
	 		<h3><i class="fa-solid fa-pipe" ></i>판매자 요청 상태</h3>
	 			<table class="table table-hover" id="sellTbl">
					<c:set var="num" value="${1 }"></c:set>
					<tr><th>번호</th><th>상호명</th><th>아이디</th><th>사업자번호</th><th>사업장</th><th>연락처</th><th>요청</th></tr>
		 			<c:forEach var="seller" items="${seller }" varStatus="status">
		 			<tr><td><input type="hidden" id="user_id${status.index }" value="${seller.user_id }">${num }</td>
		 				<td>${seller.sell_name }</td>
		 				<td>${seller.user_id }</td>
		 				<td>${seller.sell_num }</td>
		 				<td>${seller.con_addr1 }</td>
		 				<td>${seller.sell_tel }</td>
		 				<td>
		 					<input type="button" id="btn${status.index }" onclick="approve(${status.index })" value="승인/반려">
		 				</td>
		 			</tr>
	 				<c:set var="num" value="${num + 1 }"></c:set>
	 				</c:forEach>
				</table>
			</div>
			<p>
		
			<div id="new"><i class="fa-solid fa-pipe"></i><h3>신규회원</h3></div>
			<div id="date"><h3>[기간] ${minusdate } ~ ${sysdate }</h3></div>
	
			<div >
				<table class = "table" id="newtbl">
				<c:set var="num2" value="${1 }"></c:set>
					<tr><th>no</th><th>ID</th><th>이름</th><th>이메일</th><th>연락처</th><th>가입일</th></tr>
			 		<c:forEach var="list" items="${member}">
			 		<tr><td>${num2 }</td>
			 		    <td>${list.user_id}</td>
			 		    <td>${list.user_name}</td>
			 		    <td>${list.email}</td>
			 		 	<td>${list.con_tel}</td>
			 		 	<td><fmt:formatDate value="${list.join_date }" pattern="yyyy-MM-dd"/></td>
			 		</tr>
			 		<c:set var="num2" value="${num2 + 1 }"></c:set>
			 		</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>