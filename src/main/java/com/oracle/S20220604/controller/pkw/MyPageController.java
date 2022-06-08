package com.oracle.S20220604.controller.pkw;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.S20220604.model.OrderList;
import com.oracle.S20220604.service.pkw.OrderListService;


@Controller
public class MyPageController {
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private OrderListService ols;
	
	@RequestMapping(value="shopperMyPage")
	public String shopperMyPage(OrderList orderlist, String currentPage, Model model) {
		logger.info("MyPageController Start shopperMyPage...");

		int total = ols.total();

		System.out.println("MyPageController total=>" + total);
		
		model.addAttribute("total", total);
		System.out.println("ok?");
		
//		Paging pg = new Paging(total, currentPage);
//		emp.setStart(pg.getStart());   // 시작시 1
//		emp.setEnd(pg.getEnd());       // 시작시 10 
//		List<Emp> listEmp = es.listEmp(emp); 
//		System.out.println("EmpController list listEmp.size()=>" + listEmp.size());
//		model.addAttribute("listEmp",listEmp);
//		model.addAttribute("pg",pg);
//		model.addAttribute("total", total);
		
		return "myPagePkw/shopperMyPage";
	}
	
	@RequestMapping(value = "makerMyPage")
	public String makerMyPage() {
		
		return "myPagePkw/makerMyPage";
	}
}
