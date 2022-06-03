package com.oracle.S20220604.dao.ashmjb;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Message;
@Repository
public class MessageDaoImpl implements MessageDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int insert(Message message) {
		int result = 0;
		result = session.insert("akInsertMessage",message);
		
		return result;
	}

}
