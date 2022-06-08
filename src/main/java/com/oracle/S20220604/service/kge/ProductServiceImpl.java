package com.oracle.S20220604.service.kge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.kge.ProductDao;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;

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

	@Override
	public List<Product_Info> type2Select(int pro_type1) {
		System.out.println("[ProductServiceImpl type2Select] Start...");
		List<Product_Info> type2List = null;
		type2List = pd.type2Select(pro_type1);
		System.out.println("[[ProductServiceImpl type2Select type2List.size()]->"+type2List.size());
		return type2List;
	} 

//

}
