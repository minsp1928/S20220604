package com.oracle.S20220604.service.mja;

import java.util.List;

import com.oracle.S20220604.model.IncomeVO;

public interface IncomeService {

	List<IncomeVO> getIncome();

	List<IncomeVO> monthIncome(IncomeVO incomeVO);

	List<IncomeVO> yearIncome(IncomeVO incomeVO);

}
