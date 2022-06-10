<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPW</title>
<!-- <link href="css/findPW.css" rel="stylesheet" type="text/css"> -->
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	
	$(document).ready(function () {
		/* $('#background_modal').hide(); */
									
		/* $('#idSearch').click(function(){ */
		$('#findPW_btn').click(function () {//모달창
			$('#background_modal').show();
		});
		$('.close').on('click', function(){//모달창 닫기
			$('#background_modal').hide();
		});
		$(window).on('click', function(){//모달창 윈도우클릭-> 닫기
			if (event.target == $('#background_modal').get(0)) {
				$('#background_modal').hide();
			}
		});
	})
	
	
	
</script>
<style type="text/css">/*나중에 findPW.css에 옮겨서 수정할것*/
#background_modal{
	position: absolute;
	width: 100%; height: 100%;
	background: rgba(0,0,0,0.8);
	top: 0;
	left: 0;
	display: none;
	}
#modal_contents {
	color: black;
	width:400px; height:200px;
	background-color:#fff; border-radius:10px;
	position:relative; top:50%; left:50%;
	margin-top:-100px; margin-left:-200px;
	text-align:center;
	box-sizing:border-box; padding:74px 0;
	line-height:23px; cursor:pointer;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>

	<div id="background_modal" class="background_modal">
		<div class="modal_contents" style="background-color: white;">
			<br>
			<h2 id="id_value"></h2>
			<br>
			<button type="button" id="login_button" class="login_button"  onclick = "location.href = '${pageContext.request.contextPath}/login' ">로그인</button>	
<!-- 			<button type="button" id="login_button" class="login_button">비밀번호 찾기</button>	 -->
		</div>
	</div>

<div class="findPW">
<!-- 		<form action="findPwBtn" name="findPwBtn"> -->
				<a href="/findID">아이디찾기 </a> / <a href="/findPW">비밀번호찾기 </a> 
				
				<p>이름</p>
				<input type="text" name="inputName" id="inputName" class="custom-control-input"
					 placeholder="이름을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='Search'">
				<p>아이디</p>
				<input type="text" name="inputId" id="inputId" class="custom-control-input"
					 placeholder="아이디를 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='Search'">
				<p>이메일</p>
				<input type="text" name="inputEmail" id="inputEmail" class="custom-control-input"
					 placeholder="이메일을 입력해주세요" onfocus="this.placeholder=''" onblur="this.placeholder='Search'">
				<!-- <input type="submit" class="idSearch" value="확인"><p> -->
				<button id="findPW_btn" type="button" onclick="searchPW()">확인</button><p>
<!-- 		</form> -->
		<button id="login_button" onclick = "location.href = '${pageContext.request.contextPath}/login' ">로그인</button>
	</div>
	<script type="text/javascript">
	
	//비밀번호 찾아서 보여주는 아작스
	function searchPW(){
		var user_id = $('#inputId').val();
		var user_name = $('#inputName').val();
		var email = $('#inputEmail').val();
		alert("user_name: " + user_name +"user_id: " + user_id + "email: " + email);
			$.ajax({
			type:"POST",
			url:"<%=context%>/findPwBtn",
			data: {user_name: user_name, user_id:user_id, email: email},
			dataType:'json',
			success:function(member5){
				if(member5 == null){
					$('#id_value').text("회원 정보를 확인해주세요");
					alert("회원 정보를 확인해주세요");
				}else {
					$('#id_value').text("고객님의 이메일 "+member5.email+"으로 임시비밀번호를 전송했습니다. 로그인후 즉시 비밀번호를 변경해주세요!");
					alert("유저의 임시비밀번호->"+member5.user_pw);/*유저아이디를 갖고있는데 멤버로 담아와서 어떻게 유저아이디만 보여주는지 모르겠다*/
					idV = data;/*비번 찾기용으로 일단 변수에 담기는 했는데 안쓸지도..?*/
				}
			}
		});
	}

	</script>

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>