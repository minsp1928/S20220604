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
			myProductList = session.selectList("tkProductMylist", user_id);
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
}
	
	
//

