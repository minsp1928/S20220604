package com.oracle.S20220604.service.kge;

import java.util.List;

import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;
import com.oracle.S20220604.model.Review;

public interface ProductService {

	List<Product>       listMyProduct(String user_id);
	List<Product_Info>  proinfoSelect();
	List<Product_Info>  type2Select(int pro_type1);
	int                 productInsert(Product product);
	int                 delete(int pro_num);
	int                 total(Product product);
	List<Product>       listProduct(Product product);
	Product             detail(int pro_num);
//	void                productVOInsert(ProductVO productVO);  //상품 등록(프로시저 사용)
	int                 inCheck(Product product);
	int                 productUpdate(Product product);
	int                 basketMain(Product product);
	int                 basketInsert(Product product);
	int                 createPut(Product product);
	List<Product>       listProductNewest(Product product);
	List<Product>       listProductLowest(Product product);
	List<Product>       listProductHighest(Product product);
	int                 CountPersonalReview(Review review); // review(시환)
	List<Review>        SearchforUpdate(Review review); // review(시환)
	List<Review>        SearchReview(int pro_num); // review(시환)
	List<String>        SearchMbPic(int pro_num); // review(시환)
	int                 DeleteReview(Review review); // review(시환)
	int                 ReviewInsert(Review review); // review(시환)
	int                 ReviewUpdate(Review review); // review(시환)
	int CountBuy		(Review review);

}
