package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Coupon;

@Repository
public class CouponDaoImpl implements CouponDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public List<Coupon> coupons() {
		
		List<Coupon> coupons = null;
		try {
			coupons = session.selectList("mjCoupons");
		} catch (Exception e) {
			System.out.println("Coupons Err : " + e.getMessage());
		}
		
		return coupons;
	}

	@Override
	public int createCoupon(Coupon coupon) {
		System.out.println("createCoupon dao 시작");
		int result = 0;
		try {
			result = session.insert("mjCreateCoupon", coupon);
		} catch (Exception e) {
			System.out.println("createCoupon Err : " + e.getMessage());
		}
		System.out.println("createCoupon dao 끝");
		return result;
	}

	@Override
	public int couponCheck(Coupon coupon) {
		System.out.println("couponCheck dao 시작");
		int result = 0;
		try {
			result = session.selectOne("mjCouponChk", coupon);
		} catch (Exception e) {
			System.out.println("CouponChk Err : " + e.getMessage());
		}
		return result;
	}

	@Override
	public Coupon couponDown(Coupon coupon) {
		System.out.println("couponCheck dao 시작");
		int cp_num = coupon.getCp_num();
		Coupon insert = session.selectOne("mjCouponDown1", cp_num);
		insert.setUser_id(coupon.getUser_id());
		int result = session.insert("mjCoouponInsert", insert);
		return insert;
	}

}
