package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.Coupon;

public interface CouponDao {

	List<Coupon> coupons();

	int createCoupon(Coupon coupon);

	int couponCheck(Coupon coupon);

	Coupon couponDown(Coupon coupon);

	List<Coupon> getCouponLIst(Coupon coupon);

	int couponCount();

}
