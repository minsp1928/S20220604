package com.oracle.S20220604.dao.kge;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;
import com.oracle.S20220604.model.Review;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	@Autowired
	private SqlSession session;


// 내 상품 목록 
	@Override
	public List<Product> listMyProduct(String user_id) {
		System.out.println("[ProductDaoImpl listMyProduct] Start...");
		List<Product> myProductList = null;
		try {
			myProductList = session.selectList("geProductMylist", user_id);
			System.out.println("[ProductDaoImpl listMyProduct] myProductList.size()->" + myProductList.size());
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl listMyProduct Exception->" + e.getMessage());
		}
		return myProductList;
	}

// 대분류 갖고 오기
	@Override
	public List<Product_Info> listProinfo() {
		System.out.println("[ProductDaoImpl listProinfo] Start...");
		List<Product_Info> proinfoList = null;
		try {
			proinfoList = session.selectList("geProinfoListAll");
			System.out.println("[ProductDaoImpl listProinfo proinfoList.size()->]"+proinfoList.size());
		} catch(Exception e) {
			System.out.println("[ProductDaoImpl listProinfo] Exception->"+e.getMessage());
		}
		return proinfoList;
	}
// 중분류 목록 가져오기
	@Override
	public List<Product_Info> type2Select(int pro_type1) {
		System.out.println("[ProductDaoImpl type2Select] Start...");
		List<Product_Info> typeList = null;
		typeList = session.selectList("geProinfoList2All", pro_type1);
		System.out.println("[ProductDaoImpl type2Select] typeList.size()->"+typeList.size());
		return typeList;
	}
// 상품 등록하기
	@Override
	public int insertProduct(Product product) {
		System.out.println("[ProductDaoImpl insertProduct] Start...");
		int result = 0;
		try {
			result = session.insert("geProductInsert", product);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl insertProduct]"+e.getMessage());
		}
		return result;
	}
	
//	상품 삭제하기(아작스 사용)
	@Override
	public int delete(int pro_num) {
		System.out.println("[ProductDaoImpl delete] Start...");
		int result = 0;
		try {
			// 좋아요 체크 테이블에서 삭제
//			result = session.delete("geProductDelete", pro_num);
//			// 후기 테이블에서 삭제
//			result = session.delete("geProductDelete", pro_num);
//			// 결제 리스트 테이블에서 삭제
//			result = session.delete("geProductDelete", pro_num);
//			// 부모라서 맨 나중에 삭제
			result = session.update("geProductDelete", pro_num);
			System.out.println("[ProductDaoImpl delete] result->"+result);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl delete] Exception->"+e.getMessage());
		}
		return result;
	}
	
//	상품 목록 리스트 - 상품 갯수
	@Override
	public int total(Product product) {
		System.out.println("[ProductDaoImpl total] Start...");
		int tot = 0;
		try {
			tot = session.selectOne("kgeProductTotal", product);
			System.out.println("[ProductDaoImpl total] tot->"+tot);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl total] Exception->"+e.getMessage());
		}
		return tot;
	}
	
//	상품 목록 리스트 - 상품 목록
	@Override
	public List<Product> listProduct(Product product) {
		System.out.println("[ProductDaoImpl listProduct] Start...");
		List<Product> productList = null;
		try { 
			productList = session.selectList("geProductListBypro_type1", product);
			System.out.println("[ProductDaoImpl listProduct] productList.size()->"+productList.size());
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl listProduct] Exception->" + e.getMessage());
		}
		return productList;
	}

//	상품 상세 페이지(Product 테이블만 사용)
	@Override
	public Product detail(int pro_num) {
		
		System.out.println("[ProductDaoImpl detail] Start...");
		System.out.println("ProductDaoImpl detail pro_num : "+ pro_num);
		Product product = new Product();
		try {
			product = session.selectOne("geProductDetail", pro_num);
			System.out.println("ProductDaoImpl detail after  product.getPro_pic() : "+ product.getPro_pic());
			
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl listProduct] Exception->" + e.getMessage());
		}
		return product;
	}
//	상품 등록하기(프로시저 사용)
//	@Override
//	public void productVOInsert(ProductVO productVO) {
//		System.out.println("[ProductDaoImpl productVOInsert] Start...");
//		session.selectOne("geProcProductInsert", productVO);
//	}

	@Override
	public int insertCheck(Product product) {
		System.out.println("[ProductDaoImpl insertCheck] Start...");
		int result = 0;
		try {
			result = session.insert("goProdcutCheckInsert", product);
			System.out.println("[ProductDaoImpl insertCheck] result->"+result);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl insertCheck Exception->]"+e.getMessage());
		}
		return result;
	}

	@Override
	public int productUpdate(Product product) {
		System.out.println("[ProductDaoImpl productUpdate] Start...");
		int result = 0;
		try {
			result = session.update("geProductUpdate", product);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl insertCheck Exception->]"+e.getMessage());
		}
		return result;
	}
