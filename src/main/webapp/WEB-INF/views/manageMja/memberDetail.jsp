<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/memberDetail.css" rel="stylesheet" type="text/css">
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
			<div class="row">
			<input type="hidden" id="user_id" value="${member.user_id }">
			<input type="hidden" id="m_level" value="${member.m_level }">
			<div id="subject">
				<img src="${pageContext.request.contextPath}/upload/${member.user_photo}" class="rounded float-start" id="pic"> 
				<h6>회원 상세내역 </h6>
			</div> 		 
				<table class="table" id="memtbl">
					<tr>			
				 		<th>회원유형</th>
							<td colspan="3">
						    	<c:choose>
					 		 		<c:when test="${member.m_level == 1}">소비자</c:when>
					 		 		<c:when test="${member.m_level == 2}">소비자/판매자</c:when>
					 		 		<c:otherwise> 휴면 </c:otherwise>
					 		 	</c:choose>
					 		 </td>
					</tr>
				 	<tr>
				 		<th>총 주문 건수</th>
				 			<td>${member.orders}건</td>
				 		<th>총 주문금액</th>
				 			<td><fmt:formatNumber value="${member.orderamount  }" pattern="#,###"/>원</td>
				 	</tr>
				 	<tr><th>아이디</th>
				 		 	<td>${member.user_id }</td>
				 		 <th>이름</th>
				 		 	<td>${member.user_name}</td>
				 	</tr>
				 	<tr><th>주소</th><td colspan="3">${member.con_addr1 }</td></tr>	 	 
				 	<tr><th>연락처</th><td colspan="3">${member.con_tel }</td></tr>	 	 
				 	<tr><th>이메일</th><td colspan="3">${member.email }</td></tr>	 	 		 	 
				 	<tr><th>상태변경</th><td><button onclick="memberStatus()" id="btnStatus">
				 		<c:choose>
				 			<c:when test="${member.m_level == 3}">이용정지</c:when>
				 			<c:otherwise>활동중</c:otherwise>
				 		</c:choose></button></td> 
				 		<th>비밀번호 초기화</th><td><button onclick="passReset()">초기화</button></td></tr>	 	 		 	 
				</table>
				<div class="col-12 col-md-3 offset-md-6" id="page">
					<a href="memberManage">목록</a>
				</div>
			</div> 
		</div>
	</div>
</div>

<script type="text/javascript">
	function memberStatus(){
		var userId = $("#user_id").val();
		var mLevel = $("#m_level").val();
		var result = confirm(userId + " 님의 상태를 변경하시겠습니까?");
			if(result){
				$.ajax({
					url:"<%= context%>/memberStatus",
					data: {user_id:userId, m_level:mLevel },
					dataType:'text',
					success:function(data){
						if(data > 2){
							alert(userId+" 님의 사이트 사용이 정지되었습니다.");
							$('#btnStatus').text('이용정지');
							$('#m_level').val(3);
						} else {
							alert(userId +" 님의 사이트 이용이 가능합니다.");
							$('#btnStatus').text('활동중');
							$('#m_level').val(1);
						}
						
					}
				});		
			}
		}
	
	function passReset() {
		var userId = $("#user_id").val();
		var result = confirm(userId + " 님의 비밀번호를 초기화하시겠습니까?");
		if(result){
			$.ajax({
				url:"<%= context%>/passReset",
				data: {user_id:userId},
				dataType:'text',
				success:function(data){
					alert(userId+" 비밀번호가 초기화되었습니다.");
				}
			});		
		}
	}
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>