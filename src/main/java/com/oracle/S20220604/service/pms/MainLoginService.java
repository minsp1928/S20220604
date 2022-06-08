package com.oracle.S20220604.service.pms;

import com.oracle.S20220604.model.Member;

public interface MainLoginService {

	Member login(Member member);

	Member findIdCheck(Member member);

}
