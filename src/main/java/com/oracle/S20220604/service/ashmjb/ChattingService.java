package com.oracle.S20220604.service.ashmjb;

import java.util.List;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;

public interface ChattingService {
	int 		   insert(Chatting chatting);

	int 		   total();

	List<Chatting> openChatList(Chatting chatting);

	List<Chatting>	showList(String user_id);

	List<Message> 	msgnaeyong(int room_num);

}
