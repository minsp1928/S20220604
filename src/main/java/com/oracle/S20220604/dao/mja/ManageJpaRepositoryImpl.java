package com.oracle.S20220604.dao.mja;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.S20220604.domain.CouponJpa;
import com.oracle.S20220604.domain.HwCurrentVO;

@Repository
public class ManageJpaRepositoryImpl implements ManageJpaRepository {

	private final EntityManager em;

	public ManageJpaRepositoryImpl(EntityManager em) {
		this.em = em;
	}

	@Override
	public List<CouponJpa> couponList() {
		String user_id = "admin";
		@SuppressWarnings("unchecked")
		List<CouponJpa> couponList = em.createQuery("SELECT m FROM CouponJpa m WHERE m.user_id = :user_id")
										.setParameter("user_id", user_id)
										.getResultList();
		System.out.println("JpaRepository couponList ->" + couponList.size());
		return couponList;
	}

	@Override
	public int couponChk(CouponJpa couponJpa) {
		System.out.println("JpaRepository couponChk");
		HwCurrentVO pk = new HwCurrentVO();
		pk.setUser_id(couponJpa.getUser_id());
		pk.setCp_num(couponJpa.getCp_num());
		
		CouponJpa couponChk = em.find(CouponJpa.class, pk);
		if(couponChk != null) {
			System.out.println("이미있음");
			return 1;
		} else {
			System.out.println("없음 ");	
			return 0;
		}
	}
	
	@Override
	public CouponJpa save(CouponJpa couponJpa) {
		//저장할 user_id 가져오기
		String user_id = couponJpa.getUser_id();
				
		HwCurrentVO pk = new HwCurrentVO();
		pk.setUser_id("admin");
		pk.setCp_num(couponJpa.getCp_num());

		CouponJpa insert = em.find(CouponJpa.class, pk);
		insert.setUser_id(user_id);
		em.persist(insert);
		System.out.println("insert 성공");
		
		return insert;
	}
}
