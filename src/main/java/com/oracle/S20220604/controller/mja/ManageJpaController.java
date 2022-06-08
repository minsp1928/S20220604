package com.oracle.S20220604.controller.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220604.domain.CouponJpa;
import com.oracle.S20220604.service.mja.ManageJpaService;

@Controller
public class ManageJpaController {

	private final ManageJpaService manageJpaService;

	@Autowired
	public ManageJpaController(ManageJpaService manageJpaService) {
		this.manageJpaService = manageJpaService;
	}
	
	@GetMapping(value = "coupon")
	public String coupon(Model model) {
		System.out.println("manageJap coupon 컨트롤러");
		List<CouponJpa> couponList = manageJpaService.getCouponList();
		model.addAttribute("cpList", couponList);
		return "manageMja/coupon";
	}
}
