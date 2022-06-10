package com.oracle.S20220604.dao.ashmjb;

import java.util.List;

import javax.persistence.EntityManager;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.domain.Chatting;
import com.oracle.S20220604.model.Message;
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

		em.persist(chatting);
		return chatting;
	
	}

	@Override
	public int total() {
		int tot = 0;
		System.out.println("ChattingDaoImpl Start total...");
		try {
			tot = session.selectOne("akChattingTotal");
		} catch (Exception e) {
			System.out.println("ChattingDaoImpl total selectOne error -> "+ e.getMessage());
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
	public List<Chatting> showList(String user_id) {
		List<Chatting> showList = null;
		System.out.println("ChattingDaoImpl showList Start ... ");
		try {
			System.out.println("user_id : "+ user_id);
			showList = session.selectList("akChattingShowList", user_id);
			System.out.println("ChattingDaoImpl showList.size()->"+showList.size());
			
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
			
			System.out.println("ChattingDaoImpl after msgnaeyong.size()->"+msgnaeyong.size());
			
		} catch (Exception e) {
			System.out.println("ChattingDaoImpl msgnaeyong Exception..->"+ e.getMessage());
		}
		return msgnaeyong;
	}

}
