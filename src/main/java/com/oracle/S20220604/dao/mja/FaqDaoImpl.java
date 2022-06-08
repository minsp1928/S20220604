package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Faq;

@Repository
public class FaqDaoImpl implements FaqDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int faqTotal() {
		int faqTotal = 0;
		try {
			faqTotal = session.selectOne("mjFaqTotal");
		} catch (Exception e) {
			System.out.println("faqTotal err : " + e.getMessage());
		}
		return faqTotal;
	}

	@Override
	public List<Faq> faqList() {
		List<Faq> faqs = null;
		try {
			faqs = session.selectList("mjFaqList");
		} catch (Exception e) {
			System.out.println("faqList err : " + e.getMessage());
		}
		return faqs;
	}

	@Override
	public Faq faqDetail(int faq_num) {
		Faq faq = null;
		try {
			faq = session.selectOne("mjFaqDetail", faq_num);
		} catch (Exception e) {
			System.out.println("faqDetail err : " + e.getMessage());
		}
		return faq;
	}


	@Override
	public int faqAnswer(Faq faq) {
		System.out.println("faqAnswer Dao 시작");
		System.out.println("faq_num : " + faq.getFaq_num()); 
		int result = 0;
		try {
			result = session.update("mjFaqAnswer", faq);
		} catch (Exception e) {
			System.out.println("faqAnswer err : " + e.getMessage()); 
		}
		return result;
	}

}
