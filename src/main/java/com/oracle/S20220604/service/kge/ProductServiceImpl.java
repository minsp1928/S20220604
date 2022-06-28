package com.oracle.S20220604.service.kge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.kge.ProductDao;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;
import com.oracle.S20220604.model.Review;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDao pd;
	

	@Override
	public List<Product> listMyProduct(String user_id) {
		System.out.println("[ProductServiceImpl listMyProduct] Start...");
		List<Product> myProductList = null;
		myProductList = pd.listMyProduct(user_id);
		System.out.println("[ProductServiceImpl listMyProduct] myProductList.size()" + myProductList.size());
		return myProductList;
	}

// 대분류 목록 가져오기
	@Override
	public List<Product_Info> proinfoSelect() {
		System.out.println("[ProductServiceImpl proinfoSelect] Start...");
		List<Product_Info> proinfoList = null;
		proinfoList = pd.listProinfo();
		return proinfoList;
	}
// 중분류 목록 가져오기
	@Override
	public List<Product_Info> type2Select(int pro_type1) {
		System.out.println("[ProductServiceImpl type2Select] Start...");
		List<Product_Info> type2List = null;
		type2List = pd.type2Select(pro_type1);
		System.out.println("[[ProductServiceImpl type2Select type2List.size()]->"+type2List.size());
		return type2List;
	}
//	상품 등록하기
	@Override
	public int productInsert(Product product) {
		System.out.println("[ProductServiceImpl productInsert] Start...");
		int result = 0;
		result = pd.insertProduct(product);
		System.out.println("[ProductServiceImpl productInsert result->]"+result);
		return result;
	}
//	상품 삭제하기(아작스 사용)
	@Override
	public int delete(int pro_num) {
		System.out.println("[ProductServiceImpl delete] Start...");
		int result = 0;
		result = pd.delete(pro_num);
		return result;
	}
//	상품 목록 리스트 - 상품 갯수
	@Override
	public int total(Product product) {
		System.out.println("[ProductServiceImpl total] Start...");
		int totPro = pd.total(product);
		System.out.println("[ProductServiceImpl total] totPro->" + totPro);
		return totPro;
	}
//	상품 목록 리스트 - 상품 목록
	@Override
	public List<Product> listProduct(Product product) {
		System.out.println("[ProductServiceImpl listProduct] Start...");
		List<Product> productList = null;
		productList = pd.listProduct(product);
		System.out.println("[ProductServiceImpl listProduct] productList.size()->" + productList.size());
		return productList;
	}

//	상품 상세 페이지(Product 테이블만 사용)
	@Override
	public Product detail(int pro_num) {
		
		System.out.println("[ProductServiceImpl detail] Start...");
		
		Product product = null;
		product = pd.detail(pro_num);
		
		return product;
	}
//  위시리스트에 추가하기(아작스 사용)
	@Override
	public int inCheck(Product product) {
		System.out.println("[ProductServiceImpl inCheck] Start...");
		int result = 0;
		result = pd.insertCheck(product);
		System.out.println("[ProductServiceImpl inCheck] result->"+result);
		return result;
	}
//  상품 수정하기
	@Override
	public int productUpdate(Product product) {
		System.out.println("[ProductServiceImpl productUpdate] Start...");
		int result = 0;
		result = pd.productUpdate(product);
		return result;
	}
//	장바구니 추가하기(메인 장바구니에 user_id가 있는지 확인하는 logic)
	@Override
	public int basketMain(Product product) {
		System.out.println("[ProductServiceImpl basketMain] Start...");
		int mBasket = pd.basketMain(product);
		return mBasket;
	}
//  장바구니에 추가하기
	@Override
	public int basketInsert(Product product) {
		System.out.println("[ProductServiceImpl basketInsert] Start...");
		int insertBasket = pd.basketInsert(product);
		return insertBasket;
	}
	
