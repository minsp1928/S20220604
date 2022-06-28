<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>makerMyProfile</title>
<link href="css/pkw/myPage.css" rel="stylesheet" type="text/css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function adminConfirm(user_id) {
	  document.AdminConfirm.user_id.value=user_id;
	  if ("" != user_id) {
		  document.AdminConfirm.submit();
	  }
	  else {
		  alert("프로필을 작성 후 요청하세요");
	  }
}
	
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
	            /* document.getElementById('postcode').value = data.zonecode; */
	            document.getElementById("sell_addr1").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("sell_addr2").focus();
	        }
	    }).open();
	}
	
</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<jsp:include page="/WEB-INF/views/myPagePkw/myPageTopLine.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
	<form action="insertChkLevelMyPage" id="AdminConfirm" name="AdminConfirm">
		<input type="hidden" id="user_id" name="user_id" value=""/>
	</form>
	<form action="makerMyProfileUpdate" method="post">
		<div class="container" align="center">
		<div class="row">	
			<div id="myPage">
			<h3>메이커 프로필 등록/편집</h3>
		 	<table class="table table-hover" id="myPageTbl" style="width: 500px;">
				<tr>
					<th>판매자상호명</th>
					<td><input type="text" name="sell_name" required="required" value="${member.sell_name }" placeholder="${member.sell_name }"/></td>
				</tr>
				<tr>
					<th>판매자연락처</th>
					<td><input type="text" name="sell_tel" required="required" value="${member.sell_tel }"/></td>
				</tr>
				<tr>
					<th>판매상호이미지</th>
					<td>
						<img id="sell_photo"  name="sell_photo" style="width: 50px;" src="${member.sell_photo}">
						<input type="hidden" id="photoChange" name="photoChange" value="">
						<input id="photoFile" class="photoFile" type="file" name="multis" />
						
							<script type="text/javascript">
			                  function readImage(input) {
			                      // 인풋 태그에 파일이 있는 경우
			                      if(input.files && input.files[0]) {
			                          // 이미지 파일인지 검사 (생략)
			                          // FileReader 인스턴스 생성
			                          const reader = new FileReader()
			                          // 이미지가 로드가 된 경우
			                          reader.onload = e => {
			                              const previewImage = document.getElementById("sell_photo")
			                              previewImage.src = e.target.result
			                          }
			                          // reader가 이미지 읽도록 하기
			                          reader.readAsDataURL(input.files[0])
			                      }
			                  }
			                  // input file에 change 이벤트 부여
			                  const inputImage = document.getElementById("photoFile")
			                  inputImage.addEventListener("change", e => {
			                      readImage(e.target)
			                  })
		                 </script>
					</td>
				</tr>
				<tr>
					<th>판매자 사업자번호</th>
					<td><input type="text" name="sell_num" required="required" value="${member.sell_num }"/></td>
				</tr>
				<tr>
					<th>판매자주소</th>
				<%--<td><input type="text" name="sell_addr1" required="required" value="${member.sell_addr1 }"/></td> --%>
					<td><input type="text" name="sell_addr1" id="sell_addr1" placeholder="주소" readonly="readonly" value="${member.sell_addr1 }"><br>
					<input type="button" onclick="postcodeBtn()" value="주소검색"><br></td>
				</tr>
				<tr>
					<th>판매자상세주소</th>
				<%--<td><input type="text" name="sell_addr2" required="required" value="${member.sell_addr2 }"/></td> --%>
					<td><input type="text" name="sell_addr2" id="sell_addr2" placeholder="상세주소" value="${member.sell_addr2 }"
					 onfocus="this.placeholder=''" onblur="this.placeholder='상세주소'" required="required"></td>
				</tr>
				<tr>
					<th>신청상태</th>
					<td>
					<c:if test="${'9' eq member.chk or '2' eq member.chk}">
						<button name="" onclick="adminConfirm('${member.user_id}'); return false;">관리자승인 요청하기</button>
					</c:if>
					${member.chk_nm}</td>
					
				</tr>
			 </table>
			 	<div>
			   		<button class="button_view" type="submit" id="submit" value="저장" >저장</button>
			   		<button class="button_view" type="button" onclick="location.href='makerMyPage'">취소</button>
					
			   		<button class="button_view2" type="button" onclick="location.href='makerMyProfileView?user_id=${member.user_id}'">미리보기 (뷰 페이지)</button>
			  	</div>
		</div>
		</div>
		</div>
		</form>

	
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
</body>
</html>