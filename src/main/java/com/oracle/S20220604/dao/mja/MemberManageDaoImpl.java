package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberChk;

@Repository
public class MemberManageDaoImpl implements MemberManageDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int memberCnt() {
		int memberCnt = 0;
		try {
			memberCnt = session.selectOne("mjMemberCnt");
		} catch (Exception e) {
			System.out.println("memberCnt sql : " + e.getMessage());
		}
		return memberCnt;
	}
	
	@Override
	public List<Member> memberList() {
		System.out.println("MemberManageDao memberList");
		List<Member> memberList = null;
		
		try {
			memberList = session.selectList("mjaMemberList");
		} catch (Exception e) {
			System.out.println("memberList sql : " + e.getMessage());
		}
		return memberList;
	}

	@Override
	public int memberKeywordCnt(Member member) {
		System.out.println("MemberManageDao memberKeywordCnt");
		int memberCnt = 0;
		
		if(member.getKeyword() == "") member.setKeyword("%");
		System.out.println("member.getKeyword() : " + member.getKeyword());
		
		if(member.getStartDate() == "") member.setStartDate("1999-01-01");
		System.out.println("member.getStartDate()" + member.getStartDate());
		
		if(member.getEndDate() == "") member.setEndDate("2100-01-01");
		System.out.println("member.getEndDate()" + member.getEndDate());
		
		try {
			memberCnt = session.selectOne("mjMemberKeywordCnt");
		} catch (Exception e) {
			System.out.println("KeywordCnt sql : " + e.getMessage());
		}
		return memberCnt;
	}

	@Override
	public List<Member> memberKeyword(Member member) {
		System.out.println("MemberManageDao memberKeywordCnt");
		List<Member> memberList =  null;
		 
		if(member.getKeyword() == "") member.setKeyword("%");
		System.out.println("member.getKeyword() : " + member.getKeyword());
		
		if(member.getStartDate() == "") member.setStartDate("1999-01-01");
		System.out.println("member.getStartDate()" + member.getStartDate());
		
		if(member.getEndDate() == "") member.setEndDate("2100-01-01");
		System.out.println("member.getEndDate()" + member.getEndDate());
		
		try {			
			memberList = session.selectList("mjMemberKeyword", member);
		} catch (Exception e) {
			System.out.println("MemberKeyword sql : " + e.getMessage());
		}
		
		return memberList;
	}

	@Override
	public List<Member> newMember() {
		List<Member> members = null;
		try {
			members = session.selectList("mjNewMember");
		} catch (Exception e) {
			System.out.println("newMember Err : " + e.getMessage());
		} 
		return members;
	}
	
	//판매자 승인
	@Override
	public List<MemberChk> approveSeller() {
		List<MemberChk> seller = null;
		try {
			seller = session.selectList("mjSellerList");
		} catch (Exception e) {
			System.out.println("approveSeller Err : " + e.getMessage());
		}
		return seller;
	}

	

 

}
