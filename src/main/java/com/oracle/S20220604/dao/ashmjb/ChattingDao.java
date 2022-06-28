package com.oracle.S20220604.dao.ashmjb;

import java.util.List;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;
import com.oracle.S20220604.model.Participant;
import com.oracle.S20220604.model.Product;

public interface ChattingDao {
   Chatting       save(Chatting chatting);

   int          OpenChatTotal();
   
   int				ListTotal(Chatting chatting);

   List<Chatting>  openChatList(Chatting chatting);

   List<Chatting>  showList(Chatting chatting);

   List<Message>    msgnaeyong(int room_num);

   int          saveParticipant(Participant pt);

   int          insertParti(Participant parti);

   List<Chatting>  keywordList(Chatting chatting);

   void          insertChatWithCeller(Product product);

   List<Participant> selectParti(int room_num);

   void 			inChatWithConsumer(Participant pt);

   int 				findroomNum();

List<Participant> selectParti3(int room_num);
}