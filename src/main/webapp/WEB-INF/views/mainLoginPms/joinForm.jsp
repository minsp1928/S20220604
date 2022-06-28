<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
<title>findID</title>
<link href="css/joinForm.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	/*-------------아이디중복확인*-------------*/
	function idCheckBtn(){
		console.log("idCheckBtn 호출")
		console.log("아이디 입력 값 : "+join.user_id.value)
		var user_id = $('#user_id').val();
		if(user_id == ""){
			alert("아이디를 입력해주세요.")
		}else{
		$.ajax({
			type :"post",
			url :"<%=context%>/checkId", /* 컨트롤러 사용할 때. 내가 보낼 데이터의 주소. */
			data : {"user_id" : user_id},
			dataType : "text",
			success : function(data){	
				if(data=="1"){
					alert("사용가능한 아이디입니다.");
					$('#id_check_hidden').val('Y');
				}else{
					alert("이미 사용중인 아이디 입니다.");
					$('#user_id').focus();
					/*$('#user_id')[0].reset();리셋안됨 찾아보자*/
					$('#user_id').val('');
				}
			},
			error : function(){
			//	alert("아이디 중복 확인 ajax 실행 실패");
				}
			});
		}
	}
	/*-------------아이디 유효성-------------안됨 user_id를 못읽는중
		$(document).ready(function() {
		$(".user_id_confirm").blur(function(){
			//아이디 유효성 검사 (영문소문자, 숫자만 허용)
		       for (var i = 0; i < document.f.user_id.value.length; i++) {
		            ch = document.f.user_id.value.charAt(i)
		            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
		                alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
		                document.f.user_id.focus();
		                document.f.user_id.select();
		                return false;
		            }
		        }
		        //아이디에 공백 사용하지 않기
		        if (document.f.user_id.value.indexOf(" ") >= 0) {
		            alert("아이디에 공백을 사용할 수 없습니다.")
		            document.f.user_id.focus();
		            document.f.user_id.select()
		            return false;
		        }
		        //아이디 길이 체크 (4~12자)
		       if (document.f.user_id.value.length<4 || document.f.user_id.value.length>12) {
		            alert("아이디를 4~12자까지 입력해주세요.")
		            document.f.user_id.focus();
		            document.f.user_id.select();
		            return false;
		        }
		})
	}) 
	
	
	
	/*-------------비밀번호 확인*-------------*/
	
	$(document).ready(function() {
		$(".pw_confirm").blur(function(){
			/* alert("비밀번호 확인 blur이용"); */
			/*인풋태그 마우스 클릭해서 포커스 한 후 다른 창으로  포커스를 넘기면 이벤트 발생*/
		/* 비밀번호, 비밀번호 확인 입력창에 입력된 값을 비교해서 같다면 비밀번호 일치, 그렇지 않으면 불일치 라는 텍스트 출력.*/
		/* document : 현재 문서를 의미함. 작성되고 있는 문서를 뜻함. */
		/* getElementByID('아이디') : 아이디에 적힌 값을 가진 id의 value를 get을 해서 password 변수 넣기 */
			var password = document.getElementById('user_pw');					//비밀번호 
			var passwordConfirm = document.getElementById('user_pwchk');	//비밀번호 확인 값
			var confrimMsg = document.getElementById('confirmMsg');				//확인 메세지
			var correctColor = "#269F70";	//맞았을 때 출력되는 색깔.
			var wrongColor ="#CC3D3D";	//틀렸을 때 출력되는 색깔
			
			if(password.value == passwordConfirm.value){//password 변수의 값과 passwordConfirm 변수의 값과 동일하다.
				confirmMsg.style.color = correctColor;/* span 태그의 ID(confirmMsg) 사용  */
				confirmMsg.innerHTML ="비밀번호가 같습니다";/* innerHTML : HTML 내부에 추가적인 내용을 넣을 때 사용하는 것. */
			}else{
				confirmMsg.style.color = wrongColor;
				confirmMsg.innerHTML ="동일한 비밀번호를 입력해주세요";
			}
		});
	});
	
	
	


	/*-------------우편주소 가져오기--------------*/
	
    function postcodeBtn() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }

                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("con_addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("con_addr2").focus();
            }
        }).open();
    }


