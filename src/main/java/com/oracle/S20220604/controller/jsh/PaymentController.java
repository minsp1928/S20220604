package com.oracle.S20220604.controller.jsh;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import com.oracle.S20220604.model.Basket;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Main_Basket;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Review;
import com.oracle.S20220604.service.jsh.PaymentService;
import com.oracle.S20220604.service.jsh.ReviewServiceImpl;




@Controller
public class PaymentController {
	private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService ps;
	
	@Autowired
	private	ReviewServiceImpl rs;
	
	//결제
	@RequestMapping(value="PaymentPage")
	public String Payment(int pro_num, int quantity, Model model) {
		logger.info("Payment Start list...");
		Member member;
		Product product;
		Coupon coupon = new Coupon();
		List<Product> productList = new ArrayList<Product>();
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");     
		String formatedNow = now.format(formatter);		
		
		
		String user_id = "admin";
		String to_date = formatedNow;
		
		coupon.setUser_id(user_id);
		coupon.setTo_date(to_date);

		
		member = ps.BuyerInfo(user_id);
		product = ps.BuyProductInfo(pro_num);
		productList.add(product); 
		List<Coupon> Coupon = ps.BuyCoupon(coupon);
		int couponCount = Coupon.size();
		int total_price = product.getPro_price() * quantity;
		
		model.addAttribute("couponCount", couponCount);
		model.addAttribute("Coupon", Coupon);
		model.addAttribute("productQuantity", quantity);
		model.addAttribute("productList", productList);
		model.addAttribute("total_price", total_price);
		model.addAttribute("member", member);	
		
		return "Payment";
	}
	
	//결제완료시 정보 입력
	@RequestMapping(value="InsertPaymentInfo", method = RequestMethod.POST)
	public String PaymentInsert(Payment pay, Model model){
		System.out.println("InsertPaymentInfo start..");
		System.out.println("InsertPaymentInfo pay.getPay_date()->"+pay.getPay_date());
		logger.info(pay.toString());
		int result = ps.InsertPayment(pay);
		
		return "paymentSuccess";
	}
	
	//결제완료시 정보 입력
	@RequestMapping(value="InsertOrderInfo", method = RequestMethod.POST)
	public String PaymentInsert(MyPageVO mypagevo, Model model){
		System.out.println("InsertOrderInfo start..");
		logger.info(mypagevo.toString());
		int result = ps.Insertorder(mypagevo);
		
		return "paymentSuccess";
	}
	
	//장바구니
	@GetMapping(value = "ShoppingBasketPage")
	public String ShoppingBasket(String user_id, Model model) {
		logger.info("ShoppingBasket Start list...");
		Main_Basket main_Basket;
		
		
		user_id = "namwoo"; 
		
		main_Basket = ps.selectBasket(user_id);
		
		int basket_num = main_Basket.getBasket_num();
		
		List<Basket> basket = ps.listBasketInfo(basket_num);
		
		int basketCount = basket.size();
		
		model.addAttribute("basketCount", basketCount);
		model.addAttribute("basket", basket);
		model.addAttribute("basket_num", basket_num);
		
		return "Shoppingbasket";
	}
	
	//장바구니 결제 이동
	@RequestMapping(value="BasketFuction", method = RequestMethod.POST)
	public String BasketFuction(Basket basket, Model model){
		System.out.println("BasketFuction start..");
		logger.info(basket.toString());
		Member member;
		Coupon coupon = new Coupon();
		List<Product> productList = new ArrayList<Product>();
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");     
		String formatedNow = now.format(formatter);		
		
		
		String user_id = "admin";
		String to_date = formatedNow;
		
		coupon.setUser_id(user_id);
		coupon.setTo_date(to_date);

		
		member = ps.BuyerInfo(user_id); 
		List<Coupon> Coupon = ps.BuyCoupon(coupon);
		int couponCount = Coupon.size();
		
		for(int i=0; i <basket.getPro_num_list().size(); i++) {
		    Basket local_basket = new Basket() ;
			/* local_basket.setBasket_num(basket.getBasket_num()); */
			local_basket.setPro_num(basket.getPro_num_list().get(i));
			/* ps.DeletBasket(local_basket); */
			
			int pro_num = 0;
			pro_num = basket.getPro_num_list().get(i);
			
			productList.add(ps.BuyProductInfo(pro_num)); 
			
		}
		
		
		model.addAttribute("productQuantity", basket.getQuantity_list());
		model.addAttribute("productList", productList);
		model.addAttribute("total_price", basket.getTotalPrice());
		model.addAttribute("couponCount", couponCount);
		model.addAttribute("Coupon", Coupon);
		model.addAttribute("member", member);
		
		/*int a = basket.getBasket_num();
		int basket_count = ps.BasketCount(a);
		
		if(basket_count == 0) {
			 int deleteMain = ps.DeletMainBasket(a);
		} */
		
		return "Payment";
	}
	//리뷰 페이지
	@GetMapping(value = "ReviewPage")
	public String Review(String AAA, Model model) {
		
		int pro_num = 1001;
		String user_id = "namwoo";
		
		List<Review> searchReview = rs.SearchReview(pro_num);
		/*
		 * Review local_review = new Review(); searchReview.get for(int i=0; i
		 * <searchReview.size(); i++) { local_review.setUser_pic(searchReview.get); }
		 */
		
		int reviewCount = searchReview.size();
		
		/* model.addAttribute("user_pic", user_pic); */
		model.addAttribute("pro_num", pro_num);
		model.addAttribute("user_id", user_id);
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("searchReview", searchReview);
		
		return "Review";		
	}
	
	//리뷰 삭제
	@RequestMapping(value="DeleteReview", method = RequestMethod.POST)
	public String DeleteReview(Review review, Model model){
		System.out.println("DeleteReview start..");
		
		List<Review> DeleteReview = rs.DeleteReview(review);
		
		return "redirect:ReviewPage";
	}
	
}
