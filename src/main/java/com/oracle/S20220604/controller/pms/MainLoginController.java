package com.oracle.S20220604.controller.pms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainLoginController {
	 private static final Logger logger = LoggerFactory.getLogger(MainLoginController.class);
		
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
		

}