/* -------------------------------로그인 성공시 회원가입을 환영합니다 알러트 띄우기-------------------------------- */
 	function joinBtn() {
		/*전화번호 유효성체크*/
		var tel = $("#con_tel").val();
		var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/;
 		/*비밀번호 유효성체크*/
 		var pw = $("#user_pw").val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/ig);
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
		
		if(!tel_rule.test(tel)){
			alert("전화번호는 '-'를 포함하여 입력해주세요.");
			return false;
		}
		
		if(pw.length < 8 || pw.length > 20) {
		 	alert("8자리 ~ 20자리 이내로 입력해주세요.");
		 	$('#user_pw').val('').focus(); 
		 	 return false;
		 }else if(pw.search(/\s/) != -1){
		  	alert("비밀번호는 공백 없이 입력해주세요.");
		  	$('#user_pw').val('').focus();
		  	return false;
		 }else if(num < 0 || eng < 0 || spe < 0 ){
			 alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
			 $('#user_pw').val('').focus();
			 return false;
		 }else {
		 	 console.log("비밀번호 형식 통과"); 
		 } 
 		
		if($('#id_check_hidden').val() != 'Y') {
			alert("아이디 중복체크를 눌러주세요.");
			console.log("아이디 중복체크를 눌러주세요."); 
			return  false;
		}else {
		 	 console.log("아이디중복체크 버튼 누름"); 
		} 
		
		if (confirm("회원가입하시겠습니까?")) {

			$("#join").submit();
			return true; 
		}
	   

	}

