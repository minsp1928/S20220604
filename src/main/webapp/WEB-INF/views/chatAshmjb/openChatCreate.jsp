<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/openChatAsh.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function toggleTextbox(checkbox) {
		// 1. 텍스트 박스 element 찾기
		const textbox_elem = document.getElementById('chatRoomPwd');
		// 2-1. 체크박스 선택여부 체크
		// 2-2. 체크박스 선택여부에 따라 텍스트박스 활성화/비활성화
		textbox_elem.disabled = checkbox.checked ? false : true;
		// 3. 텍스트박스 활성화/비활성화 여부에 따라
		// - 텍스트박스가 비활성화 된 경우 : 텍스트박스 초기화
		// - 텍스트박스가 활성화 된 경우 : 포커스 이동
		if(textbox_elem.disabled) {
		  textbox_elem.value = null;
		}else {
		  textbox_elem.focus();
		}
	}

</script>
</head>
<body>
	<div class="newOpenChat">
		<h1>오픈 채팅방 만들기</h1>
		<img alt="채팅방 이미지" src="/img/coupon_banner.jpg" class="chatImg" name=""><p>
		<button class="picChange" name="" onclick="location.href='#'">사진 변경</button><p>
		<input type="text" class="createChatRoomName" name="" placeholder="오픈채팅방 이름을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='오픈채팅방 이름을 입력하세요.'"><p>
		비밀번호 <input type="checkbox" id="pwdCheckbox" name="" onclick="toggleTextbox(this)">
		<input type="password" class="chatRoomPwd" id="chatRoomPwd" name="" placeholder="비밀번호를 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요.'"><p>
		<button class="createNicknameBtn" name="" onclick="location.href='#'">생성하기</button>
	</div>
</body>
</html>