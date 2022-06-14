<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet"> <!-- 아이콘 -->

<link href="/css/chatRoomMain.css"  rel="stylesheet" type="text/css"> 
<meta charset="UTF-8">
<title>Chating</title>	
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
	                	if(jsonMsg.msg == "" && jsonMsg.imgSrc != ""){
							alert("if me"+jsonMsg.imgSrc);
							$("#chatting_content").append("<div class ='d_img'><img class='mePic' src='${pageContext.request.contextPath}/upload/"+jsonMsg.imgSrc+"'></div>");	
							$("#chatting_content").scrollTop($("#chatting_content")[0].scrollHeight);
	                	}else{
							alert("el me"+jsonMsg.imgSrc);
							$("#chatting_content").append("<div class ='boxme'><p class ='me'>"+ jsonMsg.msg + "</p></div>");	
							$("#chatting_content").scrollTop($("#chatting_content")[0].scrollHeight);
						} 
					}else{
						if(jsonMsg.msg == "" && jsonMsg.imgSrc != ""){
							$("#chatting_content").append("<div class ='d_img'><img class='otherPic' src='${pageContext.request.contextPath}/upload/"+jsonMsg.imgSrc+"'></div>");	
							$("#chatting_content").scrollTop($("#chatting_content")[0].scrollHeight);
						}else{
							$("#chatting_content").append("<div class ='boxother'>" + jsonMsg.userName +"<br><p class='others'>" + jsonMsg.msg + "</p>");
							$("#chatting_content").scrollTop($("#chatting_content")[0].scrollHeight);
						}
						
					}
				}else if(memberSave = true){
		//		}else if(jsonMsg.type = "userSave"){
					$('#member_sub').remove();
					// 멤버가 더 있어서 여기userSave가 동작하면 여기 그 콤보박스 생긴걸 지우고 새로이 다시 셀렉트 박스 생성해줌
					
					//  memberSave = true 면  -->	User 등록일경우
					// div로 감싸주면 재정의시 삭제(Refresh)후 다시 생성 
					//var str = " <div id='member_sub' class='member_sub'> ";
					var str = " ";
					$('#member').append(str);	
					memberSave = false;
				
				
				}else{
						console.warn("unknown type!");
				}
			}
			// 예시코드는 여기서 들어간다.
			
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	// 조건문으로 controller에서 select문 해서 null이면 실행하는 펑션
	// null이 아니면 실행안되게끔.
	
	$(document).ready(function() {
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
		// 조건문 하나 걸어서 모달 오픈되는 특정조건 관련된 sql문 하나 추가해야함.
//		document.getElementById("modal").style.display="flex";
		
	});

	// User 등록  Message 전송  saveStatus --> Create/ Delete
	// Create  -> Context도 만듦어 보냄 
	function sendUser(saveStatus) {
		var userOption ={
				type        : "userSave", // wsjob
				sessionId   : $("#sessionId").val(),
				userName    : $("#userName").val(),
				userContext :'${pageContext.request.contextPath}/upload/chatting',
				saveStatus  : saveStatus // 추가함, 삭제도 여기다 하려고
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
		var uploadImg = document.getElementById('uploadImg').src;
		var uploadImgName = $("#imgNameHidden").val();
		if(uploadImg == null)
			uploadImg = "null";
		alert(uploadImg);
		alert(uploadImgName);
		var option ={
			type: "message",
			sessionId : $("#sessionId").val(), // $().val()하면 변한 밸류값을 바로바로 가져옴
			userName : $("#userName").val(),
			yourName : $("#member_sub").val(),
			msg : $("#message").val(),
			imgSrc : uploadImgName,
			room_type : $("#room_type").val(),
			room_num : $('#room_num').val()
		}
		// 자바스크립트의 값을 JSON 문자열로 변환
		ws.send(JSON.stringify(option));
		$('#message').val("");
		document.getElementById("uploadImg").src = "";
		document.getElementById("fileUpload").value="";

			
	}
	//var inputFile = $("input[name='fileUpload']"); -- 인식못함
//	<form action="" id="fileForm" method="post" enctype="multipart/form-data">
//	<img alt="" src="" id="uploadImg" >
	//<input name="fileUpload" type="file" id="fileUpload" accept=".jpg,.jpeg,.gif,.png" onchange="imgAjax()">

	function imgAjax() {
	//	var formData = new FormData();
		var formData = new FormData($('#fileForm')[0]);
		var contextPath='${pageContext.request.contextPath}';
		var inputFile = document.querySelector("#fileUpload").files[0];
		
		$.ajax({
			contentType: false,
			processData: false,
			url:"${pageContext.request.contextPath}/imgAjax",
			type:"POST",
			enctype: 'multipart/form-data',
			data : formData,
			dataType : 'json',
			success:function(img_src){
				alert("success")
				alert("s1."+ img_src);
				var test = JSON.stringify(img_src);
				alert("s2.: "+ test.name);
				$(img_src).each(
					function () {
						console.log(this.fileName);
						$("#uploadImg").attr("src",this.realFileName);
						$("#imgNameHidden").attr("value", this.fileName);
					}	
				)
			}
		})
	}
</script>
<body>
 <jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
	<button onclick="location.href='openChatList'">오픈채팅만들기</button>
	<div id="tool" class="tool">

		<div class="snb">
			<div class="chat_list_search">
				<ul class="main2">
					<li class="toOpenLink">
						<button class="btn_toOpenChat" onclick="location.href='chat'">
							<img class="toOpenChat" src="/img/chatBox.png">
							<div class="Text">오픈채팅</div>
						</button>
					</li>
					
					<li class="qali" ><!-- 궁금해요 -->
						<button class="btn_toOpenChat" onclick="location.href='chat1?room_type=3'">
							<div class="qa">Q&A</div>
							<div class="Text">궁금해요</div>
						</button>
					</li>
					
				</ul>
				<div class="chatRoomsearchdiv">
				      <span class="icon"><i class="fa fa-search"></i></span>
				      <input type="search" class="chatRoomsearch" id="chatRoomsearch" />
				</div>
			</div>
			
			<input type="hidden" id="room_type" value="">
			<input type="hidden" id="room_num" value="">
			
			<div class="chatList_area">
				<c:forEach var="list" items="${showList}" varStatus="status">
					<div class="chatList_wrap" id="chatList_wrap" onclick="chatListClick(${status.index})">
						<input type="hidden" id="room_num${status.index}" name="room_num" value="${list.room_num }">
						<input type="hidden" id="room_type${status.index}" name="room_type" value="${list.room_type }"> ${list.room_type }
						<img class="listPic" alt="" src="${pageContext.request.contextPath}/upload/${list.pic_change }"> 
						<span class="listRoomName"> ${list.room_name}</span>
						<hr>
					</div>
				</c:forEach>
			</div>
		</div>
		
		<!-- 이거는 세션아이디, 내이름 나타내기 -->
		<input type="text" id="testId" name="testId" value="테스트아이디">
		sessionId : <input type="text" id="sessionId" value="">
		<div id="meName"></div>
		<div id="yourName">
			<input type="text" name="userName" id="userName" value="${user_id }">
		</div>
		<!-- 여기까지 -->
		
		<div id="chating" class="chating">
		<!-- 아작스에서 포이치로 돌려서 채팅대화내역리스트 뽑아서 여기에 어펜드 시키는것 -->
			<div class="chatting">
				<div class="chatting_main">
					<div id="chatting_name">  </div> 
					<hr><br>
					<div id="chatting_content" class="chatting_content">  	</div>
				</div>
				<div >
				<input type="hidden" id="imgNameHidden" value="">
				<form  id="fileForm" method="post" enctype="multipart/form-data">
						<img alt="" src="" id="uploadImg" name="uploadImg">
						<input name="fileUpload" type="file" id="fileUpload" accept=".jpg,.jpeg,.gif,.png" onchange="imgAjax()">
						<button id="sendFileBtn">파일올리기</button> <!-- onchange="imgAjax()" -->
				</form>		
				</div>
				
					<input type="text" class="message" id="message" placeholder="메시지를 입력하세요" >
					<button onclick="send()" id="sendBtn">전송</button>
				</div>
			</div>
		</div>
		<div id="modal">
		    <div class="modal_content">
		        <h2>모달 창</h2>
		        <p>모달 창 입니다.</p>
		        <div class="modal_btn">
			        <button type="button" id="modal_close_btn">모달 창 닫기</button>
			        <button type="button" id="modal_close_btn">모달 창 닫기</button>
		        </div>
		        
		    </div>
		    <div class="modal_layer"></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>


<script type="text/javascript">	
	var contextPath='${pageContext.request.contextPath}';
	function chatListClick(index) {
		var user_name = $('#userName').val();
		var str="";
		var Vroom_num = $("#room_num"+index).val();
		var room_type_this = $("#room_type"+index).val();
		$("#room_type").val(room_type_this);
		var room_num_this = $("#room_num"+index).val();
		$("#room_num").val(room_num_this);
		$('#chatting_content').empty();
		$.ajax(
				{
					url:"${pageContext.request.contextPath}/chatnaeyong",
					//      변수 명		변수값  만약 추가로 더들어가면 , 변수명: 변수값 , 변수명3: 변수값3 이런식으로 이어간다.
					data : {room_num : Vroom_num},
					// 받을때 -- 컨트롤러나 다 거쳐온다음에 받을때 데이터 타입이 'text'로 받겟다
					dataType : 'Json', //produces = "application/text;charset=UTF-8" 텍스트일떄 이거 꼭 기술해주기 컨트롤러에
					success:function(MsgList){
						var msg = JSON.stringify(MsgList);
						console.log(msg);
						$(MsgList).each(
								function(){
									var send_user_id = this.send_user_id;
									var me_user = "";
									var other_user = "";
									var content = this.content;
									var msg_time = this.msg_time;
									var msg_file = this.msg_file;
									var msg_pic = this.msg_pic;
									if($("#userName").val() == send_user_id){
										me_user = send_user_id;
										if(msg_pic != null){
											str += "<div class='d_img'><img src = '${pageContext.request.contextPath}/upload/"+msg_pic+"' class='mePic'></div>";
											//src="${pageContext.request.contextPath}/upload/${list.pic_change }"
										}else{
											str += "<div class ='boxme'><p class ='me'>"+content+"</p></div>";
								
										}
									}
									
									else if($('#userName').val() != send_user_id){
										other_user = send_user_id;
										$('#chatting_name').html(other_user);
										if(msg_pic != null){
											str += "<div class='d_img'><img src = '${pageContext.request.contextPath}/upload/"+msg_pic+"' class='otherPic' ></div>";
											
										}else{
											str += "<div class='boxother'>"+send_user_id+"<br><p class ='others'>"+content+"</p></div>";
										}
										
									}
								}		
						);
						$('#chatting_content').append(str);
					}
				
				}		 
		 );
	}
	

	document.getElementById("modal_close_btn").onclick = function() {
	    document.getElementById("modal").style.display="none";
	}
</script>
</body>
</html>
