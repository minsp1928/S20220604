package com.oracle.S20220604.controller.jsh;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.service.jsh.PaymentService;




@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService ps;
	
	@RequestMapping(value="PaymentPage")
	public String list(Payment payment, Model model) {
		logger.info("Payment Start list...");
		
		return "";
	}
	
	
	
}
