package com.oracle.S20220604.dao.pms;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Member;

@Repository
public class MainLoginDaoImpl implements MainLoginDao {

	@Autowired
	private SqlSession session;

	@Override
	public Member selectLogin(Member member) {//로그인
		System.out.println("MainLoginDaoImpl selectLogin start");
		return session.selectOne("pms_selectLogin", member);
	}

	@Override
	public Member findId(Member member) {
		System.out.println("MainLoginDaoImpl findId start");
		try {
			member = session.selectOne("pms_findId",member);
			System.out.println("MainLoginDaoImpl user_id->"+member.getUser_id());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl findId Exception->"+e.getMessage());
		}
		return member;
	}
	
	
	
}
