package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberDetail;
import com.oracle.S20220604.model.MemberChk;

public interface MemberManageDao {

	List<Member> memberList();

	int memberCnt();

	int memberKeywordCnt(Member member);

	List<Member> memberKeyword(Member member);

	List<MemberChk> approveSeller();

	List<Member> newMember();

	MemberDetail memberDetail(String user_id);

	int sellerApprove(String user_id);

	int sellerReject(String user_id);

	int memberStatus(Member member);

	int passReset(String user_id);

	int memberChk(String user_id);

  

}
