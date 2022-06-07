package com.oracle.S20220604.dao.pms;

import com.oracle.S20220604.model.Member;

public interface MainLoginDao {

	Member selectLogin(Member member);

	Member findId(Member member);

}
