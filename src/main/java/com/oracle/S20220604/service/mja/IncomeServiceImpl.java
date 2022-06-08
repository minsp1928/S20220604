package com.oracle.S20220604.service.mja;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.mja.IncomeDao;
import com.oracle.S20220604.model.IncomeVO;

@Service
public class IncomeServiceImpl implements IncomeService {

	@Autowired
	private IncomeDao incomedao;
	
	@Override
	public List<IncomeVO> getIncome() {
		List<IncomeVO>  list = incomedao.getIncome();
		return list;
	}

	@Override
	public List<IncomeVO> monthIncome(IncomeVO incomeVO) {
		List<IncomeVO> monthList = incomedao.monthIncome(incomeVO);
		return monthList;
	}

	@Override
	public List<IncomeVO> yearIncome(IncomeVO incomeVO) {
		List<IncomeVO> yearList = incomedao.yearIncome(incomeVO);
		return yearList;
	}

}
