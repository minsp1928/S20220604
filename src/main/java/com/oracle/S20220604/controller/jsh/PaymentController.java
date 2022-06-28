package com.oracle.S20220604.controller.jsh;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.oracle.S20220604.model.Basket;
import com.oracle.S20220604.model.Coupon;
import com.oracle.S20220604.model.Main_Basket;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.MyPageVO;
import com.oracle.S20220604.model.Payment;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.service.jsh.PaymentService;




@Controller
public class PaymentController {
   private static final Logger logger = LoggerFactory.getLogger(PaymentController.class);
   
   @Autowired
   private PaymentService pts;
   
   
   //결제
   @RequestMapping(value="PaymentPage", method = RequestMethod.POST)
   public String Payment(HttpServletRequest request, Member member, Product product, int pro_num, int quantity, Model model) {
      logger.info("Payment Start list...");
      Coupon coupon = new Coupon();
      List<Product> productList = new ArrayList<Product>();
      LocalDate now = LocalDate.now();
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");     
      String formatedNow = now.format(formatter);      
      String user_id = request.getSession().getAttribute("sessionId").toString();
      //String user_id = "namwoo";
      String to_date = formatedNow;
      List<Integer> quantity_list = new ArrayList<Integer>();
      
      coupon.setUser_id(user_id);
      coupon.setTo_date(to_date);

      
      member = pts.BuyerInfo(user_id);
      product = pts.BuyProductInfo(pro_num);
      productList.add(product); 
      List<Coupon> Coupon = pts.BuyCoupon(coupon);
      int couponCount = Coupon.size();
      int total_price = product.getPro_price() * quantity;
      quantity_list.add(quantity);
      
      model.addAttribute("basketNum", 0);
      model.addAttribute("productNum", pro_num);
      model.addAttribute("couponCount", couponCount);
      model.addAttribute("Coupon", Coupon);
      model.addAttribute("productQuantity", quantity_list);
      model.addAttribute("productList", productList);
      model.addAttribute("total_price", total_price);
      model.addAttribute("member", member);   
      
      return "productJsh/Payment";
   }
   
   //결제완료시 정보 입력
   @RequestMapping(value="InsertPaymentInfo", method = RequestMethod.POST)
   public String PaymentInsert(HttpServletRequest request, Payment payment, Coupon coupon, MyPageVO mypagevo, Basket basket, Model model){
      System.out.println("InsertPaymentInfo start..");
      
      String user_id = request.getSession().getAttribute("sessionId").toString();
      //String user_id = "namwoo";
      
      payment.setUser_id(user_id);
      if(coupon.getCp_num() > 0) {
         coupon.setUser_id(user_id);
         pts.BuyUpdateCoupon(coupon);
      } 
      int result = pts.InsertPayment(payment);
      
      int pay_tot_num = pts.pay_tot_num(user_id);
      
      mypagevo.setPay_tot_num(pay_tot_num);
      
      for(int i=0; i <mypagevo.getPro_num_list().size(); i++) {
      mypagevo.setQuantity(mypagevo.getQuantity_list().get(i));
      mypagevo.setPro_num(mypagevo.getPro_num_list().get(i));
        
      pts.Insertorder(mypagevo);
        
        
        }
      
      for(int i=0; i <basket.getPro_num_list().size(); i++) {
          Basket local_basket = new Basket() ;
         local_basket.setBasket_num(basket.getBasket_num());
         local_basket.setPro_num(basket.getPro_num_list().get(i));
         
         if(local_basket.getBasket_num() > 0) {
            int pro_num = 0;
            pro_num = local_basket.getPro_num();
            pts.BuyProdcutUpdate(pro_num);
            pts.DeletBasket(local_basket);
               
            }
         }   
      
      return "productJsh/paymentSuccess";   
   }
   
   //장바구니
   @GetMapping(value = "ShoppingBasketPage")
   public String ShoppingBasket(HttpServletRequest request, Model model) {
      logger.info("ShoppingBasket Start list...");
      Main_Basket main_Basket;
      int basketCount = 0;
      List<Basket> basket = new ArrayList<Basket>();
      int basket_num = 0;
      String user_id = request.getSession().getAttribute("sessionId").toString();
      /* String user_id = "namwoo"; */
      
      main_Basket = pts.selectBasket(user_id);
      
      if(main_Basket == null) { 
         basketCount = 0;
      }else {
         basket_num = main_Basket.getBasket_num();
         basket = pts.listBasketInfo(basket_num);
         basketCount = basket.size();
      }
      
      model.addAttribute("basketCount", basketCount);
      model.addAttribute("basket", basket);
      model.addAttribute("basket_num", basket_num);
      
      return "productJsh/Shoppingbasket";
   }
   
   //장바구니 결제 이동
   @RequestMapping(value="BasketFuction", method = RequestMethod.POST)
   public String BasketFuction(HttpServletRequest request, Basket basket, Model model){
      System.out.println("BasketFuction start..");
      logger.info(basket.toString());
      Member member;
      Coupon coupon = new Coupon();
      List<Product> productList = new ArrayList<Product>();
      LocalDate now = LocalDate.now();
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");     
      String formatedNow = now.format(formatter);      
      
      //String user_id = "namwoo";
      String user_id = request.getSession().getAttribute("sessionId").toString();
      String to_date = formatedNow;
      
      coupon.setUser_id(user_id);
      coupon.setTo_date(to_date);

      
      member = pts.BuyerInfo(user_id); 
      List<Coupon> Coupon = pts.BuyCoupon(coupon);
      int couponCount = Coupon.size();
      
      for(int i=0; i <basket.getPro_num_list().size(); i++) {
          Basket local_basket = new Basket() ;
         local_basket.setPro_num(basket.getPro_num_list().get(i));
         
         int pro_num = 0;
         pro_num = basket.getPro_num_list().get(i);
         
         productList.add(pts.BuyProductInfo(pro_num)); 
         
      }
      
   
      
      model.addAttribute("basketNum", basket.getBasket_num());
      model.addAttribute("productQuantity", basket.getQuantity_list());
      model.addAttribute("productNum", basket.getPro_num_list());
      model.addAttribute("productList", productList);
      model.addAttribute("total_price", basket.getTotalPrice());
      model.addAttribute("couponCount", couponCount);
      model.addAttribute("Coupon", Coupon);
      model.addAttribute("member", member);
      
      return "productJsh/Payment";
   }
   
   @RequestMapping(value = "DeleteBasket", method = RequestMethod.POST)
   public String DeleteBasket(Basket basket, Model model) {
      
      pts.DeletBasket(basket);
      
      return "redirect:/ShoppingBasketPage";
   }
   
}