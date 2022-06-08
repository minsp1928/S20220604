package com.oracle.S20220604.service.ashmjb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.ashmjb.MessageDao;
import com.oracle.S20220604.model.Message;
@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao md;
	
	@Override
	public int insert(Message message) {
		int result = 0;
		System.out.println("MessageServiceImpl insert Start...");
		result = md.insert(message);
		
		return result;
	}

}
