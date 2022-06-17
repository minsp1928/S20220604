package com.oracle.S20220604.dao.kge;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;

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
   
//   상품 삭제하기(아작스 사용)
   @Override
   public int delete(int pro_num) {
      System.out.println("[ProductDaoImpl delete] Start...");
      int result = 0;
      try {
         // 좋아요 체크 테이블에서 삭제
//         result = session.delete("geProductDelete", pro_num);
//         // 후기 테이블에서 삭제
//         result = session.delete("geProductDelete", pro_num);
//         // 결제 리스트 테이블에서 삭제
//         result = session.delete("geProductDelete", pro_num);
//         // 부모라서 맨 나중에 삭제
         result = session.update("geProductDelete", pro_num);
         System.out.println("[ProductDaoImpl delete] result->"+result);
      } catch (Exception e) {
         System.out.println("[ProductDaoImpl delete] Exception->"+e.getMessage());
      }
      return result;
   }
   
//   상품 목록 리스트 - 상품 갯수
   @Override
   public int total(Product product) {
      System.out.println("[ProductDaoImpl total] Start...");
      int tot = 0;
      System.out.println("try문 들어가기전에 tot 0으로 선언 "+tot);
      System.out.println("ProductDaoImpl total product.getPro_type1() ->"+product.getPro_type1());
      System.out.println("ProductDaoImpl total product.getPro_type2() ->"+product.getPro_type2());
      
      try {
    	 System.out.println("try문 들어갔을떄 "+tot);
         tot = session.selectOne("kgeProductTotal", product);
         System.out.println("[ProductDaoImpl total] tot->"+tot);
         System.out.println("try문에서 매퍼다녀옴 "+tot);
      } catch (Exception e) {
         System.out.println("[ProductDaoImpl total] Exception->"+e.getMessage());
      }
      return tot;
   }
   
//   상품 목록 리스트 - 상품 목록
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

//   상품 상세 페이지(Product 테이블만 사용)
   @Override
   public Product detail(int pro_num) {
      
      System.out.println("[ProductDaoImpl detail] Start...");
      
      Product product = new Product();
      try {
         product = session.selectOne("geProductDetail", pro_num);
      } catch (Exception e) {
         System.out.println("[ProductDaoImpl listProduct] Exception->" + e.getMessage());
      }
      return product;
   }
//   상품 등록하기(프로시저 사용)
//   @Override
//   public void productVOInsert(ProductVO productVO) {
//      System.out.println("[ProductDaoImpl productVOInsert] Start...");
//      session.selectOne("geProcProductInsert", productVO);
//   }

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
//   장바구니 추가하기(메인 장바구니에 user_id가 있는지 확인하는 logic)
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

//   @Override
//   public List<Product> listProductHighest(Product product) {
//      // TODO Auto-generated method stub
//      return null;
//   }

   
   //2
   //여기에서는 select문으로 basket_num값을 갖고온다
   
   //3
   // 여기에서는 insert문으로 basket_num값을 넣어준다
   
}
   
   




















