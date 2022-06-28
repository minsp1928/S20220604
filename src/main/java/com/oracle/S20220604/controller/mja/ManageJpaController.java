package com.oracle.S20220604.controller.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220604.domain.FaqJpa;
import com.oracle.S20220604.service.mja.ManageJpaService;

@Controller
public class ManageJpaController {

	private final ManageJpaService manageJpaService;

	@Autowired
	public ManageJpaController(ManageJpaService manageJpaService) {
		this.manageJpaService = manageJpaService;
	}
	
	
	
	@PostMapping(value = "faqSubmit")
	public String faqSubmit(FaqJpa faqJpa, Model model) {
		System.out.println("faqSubmit 컨트롤러");
		System.out.println(faqJpa.getFaq_subject());
		System.out.println(faqJpa.getFaq_subject());
		System.out.println(faqJpa.getFaq_content());
		System.out.println(faqJpa.getFaq_email());
		FaqJpa newFaq = manageJpaService.faqSubmit(faqJpa);
		model.addAttribute("faq", newFaq);
		if( newFaq != null)  return "manageMja/faqResult";
		else 			     return "forward:faqSubmit";
	}
}
