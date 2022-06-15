package com.oracle.S20220604.dao.mja;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.MonthIncome;
import com.oracle.S20220604.model.SellerIncome;
import com.oracle.S20220604.model.YearIncome;

@Repository
public class ImcomeDaoImpl implements IncomeDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<MonthIncome> getIncome() {
		
		List<MonthIncome> list = null;
		try {
			list = session.selectList("mjIncome");
		} catch (Exception e) {
			System.out.println("income err : " + e.getMessage());
		}
		return list;
	}

	@Override
	public List<MonthIncome> monthIncome(MonthIncome incomeVO) {
		List<MonthIncome> monthList = null;
		try {
			monthList = session.selectList("mjMonthIncome", incomeVO);
		} catch (Exception e) {
			System.out.println("monthIncome err : " + e.getMessage());
		}
		return monthList;
	}

	@Override
	public List<YearIncome> yearIncome(YearIncome incomeVO) {
		List<YearIncome> yearList = null;
		try {
			yearList = session.selectList("mjYearIncome", incomeVO);
		} catch (Exception e) {
			System.out.println("YearIncome err : " + e.getMessage());
		}
		return yearList;
	}

	@Override
	public List<SellerIncome> incomeList(SellerIncome sellerIncome) {
		List<SellerIncome> list  = null;
		try {
			list = session.selectList("mjIncomList", sellerIncome);
		} catch (Exception e) {
			System.out.println("incomeList: " + e.getMessage());
		}
		System.out.println("incomeList 끝");
		System.out.println("incomeList size" + list.size());
		return list;
	}
	
	
}
