package com.oracle.S20220604.dao.ashmjb;

import java.util.List;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;

public interface ChattingDao {
	Chatting 		save(Chatting chatting);

	int 			total();

	List<Chatting>  openChatList(Chatting chatting);

	List<Chatting>  showList(Chatting chatting);

	List<Message>	 msgnaeyong(int room_num);
}
