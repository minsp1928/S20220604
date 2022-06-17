package com.oracle.S20220604.dao.kge;

import java.util.List;

import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;

public interface ProductDao {

	List<Product>        listMyProduct(String user_id);
	List<Product_Info>   listProinfo();
	List<Product_Info>    type2Select(int pro_type1);

//	int              myProductTotal();
//	List<Product>    listProduct(Product product);

}
