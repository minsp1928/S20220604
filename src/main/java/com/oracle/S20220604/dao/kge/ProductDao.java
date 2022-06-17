package com.oracle.S20220604.dao.kge;

import java.util.List;

import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;

public interface ProductDao {

   List<Product>        listMyProduct(String user_id);
   List<Product_Info>   listProinfo();
   List<Product_Info>   type2Select(int pro_type1);
   int                  insertProduct(Product product);
   int                  delete(int pro_num);
   int                  total(Product product);
   List<Product>        listProduct(Product product);
   Product              detail(int pro_num);
//   void                 productVOInsert(ProductVO productVO); 
   int                  insertCheck(Product product);
   int                  productUpdate(Product product);
   int                  basketMain(Product product);
   int                  basketInsert(Product product);
   int                  createPut(Product product);
   List<Product>        listProductNewest(Product product);
   List<Product>        listProductLowest(Product product);
//   List<Product>        listProductHighest(Product product);


}