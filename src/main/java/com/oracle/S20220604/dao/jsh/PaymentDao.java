package com.oracle.S20220604.dao.jsh;

import java.util.List;

import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.model.Product;

public interface PaymentDao {

	Member 	BuyerInfo(String user_id);
	int 	InsertPayment(Payment payment);
	Product BuyProductInfo(int pro_num);
	List<Coupon> BuyCoupon(Coupon coupon);
	int Insertorder(MyPageVO mypagevo);
	int BuyProdcutUpdate(int pro_num);
	int BuyUpdateCoupon(Coupon coupon);
	int pay_tot_num(String user_id);
	
}
