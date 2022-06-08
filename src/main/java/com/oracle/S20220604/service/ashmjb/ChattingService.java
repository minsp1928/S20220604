package com.oracle.S20220604.service.ashmjb;

import java.util.List;

import com.oracle.S20220604.domain.Chatting;

public interface ChattingService {
	int 		   insert(Chatting chatting);

	int 		   total();

	List<Chatting> openChatList(Chatting chatting);
}
