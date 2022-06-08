package com.oracle.S20220604.service.pkw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.pkw.OrderListDao;

@Service
public class OrderListServiceImpl implements OrderListService {
	@Autowired
	private OrderListDao old;
	
	@Override
	public int total() {
		System.out.println("OrderListServiceImpl Start total...");
		int totCnt = old.total();
		System.out.println("OrderListServiceImpl total totCnt-> " + totCnt);
		
		return totCnt;
	}

}
