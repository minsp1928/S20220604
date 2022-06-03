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
		@RequestMapping(value = "login")
		public String login() {
			
			return "mainLoginPms/login";
		}
//--------------------------login----------------------------\\
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

}