// main_basket 만들고, basket에 상품 넣는 로직
	@Override
	public int createPut(Product product) {
		System.out.println("[ProductController createPut] Start...");
		int putCreate = pd.createPut(product);
		System.out.println("[ProductController createPut] putCreate->"+putCreate);
		return putCreate;
	}

// 상품 목록 리스트 - 상품 목록(최신순 정렬)
	@Override
	public List<Product> listProductNewest(Product product) {
		System.out.println("[ProductServiceImpl listProductNewest] Start...");
		List<Product> listProductNewest = null;
		listProductNewest = pd.listProductNewest(product);
		System.out.println("[ProductServiceImpl listProductNewest] listProductNewest.size()->" + listProductNewest.size());
		return listProductNewest;
	}

// 상품 목록 리스트 - 상품 목록(최저가순 정렬)
	@Override
	public List<Product> listProductLowest(Product product) {
		System.out.println("[ProductServiceImpl listProductLowest] Start...");
		List<Product> listProductLowest = null;
		listProductLowest = pd.listProductLowest(product);
		System.out.println("[ProductServiceImpl listProductLowest] listProductLowest.size()->" + listProductLowest.size());
		return listProductLowest;
	}
	
// 상품 목록 리스트 - 상품 목록(최고가순 정렬)
	@Override
	public List<Product> listProductHighest(Product product) {
		System.out.println("[ProductServiceImpl listProductHighest] Start...");
		List<Product> listProductHighest = null;
		listProductHighest = pd.listProductHighest(product);
		System.out.println("[ProductServiceImpl listProductHighest] listProductLowest.size()->" + listProductHighest.size());
		return listProductHighest;
	}

//	reveiw(시환)
	@Override
	public int CountPersonalReview(Review review) {
		System.out.println("ReviewServiceImpl CountPersonalReview ...");
		int CountPersonalReview = 0;
		CountPersonalReview = pd.CountPersonalReview(review);
		
		return CountPersonalReview;
	}
//	reveiw(시환)
	@Override
	public List<Review> SearchforUpdate(Review review) {
		List<Review> SearchforUpdate = null;
		
		SearchforUpdate = pd.SearchforUpdate(review);
		
		return SearchforUpdate;
	}

	@Override
	public List<Review> SearchReview(int pro_num) {
		System.out.println("ReviewServiceImpl SearchReview ...");
		List<Review> SearchReview = null;
		SearchReview = pd.SearchReview(pro_num);
		
		return SearchReview;
	}
	
	@Override
	   public List<String> SearchMbPic(int pro_num) {
	      System.out.println("ReviewServiceImpl SearchMbPic ...");
	      List<String> SearchMbPic = null;
	      SearchMbPic = pd.SearchMbPic(pro_num);
	      
	      
	      return SearchMbPic;
	}
	
	@Override
	public int DeleteReview(Review review) {
		System.out.println("ReviewServiceImpl DeleteReview ...");
		int DeleteReview = 0;
		DeleteReview = pd.DeleteReview(review);
		
		
		return DeleteReview;
	}
	
	
	@Override
	public int ReviewInsert(Review review) {
		int ReviewInsert = 0;
		ReviewInsert = pd.ReviewInsert(review);
		
		return ReviewInsert;
	}
	
	
	@Override
	public int ReviewUpdate(Review review) {
		System.out.println("ReviewServiceImpl ReviewUpdate ...");
		int ReviewUpdate = 0;
		ReviewUpdate = pd.ReviewUpdate(review);
		
		return ReviewUpdate;
	}



//	상품 등록하기(프로시저 사용)
//	@Override
//	public void productVOInsert(ProductVO productVO) {
//		System.out.println("[ProductServiceImpl productVOInsert] Start...");
//		pd.productVOInsert(productVO);
//		
//	} 

//
	@Override
	   public int CountBuy(Review review) {
	      System.out.println("ReviewServiceImpl CountBuy ...");
	      int CountBuy = 0;
	      CountBuy = pd.CountBuy(review);
	      
	      return CountBuy;
	   }

}





















