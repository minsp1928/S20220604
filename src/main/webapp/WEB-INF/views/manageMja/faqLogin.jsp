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
	<div><label for="inputEmail4" class="form-label">문의번호</label>
		 <input type="text" id="number" >
	</div>	
	<div>
		<label >비밀번호</label>
 		<input type="password" id="pass">
	</div> 
	<div>
		<button class="btn btn-primary" onclick="faqchk()">확인</button>
	</div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
<script type="text/javascript">
 
	function faqchk() {
		const num = $("#number").val();
		var pass = $("#pass").val();
		alert("num : " + num + "pass : " + pass);
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