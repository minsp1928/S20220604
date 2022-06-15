package com.oracle.S20220604.dao.jsh;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Basket;
import com.oracle.S20220604.model.Main_Basket;
import com.oracle.S20220604.model.Payment;

@Repository
public class ShoppingbasketDaoImpl implements ShoppingbasketDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Basket> listBasketInfo(int pro_num) {
		System.out.println("ShoppingBasketDaoImpl listBasketInfo Start...");
		 List<Basket> BasketList = null;
		try {
			BasketList	= session.selectList("jshBaksetProduct", pro_num);
		} catch (Exception e) {
			System.out.println("ShoppingBasketDaoImpl listBasketInfo Exception->"+e.getMessage());
		}
		return BasketList;
	}
	
	@Override
	public Main_Basket selectBasket(String user_id) {
		System.out.println("ShoppingBasketDaoImpl selectBasket Start...");
		
		Main_Basket main_Basket = new Main_Basket();
		try {
			main_Basket = session.selectOne("jshBasket", user_id);
		} catch (Exception e) {
			System.out.println("ShoppingBasketDaoImpl selectBasket Exception->"+e.getMessage());
		}
		
		return main_Basket;
	}
	
	@Override
	public int DeletBasket(Basket basket) {
		System.out.println("ShoppingBasketDaoImpl DeletBasket Start...");
		 int deletBasket = 0;
		 try {
			 deletBasket	= session.delete("jshDeletBasket", basket);
			} catch (Exception e) {
				System.out.println("ShoppingBasketDaoImpl DeletBasket Exception->"+e.getMessage());
			}
			return deletBasket;
	}
	
	@Override
	public int BasketCount(int basket_num) {
		int basketCount = 0;
		System.out.println("ShoppingBasketDaoImpl BasketCount Start ..." );
		try {
			basketCount = session.selectOne("jshBasketCount",basket_num);
		} catch (Exception e) {
			System.out.println("ShoppingBasketDaoImpl BasketCount Exception->"+e.getMessage());
		}
		return basketCount;
	}
	
	@Override
	public int DeletMainBasket(int basket_num) {
		int deletMainBasket = 0;
		System.out.println("ShoppingBasketDaoImpl DeletMainBasket Start ..." );
		try {
			deletMainBasket = session.delete("jshDeletMainBasket",basket_num);
		} catch (Exception e) {
			System.out.println("ShoppingBasketDaoImpl DeletMainBasket Exception->"+e.getMessage());
		}
		return deletMainBasket;
	}
	
	
	
	
}
