package com.oracle.S20220604.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.oracle.S20220604.service.mja.ManagerInterceptor;

@Configuration
public class WebMvcConfiguration implements WebMvcConfigurer {
//request.getSession().setAttribute("sessionId", user_id);
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new ManagerInterceptor()).addPathPatterns("/interceptor")
//														.addPathPatterns("/kkk");		// 추가할때 
		;
	}
}
