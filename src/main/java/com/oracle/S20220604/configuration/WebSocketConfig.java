package com.oracle.S20220604.configuration;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

import com.oracle.S20220604.handler.ashmjb.SocketHandler;

@Configuration
@EnableWebSocket // websocket이 가능하도록 만들어줘야 소켓프로그램으로서 서버프로그램으로서 발동을한다. 
public class WebSocketConfig implements WebSocketConfigurer {

	@Autowired
	SocketHandler socketHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(socketHandler, "/chating"); 
		// url에 채팅이라고 들어온것을 내가 이 소켓 핸들러를 서버로 사용할거
		// 누가 채팅이라고 치면 소켓을 발동시켜서 소켓핸들러를 실행시키겟다. -> 여기서 서버프로그램으로 누군가 url을 채팅으로 치고오면 진짜 서버로 발동시킴
	}

}
