<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPageTopLine</title>
<link href="css/pkw/myPageTopLine.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript">
	var userId = "<%=(String)session.getAttribute("sessionId")%>";
	if ("null" == userId ) {
	/* 	alert("로그인 후 접근가능합니다."); */
		location.href="/login";
	}

</script>
</head>
<body>
	<myPageTopLine>

		<div class="myPageTopLine_user">
			<button class="shopper_button" onclick = "location.href = '${pageContext.request.contextPath}/shopperMyPage' " id="shopper_button">쇼퍼</button>
			<button class="maker_button" onclick = "location.href = '${pageContext.request.contextPath}/makerMyPage' " id="maker_button">메이커</button>
		</div>
		<div class="myPageTopLine_chat">
			<button onclick = "location.href = '${pageContext.request.contextPath}/chat?&user_id=${user_id}' " id="chat_button">채팅</button>
		</div>
	</myPageTopLine>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>