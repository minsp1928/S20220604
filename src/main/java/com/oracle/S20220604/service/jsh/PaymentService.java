package com.oracle.S20220604.service.jsh;

import java.util.List;

import com.oracle.S20220604.model.Basket;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Main_Basket;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.model.Product;

public interface PaymentService {

	Member BuyerInfo(String user_id);
	int InsertPayment(Payment payment);
	Product BuyProductInfo(int pro_num);
	List<Coupon> BuyCoupon(Coupon coupon);
	List<Basket> listBasketInfo(int pro_num);
	Main_Basket selectBasket(String user_id);
	int DeletBasket(Basket basket);
	int BasketCount(int basket_num);
	int DeletMainBasket(int basket_num);
	int Insertorder(MyPageVO mypagevo);
	int BuyUpdateCoupon(Coupon coupon);
	int BuyProdcutUpdate(int pro_num);
	int pay_tot_num(String user_id);

}
