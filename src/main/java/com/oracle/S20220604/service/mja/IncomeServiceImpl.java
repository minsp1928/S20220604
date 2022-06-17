package com.oracle.S20220604.service.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.mja.IncomeDao;
import com.oracle.S20220604.model.MonthIncome;
import com.oracle.S20220604.model.SellerIncome;
import com.oracle.S20220604.model.YearIncome;

@Service
public class IncomeServiceImpl implements IncomeService {

	@Autowired
	private IncomeDao incomedao;
	
	@Override
	public List<MonthIncome> getIncome() {
		List<MonthIncome>  list = incomedao.getIncome();
		return list;
	}

	@Override
	public List<MonthIncome> monthIncome(MonthIncome incomeVO) {
		List<MonthIncome> monthList = incomedao.monthIncome(incomeVO);
		return monthList;
	}

	@Override
	public List<YearIncome> yearIncome(YearIncome incomeVO) {
		List<YearIncome> yearList = incomedao.yearIncome(incomeVO);
		return yearList;
	}


	@Override
	public List<SellerIncome> incomeList(SellerIncome sellerIncome) {
		List<SellerIncome> list = incomedao.incomeList(sellerIncome);
		return list;
	}

}
