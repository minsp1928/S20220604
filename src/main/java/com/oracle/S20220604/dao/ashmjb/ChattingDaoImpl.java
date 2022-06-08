package com.oracle.S20220604.dao.ashmjb;

import java.util.List;

import javax.persistence.EntityManager;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.domain.Chatting;
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

}
