package com.oracle.S20220604.dao.pkw;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Check_Product;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	private SqlSession session;	
	
//	@Override
//	public int total() {
//		int tot = 0;
//		System.out.println("MyPageDaoImpl Start total...");
//		try {
//			tot = session.selectOne("pkwOrderListTotal");
//			System.out.println("MyPageDaoImpl total tot-> " + tot);//오류
//		} catch (Exception e) {
//			System.out.println("MyPageDaoImpl total Exception->" + e.getMessage());
//		}
//	
//		return tot;
//	}

	@Override
	public List<MyPageVO> listShopperOrder(MyPageVO mypagevo) {
		List<MyPageVO> shopperOrderList = null;
		System.out.println("MyPageDaoImpl listShopperOrder Start...");
		try {
			shopperOrderList = session.selectList("pkwShopperOrderList", mypagevo);
			System.out.println("MyPageDaoImpl listShopperOrder shopperOrderList.size()-->" + shopperOrderList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listShopperOrder Exception-->" + e.getMessage());
		}
				
		return shopperOrderList;
	}

	@Override
	public List<MyPageVO> listShopperRefund(MyPageVO mypagevo) {
		List<MyPageVO> shopperRefundList = null;
		System.out.println("MyPageDaoImpl listShopperRefund Start...");
		try {
			shopperRefundList = session.selectList("pkwShopperRefundList", mypagevo);
			System.out.println("MyPageDaoImpl listShopperRefund shopperRefundList.size()-->" + shopperRefundList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listShopperRefund Exception-->" + e.getMessage());
		}
				
		return shopperRefundList;
	}

	@Override
	public List<MyPageVO> listShopperPurchaseCompleted(MyPageVO mypagevo) {
		List<MyPageVO> shopperPurchaseCompletedList = null;
		System.out.println("MyPageDaoImpl listShopperPurchaseCompleted Start...");
		try {
			shopperPurchaseCompletedList = session.selectList("pkwShopperPurchaseCompletedList", mypagevo);
			System.out.println("MyPageDaoImpl listShopperPurchaseCompleted shopperRefundList.size()-->" + shopperPurchaseCompletedList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listShopperPurchaseCompleted Exception-->" + e.getMessage());
		}
				
		return shopperPurchaseCompletedList;
	}
	
	@Override
	public List<MyPageVO> listShopperMyCheckProduct(MyPageVO mypagevo) {
		List<MyPageVO> shopperMyCheckProductList = null;
		System.out.println("MyPageDaoImpl listShopperMyCheckProduct Start...");
		try {
			shopperMyCheckProductList = session.selectList("pkwShopperMyCheckProductList", mypagevo);
			System.out.println("MyPageDaoImpl listShopperMyCheckProduct ShopperMyCheckProductList.size()-->" + shopperMyCheckProductList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listShopperMyCheckProduct Exception-->" + e.getMessage());
		}
				
		return shopperMyCheckProductList;
	}
	
	@Override
	public List<Coupon> listShopperMyCoupon(Coupon coupon) {
		List<Coupon> shopperMyCouponList = null;
		System.out.println("MyPageDaoImpl listShopperMyCoupon Start...");
		try {
			shopperMyCouponList = session.selectList("pkwShopperMyCouponList", coupon);
			System.out.println("MyPageDaoImpl listShopperMyCoupon shopperMyCouponList.size()-->" + shopperMyCouponList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listShopperMyCoupon Exception-->" + e.getMessage());
		}
				
		return shopperMyCouponList;
	}

	@Override
	public List<MyPageVO> listShopperMyReview(MyPageVO mypagevo) {
		List<MyPageVO> shopperMyReviewList = null;
		System.out.println("MyPageDaoImpl listShopperMyReview Start...");
		try {
			shopperMyReviewList = session.selectList("pkwShopperMyReviewList", mypagevo);
			System.out.println("MyPageDaoImpl listShopperMyReview shopperMyReviewList.size()-->" + shopperMyReviewList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listShopperMyReview Exception-->" + e.getMessage());
		}
				
		return shopperMyReviewList;
	}

	@Override
	public List<MyPageVO> listMakerOrder(MyPageVO mypagevo) {
		List<MyPageVO> makerOrderList = null;
		System.out.println("MyPageDaoImpl listMakerOrder Start...");
		try {
			makerOrderList = session.selectList("pkwMakerOrderList", mypagevo);
			System.out.println("MyPageDaoImpl listMakerOrder makerOrderList.size()-->" + makerOrderList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listMakerOrder Exception-->" + e.getMessage());
		}
				
		return makerOrderList;
	}

	@Override
	public List<MyPageVO> listMakerRefund(MyPageVO mypagevo) {
		List<MyPageVO> makerRefundList = null;
		System.out.println("MyPageDaoImpl listMakerRefund Start...");
		try {
			makerRefundList = session.selectList("pkwMakerRefundList", mypagevo);
			System.out.println("MyPageDaoImpl listMakerRefund makerRefundList.size()-->" + makerRefundList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listMakerRefund Exception-->" + e.getMessage());
		}
				
		return makerRefundList;
	}

	@Override
	public List<MyPageVO> listMakerSellCompleteList(MyPageVO mypagevo) {
		List<MyPageVO> makerSellCompleteList = null;
		System.out.println("MyPageDaoImpl listMakerSellCompleteList Start...");
		try {
			makerSellCompleteList = session.selectList("pkwMakerSellCompleteList", mypagevo);
			System.out.println("MyPageDaoImpl listMakerSellCompleteList makerSellCompleteList.size()-->" + makerSellCompleteList.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl listMakerSellCompleteList Exception-->" + e.getMessage());
		}
				
		return makerSellCompleteList;
	}

	@Override
	public Member shopperMyProfile(Member memberMp) {
		Member member = new Member();
		try {
			System.out.println("MyPageDaoImpl shopperMyProfile Start...");
			member = session.selectOne("pkwShopperMyProfile", memberMp);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return member;
	}

	@Override
	public void updatePkwShopperMyProfile(Member member) {
		session.update("updatePkwShopperMyProfile",member);
	}

	   @Override
	   public void updatePkwMakerMyProfile(Member member) {
	      System.out.println("MyPageDaoImpl updatePkwMakerMyProfile Start...");
	      System.out.println("MyPageDaoImpl updatePkwMakerMyProfile getUser_id : "+ member.getUser_id());
	      System.out.println("MyPageDaoImpl updatePkwMakerMyProfile member.getSellname() ->" + member.getSell_name());
	      System.out.println("MyPageDaoImpl updatePkwMakerMyProfile Photo   : "+ member.getSell_photo());
	      
	      if (member.getSell_photo() == null) {
	         member.setSell_photo("null");
	         System.out.println("사진은 null로 셋팅해서 디비에 저장함");
	         session.update("updatePkwMakerMyProfile",member);
	      }
	      else {
	         session.update("updatePkwMakerMyProfile",member);
	      }
	   }

	@Override
	public void updatePkwShopperOrderList(MyPageVO mypagevo) {
		System.out.println("MyPageDaoImpl updatePkwShopperOrderList Start...");
		
		session.update("updatePkwShopperOrderList",mypagevo);
	}

	@Override
	public void updatePkwMakerOrderList(MyPageVO mypagevo) {
		System.out.println("MyPageDaoImpl updatePkwMakerOrderList Start...");
		
		session.update("updatePkwMakerOrderList",mypagevo);
	}

	@Override
	public int insertChkLevelMyPage(MyPageVO mypagevo) {
		int result = 0;
		System.out.println("MyPageDaoImpl insertChkLevelMyPage Start ..." );
		try {
			result = session.insert("insertChkLevelMyPage",mypagevo);
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl insert Exception->"+e.getMessage());
		}
		return result;
	}

	@Override
	public int selectChkLevelMyPage(MyPageVO mypagevo) {
		int resultcnt = 0;
		try {
			resultcnt = session.selectOne("selectChkLevelMyPage", mypagevo);
			System.out.println("MyPageDaoImpl resultcnt-> " + resultcnt);
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl resultcnt Exception->" + e.getMessage());
		}
	
		return resultcnt;
	}

	@Override
	public void updateChkLevelMyPage(MyPageVO mypagevo) {
		session.update("updateChkLevelMyPage", mypagevo);
		
	}

	@Override
	public List<MyPageVO> makerMyProfileView(MyPageVO mypagevo) {
		List<MyPageVO> makerMyProfileView = null;
		System.out.println("MyPageDaoImpl makerMyProfileView Start...");
		try {
			makerMyProfileView = session.selectList("pkwMakerMyProfileView", mypagevo);
			System.out.println("MyPageDaoImpl makerMyProfileView makerMyProfileView.size()-->" + makerMyProfileView.size());
		} catch (Exception e) {
			System.out.println("MyPageDaoImpl makerMyProfileView Exception-->" + e.getMessage());
		}
				
		return makerMyProfileView;
	}
	
	

}
