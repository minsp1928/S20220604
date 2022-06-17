package com.oracle.S20220604.service.ashmjb;

import java.util.List;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;
import com.oracle.S20220604.model.Participant;
import com.oracle.S20220604.model.Product;

public interface ChattingService {
	int 		   insert(Chatting chatting);

	int 		   total();

	List<Chatting> openChatList(Chatting chatting);

	List<Chatting>	showList(Chatting chatting);

	List<Message> 	msgnaeyong(int room_num);

	void			insertParti(Participant parti);

	List<Chatting>  keywordList(Chatting chatting);
	
	void			insertChatWithCeller(Product product);

}
