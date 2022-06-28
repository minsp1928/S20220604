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
<script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
<script src="jquery.counterup.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 
 	function approve(Vindex) {
 		var user_id = $("#user_id"+Vindex).val();
 	//	alert(user_id);
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
			<div class="page-header">
				<h3 class="page-title">
					<span class="page-title-icon bg-gradient-primary text-white mr-2">
					</span> 회원현황 </h3>		
		
				<div class="row" id="memberStatus">
					<div class="col-md-4">	 
						<div class="body">
							<i class="fa-solid fa-user"></i>
							<div><h2> ${memNum }</h2></div>
							<div><h4> 총 회원 수  </h4></div>				
						</div>
					</div>

					<div class="col-md-4">	 
						<div class="body">
							<i class="fa-solid fa-store"></i>
							<div><h2> ${sellerNum }</h2></div>
							<div><h4>  판매자 요청 대기  </h4></div>				
						</div>
					</div>
					
					<div class="col-md-4">	 
						<div class="body">
							<i class="fa-solid fa-person-arrow-up-from-line"></i>
							<div><h2> ${newMemNum }</h2></div>
							<div><h4> 신규회원  </h4></div>				
						</div>
					</div>
		 		</div>
		 	</div>	
		 	
		 	<div id= "sellerFont">판매자 요청 상태</div>
	 		<div id="seller">	 		
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
		 					<input type="button" class="sellbtn" id="btn${status.index }" onclick="approve(${status.index })" value="승인/반려">
		 				</td>
		 			</tr>
	 				<c:set var="num" value="${num + 1 }"></c:set>
	 				</c:forEach>
				</table>
			</div>
			
			<p>
		
			<div class="allnew">
				<div id="new">신규회원</div>
				<div id="date">( ${minusdate } ~ ${sysdate } )</div>
			</div>
			<div id= "newMember" >
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
<script type="text/javascript">
	$(function() {
		  var count0 = count1 = count2 = 0;
	
		  timeCounter();
	
		  function timeCounter() {
	
		    id0 = setInterval(count0Fn, 1);
	
		    function count0Fn() {
		      count0++;
		      if (count0 > 785) {
		        clearInterval(id0);
		      } else {
		        $(".number").eq(0).text(count0);
		      }
	
		    }
	
		    id1 = setInterval(count1Fn, 1);
	
		    function count1Fn() {
		      count1++;
		      if (count1 > 987) {
		        clearInterval(id1);
		      } else {
		        $(".number").eq(1).text(count1);
		      }
		    }
	
		    id2 = setInterval(count2Fn, 1);
	
		    function count2Fn() {
		      count2++;
		      if (count2 > 350) {
		        clearInterval(id2);
		      } else {
		        $(".number").eq(2).text(count2);
		      }
		    }
		  }
		});
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>