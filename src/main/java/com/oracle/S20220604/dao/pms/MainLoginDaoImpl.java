package com.oracle.S20220604.dao.pms;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

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

	@Override
	public Member findPw(Member member) {
		System.out.println("MainLoginDaoImpl findPw start");
		try {
			member = session.selectOne("pms_findPw",member);
			System.out.println("MainLoginDaoImpl findPw member.getUser_pw()"+member.getUser_pw());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl pms_findPw Exception->"+e.getMessage());
		}
		return member;
	}


	@Override
	public int updateTempPw(Member member5) {
		System.out.println("MainLoginDaoImpl updateTempPw Start..");
		/* String tempPassword = (String) model.getAttribute("tempPassword"); -> 모델에 담기는지 궁금해서 해봤는디 잘 모르겠음*/
		int findPwUp = 0;
		try {
			System.out.println("try문에 왜 안들어오시죠?");
			System.out.println("MainLoginDaoImpl sql문전에 비번이 들어갑니까? : "+member5.getUser_pw());
			findPwUp =  session.update("pms_updateTempPw", member5);
			System.out.println("MainLoginDaoImpl 왜 비밀번호를 업데이트 못해요? 비번이 뭐에요? : "+member5.getUser_pw());
		} catch (Exception e) {
			System.out.println("MainLoginDaoImpl updateTempPw Exception->"+e.getMessage());
		}
		return findPwUp;
	}
	
	
	
}
