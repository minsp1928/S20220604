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
<title>login</title>
<link href="css/login.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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

    
    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
  </head>

<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>


<div class="login_box">

	
<main class="form-signin">
  <form action="loginbtn" name="loginbtn">
    <img class="logoImg" src="/img/logo_sajomarket.png" alt="마켓사조로고" width="72" height="57">
    <h1 class="h3 mb-3 fw-normal">로그인</h1>

    <div class="form-floating">
      <input type="text" id="floatingInput" name="user_id" class="form-control" required="required" >
      <label for="floatingInput">아이디를 입력하세요</label>
    </div>
    <div class="form-floating">
      <input type="password" id="floatingPassword" name="user_pw" class="form-control" required="required" >
      <label for="floatingPassword">비밀번호를 입력하세요</label>
    </div>

    <!-- <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div> -->
    
    <div id="msg" style="color: red; font-size: 9pt;">
		<c:if test="${msg!=null}">
			${msg}
		</c:if>
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
    
    
    <button id="login_submit-button" class="custom-btn btn-16" type="submit"  onclick="login_btn()">로그인</button>
    <p class="202206">© 2022.06 – 2022.07</p>
  </form>
</main>
	
		
	</div>




<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>