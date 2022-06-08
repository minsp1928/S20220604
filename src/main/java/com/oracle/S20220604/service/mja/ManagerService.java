package com.oracle.S20220604.service.mja;

import java.util.List;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Board;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Faq;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberChk;

public interface ManagerService {

	//회원
	List<Member> memberList();

	int memberCnt();
	
	int memberKeywordCnt(Member member);

	List<Member> memberKeyword(Member member);
	
	List<Member> newMember();

	//공지
	int boardTotal();

	List<Board> boardList(Board board);

	int writeNotice(Board board);
	
	Board noticeDetail(int board_num);
	
	int noticeHits(int board_num);
	
	
	//쿠폰
	List<Coupon> coupons();

	int createCoupon(Coupon coupon);

	int couponCheck(Coupon coupon);

	String couponDown(Coupon coupon);
	
	
	
	//1:1 문의
	int faqTotal();

	List<Faq> faqList();

	Faq faqDetail(int faq_num);

	int faqAnswer(Faq faq);

	
	
	//배너 등록시 글 확인
	List<Board> boardList();
	
	//배너 리스트
	List<Banner> bannerList();

	int bannerDelete(int bn_num);

	int createBanner(Banner banner);

	
	//판매자
	List<MemberChk> approveSeller();

	


	

	
	

	


}