</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
</jsp:include>
	<div class="user_info">
		<form  id="join" name="join" method="post" action="join" autocomplete="off" encType="multipart/form-data">
			<main class="form-signin">
				<div class="infoTxt" id="info_txt">
				    <img class="logoImg" src="/img/logo_sajomarket.png" alt="마켓사조로고" width="72" height="57">
				    <h1 class="h3 mb-3 fw-normal">기본정보</h1>
					
					<hr>
						<div class="infoAlignf" id="info_align" >
							<div class="infogul">＊ 아이디</div>  
								<input type="text" class="user_id_confirm"  id="user_id" name="user_id" required="required" placeholder="영문 소문자, 숫자를 이용해 8~20자 입력"
								onfocus="this.placeholder=''" onblur="this.placeholder='영문 소문자, 숫자를 이용해 8~20자 입력'" 
								pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$">
			
								<button class="idCheckBtn" id="id_check_btn" onclick="idCheckBtn()" value="N">중복체크</button><br>
								<input type="hidden" id="id_check_hidden" value="N"> <!--중복확인해서 알러트로 띄워줄것-> 없으면  그대로, 있으면 reset-->
						</div>
						<div class="infoAlignf">
							＊ 비밀번호
							<div class="PswdBig">
								<!--암호화하는 코드는 나중에 추가할지 정할것.-->
								<div >	
									<input class="pswdInput" type="password" id="user_pw" name="user_pw"required="required" placeholder="8자리 ~ 20자리로 입력해주세요"
									 onfocus="this.placeholder=''" onblur="this.placeholder='8자리 ~ 20자리로 입력해주세요'">
								</div>
								<div class="pswdLabel">
									<label class="pswdLabelReal" >영문,숫자, 특수문자를 포함해주세요</label><br>
								</div>
							</div>
						</div>
						<div class="infoAlignf">
							＊ 비밀번호 확인 <!--키보드로 입력하는 순간 첫번째 비밀번호와 같은지 확인-->
							<div >
								<span><input type="password" class="pw_confirm"  id="user_pwchk" placeholder="비밀번호확인"
								onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 다시 입력해주세요'"> 
								</span>
								<span id ="confirmMsg"></span> <!--확인 메세지-->
							</div>	
						</div>
						<div class="infoAlignb">
							＊ 이름
							<div class="nameInput">
								<input type="text" class="userNameIn" id="user_name" name="user_name" required="required">
							</div>
						</div>
						<div class="infoAlignb">
						
							＊ 이메일<!--메일 인증을 하고싶으면 테이블에 컬럼필요, 아작스 이용.-->
							<div class="userEmail">	
									<input type="text" class="userEmailHead" id="user_email" required>
									<span id="middle">@</span><input type="text" class="userEmailTail" id="email_address" list="user_email_address">
										<datalist id="user_email_address">
											<option value="naver.com"></option>
											<option value="daum.com"></option>
											<option value="gmail.com"></option>
											<option value="직접입력"></option>
										</datalist>
										<input type="hidden" id="email" name="email" value="">
								</div>
							<!-- 	/*-------------이메일주소 가져오기--------------*/ -->		
								<script type="text/javascript">
											$("#user_email").blur(function(){
												totalemail();	
											});
											
											$("#email_address").change(function(){
												totalemail();	
											});
						
											function totalemail() {
												const user_email = $("#user_email").val();
												const middle = $("#middle").text();
												const email_address = $("#email_address").val();
												if(user_email != "" && email_address != "") {
													$("#email").val(user_email+middle+email_address);
												}
											};
			
								</script>
			
						</div>
						<div class="infoAlignb">
							＊ 전화번호
							<div >
								<input type="text"  id="con_tel" name="con_tel" class="phone" required="required" maxlength="13" placeholder="000-0000-0000"
								onfocus="this.placeholder=''" onblur="this.placeholder='000-0000-0000'" pattern="\d{2,3}-\d{3,4}-\d{4}">
							</div>
						</div>
						<div class="infoAlignc">
							＊ 주소 
							<div class="PostTot">
								<div class="postCode">
									<input type="text"  id="postcode" placeholder="우편번호"><br>	
					   			</div>
					   			<div class="searchBtn">
					   				<input type="button" onclick="postcodeBtn()" value="우편번호 검색"><br>
					   			</div>
					   			<div>
					   				<input type="text" class="addr1" name="con_addr1" id="con_addr1" placeholder="주소" readonly="readonly"><br>
				   					<input type="text" class="addr2" name="con_addr2" id="con_addr2" placeholder="상세주소" onfocus="this.placeholder=''" onblur="this.placeholder='상세주소'" required="required">
								</div>
							</div>
						</div>
						<div class="infoAlignb">	
							<div class="photoTxt">	＊ 프로필<p>&nbsp&nbsp&nbsp사진등록</div>
							<div class="userPotoWrap">
								<!--null인경우 랜덤값으로 넣어야 할텐디(1~7) how 아작스 구현할것 고니언니한티물어보자-->
								<div class="userPhotoo">
									<img class="userImg" id="user_photo"  name="user_photo" alt="기본 프로필 사진">
									<input type="hidden" id="photoChange" name="photoChange" value=""> <!--히든의값에 어떻게 값을 넣지?-->
									<!-- <label class="photoFile1" for="photoFile">사진변경</label> -->
								</div>
								<div class="potoFileeee">
									<input id="photoFile" class="photoFile" type="file" name="multi" />
								</div>
									<script type="text/javascript">
										const images = [ //디폴트이미지1~7개 랜덤으로 값을 값을 정함
											"default_profile1.png","default_profile2.png","default_profile3.png",
											"default_profile4.png","default_profile5.png","default_profile6.png","default_profile7.png"]
										const chosenImage = images[Math.floor(Math.random() * 6 + 1)];/*1~7의 랜덤숫자 */
										const user_image = document.getElementById("user_photo");
										user_image.src = 'img/'+chosenImage;
									//	alert("user_image.src "+ user_image.src);
										$("#photoChange").val(chosenImage);
										/* bgImage.src = "img/"+chosenImage; //img 태그속성을 넣어줌
										document.body.appendChild(bgImage); // */
										/*프로필 사진 미리보기 */
										function readImage(input) {
										    // 인풋 태그에 파일이 있는 경우
										    if(input.files && input.files[0]) {
										        // 이미지 파일인지 검사 (생략)
										        // FileReader 인스턴스 생성
										        const reader = new FileReader();
										        // 이미지가 로드가 된 경우
										        reader.onload = function(e) {
										            const previewImage = document.getElementById("user_photo");
										            previewImage.src = e.target.result;
										        }
										        // reader가 이미지 읽도록 하기
										        reader.readAsDataURL(input.files[0]);
										    }
										}
										// input file에 change 이벤트 부여(click같은 이벤트임) 변화를 감지
										const inputImage = document.getElementById("photoFile");
										inputImage.addEventListener('change', function(e){
										    readImage(e.target);
										})
									</script>
							</div>
						</div> <!-- 프로필사진 디브 -->
				</div>
							
			<!-- 	<!--성공시 회원가입을 축하합니다알러트 뜨고 로그인화면 이동-->
				<div id="buttons" style="display: inline-flex;"> 
						<input id="findID_submit-button" class="custom-btn btn-16" type="button" value="취소"  onclick = "location.href = '${pageContext.request.contextPath}/main' ">
						<input id="login_submit-button" class="custom-btn btn-16" type="button" value="회원가입" onclick="joinBtn()">
				</div>
			   
			 	<p class="202206">© 2022.06 – 2022.07</p>
			</main>
		</form>
	</div>

<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>