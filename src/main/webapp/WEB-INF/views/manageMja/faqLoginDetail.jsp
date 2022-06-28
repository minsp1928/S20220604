<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mja.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/mja/faqLoginDetail.css" rel="stylesheet" type="text/css">
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
            
         <div class="col-md-8 offset-md-2">   
            <table class="table" id="answerTbl">
               <tr>
                  <th>문의번호</th><td>${faq.faq_num }</td>
                  <th>작성일자</th>   
                     <td><fmt:formatDate value="${faq.user_date}" pattern="yyyy-MM-dd"/></td> 
               </tr>
               <tr>   
                  <th>작성자</th>
                     <td>${faq.user_id }</td> 
                  
                  <th>문의유형</th>
                     <c:if test= "${faq.faq_category == 1}"><td>개인정보</td></c:if>
                      <c:if test= "${faq.faq_category == 2}"><td>신고</td></c:if>
                      <c:if test= "${faq.faq_category == 3}"><td>기타</td></c:if>
               </tr>
               <tr> 
                  <th>제목</th><td colspan="3">${faq.faq_subject}</td>
               </tr>
               <tr>
                  <td colspan="4">${faq.faq_content}</td>
               </tr>
            
               <!-- 답변완료 -->
               <c:if test="${faq.faq_check==1}">
                  <tr id="answer">
                     <td><img alt="답변" src="/img/arrow.png">
                     <td colspan="5">${faq.admin_content}</td>
                  </tr>
               </c:if>
               
                     <!-- 답변대기 -->
               <c:if test="${faq.faq_check==0}">
                  <tr>
                     <td colspan="6">답변을 기다리는 중</td>
                  </tr>
               </c:if>
            </table>
         </div>
      </div>
   </div>
</div>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>