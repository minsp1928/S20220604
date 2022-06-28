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
		System.out.println("insertMe Start");
		System.out.println("rc.getRoom_num -> "+rc.getRoom_num());
		System.out.println("rc.getUser_id -> "+rc.getUser_id());
		int result = rd.insertMe(rc);
		return result;
	}
	@Override
	public int insertOther(ReadCheck rc) {
		System.out.println("insertMe Start");
		System.out.println("rc.getRoom_num -> "+rc.getRoom_num());
		System.out.println("rc.getUser_id -> "+rc.getUser_id());
		int result = rd.insertOther(rc);
		return result;
	}

}
