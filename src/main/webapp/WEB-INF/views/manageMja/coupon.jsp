<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<%
	String context = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<section>
<h1>쿠폰</h1>
<input type="hidden" id="user_id" name="user_id" value="namwoo"> 
 <div class="row">
 	<c:forEach var="cp" items="${cpList }" varStatus="status">
 		<div class="col-lg-4">
 			<div class="couponCard">
	 		<img alt="" src="/img/coupon_default.png">
	 		<input type="hidden" id="cp_num${status.index }" name="cp_num" value="${cp.cp_num }">
 			<input type="text" id="cp_name${status.index }" name="cp_name" value="${cp.cp_name }">
 			<button  type="button" onclick="couponDown(${status.index})" value=""><img alt="" src="/img/download.png"></button>
 			</div>
	 	</div>	
 	</c:forEach>	
 </div>
</section>
<script type="text/javascript">
	function couponDown(Vindex) {
		console.log(Vindex);
		var user_id = $("#user_id").val();
		var cp_num = $("#cp_num"+Vindex).val();
		alert("user_id : " + user_id + "cp_num" + cp_num);
		$.ajax({
			url: "<%=context%>/downloadCoupon",
			data:{user_id: user_id, cp_num : cp_num},
			dataType:'text',
			success:function(data){
				if(data == "alreadyIn"){
					alert("이미 쿠폰이 있습니다.")
				} else {
					alert(user_id + "님 쿠폰 다운이 완료되었습니다.")
				}
			}
			
		});
	}
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>