package com.oracle.S20220604.service.mja;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.mja.ManageJpaRepository;
import com.oracle.S20220604.domain.FaqJpa;

@Transactional
@Service
public class ManageJpaService {

	private final ManageJpaRepository manageJpaRepository;

	public ManageJpaService(ManageJpaRepository manageJpaRepository) {
		this.manageJpaRepository = manageJpaRepository;
	}


	public FaqJpa faqSubmit(FaqJpa faqJpa) {
		System.out.println("faqSubmit 서비스");
		FaqJpa newFaq = manageJpaRepository.save(faqJpa);
		return newFaq;
	}
}
