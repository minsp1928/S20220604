package com.oracle.S20220604.controller.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.S20220604.domain.CouponJpa;
import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Board;
import com.oracle.S20220604.model.Coupon;
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
		if(num < 4) {
			return  "1";
		} else {
			return  "0";
		}
	}
}
