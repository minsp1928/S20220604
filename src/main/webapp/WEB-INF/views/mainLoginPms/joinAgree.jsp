<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinAgree</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

	function checkAll() {
		if($("#chkAll").is(":checked")){
			$("#chk1").prop("checked",true);
			$("#chk2").prop("checked",true);
		}else{
			$("#chk1").prop("checked",false);
			$("#chk2").prop("checked",false);
		}
		
		return true;
	}

/* 	//체크박스 전체선택시
	$(".checkbox_group").on("click", "#chkAll", function () {
	    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});
	// 체크박스 개별 선택시
	$(".checkbox_group").on("click", ".normal", function() {
		
	    var is_checked = true;
	    $(".checkbox_group .normal").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });
	    $("#chkAll").prop("checked", is_checked);
	});
	 */

</script>
</head>
<body>
	<h2>이용약관 동의</h2>
	<div class="checkbox_group">
		<input type="checkbox" id="chkAll" name="chkAll">
		<label for="chkAll">이거사조 마켓 이용약관, 개인정보 수집 및 이용에 전체동의 합니다</label>
		
		<input type="checkbox" id="chk1" name="chk1" class="nomal" required="required">
		<label for="chk1">이거사조마켓 이용약관 동의</label>
		
		<input type="checkbox" id="chk2" name="chk2" class="nomal" required="required">
		<label for="chk2">개인정보 수집 및 이용 동의</label>
	</div>

	<a href="${pageContext.request.contextPath}/main" role="button" id="disagree">취소</a>
	<a href="${pageContext.request.contextPath}/joinForm" role="button" id="agree">다음단계</a>

</body>
</html>