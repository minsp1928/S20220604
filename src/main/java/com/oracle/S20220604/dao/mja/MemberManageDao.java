package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberChk;

public interface MemberManageDao {

	List<Member> memberList();

	int memberCnt();

	int memberKeywordCnt(Member member);

	List<Member> memberKeyword(Member member);

	List<MemberChk> approveSeller();

	List<Member> newMember();

  

}
