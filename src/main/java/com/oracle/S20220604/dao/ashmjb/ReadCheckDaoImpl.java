package com.oracle.S20220604.dao.ashmjb;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.ReadCheck;

@Repository
public class ReadCheckDaoImpl implements ReadCheckDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertMe(ReadCheck rc) {
		int result = 0;
		System.out.println("Dao insertMe Start");
		System.out.println("Dao insertMe rc.getRoom_num -> "+rc.getRoom_num());
		try {
			result = session.insert("akInsertReadCheckMe", rc);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("result -> "+result);
		System.out.println("Dao insertMe End");
		return result;
	}

	@Override
	public int insertOther(ReadCheck rc) {
		int result = 0;
		System.out.println("Dao insertOther Start");
		System.out.println("Dao insertOther rc.getRoom_num -> "+rc.getRoom_num());
		try {
			result = session.insert("akInsertReadCheckOther", rc);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("result -> "+result);
		System.out.println("Dao insertOther End");
		return result;
	}
	
}
