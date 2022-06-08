package com.oracle.S20220604.dao.mja;

import java.util.List;

import com.oracle.S20220604.model.IncomeVO;

public interface IncomeDao {

	List<IncomeVO> getIncome();

	List<IncomeVO> monthIncome(IncomeVO incomeVO);

	List<IncomeVO> yearIncome(IncomeVO incomeVO);

}