//	장바구니 추가하기(메인 장바구니에 user_id가 있는지 확인하는 logic)
	@Override
	public int basketMain(Product product) {
		System.out.println("[ProductDaoImpl basketMain] Start...");
		int result = 0;
		try {
			result = session.selectOne("geProductBaskectCheck", product);
			System.out.println("[ProductDaoImpl basketMain] result->"+result);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl basketMain Exception->]"+e.getMessage());
		}
		return result;
	}

	@Override
	public int basketInsert(Product product) {
		System.out.println("[ProductDaoImpl basketInsert] Start...");
		int result = 0;
		try {
			result = session.insert("geProductInsertBasket", product);
			System.out.println("[ProductDaoImpl basketInsert] result ->"+result);
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl basketInsert Exception->]"+e.getMessage());
		}
		return result;
	}

	@Override
	public int createPut(Product product) {
		System.out.println("[ProductDaoImpl createPut] Start...");
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		try {
			result = session.insert("geProductMainBasketInsert", product);
			if (result > 0) {
				// int basket_num = session.select로 검색문 해서 값 뽑아오고
				// if 써서 basket_num > 0 일때 insert 동작
				// product.setBasket_num(basket_num);
				//
				result2 = session.selectOne("geProductBasket", product);
				if (result2 > 0) {
					product.setBasket_num(result2);
					result3 = session.insert("geProductBasketInsert", product);
				}
			}
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl createPut Exception->]"+e.getMessage());
		}
		System.out.println("[ProductDaoImpl createPut] result->"+result);
		return result;
		//1
	}

// 상품 목록 리스트 - 상품 목록(최신순 정렬)
	@Override
	public List<Product> listProductNewest(Product product) {
		System.out.println("[ProductDaoImpl listProduct] Start...");
		List<Product> listProductNewest = null;
		try { 
			listProductNewest = session.selectList("geProductListNewest", product);
			System.out.println("[ProductDaoImpl listProductNewest] listProductNewest.size()->"+listProductNewest.size());
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl listProductNewest] Exception->" + e.getMessage());
		}
		return listProductNewest;
	}

	@Override
	public List<Product> listProductLowest(Product product) {
		System.out.println("[ProductDaoImpl listProductLowest] Start...");
		List<Product> listProductLowest = null;
		try { 
			listProductLowest = session.selectList("geProductListLowest", product);
			System.out.println("[ProductDaoImpl listProductLowest] listProductLowest.size()->"+listProductLowest.size());
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl listProductLowest] Exception->" + e.getMessage());
		}
		return listProductLowest;
	}

	@Override
	public List<Product> listProductHighest(Product product) {
		System.out.println("[ProductDaoImpl listProductHighest] Start...");
		List<Product> listProductHighest = null;
		try { 
			listProductHighest = session.selectList("geProductListHighest", product);
			System.out.println("[ProductDaoImpl listProductgeProductListHighestHighest] listProductLowest.size()->"+listProductHighest.size());
		} catch (Exception e) {
			System.out.println("[ProductDaoImpl listProductHighest] Exception->" + e.getMessage());
		}
		return listProductHighest;
	}
	
//	review(시환)
	@Override
	public List<Review> SearchReview(int pro_num) {
		System.out.println("pro_num" + pro_num);
		List<Review> SearchReview = null;
		System.out.println("ReviewDaoImpl SearchReview Start ..." );
		
		try {
			SearchReview = session.selectList("jshSearchReview", pro_num);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl SearchReview Exception->"+e.getMessage());
		}
		return SearchReview;
		
	}
	
	@Override
	   public List<String> SearchMbPic(int pro_num) {
	      List<String> SearchMbPic = null;
	      System.out.println("ReviewDaoImpl SearchMbPic Start ..." );
	      
	      try {
	         SearchMbPic = session.selectList("jshSearchMbPic", pro_num);
	      } catch (Exception e) {
	         System.out.println("ReviewDaoImpl SearchMbPic Exception->"+e.getMessage());
	      }
	      return SearchMbPic;
	      
	   }
	
	@Override 
	public  int DeleteReview(Review review) {
		System.out.println("review" + review);
		int DeleteReview = 0;
		System.out.println("ReviewDaoImpl DeleteReview Start ..." );
		
		try {
			DeleteReview = session.delete("jshReviewDelete", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl DeleteReview Exception->"+e.getMessage());
		}
		return DeleteReview;
		
	}
	
	@Override
	public int CountPersonalReview(Review review) {
		
		int CountPersonalReview = 0;
		System.out.println("ReviewDaoImpl CountPersonalReview Start ..." );
		try {
			CountPersonalReview = session.selectOne("jshCountPersonalReview", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl CountPersonalReview Exception->"+e.getMessage());
		}
		return CountPersonalReview;
		
	}
	
	@Override
	public int ReviewInsert(Review review) {
		int ReviewInsert = 0;
		System.out.println("ReviewDaoImpl ReviewInsert Start ..." );
		try {
			ReviewInsert = session.insert("jshReviewInsert", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl ReviewInsert Exception->"+e.getMessage());
		}
		return ReviewInsert;
	}
	
	@Override
	public List<Review> SearchforUpdate(Review review) {
		
		List<Review> SearchforUpdate = null;
		System.out.println("ReviewDaoImpl SearchforUpdate Start ..." );
		try {
			SearchforUpdate = session.selectOne("jshSearchforUpdate", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl SearchforUpdate Exception->"+e.getMessage());
		}
		return SearchforUpdate;
		
	}
	
	@Override
	public int ReviewUpdate(Review review) {
		int ReviewUpdate = 0;
		System.out.println("ReviewDaoImpl ReviewUpdate Start ..." );
		try {
			ReviewUpdate = session.update("jshReviewUpdate", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl ReviewUpdate Exception->"+e.getMessage());
		}
		return ReviewUpdate;
	}

	
	//2
	//여기에서는 select문으로 basket_num값을 갖고온다
	
	//3
	// 여기에서는 insert문으로 basket_num값을 넣어준다

	@Override
	   public int CountBuy(Review review) {
	      
	      int CountBuy = 0;
	      System.out.println("ReviewDaoImpl CountBuy Start ..." );
	      try {
	         CountBuy = session.selectOne("jshCountBuy", review);
	      } catch (Exception e) {
	         System.out.println("ReviewDaoImpl CountPersonalReview Exception->"+e.getMessage());
	      }
	      return CountBuy;
	      
	   }

	
}
	
	





















