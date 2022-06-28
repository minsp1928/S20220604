package com.oracle.S20220604.dao.ashmjb;

import java.util.List;

import javax.persistence.EntityManager;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;
import com.oracle.S20220604.model.Participant;
import com.oracle.S20220604.model.Product;
@Repository
public class ChattingDaoImpl implements ChattingDao {
   @Autowired
   private SqlSession session;
   
   private final EntityManager em;
   
   public ChattingDaoImpl(EntityManager em) {
      this.em = em;
   }

   @Override
   public Chatting save(Chatting chatting) {
	   try {
		   em.persist(chatting);
		   System.out.println("chatting save 성공");
	   }
	   catch (Exception e) {
		   System.out.println(e.getMessage());
	   }
	   System.out.println("Chatting save->");
	   
	   return chatting;
   }

   @Override
   public int saveParticipant(Participant pt) {
      int result = 0;
      int room_num = session.selectOne("akSelectUser_id");
      pt.setRoom_num(room_num);
      System.out.println("chatting.getRoom_num->"+pt.getRoom_num());
      System.out.println("chatting.getUser_id->"+pt.getUser_id());
      try {
         result = session.insert("akInsertParticipant", pt);
         System.out.println("akInsertParticipant -> "+result);
      } catch (Exception e) {
         System.out.println(e.getMessage());
      }
      return result;
   }

   @Override
   public int OpenChatTotal() {
      int tot = 0;
      System.out.println("ChattingDaoImpl Start total...");
      try {
         tot = session.selectOne("akChattingOpenChatTotal");
      } catch (Exception e) {
         System.out.println("ChattingDaoImpl total selectOne error -> "+ e.getMessage());
      }
      return tot;
   }
   
   @Override
   public int ListTotal(Chatting chatting) {
	   int tot = 0;
	   try {
		   tot = session.selectOne("akChattingTotal", chatting);
	   }catch (Exception e) {
		   System.out.println("ChattingDaoImpl ListTotal selectOne error -> "+ e.getMessage());
	   }
	   return tot;
   }
   @Override
   public List<Chatting> openChatList(Chatting chatting) {
      List<Chatting> openChatList = null;
      System.out.println("ChattingDaoImpl openChatList start...");
      try {
         System.out.println("chatting.getStart()->"+chatting.getStart());
         openChatList = session.selectList("akChattingList", chatting);
         
         System.out.println("ChattingDaoImpl openChatingList.size()->"+openChatList.size());
      
         
      } catch (Exception e) {
         System.out.println("ChattingDaoImpl openChatingList Exception..->"+ e.getMessage());
      }
      
      return openChatList;
   }

   @Override
   public List<Chatting> showList(Chatting chatting) {
      List<Chatting> showList = null;
      System.out.println("ChattingDaoImpl showList Start ... ");
      try {
         System.out.println("ChattingDaoImpl showList user_id : "+ chatting.getUser_id());
         if(chatting.getRoom_type2() != 0   ) {
            showList = session.selectList("akChattingShowList12", chatting);
            
            System.out.println("ChattingDaoImpl akChattingShowList12 showList.size()->"+showList.size());
         }
         else {
            showList = session.selectList("akChattingShowList3", chatting);
            System.out.println("ChattingDaoImpl akChattingShowList3 showList.size()->"+showList.size());
         }
         
      } catch (Exception e) {
         System.out.println("ChattingDaoImpl showList Exception..->"+ e.getMessage());
      }
      return showList;
   }

   @Override
   public List<Message> msgnaeyong(int room_num) {
      List<Message> msgnaeyong = null;
      System.out.println("ChattingDaoImpl msgnaeyong start");
      try {
         System.out.println("ChattingDaoImpl star room_num : "+ room_num);
         msgnaeyong = session.selectList("akMsgNaeYong", room_num);
         System.out.println("ChattingDaoImpl msgnaeyong msgnaeyong.get(5) : "+msgnaeyong.get(0).getMmsg_time());
         System.out.println("ChattingDaoImpl after msgnaeyong.size()->"+msgnaeyong.size());
         
      } catch (Exception e) {
         System.out.println("ChattingDaoImpl msgnaeyong Exception..->"+ e.getMessage());
      }
      return msgnaeyong;
   }
   
