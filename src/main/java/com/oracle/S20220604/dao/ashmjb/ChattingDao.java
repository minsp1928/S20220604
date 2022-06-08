package com.oracle.S20220604.dao.ashmjb;

import java.util.List;

import com.oracle.S20220604.domain.Chatting;

public interface ChattingDao {
	Chatting 		save(Chatting chatting);

	int 			total();

	List<Chatting>  openChatList(Chatting chatting);
}
