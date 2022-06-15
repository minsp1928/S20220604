package com.oracle.S20220604.dao.jsh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.model.Product;


@Repository
public class PaymentDaoImpl implements PaymentDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public Member BuyerInfo(String user_id) {
		System.out.println("PaymentDaoImpl BuyerInfo Start ..." );
		Member member = new Member();
		try {
			member = session.selectOne("jshBuyerInfo", user_id);
		} catch (Exception e) {
			System.out.println("PaymentImpl BuyerInfo Exception->"+e.getMessage());
		}
		return member;	
	}
	
	@Override
	public int InsertPayment(Payment payment) {
		int result = 0;
		System.out.println("PaymentDaoImpl InsertPayment Start ..." );
		try {
			System.out.println("");
			result = session.insert("jshInsertPayment",payment);
		} catch (Exception e) {
			System.out.println("PaymentDaoImpl InsertPayments Exception->"+e.getMessage());
		}
		return result;
	}
	
	@Override
	public Product BuyProductInfo(int pro_num) {
		System.out.println("PaymentDaoImpl BuyProductInfo Start ..." );
		Product productboard = new Product();
		try {
			productboard = session.selectOne("jshBuyProductSearch", pro_num);
		} catch (Exception e) {
			System.out.println("PaymentImpl BuyProductInfo Exception->"+e.getMessage());
		}
		return productboard;	
	}
	
	@Override
	public List<Coupon> BuyCoupon(Coupon coupon) {
		List<Coupon> BuyCoupon = null;
		System.out.println("PaymentDaoImpl BuyCoupon Start ..." );
		/*
		 * System.out.println("EmpDaoImpl listEmpKeyword emp.getSearch()-->"+emp.
		 * getSearch() );
		 * System.out.println("EmpDaoImpl listEmpKeyword emp.getKeyword()-->"+emp.
		 * getKeyword() ); if (emp.getKeyword() == null) emp.setKeyword("%");
		 */
		
		try {
			//  keyword검색
			//  Naming Rule                       Map ID         parameter
			BuyCoupon = session.selectList("jshBuyCoupon", coupon);
		} catch (Exception e) {
			System.out.println("PaymentDaoImpl BuyCoupon Exception->"+e.getMessage());
		}
		return BuyCoupon;
	}
		
	@Override
	public int Insertorder(MyPageVO mypagevo) {
		int result = 0;
		System.out.println("PaymentDaoImpl Insertorder Start ..." );
		try {
			System.out.println("");
			result = session.insert("jshInsertorder", mypagevo);
		} catch (Exception e) {
			System.out.println("PaymentDaoImpl Insertorder Exception->"+e.getMessage());
		}
		return result;
	}
}
