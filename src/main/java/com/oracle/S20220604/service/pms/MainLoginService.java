package com.oracle.S20220604.service.pms;

import org.springframework.ui.Model;

import com.oracle.S20220604.model.Member;

public interface MainLoginService {

	Member login(Member member);

	Member findIdCheck(Member member);

	Member findPwCheck(Member member);

	int updateTempPassword(Member member5);

}
