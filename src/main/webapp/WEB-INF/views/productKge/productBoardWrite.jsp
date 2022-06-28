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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="css/kge/productBoardWrite.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	var contextPath='${pageContext.request.contextPath}';
	var src='${pageContext.request.contextPath}/images/';

	function ProInfotype(){
		var values = $('#pt1').val();
		var hidden = $('#selectCheck').val();
		if(values!=hidden){
			$('#selectCheck').val(values);
		
			var str = "";
			var str2 = "";
			var pro_type1 = $("#pt1").val()
			// console.log(Vpro_type1);
			
	 		$.ajax(
				{
					url:"<%=context%>/type2",	
					data:{pro_type1 : pro_type1},
					dataType:'json',
					success:function(proType2List){
						$('#pt2').empty();
						var proType2ListStr = JSON.stringify(proType2List);
				//		alert("proType2ListStr->"+proType2ListStr);
						// $('#pt2').append(proInfoTy2List);
						str += "<select name='pro_type2' id='pt2_foreach'>";
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
		<br>
		<h2 id="pageTitle"><b>상품 등록</b></h2>
		<br>
		<input type="hidden" id="selectCheck" value="선택해 주세요">
		<form action="productWrite" method="post" name="pbw" enctype="multipart/form-data"> <!-- pbw=productboardwrite -->
			<div  class="productBoardWriteTable">
			<table class="boardWriteTable">
				<tr><th id="boardWriteLeft">상품 대분류&nbsp;&nbsp;</th><td>
				
				<select class="pro_type1" name="pro_type1" id="pt1" onclick="ProInfotype()"  > <!-- 상품 대분류(pro_type1) -->
					  <option>선택해 주세요</option>
					 <c:forEach var="pro_type1" items="${proInfoTy1List}" varStatus="i">
						<option value="${pro_type1.pro_type1}" id="selectOption${i.index }">${pro_type1.pro_content}</option>
					</c:forEach>
			    </select></td>
				
			</tr>
			
			<tr><th id="boardWriteLeft">상품 중분류&nbsp;&nbsp;</th><td>
			<div id="pt2">
			
			</div></tr>
			
			<tr><th id="boardWriteLeft"><input type="hidden" id="boardWriteRight" name="user_id" value="${user_id}"></td></tr>
			<tr><th id="boardWriteLeft">상품 이름&nbsp;&nbsp;</th><td><input type="text" id="boardWriteRight" name="pro_title" required="required"></td></tr>
			<tr><th id="boardWriteLeft">판매가격(원)&nbsp;&nbsp;</th><td><input type="number" id="boardWriteRight" name="pro_price" required="required"></td></tr>
			
			<tr><th id="boardWriteLeft">상품판매 메인사진&nbsp;&nbsp;</th>
				<td>
					<div id="mPhoto">
						<label for="pro_photoImg" id="pro_photoImg_label">파일선택</label>
						<input type="file" id="pro_photoImg" name="pro_photoImg" required="required">
						<img id="pro_photoImg_preview">
					</div>
				</td>
			</tr>
			
			<tr><th id="boardWriteLeft">상품 상세글&nbsp;&nbsp;</th><td><input type="text" id="boardWriteRight" name="pro_write" required="required">
			
			<tr><th id="boardWriteLeft">상품판매 상세사진&nbsp;&nbsp;</th>
				<td>
					<div id="mPhoto">
						<label for="pro_picImg" id="pro_picImg_label">파일선택</label>
						<input type="file"id="pro_picImg"  name="pro_picImg" required="required">
						<span id="d_photo_name"></span>
					</div>
				</td>
			</tr>
			
			<tr><th id="boardWriteLeft">재고&nbsp;&nbsp;</th><td><input type="number" id="boardWriteRight" name="amount" required="required"></td></tr>
			<tr><td colspan="2"><input id="write_Submit_Button" type="submit" value="확인"></td></tr>
			</table>
			</div>
		</form>
	
	<script type="text/javascript">
		function readImage(input) {	// 메인이미지 바뀐거 읽어내기
	    // 인풋 태그에 파일이 있는 경우
		    if(input.files && input.files[0]) {
		        // 이미지 파일인지 검사 (생략)
		        // FileReader 인스턴스 생성
		        const reader = new FileReader();
		        // 이미지가 로드가 된 경우
		        reader.onload = function(e) {
		            const previewImage = document.getElementById("pro_photoImg_preview");
		            previewImage.src = e.target.result;
		        }
		        // reader가 이미지 읽도록 하기
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		function readPicImage(input) {	// 상세이미지 바뀐거 읽어내기
		    // 인풋 태그에 파일이 있는 경우
		    	const fileValue = $("#pro_picImg").val().split("\\");
				console.log(fileValue);
		    	const name = fileValue[fileValue.length-1];
				console.log(name);
			    $("#d_photo_name").text(name);
			}
		
		const photoImage = document.getElementById("pro_photoImg");	// 메인이미지 찾아오기
		photoImage.addEventListener('change', function(e){			// 메인이미지 바뀔떄 이벤트 처리
		    readImage(e.target);
		})
		
		const picImage = document.getElementById("pro_picImg");	// 상세이미지 찾아오기
		picImage.addEventListener('change', function (e) {		// 상세이미지 바뀔때 이벤트 처리
			readPicImage(e.target);
		})
	</script>
	
	
	
	<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true">
		<jsp:param value="" name=""/>
	</jsp:include>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>