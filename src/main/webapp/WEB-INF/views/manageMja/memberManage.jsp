<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/mja/memberManage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
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
      
      <form action="memberKeyword">                  
         <div class="row g-3" id="search">
               <div class="col-md-4">
                 <label for="state" class="form-label">유형</label>
                 <select class="form-select" id="m_level" name="m_level" required="">
                   <option value="1">소비자</option>
                   <option value="2">판매자</option>
                 </select>
               </div>
            <div class="col-md-3">
                 <label for="search" class="form-label">검색조건</label>
                 <select class="form-select" id="search" name="search">
                    <option value="user_id">아이디</option>
               <option value="user_name">이름</option>
                 </select>
               </div>
               <div class="col-md-5">
                 <label for="keyword" class="form-label">검색어</label>
                 <input type="text" class="form-control" id="keyword"  name="keyword" value="${keyword }">
               </div>               
                 <div class="col-sm-6">
                   <input type="date" class="form-control" id="firstName" name="startDate">
                 </div>
               <div class="col-sm-6">
                    <input type="date" class="form-control" id="endDate" name="endDate">
               </div>
               <div class="col-sm-12">
               <input type="submit" value="검색" id="keyBtn">    
            </div>       
            </div>
      </form>
      <table class="table"  id="tableData">
         <tr><th>NO</th><th>ID</th><th>이름</th><th>판매자</th><th>이메일</th><th>연락처</th><th>주소</th><th>상태변경</th></tr>
            <c:forEach var="list" items="${memberList }">
          <tr><td>${num }</td>
              <td>${list.user_id}</td>
              <td>${list.user_name}</td>
            <td><c:choose>
                    <c:when test="${list.m_level == 2}">${list.sell_name }</c:when>
                    <c:otherwise></c:otherwise>
                 </c:choose></td>
              <td>${list.email }
              <td>${list.con_tel }</td>
              <td>${list.con_addr1 }</td>
              <td><a href="memberDetail?user_id=${list.user_id }">
                 <c:choose>
                    <c:when test="${list.m_level == 3}"> 정지 </c:when>
                    <c:otherwise> 활동중 </c:otherwise>
                 </c:choose></a>
              </td>
          </tr>
            <c:set var="num" value="${num-1 }"></c:set>
            </c:forEach>
      </table>
         <div class="excel">
            <input type="button" value="엑셀다운" onclick="download();" id="excelBtn"/>
         </div>
      </div>
   </div>
</div>

<!-- Sheet JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--FileSaver savaAs 이용 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<script type="text/javascript">

   function _excelDown(fileName, sheetName, sheetHtml) {
       var html = '';
       html += '<html xmlns:x="urn:schemas-microsoft-com:office:excel">';
       html += '    <head>';
       html += '        <meta http-equiv="content-type" content="application/vnd.ms-excel; charset=UTF-8">';
       html += '        <xml>';
       html += '            <x:ExcelWorkbook>';
       html += '                <x:ExcelWorksheets>';
       html += '                    <x:ExcelWorksheet>'
       html += '                        <x:Name>' + sheetName + '</x:Name>';   // 시트이름
       html += '                        <x:WorksheetOptions><x:Panes></x:Panes></x:WorksheetOptions>';
       html += '                    </x:ExcelWorksheet>';
       html += '                </x:ExcelWorksheets>';
       html += '            </x:ExcelWorkbook>';
       html += '        </xml>';
       html += '    </head>';
       html += '    <body>';
       
       // ----------------- 시트 내용 부분 -----------------
       html += sheetHtml;
       // ----------------- //시트 내용 부분 -----------------
       
       html += '    </body>';
       html += '</html>';
       
       // 데이터 타입
       var data_type = 'data:application/vnd.ms-excel';
       var ua = window.navigator.userAgent;
       var blob = new Blob([html], {type: "application/csv;charset=utf-8;"});
       
       if ((ua.indexOf("MSIE ") > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./)) && window.navigator.msSaveBlob) {
           // ie이고 msSaveBlob 기능을 지원하는 경우
           navigator.msSaveBlob(blob, fileName);
       } else {
           // ie가 아닌 경우 (바로 다운이 되지 않기 때문에 클릭 버튼을 만들어 클릭을 임의로 수행하도록 처리)
           var anchor = window.document.createElement('a');
           anchor.href = window.URL.createObjectURL(blob);
           anchor.download = fileName;
           document.body.appendChild(anchor);
           anchor.click();
           
           // 클릭(다운) 후 요소 제거
           document.body.removeChild(anchor);
       }
   }
   
   function download(){
       // 대상 테이블을 가져옴
       var table = document.getElementById("tableData");
       
       if(table){
           // CASE 대상 테이블이 존재하는 경우
           
           // 엑셀다운 (엑셀파일명, 시트명, 내부데이터HTML)
           _excelDown("member.xls", "member", table.outerHTML)
       }
   }
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/> 
</body>
</html>