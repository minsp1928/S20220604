<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<link href="css/footer.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com" >
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
</head>
<body>
    <footer>
        <div id="footer_left">
            <div id="footer_img"><!--메인으로 이동-->
                <a href="main.jsp">
                     <img alt="로고푸터이미지" src="/img/logo_sajomarket_footer.png" id="logofooter_img"> 
                </a>
            </div>
        </div>

        <div id="footer_right">
        
           <div id="footer_info">
               상호명 및 호스팅 서비스 : 이거사조(주)<br>
                sajomarket@gmail.com
            </div>
            <hr>
            
            <div id="footer_center">
               <div id="footer_inc">
                    중앙정보 기술 인재 개발원 4조 <br>
                    @BuySajo.Inc
               </div>
               <div id="footer_right_top">
                   <div id="footer_teamName">
                       <div id="footer_PL">
                       <span>조장</span> 
                       <span>박민서</span>
                       <span>부조장</span>
                       <span>강민주</span>
                       </div>
                       <div id="footer_PTM">
                           <span>김고은</span> 
                           <span>김민정</span>  
                           <span>박건우</span>  
                           <span>안성현</span>  
                           <span>장시환</span> 
                       </div>
                   </div>
               </div>
            </div>
        </div>
        <div id="footer_admin">
             <a href="notice">공지사항</a><br> <!--관리자 페이지의 공지사항으로 이동-->
             <a href="faq?user_id=${sessionId }">1:1문의</a><br> <!--관리자 페이지의 1:1문의로 이동-->
        </div>
    </footer>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>