package com.oracle.S20220604.controller.pms;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.service.pms.MainLoginService;


@Controller

public class MainLoginController {
	
	 @Autowired
	 private MainLoginService ms;
	 private static final Logger logger = LoggerFactory.getLogger(MainLoginController.class);
	 
	 //--------------------------main----------------------------\\		
		@RequestMapping(value = "header")
		public String header() {
			
			return "base/header";
		}
		@RequestMapping(value = "main")
		public String main() {
			
			return "mainLoginPms/main";
		}
		@RequestMapping(value = "footer")
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
		public String findIdCheck(Member member, Model model) {
			System.out.println("MainLoginController findIdBtn start...");
		    Member findIdCheck = ms.findIdCheck(member);
			if (member == null) {
				model.addAttribute("result", 1); //일치하는 정보가 없을때
			}else {
				model.addAttribute("result", 2);
				model.addAttribute("user_id", member.getUser_id());
			}
			return "mainLoginPms/findID";
					
		}
		
		
		
//-------------------------find id end------------------------\\
		
		
//-------------------------join start------------------------\\
		@RequestMapping(value = "joinAgree")
		public String joinAgree() {
			System.out.println("MainLoginController joinAgree start");
			return "mainLoginPms/joinAgree";
		}
		@RequestMapping(value = "joinForm")
		public String joinForm() {
			System.out.println("MainLoginController joinForm start");
			return "mainLoginPms/joinForm";
		}
		
//-------------------------join end------------------------\\
		
		
		
		
		
//-------------------------naver login------------------------\\
		

}//end
