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
         <div class="row" id="notice">
            <h2>문의하기</h2>
            <h6>고객에 소리를 듣겠습니다.</h6>
         </div>
          <div class="row">
             <table class="table col-10" id="tbl-first">
               <tr><td colspan="2">개인정보 수집 및 이용 안내</td></tr>
               <tr><th>수집항목</th><td>* [필수] 이름, 이메일, 휴대폰번호, 비밀번호, 발생지 주소(택배 이용문의 시), 운송장번호(택배/특송 이용문의 시)</td></tr>
               <tr><th>수집 및 이용 목적</th><td> 고객 민원 접수, 사실 관계 확인을 위한 연락 및 통지, 처리 결과 안내</td></tr>
               <tr><th>보유 및 이용 기간 </th><td> -상담 접수 및 처리 후 3개월 까지 -소비자 불만/분쟁 처리 후 3년(법정 보존기간)</td></tr>
               <tr><td colspan="2">*고객은 상기의 개인정보 수집 및 이용에 대해 동의를 거부하실 수 있으나 해당 동의를 거부하시는 경우 1:1문의가 불가합니다.</td></tr>
            </table>
            <div class="agree">      
               <label for="inChk"><span>이용동의</span></label>     
               <input type="checkbox" id="inChk">
            </div> 
          </div>
          
          <form action="faqSubmit" method="post" name="frm">
          <div class="row">
             <table class="table col-10" id="tbl-second">
                <tr><td colspan="3">기본 정보 입력</td></tr>
                <tr>
                   <th>이름</th>
                      <c:choose>
                        <c:when test="${empty sessionId}">
                           <td><input type="text" name="user_id" required="required"></td> 
                        </c:when>
                         <c:otherwise>
                            <td><input type="text" name="user_id" readonly="readonly" value="${user_id}"></td>
                         </c:otherwise>
                      </c:choose>
                   <th>연락처</th>
                     <td>
                        <input type="tel" name="faq_phone"  required="required" id = "telInput" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"  placeholder="예) 010-1234-5678">            
                     </td>      
                </tr>
                <tr>
                   <th>비밀번호</th>
                     <td>
                        <input type="text" placeholder="숫자 4자리" maxlength="4" name="faq_pass"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required="required">
                     </td>
                  <th>이메일</th>
                     <td>
                        <input id="email" type="text" maxlength="50" name="faq_email" placeholder="Email"/>
                     </td>
                </tr>
               <tr><td colspan="3">상세항목입력</td></tr>
               <tr><th>문의유형</th>
                     <td>
                        <select name="faq_category">
                           <option value="1">회원정보</option>
                           <option value="2">신  고</option>
                           <option value="3">기  타</option>               
                        </select>
                     </td>    
                  <th>제목</th>
                      <td ><input type="text" name="faq_subject" required="required"></td>
               </tr>
               <tr>
                  <th>내용</th>
                     <td colspan="3">
                        <textarea rows="5" cols="100" name="faq_content" required="required"></textarea>
                           <c:choose>
                              <c:when test="${empty sessionId}"> 
                                 <input type="hidden" name="login_check" value="0"> 
                              </c:when>
                               <c:otherwise>
                                  <input type="hidden" name="login_check" value="1">
                               </c:otherwise>
                            </c:choose>
                     </td>
               </tr>                
            </table>
         </div>
         </form>
           <button id="submitBtn">제출하기</button>   
      </div>
   </div>
</div>
<script type="text/javascript">
   $(document).ready(function (){
      $('#submitBtn').click(function () {
          theForm = document.frm;
          if(theForm.user_id.value=="" || theForm.faq_phone.value == "" || theForm.faq_pass.value == "" || 
                theForm.faq_email.value == "" || theForm.faq_subject.value == ""|| theForm.faq_content.value == ""){
             alert("필수 입력란이 비어 있습니다. 확인해주세요.");
          } else {
             var yn = $("input:checkbox[id=inChk]").is(":checked");
            if(yn){
               if(!isEmail($('#email').val())){
                  alert("이메일 형식이 올바르지 않습니다.");
               } else {
                  $("form").submit();
               }               
            } else {
               alert("이용동의해주셔야 등록이 가능합니다.");
            }
          }
      })   
   });
   
   function inNumber() {
      if(event.keyCode<= 48 || event.keyCode > 57){
         event.returnValue= false;
      }
   }
   
   
   //핸드폰 번호 입력
   $('#telInput').keyup(function (event) {
        event = event || window.event;
        var _val = this.value.trim();
        this.value = autoHypenTel(_val);
      });
   
   function autoHypenTel(str) {
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';

        if (str.substring(0, 2) == 02) {
          // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
          if (str.length < 3) {
            return str;
          } else if (str.length < 6) {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2);
            return tmp;
          } else if (str.length < 10) {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 3);
            tmp += '-';
            tmp += str.substr(5);
            return tmp;
          } else {
            tmp += str.substr(0, 2);
            tmp += '-';
            tmp += str.substr(2, 4);
            tmp += '-';
            tmp += str.substr(6, 4);
            return tmp;
          }
        } else {
          // 핸드폰 및 다른 지역 전화번호 일 경우
          if (str.length < 4) {
            return str;
          } else if (str.length < 7) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
          } else if (str.length < 11) {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
          } else {
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
          }
        }

        return str;
      }
   
   //이메일 형식
   function isEmail(asValue) {
      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
      
      return regExp.test(asValue);
   }
</script>
<jsp:include page="/WEB-INF/views/base/footer.jsp" flush="true"/>
</body>
</html>