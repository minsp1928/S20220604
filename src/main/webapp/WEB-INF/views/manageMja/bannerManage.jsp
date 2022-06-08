<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="mja.jsp" %> 
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="css/mja/section.css" rel="stylesheet" type="text/css">
</head>
<body>
<script type="text/javascript">
	
	function coupon() {
		$('#boardSelect').remove();
		alert("coupon");
		$('#couponSelect').val('1');
	}
	
	function getBoardNum() {
		$('#boardSelect').remove();
		var str  = "";
		var str2 = "";
		alert("getBoarNum")
		console.log("getBoardNum run");
		$.ajax(
			{
				url:"<%=context %>/getBoardNum",
				dataType: 'json',
				success: function (boardList) {
					var jsondata = JSON.stringify(boardList);
					str += "<select id='boardSelect' name = 'board_num'>";
					$(boardList).each(
						function () {
							str2 = "<option value=" + this.board_num+"> +" + this.board_subject+"</option>";
							str += str2;
						}		
					);
					str += "</select>"
					$('#board').append(str);
				}
			}		
		);
	}
	
	function bannerChk() {
		$.ajax({
			url:"<%=context%>/bannerChk",
			dataType:'text',
			success: function(data) {
				alert(data);
				if(data == '1'){
					var form = document.createBn;
					form.submit();
				} else {
					alert("배너가 모두 등록되었습니다. 삭제하시고 등록하세요");
				}
			}
			
		});
	}
	
	function bannerDelete(Vnum) {
		alert(Vnum);
		var bn_num = Vnum;
		$.ajax({
			url:"<%=context%>/bannerDelete",
			data:{num: bn_num},
			dataType:'text',
			success: function(data) {
				alert(data);
				if(data == '1'){
					alert("배너 삭제 성공");
					location.reload();
				} else {
					alert("배너 삭제 실패");
				}
				
			}
			
		});
	}
</script>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<jsp:include page="/WEB-INF/views/manageMja/sidebar.jsp"/>
<section>
<div>
	<h3>배너등록</h3>
		<form name="createBn" action="createBanner" method="post" enctype="multipart/form-data">
			<table>
				<tr><th>배너명</th><td colspan="2"><input type="text"	name="bn_name" required="required"></td></tr>
				<tr><th>카테고리</th><td><input type="button" name="bn_category"  value="쿠폰" 	onclick="coupon()"></td>
 						           <td><input type="button" name="bn_category"  value="공지" onclick="getBoardNum()"></td>
				</tr>
				<tr><th>공지글</th><td colspan="2"><div id="board"></div></td></tr>
				<tr><th>배너이미지</th><td colspan="2">
					<input type="file" name="bn_photo">
					<input type="hidden" name="path" value="${pageContext.request.contextPath}/resources/image/"> </td></tr>
				<tr><td colspan="3"><input type="submit" value="등록"></td></tr>
			</table>
		</form>
</div>
<div>
	<h3>배너리스트</h3>
	<c:set var="num" value="${num }"></c:set>
	<table>
		<tr><th>번호</th><th>카테고리</th><th>배너명</th><th>삭제</th></tr>
		<c:forEach var="bn" items="${banners }">
			<tr><td>${num }</td>
				<c:if test="${bn.bn_category == 1 }"><td>공지사항</td></c:if>
				<c:if test="${bn.bn_category == 2 }"><td>쿠폰</td></c:if>
				<td>${bn.bn_name }</td>
				<td><button  id="bnDelete" onclick="bannerDelete(${bn.bn_num})">삭제</button>
				</td></tr>
			<c:set var="num" value="${num - 1}"></c:set>
		</c:forEach>
	</table>
</div>

</section>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>