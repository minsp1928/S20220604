package com.oracle.S20220604.service.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.mja.BannerDao;
import com.oracle.S20220604.dao.mja.BoardDao;
import com.oracle.S20220604.dao.mja.CouponDao;
import com.oracle.S20220604.dao.mja.FaqDao;
import com.oracle.S20220604.dao.mja.MemberManageDao;
import com.oracle.S20220604.domain.FaqJpa;
import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Board;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Faq;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberDetail;
import com.oracle.S20220604.model.MemberChk;
 

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private BannerDao 		bannerDao;
	@Autowired
	private BoardDao 		boardDao;
	@Autowired
	private CouponDao 		couponDao;
	@Autowired
	private FaqDao    		faqDao;
	@Autowired
	private MemberManageDao memberManageDao;
	
	
	//회원
	@Override
	public List<Member> memberList() {
		System.out.println("서비스 memberList");
		List<Member> memberList = memberManageDao.memberList();
		return memberList;
	}

	@Override
	public int memberCnt() {
		int memberCnt = memberManageDao.memberCnt();
		return memberCnt;
	}

	@Override
	public int memberKeywordCnt(Member member) {
		System.out.println("memberKeywordCnt 서비스");
		int memberCnt = memberManageDao.memberKeywordCnt(member);
		return memberCnt;
	}

	@Override
	public List<Member> memberKeyword(Member member) {
		System.out.println("memberKey 서비스");
		List<Member> memberList = memberManageDao.memberKeyword(member);
		return memberList;
	}
	
	@Override
	public List<Member> newMember() {
		System.out.println("newMember 서비스");
		List<Member> member = memberManageDao.newMember();
		return member;
	}
	
	@Override
	public MemberDetail memberDetail(String user_id) {
		System.out.println("memberDetail 서비스");
		MemberDetail member = memberManageDao.memberDetail(user_id);
		System.out.println("memberDetail 서비스 끝");
		return member;
	}

	@Override
	public int memberStatus(Member member) {
		System.out.println("memberStatus 서비스");
		int status = memberManageDao.memberStatus(member);
		return status;
	}
	
	@Override
	public int passReset(String user_id) {
		System.out.println("passReset 서비스");
		int status = memberManageDao.passReset(user_id);
		return status;
	}
	
	//공지
	@Override
	public int boardTotal() {
		int boardTotal = boardDao.boardTotal();
		return boardTotal;
	}
	
	@Override
	public List<Board> boardList(Board board) {
		List<Board> boardList = boardDao.boardList(board);
		return boardList;
	}
	

	
	//공지 등록
	@Override
	public int writeNotice(Board board) {
		System.out.println("writeNotice service");
		int result = boardDao.writeNotice(board);
		return result;
	}

	
	@Override
	public Board noticeDetail(int board_num) {
		System.out.println("noticeDetail 서비스");
		Board board = boardDao.noticeDetail(board_num);
		return board;
	}

	@Override
	public int noticeHits(int board_num) {
		System.out.println("noticeHits 서비스");
		int result = boardDao.noticeHits(board_num);
		return result;
	}
	
	@Override
	public int noticeDelete(int board_num) {
		System.out.println("notice delete 서비스 ");
		int result = boardDao.noticeDelete(board_num);
		return result;
	}
	
	
	//쿠폰
	@Override
	public List<Coupon> coupons() {
		List<Coupon> coupons = couponDao.coupons();
		return coupons;
	}

	@Override
	public int createCoupon(Coupon coupon) {
		System.out.println("createCoupon 서비스 시작");
		int result = couponDao.createCoupon(coupon);
		System.out.println("createCoupon 서비스 끝");
		return result;
	}

	@Override
	public int couponCheck(Coupon coupon) {
		System.out.println("couponCheck 서비스 시작");
		int result = couponDao.couponCheck(coupon);
		return result;
	}

	@Override
	public String couponDown(Coupon coupon) {
		System.out.println("couponDown 서비스 시작");
		Coupon insert = couponDao.couponDown(coupon);
		return insert.getUser_id();
	}
	
	@Override
	public List<Coupon> getCouponList(Coupon coupon) {
		System.out.println("getCouponList 서비스 시작");
		List<Coupon> coupons = couponDao.getCouponLIst(coupon);
		return coupons;
	}
	
	
	@Override
	public int couponCount() {
		System.out.println("couponCount 서비스 시작");
		int couponCnount = couponDao.couponCount();
		return couponCnount;
	}
	
	//1:1 문의
	@Override
	public int faqTotal() {
		System.out.println("faqTotal 서비스 ");
		int faqTotal = faqDao.faqTotal();
		return faqTotal;
	}

	@Override
	public List<Faq> faqList(Faq faq) {
		System.out.println("faqsList 서비스");
		List<Faq> faqs = faqDao.faqList(faq);
		return faqs;
	}

	@Override
	public Faq faqDetail(int faq_num) {
		System.out.println("faqDetail 서비스");
		Faq faq = faqDao.faqDetail(faq_num);
		return faq;
	}


	@Override
	public int faqAnswer(Faq faq) {
		System.out.println("faqAnswer 서비스 ");
		int result = faqDao.faqAnswer(faq);
		return result;
	}

	
	@Override
	public List<Faq> faqKeyword(Faq faq) {
		System.out.println("faqKeyword 서비스 ");
		List<Faq> faqs = faqDao.faqKeyword(faq);
		return faqs;
	}
	
	@Override
	public int faqchk(Faq faq) {
		System.out.println("faqchk 서비스 ");
		int faqchk = faqDao.faqchk(faq);
		return faqchk;
	}
	
	
	//배너
	@Override
	public List<Board> boardList() {
		List<Board> boardList = boardDao.boardList();
		return boardList;
	}

	@Override
	public List<Banner> bannerList() {
		List<Banner> banners = bannerDao.bannsers();
		return banners;
	}

	@Override
	public int bannerDelete(int bn_num) {
		int result = bannerDao.bannerDelete(bn_num);
		return result;
	}

	@Override
	public int createBanner(Banner banner) {
		int result = bannerDao.createBanner(banner);
		return result;
	}

	
	
	//판매자
	@Override
	public List<MemberChk> approveSeller() {
		List<MemberChk> seller = memberManageDao.approveSeller();
		return seller;
	}

	@Override
	public int sellerApprove(String user_id) {
		int result = memberManageDao.sellerApprove(user_id);
		return result;
	}

	@Override
	public int sellerReject(String user_id) {
		int result = memberManageDao.sellerReject(user_id);
		return result;
	}
	
	
	//인터셉터
	@Override
	public int memberChk(String user_id) {
		int result = memberManageDao.memberChk(user_id);
		return result;
	}

	@Override
	public List<Faq> questions(String user_id) {
		System.out.println("questions 서비스");
		List<Faq> faqs = faqDao.questions(user_id);
		return faqs;
	}

	













	

}
