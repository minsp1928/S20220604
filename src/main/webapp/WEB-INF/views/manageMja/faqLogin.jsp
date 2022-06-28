<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/faqLogin.css" rel="stylesheet" type="text/css">

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
			<div class="row">
				<div class="col-md-3 login">
					<h4>비회원 문의내역</h4>
					<div class="form-floating">
      					<input type="email" class="form-control" id="floatingInput" placeholder="Contact number">
      					<label for="floatingInput">Contact number</label>
    				</div>
    				<div class="form-floating">
      					<input type="password" class="form-control" id="floatingPassword" placeholder="Password">
      					<label for="floatingPassword">Password</label>
   				 	</div>
					<!--  <input type="text" name="username"  id="number" placeholder="문의번호">
					<input type="password" name="pass"  id="pass" placeholder="비밀번호">-->
					<div>
						<button id="Loginbtn" onclick="faqchk()">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
<script type="text/javascript">
 
	function faqchk() {
		const num = $("#floatingInput").val();
		var pass = $("#floatingPassword").val();
	//	alert("num : " + num + "pass : " + pass);
		$.ajax({
			url: "<%=context%>/faqchk",
			data:{num: num, pass: pass},
			dataType:'text',
			success:function(data){
				if(data == "ok"){
					location.href = "faqLoginDetail?faq_num=" + num;					
				} else {
					alert("문의번호 또는 비밀번호가 틀립니다. 다시 한번 확인해주세요.");	
				}
			}
			
		});
	}

</script>
</body>
</html>