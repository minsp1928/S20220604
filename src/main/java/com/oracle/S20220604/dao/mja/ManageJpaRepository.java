package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.domain.CouponJpa;
import com.oracle.S20220604.domain.FaqJpa;

public interface ManageJpaRepository {

	List<CouponJpa> couponList();

	int couponChk(CouponJpa couponJpa);

	CouponJpa save(CouponJpa couponJpa);

	FaqJpa save(FaqJpa faqJpa);

 

}
