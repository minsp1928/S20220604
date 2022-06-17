package com.oracle.S20220604.dao.pms;

import org.springframework.ui.Model;

import com.oracle.S20220604.model.Member;

public interface MainLoginDao {

	Member selectLogin(Member member);

	Member findId(Member member);

	Member findPw(Member member);

	int updateTempPw(Member member5);

}
