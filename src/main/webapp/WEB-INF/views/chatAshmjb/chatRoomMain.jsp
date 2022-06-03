-<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title>Chating</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating .me{
			color: #F6F6F6;
			text-align: right;
		}
		.chating .others{
			color: #FFE400;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
		#yourNameDel{
			display: none;
		}
	</style>
</head>

<script type="text/javascript">
	var ws;

	function wsOpen(){
		console.log("wsOpen  location.host: " + location.host);
		var wsUri = "ws://" +  location.host + "${pageContext.request.contextPath}/chating";
		// WebSocket 프로토콜을 사용하여 통신하기 위해서는 WebSocket객체를 생성.
		// 객체는 자동으로 서버로의 연결 -> 서버프로그램으로 가서 등록한다.
		//  여기서 ws://  웹서비스 호출 방식이다. 이렇게 써야 웹서비스를 소출한다. 
		ws = new WebSocket(wsUri);// 웹소켓을 열어준다. 즉 여기서 연결하러 간다.-- 컨트롤러로
		wsEvt();
 	}
		
	function wsEvt() {
		console.log(" wsEvt  start... ");
		//소켓이 열리면 동작 
		ws.onopen = function(data){ // onopen : 이벤트소스와의 연결 열릴 때 이벤트발생 [서버센트이벤트]connection이 맺어지면 실행된다.
						// 여기에 담긴 data는 뭐지?? 
		console.log("wsEvt  소켓이 열리면 초기화 세팅하기..");
		}
		
		//메시지를 받으면 동작 
		// 서버에서도 데이터를 json형태로 전달해주기떄문에 받은 데이터를 json.parse메서드를 활용해서 파싱해야한다. 
		//파싱한 객체의 타입값을 확인해 getId값	이면 초기 설정된 값이므로 찿팅창에 값을 입력하는게 아니라 추가할 태그 sessionId에 값을 세팅
		ws.onmessage = function(data) {
			
			var msg = data.data; //?? data. data가 의미하는게 뭐지??
			var memberSave = false;
			if(msg != null && msg.trim() != ''){
				memberSave = false;
				// JSON 오브젝트를 자바스크립트 오브젝트로 변환
			    var jsonMsg = JSON.parse(msg);
				// msg가 배열이고, 2개이상의 Count이면 , member 등록 대상 
                if (Array.isArray(jsonMsg)) {
                	if (Object.keys(jsonMsg).length > 1) {
                    	memberSave = true;
                       	alert("JSONArray jsonMsg Count->"+ Object.keys(jsonMsg).length);
                	}
                }
				// 파싱한 객체의 type값을 확인하여 getId값이면 초기 설정된 값이므로 채팅창에 값을 입력하는게 아니라
				// 추가한 태그 sessionId에 값을 세팅
				if(jsonMsg.type == "getId"){ // 처음에 겟아이디로 보낸것임 
					var sid = jsonMsg.sessionId != null ? jsonMsg.sessionId : ""; 
										// 삼항연산자 null이 아니면 jsonMsg.sessionId null이면 "" 을 보내라
			// 굳이 삼항연산자 준것은 null값을 처리하려고 넣었다. null과 그냥 ''으로 공백이 있는것은 다르다.(이게 nvl 처리하는것과 같은 역할을 한다.)
					if(sid != ''){
						$("#sessionId").val(sid); 
						// session User 등록 수행
						sendUser('Create');
					}
				}else if(jsonMsg.type == "message"){ // 근데 타입이 메세지이면 이걸 보내주고 
					// type이 message인 경우엔 채팅이 발생한 경우.
	                // 상대방과 자신을 구분하기 위해 여기서 sessionId값을 사용
	                // 최초 이름을 입력하고 연결되었을때, 발급받은 sessionId값을 비교하여 같다면 자기 자신이 발신한
	                // 메시지이므로 오른쪽으로 정렬하는 클래스를 처리하고 메시지를 출력.     
	                // 비교하여 같지 않다면 타인이 발신한 메시지이므로 왼쪽으로 정렬하는 클래스를 처리하고 메시지를 출력
					if(jsonMsg.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + jsonMsg.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + jsonMsg.userName + " :" + jsonMsg.msg + "</p>");
					}
					}else if(memberSave = true){
			//		}else if(jsonMsg.type = "userSave"){
					$('#member_sub').remove();
					// 멤버가 더 있어서 여기userSave가 동작하면 여기 그 콤보박스 생긴걸 지우고 새로이 다시 셀렉트 박스 생성해줌
					
					//  memberSave = true 면  -->	User 등록일경우
					// div로 감싸주면 재정의시 삭제(Refresh)후 다시 생성 
					//var str = " <div id='member_sub' class='member_sub'> ";
					var str = " ";
					/* str  += " <select name='member' id='member_sub' class='member_sub'> ";
					str  += " <option value='ALL'>전체 </option> "; 
					$(jsonMsg).each(
						function(){
							var str2 = "";
				            // User를 선택하여 message전송 가능토록 member에 등록 
							if(jsonMsg.sessionId == $("#sessionId").val()){
								alert("내꺼임"+ $("#sessionId").val())
							} else {  // 타인 session일 경우 추가 등록 
								str2 += " <option value='"+this.sessionId + "'> "+this.userName  + "</option> "; 
								str  += str2 ;
							}
						}
					);
					str += " </select>"
					str += " </div><p>" */
					$('#member').append(str);	
					memberSave = false;
				
				
				}else{
						console.warn("unknown type!");
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	$(document).ready(function() {
		// 김준수
		var userName = $("#userName").val();
		console.log("chatName  userName: " + userName);
		if(userName == null || userName.trim() == ""){
			$("#userName").focus();
		}else{
			wsOpen(); //웹서비스를오픈함 위에 있는 메서드 동작
			$("#meName").append('<input type="hidden" value="'+userName+'">'); 
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	});
	

	// User 등록  Message 전송  saveStatus --> Create/ Delete
	function sendUser(saveStatus) {
		var userOption ={
				type: "userSave", // wㅜ제 sjob
				sessionId : $("#sessionId").val(),
				userName : $("#userName").val(),
				saveStatus : saveStatus // 추가함, 삭제도 여기다 하려고
			}
		// 자바스크립트의 값을 JSON 문자열로 변환
		ws.send(JSON.stringify(userOption));
		if(saveStatus == "Delete") {
			alert("sendUser saveStatus-->"+saveStatus);
			//자기자신창을 닫습니다.
			//window.open('','_self').close(); 
			 window.open(location.href, "_self", "");
			 window.close()
		}	
		// $('#chatting').val("");
	}
	
	// 전체 Message 전송 
	function send() {
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(), // $().val()하면 변한 밸류값을 바로바로 가져옴
			userName : $("#userName").val(),
			yourName : $("#member_sub").val(),
			msg : $("#chatting").val()
		}
		// 자바스크립트의 값을 JSON 문자열로 변환
		ws.send(JSON.stringify(option));
		$('#chatting').val("");
	}
</script>
<body>
 <jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
	<div id="container" class="container">
		
		<input type="hidden" id="sessionId" value="">
		<div id="meName"></div>
		<div id="chating" class="chating">
		<!-- 아작스에서 포이치로 돌려서 채팅대화내역리스트 뽑아서 여기에 어펜드 시키는것 -->
		</div>
		<div id="member" class="member">
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName" value="${user_id }"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>