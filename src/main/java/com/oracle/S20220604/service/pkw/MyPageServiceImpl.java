package com.oracle.S20220604.service.pkw;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.pkw.MyPageDao;
import com.oracle.S20220604.model.Check_Product;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDao mpd;
	
//	@Override
//	public int total() {
//		System.out.println("MyPageServiceImpl Start total...");
//		int totCnt = mpd.total();
//		System.out.println("MyPageServiceImpl total totCnt-> " + totCnt);
//		
//		return totCnt;
//	}

	@Override
	public List<MyPageVO> listShopperOrder(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listShopperOrder...");
		List<MyPageVO> shopperOrderList = null;
		shopperOrderList = mpd.listShopperOrder(mypagevo);
		System.out.println("MyPageServiceImpl listShopperOrder.size()->" + shopperOrderList.size());
		
		return shopperOrderList;
	}

	@Override
	public List<MyPageVO> listShopperRefund(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listShopperRefund...");
		List<MyPageVO> shopperRefundList = null;
		shopperRefundList = mpd.listShopperRefund(mypagevo);
		System.out.println("MyPageServiceImpl listShopperRefund.size()->" + shopperRefundList.size());
		
		return shopperRefundList;
	}

	@Override
	public List<MyPageVO> listShopperPurchaseCompleted(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listShopperPurchaseCompleted...");
		List<MyPageVO> shopperPurchaseCompletedList = null;
		shopperPurchaseCompletedList = mpd.listShopperPurchaseCompleted(mypagevo);
		System.out.println("MyPageServiceImpl listShopperPurchaseCompleted.size()->" + shopperPurchaseCompletedList.size());
		
		return shopperPurchaseCompletedList;
	}
	
	@Override
	public List<MyPageVO> listShopperMyCheckProduct(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listShopperMyCheckProduct...");
		List<MyPageVO> shopperMyCheckProductList = null;
		shopperMyCheckProductList = mpd.listShopperMyCheckProduct(mypagevo);
		System.out.println("MyPageServiceImpl listShopperMyCheckProduct.size()->" + shopperMyCheckProductList.size());
		
		return shopperMyCheckProductList;
	}


	@Override
	public List<Coupon> listShopperMyCoupon(Coupon coupon) {
		System.out.println("MyPageServiceImpl Start listShopperMyCoupon...");
		List<Coupon> shopperMyCouponList = null;
		shopperMyCouponList = mpd.listShopperMyCoupon(coupon);
		System.out.println("MyPageServiceImpl listShopperMyCoupon.size()->" + shopperMyCouponList.size());
		
		return shopperMyCouponList;
	}

	@Override
	public List<MyPageVO> listShopperMyReview(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listShopperMyReview...");
		List<MyPageVO> shopperMyReviewList = null;
		shopperMyReviewList = mpd.listShopperMyReview(mypagevo);
		System.out.println("MyPageServiceImpl listShopperMyReview.size()->" + shopperMyReviewList.size());
		
		return shopperMyReviewList;
	}

	@Override
	public List<MyPageVO> listMakerOrder(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listMakerOrder...");
		List<MyPageVO> makerOrderList = null;
		makerOrderList = mpd.listMakerOrder(mypagevo);
		System.out.println("MyPageServiceImpl listMakerOrder.size()->" + makerOrderList.size());
		
		return makerOrderList;
	}

	@Override
	public List<MyPageVO> listMakerRefund(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listMakerRefund...");
		List<MyPageVO> makerRefundList = null;
		makerRefundList = mpd.listMakerRefund(mypagevo);
		System.out.println("MyPageServiceImpl listMakerRefund.size()->" + makerRefundList.size());
		
		return makerRefundList;
	}

	@Override
	public List<MyPageVO> listMakerSellCompleteList(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start listMakerSellCompleteList...");
		List<MyPageVO> makerSellCompleteList = null;
		makerSellCompleteList = mpd.listMakerSellCompleteList(mypagevo);
		System.out.println("MyPageServiceImpl listMakerSellCompleteList.size()->" + makerSellCompleteList.size());
		
		return makerSellCompleteList;
	}

	@Override
	public Member shopperMyProfile(Member member) {
		System.out.println("MyPageServiceImpl Start shopperMyProfile...");
		Member shopperMyProfile= null;
		
		try {
			System.out.println("try MyPageServiceImpl");
			shopperMyProfile = mpd.shopperMyProfile(member);
			System.out.println(shopperMyProfile);
			System.out.println(shopperMyProfile.getUser_id());
			System.out.println(shopperMyProfile.getUser_name());
			System.out.println(shopperMyProfile.getSell_name());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return shopperMyProfile;
	}

	@Override
	public void updatePkwShopperMyProfile(Member member) {
		mpd.updatePkwShopperMyProfile(member);
	}

	@Override
	public void updatePkwMakerMyProfile(Member member) {
		System.out.println("MyPageServiceImpl Start updatePkwMakerMyProfile...");
		System.out.println("member.getSellname() ->" + member.getSell_name());
		mpd.updatePkwMakerMyProfile(member);
		
	}

	@Override
	public void updatePkwShopperOrderList(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start updatePkwShopperOrderList...");
		mpd.updatePkwShopperOrderList(mypagevo);
		
	}

	@Override
	public void updatePkwMakerOrderList(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start updatePkwMakerOrderList...");
		mpd.updatePkwMakerOrderList(mypagevo);
		
	}

	@Override
	public int insertChkLevelMyPage(MyPageVO mypagevo) {
		int result = 0;
		System.out.println("MyPageServiceImpl insertMakerMyProfileAdminConfirm Start..." );
		result = mpd.insertChkLevelMyPage(mypagevo);
		return result;
	}

	@Override
	public int selectChkLevelMyPage(MyPageVO mypagevo) {
		int resultcnt = mpd.selectChkLevelMyPage(mypagevo);
		return resultcnt;
	}

	@Override
	public void updateChkLevelMyPage(MyPageVO mypagevo) {
		mpd.updateChkLevelMyPage(mypagevo);
	}

	@Override
	public List<MyPageVO> makerMyProfileView(MyPageVO mypagevo) {
		System.out.println("MyPageServiceImpl Start makerMyProfileView...");
		List<MyPageVO> makerMyProfileView = null;
		makerMyProfileView = mpd.makerMyProfileView(mypagevo);
		System.out.println("MyPageServiceImpl makerMyProfileView.size()->" + makerMyProfileView.size());
		
		return makerMyProfileView;
	}



}
