package com.oracle.S20220604.service.mja;

import java.util.List;

import com.oracle.S20220604.domain.FaqJpa;
import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Board;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Faq;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberDetail;
import com.oracle.S20220604.model.MemberChk;

public interface ManagerService {

	//회원
	List<Member> memberList();

	int memberCnt();
	
	int memberKeywordCnt(Member member);

	List<Member> memberKeyword(Member member);
	
	List<Member> newMember();
	
	MemberDetail memberDetail(String user_id);

	int memberStatus(Member member);

	int passReset(String user_id);


	//공지
	int boardTotal();

	List<Board> boardList(Board board);

	int writeNotice(Board board);
	
	Board noticeDetail(int board_num);
	
	int noticeHits(int board_num);
	
	int noticeDelete(int board_num);
	
	//쿠폰
	List<Coupon> coupons();

	int createCoupon(Coupon coupon);

	int couponCheck(Coupon coupon);

	String couponDown(Coupon coupon);
	
	List<Coupon> getCouponList(Coupon coupon);
	
	int couponCount();
	
	
	//1:1 문의
	int faqTotal();

	List<Faq> faqList(Faq faq);

	Faq faqDetail(int faq_num);

	int faqAnswer(Faq faq);

	List<Faq> faqKeyword(Faq faq);
	
	
	//배너 등록시 글 확인
	List<Board> boardList();
	
	//배너 리스트
	List<Banner> bannerList();

	int bannerDelete(int bn_num);

	int createBanner(Banner banner);

	
	//판매자
	List<MemberChk> approveSeller();

	int sellerApprove(String user_id);

	int sellerReject(String user_id);

	
	//인터셉터
	int memberChk(String user_id);

	List<Faq> questions(String user_id);

	int faqchk(Faq faq);

	

	




	


}
