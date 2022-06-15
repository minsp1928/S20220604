package com.oracle.S20220604.service.mja;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.oracle.S20220604.model.Faq;

public class ManagerInterceptor implements HandlerInterceptor {

	//preHandle : Controller 호출되기 전 수행
	//postHandle : Controller가 완료된 이후에 수행
	//afterCompletion Controller 수행 후 view 단 작업
	
	private static Logger logger = LoggerFactory.getLogger(ManagerInterceptor.class);
	
	//1번
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		System.out.println("1. pre handle ------------------  ");
		HandlerMethod method = (HandlerMethod) handler;
		Method methodObj = method.getMethod();
		System.out.println("Bean : " + method.getBean());
		System.out.println("Method : " + methodObj);

		return true;
	}
	
	//3번 
	@Override
	public void postHandle(HttpServletRequest request, 
						   HttpServletResponse response, 
					       Object handler, 
					       ModelAndView modelAndView) throws IOException {
		System.out.println("3.post Handle------------------ ");
		
		HttpSession session = request.getSession();
		
		String user_id = (String) session.getAttribute("sessionId");
		System.out.println("user_id" + user_id);
		if(user_id == null) {
			System.out.println("memCnt Not exists");
			response.sendRedirect("faqLogin");
		} else {
			System.out.println("memCnt exists");
			request.getSession().setAttribute("sessionId ", user_id);
			response.sendRedirect("questions");
		}

	}

}
