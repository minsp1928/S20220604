package com.oracle.S20220604.controller.ashmjb;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class ChattingController {
	@RequestMapping("/chat")
	public ModelAndView chat() {
		System.out.println("ChattingController chat start");
		String user_id = "namwoo";
		ModelAndView mv = new ModelAndView();
		mv.addObject("user_id", user_id);
		mv.setViewName("/chatAshmjb/chatRoomMain");
		return mv;
	}
	@RequestMapping("/test")
	public ModelAndView test() {
		System.out.println("ChattingController chat start");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/chatAshmjb/text");
		return mv;
	}
}
