package com.oracle.S20220604.service.jsh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.jsh.PaymentDao;
import com.oracle.S20220604.dao.jsh.ShoppingbasketDao;
import com.oracle.S20220604.model.Basket;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Main_Basket;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.model.Product;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao pd;
	
	@Autowired
	private ShoppingbasketDao sb;

	@Override
	public Member BuyerInfo(String user_id) {
		System.out.println("PaymentServiceImpl BuyerInfo ...");
		Member member = null;
		member = pd.BuyerInfo(user_id);
		
		return member;
	}
	
	@Override
	public int InsertPayment(Payment payment) {
		int result = 0;
		System.out.println("PaymentServiceImpl InsertPayment Start..." );
		result = pd.InsertPayment(payment);
		return result;		
	}
	
	@Override
	public Product BuyProductInfo(int pro_num) {
		System.out.println("PaymentServiceImpl BuyProductInfo ...");
		Product productboard = null;
		productboard = pd.BuyProductInfo(pro_num);
		
		return productboard;
	}
	
	@Override
	public List<Coupon> BuyCoupon(Coupon coupon) {
		System.out.println("PaymentServiceImpl BuyCoupon ...");
		List<Coupon> BuyCoupon = null;
		BuyCoupon = pd.BuyCoupon(coupon);
		
		
		return BuyCoupon;
	}
	
	@Override
	public List<Basket> listBasketInfo(int pro_num) {
		System.out.println("PaymentServiceImpl listBasketInfo Start...");
		List<Basket> BasketList = null;
		
		BasketList = sb.listBasketInfo(pro_num);
		
		return BasketList;
	}
	
	@Override
	public Main_Basket selectBasket(String user_id) {
		System.out.println("PaymentServiceImpl selectBasket ...");
		Main_Basket main_Basket = null;
		main_Basket = sb.selectBasket(user_id);
		
		return main_Basket;
	}
	
	@Override 
	public int DeletBasket(Basket basket) {
		System.out.println("PaymentServiceImpl DeletBasket ...");
		int deletBasket = 0;
		deletBasket = sb.DeletBasket(basket);
		
		return deletBasket;
	}
	
	@Override
	public int BasketCount(int basket_num) {
		System.out.println("PaymentServiceImpl BasketCount ...");
		int basketCount = 0;
		
		basketCount = sb.BasketCount(basket_num);
		
		return basketCount;
		
	}
	
	@Override
	public int DeletMainBasket(int basket_num) {
		System.out.println("PaymentServiceImpl DeletMainBasket ...");
		
		int deletMainBasket = 0;
		
		deletMainBasket = sb.DeletMainBasket(basket_num);
		
		return deletMainBasket;
	}
	
	@Override
	public int Insertorder(MyPageVO mypagevo) {
		int result = 0;
		System.out.println("PaymentServiceImpl Insertorder Start..." );
		result = pd.Insertorder(mypagevo);
		return result;		
	}
	
	@Override
	public int BuyUpdateCoupon(Coupon coupon) {
		int BuyUpdateCoupon = 0;
		System.out.println("PaymentServiceImpl BuyUpdateCoupon Start..." );
		BuyUpdateCoupon = pd.BuyUpdateCoupon(coupon);
		return BuyUpdateCoupon;
	}
	
	@Override
	public int BuyProdcutUpdate(int pro_num) {
		int BuyProdcutUpdate = 0;
		System.out.println("PaymentServiceImpl BuyProdcutUpdate Start..." );
		BuyProdcutUpdate = pd.BuyProdcutUpdate(pro_num);
		return BuyProdcutUpdate;
	}
	
	@Override
	public int pay_tot_num(String user_id) {
		System.out.println("PaymentServiceImpl Start pay_tot_num..." );
		int pay_tot_num = pd.pay_tot_num(user_id);

		return pay_tot_num;
	}

}
