package com.oracle.S20220604.dao.pkw;

import java.util.List;

import com.oracle.S20220604.model.Check_Product;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;

public interface MyPageDao {
//	int	total();
	List<MyPageVO> listShopperOrder(MyPageVO mypagevo);
	List<MyPageVO> listShopperRefund(MyPageVO mypagevo);
	List<MyPageVO> listShopperPurchaseCompleted(MyPageVO mypagevo);
	List<MyPageVO> listShopperMyCheckProduct(MyPageVO mypagevo);
	List<Coupon> listShopperMyCoupon(Coupon coupon);
	List<MyPageVO> listShopperMyReview(MyPageVO mypagevo);
	List<MyPageVO> listMakerOrder(MyPageVO mypagevo);
	List<MyPageVO> listMakerRefund(MyPageVO mypagevo);
	List<MyPageVO> listMakerSellCompleteList(MyPageVO mypagevo);
	Member shopperMyProfile(Member member);
	void updatePkwShopperMyProfile(Member member);
	void updatePkwMakerMyProfile(Member member);
	void updatePkwShopperOrderList(MyPageVO mypagevo);
	void updatePkwMakerOrderList(MyPageVO mypagevo);
	int insertChkLevelMyPage(MyPageVO mypagevo);
	int selectChkLevelMyPage(MyPageVO mypagevo);
	void updateChkLevelMyPage(MyPageVO mypagevo);
	List<MyPageVO> makerMyProfileView(MyPageVO mypagevo);

	
}
