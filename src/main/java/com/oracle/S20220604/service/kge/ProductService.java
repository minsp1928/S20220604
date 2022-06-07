package com.oracle.S20220604.service.kge;

import java.util.List;

import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;

public interface ProductService {

	List<Product>       listMyProduct(String user_id);
	List<Product_Info>  proinfoSelect();
	List<Product_Info>  type2Select(int pro_type1);


//	int              myProductTotal();
//	List<Product>    listProduct(Product product);

}
