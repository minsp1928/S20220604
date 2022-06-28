package com.oracle.S20220604.dao.mja;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.stereotype.Repository;

import com.oracle.S20220604.domain.FaqJpa;

@Repository
public class ManageJpaRepositoryImpl implements ManageJpaRepository {

	private final EntityManager em;

	public ManageJpaRepositoryImpl(EntityManager em) {
		this.em = em;
	}

	@Override
	public FaqJpa save(FaqJpa faqJpa) {
		LocalDate now = LocalDate.now();
		String date = now.toString();
		faqJpa.setUser_date(date);
		faqJpa.setFaq_check(0);
		faqJpa.setLogin_check(0);
		em.persist(faqJpa);
		System.out.println("insert 성공");
		return faqJpa;
	}
}
