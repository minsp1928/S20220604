package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.IncomeVO;

@Repository
public class ImcomeDaoImpl implements IncomeDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<IncomeVO> getIncome() {
		
		List<IncomeVO> list = null;
		try {
			list = session.selectList("mjIncome");
		} catch (Exception e) {
			System.out.println("income err : " + e.getMessage());
		}
		return list;
	}

	@Override
	public List<IncomeVO> monthIncome(IncomeVO incomeVO) {
		List<IncomeVO> monthList = null;
		try {
			monthList = session.selectList("mjMonthIncome", incomeVO);
		} catch (Exception e) {
			System.out.println("monthIncome err : " + e.getMessage());
		}
		return monthList;
	}

	@Override
	public List<IncomeVO> yearIncome(IncomeVO incomeVO) {
		List<IncomeVO> yearList = null;
		try {
			yearList = session.selectList("mjYearIncome", incomeVO);
		} catch (Exception e) {
			System.out.println("YearIncome err : " + e.getMessage());
		}
		return yearList;
	}
	
	
}
