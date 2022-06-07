package com.oracle.S20220604.dao.pkw;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderListDaoImpl implements OrderListDao {
	@Autowired
	private SqlSession session;	
	
	@Override
	public int total() {
		int tot = 0;
		System.out.println("OrderListDaoImpl Start total...");
		try {
			tot = session.selectOne("pkwOrderListTotal");
			System.out.println("OrderListDaoImpl total tot-> " + tot);
		} catch (Exception e) {
			System.out.println("OrderListDaoImpl total Exception->" + e.getMessage());
		}
	
		return tot;
	}

}
