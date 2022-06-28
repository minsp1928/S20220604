package com.oracle.S20220604.controller.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Board;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Faq;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MemberDetail;
import com.oracle.S20220604.service.mja.ManagerService;

@RestController
public class ManageRestController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/getBoardNum")
	public List<Board> getBoardList(){
		System.out.println("getBoardList 컨트롤러");
		List<Board> boardList = managerService.boardList();
		return boardList;
	}
	
 
	@RequestMapping(value = "downloadCoupon", produces = "application/text;charset=UTF-8")
	public String downloadCoupon(Coupon coupon) {
		//result = 쿠폰 다운 완료시 1
		//coupon 쿠폰 있는지 먼저 확인 없으면 0 있으면 1
		int couponChk= 0;
		String result = "";
		System.out.println("downloadCoupon 컨트롤러");
		System.out.println("user_id : " + coupon.getUser_id());
		System.out.println("cp_num : " + coupon.getCp_num());
		
		couponChk = managerService.couponCheck(coupon);
		if(couponChk > 0) {
			System.out.println("쿠폰이 이미 있음");
			result = "alreadyIn";
			return result;
		} else {
			result = managerService.couponDown(coupon);
			System.out.println("쿠폰 다운로드 완료");
			return result;
		}
	}
	
	
	@RequestMapping(value = "bannerDelete")
	public String bannerDelete(String num) {
		System.out.println("bannerDelete 컨트롤러");
		System.out.println(num);
		int result = 0;
		int bn_num = Integer.parseInt(num);
		result = managerService.bannerDelete(bn_num);
		if(result > 0) {
			System.out.println("삭제 성공");
			return "1";
		} else {
			return "0";
		}
	}
	
	@RequestMapping(value = "bannerChk")
	public String bannerChk() {
		System.out.println("bannerChk 컨트롤러");
		List<Banner> banners = managerService.bannerList();
		int num = banners.size();
		if(num < 3) {
			return  "1";
		} else {
			return  "0";
		}
	}
	
	@RequestMapping(value = "sellerApprove")
	public boolean sellerApprove(String user_id) {
		System.out.println("seller Approve 컨트롤러 실행");
		System.out.println(user_id);
		//승인
		int num =  managerService.sellerApprove(user_id);
		return true;
	}
	
	
	@RequestMapping(value = "sellerReject")
	public boolean sellerReject(String user_id) {
		System.out.println("sellerReject 컨트롤러 실행");
		System.out.println(user_id);
		//반려
		int num =  managerService.sellerReject(user_id);
		return true;
	}
	
	@RequestMapping(value = "memberStatus",  produces = "application/text;charset=UTF-8")
	public String memberStatus(Member member) {
		System.out.println("memberStatus 실행");
		System.out.println(member.getM_level());
		System.out.println(member.getUser_id());
		String result = "";
		if(member.getM_level().equals("3")) {
			member.setM_level("1"); result = "1";
		} else {
			member.setM_level("3"); result = "3";
		}
		System.out.println(result);
		int status = managerService.memberStatus(member);
		
		return result;
	}
	
	@RequestMapping(value = "passReset")
	public boolean passReset(String user_id) {
		System.out.println("passReset 실행 ");
		System.out.println("user_id" + user_id);
		int num = managerService.passReset(user_id);
		return true;
	}
	
	@RequestMapping(value = "faqchk")
	public String faqchk(String num, String pass) {
		System.out.println("faqchk 실행");
		System.out.println("num : " + num + "pass :" + pass);
		Faq faq = new Faq();
		faq.setFaq_num(Integer.parseInt(num));
		System.out.println(faq.getFaq_num());
		System.out.println(faq.getFaq_pass());
		faq.setFaq_pass(Integer.parseInt(pass));
		int result = managerService.faqchk(faq);
		System.out.println("result : " + result);
		if(result > 0) return "ok";
		else           return "notOk";
		
	}
}
