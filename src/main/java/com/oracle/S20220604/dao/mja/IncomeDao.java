package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.MonthIncome;
import com.oracle.S20220604.model.SellerIncome;
import com.oracle.S20220604.model.YearIncome;

public interface IncomeDao {

	List<MonthIncome> getIncome();

	List<MonthIncome> monthIncome(MonthIncome incomeVO);

	List<YearIncome> yearIncome(YearIncome incomeVO);

	List<SellerIncome> incomeList(SellerIncome sellerIncome);

}