   @Override
   public List<Chatting> keywordList(Chatting chatting) {
      List<Chatting> keywordList = null;
      System.out.println("ChattingDaoImpl keywordList Start...");
//      if(chatting.getKeyword() == null) chatting.setKeyword("%");
      try {
         keywordList = session.selectList("akKeywordList", chatting);
         System.out.println("ChattingDaoImpl after keywordList -> "+ keywordList.size());
      } catch (Exception e) {
         System.out.println("ChattingDaoImpl keywordList Exception..->"+ e.getMessage());
      }
         
      return keywordList;
   }
   @Override
   public int insertParti(Participant parti) {
      int result = 0;
      System.out.println("ChattingDaoImpl insertParti start...");
      System.out.println("ChattingDaoImpl insertParti parti.getRoom_num() : "+ parti.getRoom_num());
      System.out.println("ChattingDaoImpl insertParti parti.getUser_id() : "+ parti.getUser_id());
      int count = session.selectOne("akCountParti", parti);
      
      System.out.println("ChattingDaoImpl 참여자목록 count : "+ count);
      if(count == 0) {
         result = session.insert("akInsertParticipant", parti);
         System.out.println("ChattingDaoImpl session.insert result2 : "+result);
      }
      else {
         result = 0;
      }
      return result;
   }
   
   @Override
   public void insertChatWithCeller(Product product) {
//       매퍼는 chatting으로 연결했다.
      System.out.println("ChattingDaoImpl insertChatWithCeller start ...");
      System.out.println("ChattingDaoImpl chatWithCeller product.getPro_title : "+ product.getPro_title());
      System.out.println("ChattingDaoImpl chatWithCeller 판매자 ID product.getUser_id : "+ product.getUser_id());
      System.out.println("ChattingDaoImpl chatWithCeller 로그인 ID product.getLogin_user_id : " + product.getLogin_user_id() );
      
      session.selectOne("akInsertChatWithCeller", product);
      System.out.println("ChattingDaoImpl insertChatWithCeller after!! ");
      
   }

	@Override
	public List<Participant> selectParti(int room_num) {
		List<Participant> selectParti = null;
		
		System.out.println("Chatting Dao parti start");
	    try {
	       System.out.println("ChattingDaoImpl parti room_num : "+ room_num);
	       selectParti = session.selectList("akSelectParti", room_num);
	       
	       System.out.println("ChattingDaoImpl parti.size()->"+selectParti.size());
	       
	    } catch (Exception e) {
	       System.out.println("ChattingDaoImpl parti Exception..->"+ e.getMessage());
	    }
	    System.out.println("Chatting Dao parti End");
	    return selectParti;
	}
	
	   @Override
	   public void inChatWithConsumer(Participant pt) {
	      //     매퍼는 chatting으로 연결했다.
	         System.out.println("ChattingDaoImpl inChatWithConsumer start ...");
	         System.out.println("ChattingDaoImpl inChatWithConsumer 판매자 ID product.getUser_id : "+ pt.getUser_id());
	         System.out.println("ChattingDaoImpl inChatWithConsumer 로그인 ID product.getLogin_user_id : " + pt.getCon_user_id() );
	         
	         session.selectOne("akInChatWithConsumer", pt);
	         System.out.println("ChattingDaoImpl insertChatWithCeller after!! ");
	   }

	@Override
	public int findroomNum() {
		int result = session.selectOne("akFindRoom_num");
		return result;
	}
   @Override
   public List<Participant> selectParti3(int room_num) {
      List<Participant> selectParti3 = null;
      
      System.out.println("Chatting Dao parti start");
       try {
          System.out.println("ChattingDaoImpl parti room_num : "+ room_num);
          selectParti3 = session.selectList("akSelectParti3", room_num);
          
          System.out.println("ChattingDaoImpl parti.size()->"+selectParti3.size());
          
       } catch (Exception e) {
          System.out.println("ChattingDaoImpl parti Exception..->"+ e.getMessage());
       }
       System.out.println("Chatting Dao parti End");
       return selectParti3;
   }
}