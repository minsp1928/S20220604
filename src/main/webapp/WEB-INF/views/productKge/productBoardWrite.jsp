<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
    System.out.println("context->"+context);
%>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link href="css/productBoardWrite.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';
	var contextPath='${pageContext.request.contextPath}';

	function ProInfotype(){
		var str = "";
		var str2 = "";
		var pro_type1 = $("#pt1").val()
		// console.log(Vpro_type1);
		alert("pro_type1->"+pro_type1);
		
 		$.ajax(
			{
				url:"<%=context%>/type2",	
				data:{pro_type1 : pro_type1},
				dataType:'json',
				success:function(proType2List){
					var proType2ListStr = JSON.stringify(proType2List);
					alert("proType2ListStr->"+proType2ListStr);
					// $('#pt2').append(proInfoTy2List);
					str += "<select name='pro_type2'>";
					$(proType2List).each(            /* foreach문 같음 */
							function(){              /* 가져온 객체 만큼 돌려서 뿌려줌 */
							  //str2 = " " + this.deptno + "' " +this.dname + "<br>";
								str2 = "<option value=" + this.pro_type2 + ">"+this.pro_content + "</option>";
								str += str2;
							}		
						);
						str += "</select><p>"  /* select 태그는 콤보박스 */
						$('#pt2').append(str); /* append 함수는 태그가 전체로 들어갈 수 있다. */

				}
			}
		); 
		
	}

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
		<h2>상품 등록</h2>
		<form action="productBoardWrite" method="post" name="pbw" enctype="multipart/form-data"> <!-- pbw=productboardwrite -->
			<div  class="productBoardWriteTable">
			<table>
				<tr><th>상품 대분류</th><td>
				<select name="pt1" id="pt1" onchange="ProInfotype()" >   <!-- 상품 대분류(pro_type1) -->
					<c:forEach var="pro_type1" items="${proInfoTy1List}">
						<option value="${pro_type1.pro_type1}">${pro_type1.pro_content}</option>
					</c:forEach>
				</select></td>
			</tr>
			
			<tr><th>상품 중분류</th><td>
			<div id="pt2">
			
			</div>
			
			</tr>
			<tr><th><input type="hidden" name="user_id" value="${user_id}"></td></tr>
			<tr><th>상품판매글 제목</th>
				<td class="td1"><input type="text" name="pro_title" required="required"></td></tr>
			<tr><th>판매가격</th>
			<td class="td1"><input type="curren" name="pro_price"required="required">원</td></tr>
			<tr><th>상품판매 메인사진</th>
			<td class="td1"><input type="file" name="pro_photo" required="required"></td></tr>
			<tr><th>글 상세</th>
			<td class="td1"><input type="text" name="pro_write" required="required"></td></tr>
			<tr><th>상품판매 상세사진</th>
			<td class="td1"><input type="file" name="pro_pic" required="required"></td></tr>
			<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
			</table>
			</div>
		</form>
	
	
	
	
	
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
</body>
</html>