<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>네이버 로그인</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>
	var naverLogin = new naver.LoginWithNaverId({
		clientId: "bGVedUORbqhUvX1hZlzP", // 본인걸로 수정, 띄어쓰기 금지.
		callbackUrl: "http://localhost:8989/S20220604/mainLoginPms/naverCallback", // 아무거나 설정
		isPopup: false,
		callbackHandle: true
	});
	naverLogin.init();
	alert("1되고있나요?");
	window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
	alert("2는 되고있나요?");
	
	if (status) {
		/* console.log(naverLogin.user); */
		alert("3if(state)안에 들어왔나요?");
		var user_id = naverLogin.user.getId();
		var user_name = naverLogin.user.getName();
		var email = naverLogin.user.getEmail();
		alert("4user_id->"+user_id);


		$.ajax({
			type: 'post',
			url: 'naverSave',
			data: {'user_id':user_id, 'user_name':user_name,'email':email},
			dataType: 'text',
			success: function(result) {
				if(result=='ok') {
					console.log('성공')
					location.replace("http://localhost:8989/S20220604/mainLoginPms/main") 
				} else if(result=='no') {
					console.log('실패')
					location.replace("http://localhost:8989/S20220604/mainLoginPms/login")
				}
			},
			error: function(result) {
				console.log('오류 발생')
			}
		})

	} else {
		console.log("callback 처리에 실패하였습니다.");
	}
	});
});
</script>
</body>
</html>