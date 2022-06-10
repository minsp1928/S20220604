package com.oracle.S20220604.service.pms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oracle.S20220604.dao.pms.MainLoginDao;
import com.oracle.S20220604.model.Member;

@Service
public class MainLoginServieceImpl implements MainLoginService {
	
	@Autowired MainLoginDao md;
	
	@Override
	public Member login(Member member) {
		System.out.println("MainLoginServieceImpl login Start");
		return md.selectLogin(member);
	}

	@Override
	public Member findIdCheck(Member member) {
		System.out.println("MainLoginServieceImpl findIdCheck Start");
		return md.findId(member);
	}

	@Override
	public Member findPwCheck(Member member) {
		System.out.println("MainLoginServieceImpl findPwCheck Start");
		return md.findPw(member);
	}

	@Override
	public int updateTempPassword(Member member5) {
		System.out.println("MainLoginServieceImpl updateTempPassword Start..");
		return md.updateTempPw(member5);
	}

}
