package com.oracle.S20220604.service.mja;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.mja.ManageJpaRepository;
import com.oracle.S20220604.domain.CouponJpa;

@Transactional
@Service
public class ManageJpaService {

	private final ManageJpaRepository manageJpaRepository;

	public ManageJpaService(ManageJpaRepository manageJpaRepository) {
		this.manageJpaRepository = manageJpaRepository;
	}

	//전체 쿠폰 조회
	public List<CouponJpa> getCouponList() {
		List<CouponJpa> couponList = manageJpaRepository.couponList();
		System.out.println("couponJpa List 서비스");
		return couponList;
	}

	public int couponCheck(CouponJpa couponJpa) {
		System.out.println("couponCheck 서비스");
		int couponChk = manageJpaRepository.couponChk(couponJpa);
		return couponChk;
	}

	public String couponDown(CouponJpa couponJpa) {
		System.out.println("couponDown 서비스");
		CouponJpa insert = manageJpaRepository.save(couponJpa);
		return insert.getUser_id();
	}
	
}
