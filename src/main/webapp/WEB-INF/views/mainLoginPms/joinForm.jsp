<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
<title>findID</title>
<link href="css/joinForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	function pw_confirm() {/*비밀번호 확인*/
	
}
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>
	<div id="user_info">
		<h2>기본정보</h2>
		<hr>
			● 아이디 
			<input type="text" id="user_id" name="user_id" required="required">
			<button id="id_check_btn" onclick="idCheckBtn()">중복확인</button><br><!--중복확인해서 알러트로 띄워줄것-> 없으면 그대로, 있으면 reset--></li>
			● 비밀번호
			<input type="password" id="user_pw" name="user_pw"required="required"
			placeholder="비밀번호 입력" onfocus="this.placeholder=''" onblur="this.placeholder='Search'">
			● 비밀번호 확인
			<input type="비밀번호 확인" id="user_pwchk" onkeyup="pw_confirm()"> 
			
	</div>
	
	

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>