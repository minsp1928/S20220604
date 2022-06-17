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
	function testclick() {
		var imgsrc = document.getElementById('chatImg').src;
		alert(imgsrc);
	}
</script>
</head>
<body>
<form action="createOpenChat" id="fphoto" method="post" enctype="multipart/form-data" >
	<div class="newOpenChat">
		<h1>오픈 채팅방 만들기</h1>
		<img alt="채팅방 이미지" src="${defaultChatImg }" class="chatImg" id="chatImg" name=""><p>
		<label class="picChange2" for="picChange">사진변경</label>
		<input id="picChange" class="picChange" type="file" name="file" accept=".jpg,.jpeg,.gif,.png"/>
		<input type="text" class="createChatRoomName" name="room_name" placeholder="오픈채팅방 이름을 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='오픈채팅방 이름을 입력하세요.'"><p>
		비밀번호 <input type="checkbox" id="pwdCheckbox" name="" onclick="toggleTextbox(this)">
		<input type="password" class="chatRoomPwd" id="chatRoomPwd" name="room_pawd" placeholder="비밀번호를 입력하세요." onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력하세요.'"><p>
		<button class="createNicknameBtn" name="" type="submit" >생성하기</button>
	
		<input type="hidden" name="room_type" value="2">
	</div>
</form>
<button id="testbtn" onclick="testclick()">테스트 버튼</button>
</body>
<script type="text/javascript">
	function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader();
	        // 이미지가 로드가 된 경우
	        reader.onload = function(e) {
	            const previewImage = document.getElementById("chatImg");
	            previewImage.src = e.target.result;
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("picChange");
	inputImage.addEventListener('change', function(e){
	    readImage(e.target);
	})
</script>
</html>