package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.Faq;

public interface FaqDao {

	int faqTotal();

	List<Faq> faqList(Faq faq);

	Faq faqDetail(int faq_num);

	int faqAnswer(Faq faq);

	List<Faq> faqKeyword(Faq faq);

	List<Faq> questions(String user_id);

	int faqchk(Faq faq);

}
