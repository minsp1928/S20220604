package com.oracle.S20220604.controller.mja;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.oracle.S20220604.model.MonthIncome;
import com.oracle.S20220604.model.SellerIncome;
import com.oracle.S20220604.model.YearIncome;
import com.oracle.S20220604.service.mja.IncomeService;

import lombok.extern.java.Log;

@Controller
public class IncomeController {

	private static final Logger logger = LoggerFactory.getLogger(IncomeController.class);

	@Autowired
	private IncomeService incomeService;


	@RequestMapping(value = "sellManage", method = RequestMethod.GET)
	public String sellManage(int month, int year, Model model) {
		System.out.println("sellManage 컨트롤러");
		if(month == 0 && year == 0) {
			LocalDate now = LocalDate.now();
			System.out.println("now : " + now);
			year =  now.getYear();
			month = now.getMonthValue();
		}
		
		
		if(month == 0) {
			month = 12;
			year = year - 1;
		}
		
		if(month > 12) {
			month = 1;
			year = year + 1;
		}
		
		System.out.println("year : " + year + "month : " + month);
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		
		System.out.println("매출 순위 불러오기");
		SellerIncome sellerIncome = new SellerIncome();
		sellerIncome.setMonth(month);
		sellerIncome.setYear(year);
		List<SellerIncome> list = incomeService.incomeList(sellerIncome);
		model.addAttribute("num", "1");
		model.addAttribute("list", list);
		return "manageMja/sellManage";
	}
	

 	
//	@RequestMapping(value = "sellManageYear", method = RequestMethod.GET)
//	public String sellManageYear(int month, int year, Model model) {
//		System.out.println("sellManage 컨트롤러");
//		if(month == 0 && year == 0) {
//			LocalDate now = LocalDate.now();
//			System.out.println("now : " + now);
//			year =  now.getYear();
//			month = now.getMonthValue();
//		}
//		
//		if(month == 0) {
//			month = 12;
//			year = year - 1;
//		}
//		
//		if(month > 12) {
//			month = 1;
//			year = year + 1;
//		}
//		
//		System.out.println("year : " + year + "month : " + month);
//		model.addAttribute("month", month);
//		model.addAttribute("year", year);
//		return "manageMja/sellManageYear";
//	}
	
	@ResponseBody
	@RequestMapping(value = "yearIncome", produces = "application/text;charset=UTF-8")
	public String yearIncome(YearIncome incomeVO,  Model model) {
		System.out.println("yearIncome 컨트롤러");		
		int month = incomeVO.getMonth();
		int year  = incomeVO.getYear();

		System.out.println("month : " + month + "year : " + year );
		Gson gson = new Gson();
		List<YearIncome> yearList = incomeService.yearIncome(incomeVO);

		System.out.println("yearList.size() : "  + yearList.size());
		return gson.toJson(yearList); 
	}
	
	@ResponseBody
	@RequestMapping(value = "monthIncome", produces = "application/text;charset=UTF-8")
	public String monthIncome(MonthIncome incomeVO,  Model model) {
		System.out.println("monthIncome 컨트롤러");
		
		int month = incomeVO.getMonth();
		int year  = incomeVO.getYear();
		
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, 1);
		int lastday = cal.getActualMaximum(Calendar.DATE);

		incomeVO.setLastday(lastday);
		
		System.out.println("month : " + month + "year : " + year + "lastDay : " + lastday);
		Gson gson = new Gson();
		List<MonthIncome> monthList = incomeService.monthIncome(incomeVO);
		
		for(MonthIncome m : monthList) {
			System.out.println("incomed : " + m.getMonth() + " tot :" + m.getTotm());
		}
		System.out.println("monthList.size() : "  + monthList.size());
		return gson.toJson(monthList); 
	}
}