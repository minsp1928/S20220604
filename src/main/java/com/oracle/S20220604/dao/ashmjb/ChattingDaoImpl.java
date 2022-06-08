package com.oracle.S20220604.dao.ashmjb;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.S20220604.domain.Chatting;
@Repository
public class ChattingDaoImpl implements ChattingDao {
	private final EntityManager em;
	
	public ChattingDaoImpl(EntityManager em) {
		this.em = em;
	}

	@Override
	public Chatting save(Chatting chatting) {

		em.persist(chatting);
		return chatting;
	
	}

}