package com.oracle.S20220604.controller.pms;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.service.pms.MainLoginService;


@Controller

public class MainLoginController {
	
	 @Autowired
	 private MainLoginService ms;
	 
	 @Autowired
	 private JavaMailSender mailSender;
	 
	 private static final Logger logger = LoggerFactory.getLogger(MainLoginController.class);
	 
	 //--------------------------main----------------------------\\		
		@RequestMapping(value = "header") //헤더
		public String header() {
			
			return "base/header";
		}
		@RequestMapping(value = "main")  //메인페이지
		public String main() {
			
			return "mainLoginPms/main";
		}
		@RequestMapping(value = "footer") //푸터
		public String list() {
			
			return "base/footer";
		}
		@RequestMapping(value = "login")	//로그인페이지로 이동
		public String login() {
			
			return "mainLoginPms/login";
		}
		@RequestMapping(value = "findID")	//아이디찾기페이지로 이동
		public String findID() { 
			
			return "mainLoginPms/findID";
		}
		@RequestMapping(value = "findPW")	//비밀번호찾기페이지로 이동
		public String findPW() { 
			
			return "mainLoginPms/findPW";
		}
//--------------------------login start----------------------------\\
		@RequestMapping(value = "loginbtn")
		public String login(Member member, String user_id, Model model, HttpServletRequest request) {//로그인
			System.out.println("MainLoginController login Start...");
			Member login =ms.login(member);
			System.out.println("MainLoginController login->"+login);
			if (login == null) {
				System.out.println("MainLoginController 아이디 혹은 비번 오류");
				return"redirect:/mainLoginPms/login";
				
			}else {//세션유지
				request.getSession().setAttribute("sessionId", user_id);
				model.addAttribute("Member", login);
				model.addAttribute("user_id", user_id);
				System.out.println("MainLoginController login user_id->"+user_id);
				return "mainLoginPms/main";   //로그인.jsp
			}
		
		}
//-------------------------logout start------------------------\\
		@RequestMapping(value = "logout_button")
		public String logout(HttpServletRequest request) { //로그아웃/*HttpSession session)*/
			System.out.println("MainLoginController logout Start...");
//			session.setAttribute("sessionID", null);
//			session.invalidate();
			request.getSession().invalidate();//세션비우기
			return "mainLoginPms/main"; 
		}
		
//-------------------------find id start------------------------\\
		
		@RequestMapping(value = "findIdBtn")
		@ResponseBody
		public Member findIdCheck(Member member, Model model) {
			System.out.println("MainLoginController findIdBtn start...");
		    Member member3 = ms.findIdCheck(member);
			
			return member3;
					
		}

//-------------------------find pw start------------------------\\
		
		@RequestMapping("findPwBtn")
		@ResponseBody
		public Member findPwCheck(HttpServletRequest request, Member member, Model model) {
			System.out.println("MainLoginController findPwBtn Start..");
			Member member5 = ms.findPwCheck(member);
			if(member5 == null) {
				System.out.println("일치하는 회원정보가 없음");
				return member5;
			}else {
				System.out.println("비밀번호 찾아옴");
				System.out.println("MainLoginController findPwBtn member.getUser_pw()(just check)->"+member.getUser_pw());
				System.out.println("MainLoginController mailiSending...");
				String tomail = member.getEmail();  //받는 사람이메일
				System.out.println(tomail);
				String setfrom = "sajomarket@gmail.com"; //보내는 사람 이메일
				String title ="[마켓사조] 임시비밀번호가 발급되었습니다 ";      //제목 
				try {
					//Mime : 전자우편 Internet 표준 프로토콜
					MimeMessage message = mailSender.createMimeMessage();//인스턴스(메일센더객체의 크리에이트마임메시지를 하면 인스턴스로 만들 수 있음)
					MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //헬퍼를 호출해야지(메세지, 트루, 한글화) 인스턴스
					//메일을 보내는 메서드
					messageHelper.setFrom(setfrom); 	 //보내는 사람 생략하면 정상작동안함
					messageHelper.setTo(tomail);		 //받는 사람이메일
					messageHelper.setSubject(title);	 //메일 제목은 생략이 가능하다
					String tempPassword = (int) (Math.random() * 999999)+1+"";
					
					messageHelper.setText("안녕하세요 '"+ member.getUser_name() 
					+"' 회원님! 회원님의 비밀번호가 임시코드로 변경되었습니다. 임시코드  :  " 
					+ tempPassword 
					+" 로그인 후 [내정보] - [비밀번호 변경]에서 수정해 주시기 바랍니다."); //메일 내용
					System.out.println("임시비밀번호 입니다 :"+ tempPassword);
					
					mailSender.send(message);
					model.addAttribute("check", 1); //정상전달
					//임시비밀번호 로직 서비스-->다오-->매퍼-->mapper 패스워드업데이트 메서드를 만들어준다
					//성공적으로 메일이 전달되면 컨트롤러이기때문에 임시비밀번호 저장 로직을 여기서 만들어줄 수 있다
					//ex)멤버라는 테이블에서~ -> member.tempPassword -> 이거를 디비에 값을 업데이트해주면 
					//s.tempPw(u_id, tempPassword); // db에 비밀번호를 임시비밀번호로 업데이트 	
					
					//임시비밀번호를 db에 비밀번호로 업데이트
//					String user_id = member5.getUser_id();
					member5.setUser_pw(tempPassword);
					System.out.println("임시비밀번호가 들어가시나요-? : "+member5.getUser_pw());
					
					int findPwUp = ms.updateTempPassword(member5); 
					
					                                                                                                          
				} catch (Exception e) {
					//안되는경우 : 보안설정 열어주기, 2단계인증 없애주기, 백신때문에 안갈 수도 있음
					System.out.println(e);//문제가 있을경우
					model.addAttribute("check",2); //메일전달 실패
				}
				
				//yml에서 starttls.enable: true(ssl):보안 소켓계층 전송되는 데이터를 암호화 해줌
				//ssl과 tls의 차이: tls-> 새버전의 ssl으로서 도입 
				
					}
				return member5;			
		
		}
		
	
//-------------------------joinAgree start------------------------\\
		@RequestMapping(value = "joinAgree") //회원가입 이용약관동의페이지 1 
		public String joinAgree() {
			System.out.println("MainLoginController joinAgree start");
			return "mainLoginPms/joinAgree";
		}
//-------------------------joinForm start------------------------\\
		@RequestMapping(value = "joinForm")  //회원가입 페이지 2 (알러트로 회원가입을 축하합니다! 뜨고 로그인 화면으로 이동)
		public String joinForm() {
			System.out.println("MainLoginController joinForm start");
			return "mainLoginPms/joinForm";
		}
		
//-------------------------join end------------------------\\
		
		
		
		
		
//-------------------------naver login------------------------\\
		

}//end
