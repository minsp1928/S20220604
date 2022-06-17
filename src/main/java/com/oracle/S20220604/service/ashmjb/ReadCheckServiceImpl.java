package com.oracle.S20220604.service.ashmjb;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.ashmjb.ReadCheckDao;
import com.oracle.S20220604.model.ReadCheck;

@Service
public class ReadCheckServiceImpl implements ReadCheckService {
	@Autowired
	private ReadCheckDao rd;
	@Override
	public int insertMe(ReadCheck rc) {
		int result = rd.insertMe(rc);
		return result;
	}
	@Override
	public int insertOther(ReadCheck rc) {
		int result = rd.insertOther(rc);
		return result;
	}

}
