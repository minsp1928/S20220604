<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findID</title>
<link href="css/signin.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>	

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">


    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
    </style>
<script type="text/javascript">
	
//모달창 열기,닫기
$(function() {
	
	$(".modal_button").click(function(){
		$(".modal").fadeIn();
	});
	$(".modal_content").click(function(){
		$(".modal").fadeOut();
	});
});

</script>
    

  </head>

<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>


	<div class="findID_box">
		
			
		<main class="form-signin">
		
		    <img class="logoImg" src="/img/logo_sajomarket.png" alt="마켓사조로고" width="72" height="57">
		    <h1 class="h3 mb-3 fw-normal">아이디찾기</h1>
		
		    <div class="form-floating">
		      <input type="text" id="floatingInput" name="floatingInput" class="form-control" required="required" >
		      <label for="floatingInput">이름을 입력해주세요</label>
		    </div>
		    <div class="form-floating">
		      <input type="email" id="floatingPassword" name="floatingPassword" class="form-control" required="required" >
		      <label for="floatingPassword">이메일을 입력해주세요</label>
		    </div>
		
		    
		   
		<div class="find_idPw">
			<ul class="login-more p-t-190">
				<li>
				<a href="${pageContext.request.contextPath}/findID" class="sign_buttons"  id="find_id">아이디</a>
				 /
				<a href="${pageContext.request.contextPath}/findPW" class="sign_buttons"  id="find_pw">비밀번호</a><span class="loginTxt">를 잊어버리셨나요?</span>
				</li>
				<li>
					<span class="loginTxt">아직 회원이  아니신가요?</span><a href="${pageContext.request.contextPath}joinAgree" class="sign_buttons">회원가입></a>
				</li>
			</ul> 
		  </div>  
		    
		  <button id="findID_submit-button" class="custom-btn btn-16" type="submit" onclick="searchID()">확인</button><p>
		   
		  
		   <button id="login_submit-button" class="custom-btn btn-16" onclick = "location.href = '${pageContext.request.contextPath}/login' ">로그인 하러가기</button>
		   
		   
		</main>
		 <p class="202206">© 2022.06 – 2022.07</p>
			
		
	</div>
			<div class="modal" id="modal">
				<div class="modal_content" title="클릭하면 창이 닫힙니다">
					<p id="aaas"></p>
				    <button id="login_submit-button" class="custom-btn btn-16" onclick = "location.href = '${pageContext.request.contextPath}/login' ">로그인 하러가기</button>
				    <br>
					<a href="${pageContext.request.contextPath}/findPW" class="sign_buttons"  id="find_pw">비밀번호</a><span class="loginTxt">를 잊어버리셨나요?</span>
					
				</div>
			</div>

	<script type="text/javascript">
	
	//아이디 찾아서 보여주는 아작스
	
		document.getElementById("findID_submit-button").onclick = function searchID() {
		    document.getElementById("modal").style.display="flex";
	
		var idV ="";
		var user_name = $('#floatingInput').val();/*inputname*/
		var email = $('#floatingPassword').val();/*inputemail 부트스트랩때문에 아이디 설정이 저럴뿐인것.*/
	//	alert("user_name: " + user_name + "email: " + email);
		
		
			$.ajax({
			type:"POST",
			url:"<%=context%>/findIdBtn",
			data: {user_name: user_name, email: email},
			dataType:'json',
			success:function(member3){
				if(member3.user_id == 'failUser'){
					/* $('#id_value').text("회원 정보를 확인해주세요"); */
					 ajaxSuccessFailUser()
				}else {
					//$('.modal_content').append("찾으시는 아이디는 "+member3.user_id+"입니다");
					//alert("찾으시는 아이디는 "+member3.user_id);/*유저아이디를 갖고있는데 멤버로 담아와서 어떻게 유저아이디만 보여주는지 모르겠다*/
					idV = member3;/*비번 찾기용으로 일단 변수에 담기는 했는데 안쓸지도..?*/
					$('#aaas').html("찾으시는 아이디는 "+member3.user_id+"입니다.");
				}
			}
		});
	}
	function ajaxSuccessFailUser(){
		
		Swal.fire({

		  title:'확인',
		  text: "회원 정보를 확인해주세요",
		  icon: 'warning',
		  showCancelButton: false,
		  confirmButtonColor: '#6B9900',
		  cancelButtonColor: '#dedab8',
		  confirmButtonText: '확인',
		}).then((result) => {
		  if (result.value) {
			  location.href="${pageContext.request.contextPath}/findID";
		  }
		})
	}
	</script>




<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>