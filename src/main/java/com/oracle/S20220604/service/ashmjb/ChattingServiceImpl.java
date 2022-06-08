package com.oracle.S20220604.service.ashmjb;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.ashmjb.ChattingDao;
import com.oracle.S20220604.domain.Chatting;

@Service
@Transactional
public class ChattingServiceImpl implements ChattingService {
	private static final Logger logger = LoggerFactory.getLogger(ChattingServiceImpl.class);
	
	private final ChattingDao chattingDao;
	
	public ChattingServiceImpl(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}

	@Override
	public int insert(Chatting chatting) {
		logger.info("insert Start .. ");
		logger.info("insert chatting.getRoom_num-> " + chatting.getRoom_num());
		chattingDao.save(chatting);
		
		return chatting.getRoom_num();
	}

}
