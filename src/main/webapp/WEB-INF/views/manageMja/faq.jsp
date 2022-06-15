<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/faq.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
	 
	<h3>1:1 문의하기</h3>
	<div class="row">
		<span id="fafa"><a href="faq?user_id=${sessionId}">문의하기</a></span>  
		<span id="fafa"><a href="questions?user_id=${sessionId}">나의 문의내역</a></span>
	</div>
	
	<form action="faqSubmit" method="post">
		<table class="table">
			<tr><td colspan="2">개인정보 수집 및 이용 안내</td></tr>
			<tr><th>수집항목</th><td>* [필수] 이름, 이메일, 휴대폰번호, 비밀번호, 발생지 주소(택배 이용문의 시), 운송장번호(택배/특송 이용문의 시)</td></tr>
			<tr><th>수집 및 이용 목적</th><td> 고객 민원 접수, 사실 관계 확인을 위한 연락 및 통지, 처리 결과 안내</td></tr>
			<tr><th>보유 및 이용 기간 </th><td> -상담 접수 및 처리 후 3개월 까지 -소비자 불만/분쟁 처리 후 3년(법정 보존기간)</td></tr>
			<tr><td colspan="2">*고객은 상기의 개인정보 수집 및 이용에 대해 동의를 거부하실 수 있으나 해당 동의를 거부하시는 경우 1:1문의가 불가합니다.</td></tr>
			<tr><td><input type="checkbox" id="inChk"></td><td>이용동의 </td></tr>
			<tr><td colspan="2"></tr>
			<tr><td colspan="2">기본 정보 입력</td></tr>
		
			<tr><th>이름</th>
				<c:choose>
					<c:when test="${empty sessionId}"><td>
						<input type="text" name="user_id" required="required"></td> 
					</c:when>
			 		<c:otherwise>
			 			<td><input type="text" name="user_id" readonly="readonly" value="${user_id}"></td>
			 		</c:otherwise>
			 	</c:choose>
			</tr>
			<tr><th>이메일</th><td><input type="text" name="faq_email" required="required"></td></tr>
			<tr><th>휴대폰번호</th><td><input type="tel" name="faq_phone" required="required"></td></tr>
			<tr><th>비밀번호</th><td><input type="text" placeholder="숫자 4자리" name="faq_pass" required="required"></td></tr>
			<tr></tr>
			<tr><td colspan="2">상세항목입력</td></tr>
			<tr><th>문의유형</th><td>
				<select name="faq_category">
					<option value="1">회원정보</option>
					<option value="2">신  고</option>
					<option value="3">기  타</option>					
				</select></td></tr>
			<tr><th>제목</th><td><input type="text" name="faq_subject" required="required"></td></tr>
			<tr><th>내용</th><td><textarea rows="5" cols="30" name="faq_content" required="required"></textarea>
				<c:choose>
					<c:when test="${empty sessionId}"> 
						<input type="hidden" name="login_check" value="0"> 
					</c:when>
				 	<c:otherwise>
				 		<input type="hidden" name="login_check" value="1">
				 	</c:otherwise>
				 </c:choose></td></tr>					 
		</table>
 	</form>
 	<button id="submitBtn">제출하기</button>	
</div>
<script type="text/javascript">
	$(document).ready(function (){
		$('#submitBtn').click(function () {
			var yn = $("input:checkbox[id=inChk]").is(":checked");
			if(yn){
				$("form").submit();
			} else {
				alert("이용동의해주셔야 등록이 가능합니다.");
			}
		})	
	});
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>