<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %> 
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/bannerManage.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header2.jsp" flush="true">
	<jsp:param value="" name=""/>
</jsp:include>
<div class="container">
	<div class="row">	
		<div class="col-md-2" id="sidebar">
   			<a href="adminMain" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
     				<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
     					<span class="fs-4">Admin</span>
   			</a>
   			<hr>
   			<ul class="nav nav-pills flex-column mb-auto">
		      <li class="nav-item">
		        <a href="sellManage?month=0&year=0" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	판매관리
		        </a>
		      </li>
		      <li>
		        <a href="memberManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	회원관리
		        </a>
		      </li>
		      <li>
		        <a href="noticeManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	공  지
		        </a>
		      </li>
		      <li>
		        <a href="couponManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		          	쿠  폰
		        </a>
		      </li>
		      <li>
		        <a href="bannerManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	배  너
		        </a>
		      </li>
		      <li>
		        <a href="faqManage" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	1:1문의
		        </a>
		      </li>
		      <li>
		        <a href="chat?user_id&admin" class="nav-link link-dark">
		          <svg class="bi me-2" width="16" height="16"></svg>
		         	채  팅
		        </a>
		      </li>
		    </ul>	 
		</div>
		
		<div class="col-md-10" id="main">
		<div id="subject">
			<h3>배너리스트</h3> 
		</div>
			<div>
				<c:set var="num" value="1"></c:set>
				<table class="table" id="bannerCreate">
					<tr><th>번호</th><th>카테고리</th><th>배너명</th><th>삭제</th></tr>
					<c:forEach var="bn" items="${banners }">
					<tr>
						<td>${num }</td>
							<c:if test="${bn.bn_category == 1 }"><td>공지사항</td></c:if>
							<c:if test="${bn.bn_category == 2 }"><td>쿠폰</td></c:if>
						<td>${bn.bn_name }</td>
						<td><button  id="bnDelete" onclick="bannerDelete(${bn.bn_num})">삭제</button></td>
					</tr>
					<c:set var="num" value="${num + 1}"></c:set>
					</c:forEach>
				</table>
			</div>
			
			<p>
 
		<div id="subject">
			<h3>배너등록</h3> 
		</div>
			<form name="createBn" action="createBanner" method="post" enctype="multipart/form-data">
				<table class="table" id="bannerTbl">
					<tr>
						<th>카테고리</th><td><input type="button"    value="쿠폰" 	onclick="coupon()"></td>
	 						           <td><input type="button"    value="공지" onclick="getBoardNum()"></td>
					</tr>
					<tr>
						<th>배너명</th><td colspan="2"><input type="text"	name="bn_name" required="required"></td>
					</tr>
					<tr>
						<th>공지글</th><td colspan="2"><div id="board"></div></td>
					</tr>
					<tr>
						<th>배너이미지</th><td colspan="2"><input type="file" name="file">
						<input type="hidden" id="bn_category" name="bn_category" >
						<input type="hidden" id="board_num" name="board_num" ></td>
					</tr>
				</table>
			</form>
			<input id="createBtn" type="button" value="등록" onclick="bannerChk()"> 
		</div>
	</div>
</div>

<script type="text/javascript">
	
	function coupon() {
		$('#boardSelect').remove();
	//	alert("coupon");
		$('#bn_category').val('2');
		$('#board_num').val('1');
	}
	
	function getBoardNum() {
		$('#boardSelect').remove();
		var str  = "";
		var str2 = "";
		$('#bn_category').val('1');
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
			//	alert(data);
				if(data == '1'){
					var createBn = document.createBn;
					alert("배너가 등록되었습니다.");
					createBn.submit();			
				} else {
					alert("배너가 모두 등록되어있습니다. 삭제하시고 등록하세요");
				}
			}
			
		});
	}
	
	function bannerDelete(Vnum) {
		//alert(Vnum);
		var bn_num = Vnum;
		$.ajax({
			url:"<%=context%>/bannerDelete",
			data:{num: bn_num},
			dataType:'text',
			success: function(data) {
				//alert(data);
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
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>