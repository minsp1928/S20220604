package com.oracle.S20220604.dao.jsh;



import java.util.List;

import com.oracle.S20220604.model.Basket;
import com.oracle.S20220604.model.Main_Basket;

public interface ShoppingbasketDao {

	List<Basket> listBasketInfo(int pro_num);
	Main_Basket selectBasket(String user_id);
	int DeletBasket(Basket basket);
	int BasketCount(int basket_num);
	int DeletMainBasket(int basket_num);
	
}
