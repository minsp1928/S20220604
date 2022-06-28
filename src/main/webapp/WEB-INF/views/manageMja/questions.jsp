<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="css/mja/questions.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="/WEB-INF/views/base/header.jsp" flush="true"/>
<div class="container">
   <div class="row">   
      <div class="col-md-2" id="sidebar">
         <div class="flex-shrink-0 p-3 bg-white">
             <a class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
               <svg class="bi me-2" width="15" height="18"><use xlink:href="#bootstrap"/></svg>
               <span class="fs-5 fw-semibold"><h4>고객센터</h4></span>
             </a>
             <ul class="list-unstyled ps-0">
               <li class="mb-1">
                 <button onclick="location.href='notice'" class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                    공지사항 
                 </button>
               </li>
               <li class="mb-1">
                 <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                     1:1문의
                 </button>
                 <div class="collapse" id="dashboard-collapse">
                   <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                     <li><svg class="bi me-2" width="5" height="10"></svg><a href="faq?user_id=${sessionId}" class="link-dark rounded">문의하기</a></li>
                     <li><svg class="bi me-2" width="5" height="10"></svg><a href="interceptor" class="link-dark rounded">나의문의내역</a></li>
                   </ul>
                 </div>
               </li>
             </ul>
          </div> 
      </div>
   
      <div class="col-md-10" id="main">      
         <div id="list">
            <h2>나의 문의 내역</h2> 
         </div>
         <div class="col-md-10 offset-md-1">
         <c:choose>
            <c:when test="${tot < 1 }">
               문의내역이 없습니다.
            </c:when>
            <c:otherwise>
             <table class="table" id="answerTbl">
               <tr>
                  <th style="width: 10%">번호</th>
                  <th style="width: 15%">유형</th>
                  <th style="width: 40%">제목/내용</th>
                  <th style="width: 15%">답변</th>
                  <th style="width: 20%" >작성일</th>
               </tr>
                <c:forEach var="list" items="${faqList }">
                   <tr><td rowspan="2">${list.faq_num}</td>
                      <c:if test= "${list.faq_category == 1}"><td>개인정보</td></c:if>
                      <c:if test= "${list.faq_category == 2}"><td>신고</td></c:if>
                      <c:if test= "${list.faq_category == 3}"><td>기타</td></c:if>
                       <td>${list.faq_subject}</td>                   
                       <c:if test="${list.faq_check == 1}"><td>답변완료</td></c:if>
                       <c:if test="${list.faq_check == 0}"><td>답변대기</td></c:if>
                       <td><fmt:formatDate value="${list.user_date }" pattern="yyyy-MM-dd"/></td></tr>
                    <tr><td colspan="4" style="text-align: left">${list.faq_content }</td></tr>
                <c:if test="${list.faq_check == 1}">
                   <tr id="answer">
                     <td><img alt="답변" src="/img/arrow.png" id="">
                     <td colspan="3"  style="text-align: left">${list.admin_content}</td>
                     <td  style="text-align: center"><fmt:formatDate value="${list.admin_date }" pattern="yyyy-MM-dd"/></td>
                  </tr>          
                </c:if>
                </c:forEach>
            </table>
            </c:otherwise>
         </c:choose>
         </div>
       </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>