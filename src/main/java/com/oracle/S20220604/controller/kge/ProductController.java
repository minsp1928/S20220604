package com.oracle.S20220604.controller.kge;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;
import com.oracle.S20220604.model.Product_Info;
import com.oracle.S20220604.service.kge.Paging;
import com.oracle.S20220604.service.kge.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService ps;
	// 내 상품 목록 	
	@RequestMapping(value = "/myProductList")
	public String myProductList(String user_id, Product product, Model model) {
		System.out.println("[ProductController myProductList] Start...");
		user_id ="min2523";
		List<Product> listMyProduct = ps.listMyProduct(user_id);
		System.out.println("[ProductController myProductList] listMyProduct.size()" + listMyProduct.size());
		int listSize = listMyProduct.size();
		model.addAttribute("listMyProduct", listMyProduct);
		model.addAttribute("listSize"     , listSize);
		return "productKge/myProductList";
	}
//	상품 등록하기(대분류 get)
	@RequestMapping(value = "/productBoardWrite")
	public String productBoardWrite(Product product, Member member, Model model) {
		System.out.println("[ProductController productBoardWrite] Start...");
		//대분류만 Get
		List<Product_Info> proInfoTy1List = ps.proinfoSelect();
		for(Product_Info product_Info : proInfoTy1List) {
			System.out.println("[ProductController productBoardWrite product_Info.getPro_type1-->"+product_Info.getPro_type1());
			System.out.println("[ProductController productBoardWrite product_Info.getPro_content-->"+product_Info.getPro_content());
			
		}
		System.out.println("[ProductController productBoardWrite] proInfoTy1List.size->"+proInfoTy1List.size());
		model.addAttribute("proInfoTy1List", proInfoTy1List);
		return "productKge/productBoardWrite";
	}
//	중분류 get
	@ResponseBody // 아작스 사용하려면 이걸 걸어줘야 한다.
	@RequestMapping(value = "/type2")
	public List<Product_Info> type2(int pro_type1) {
		System.out.println("[ProductController type2] Start...");
		List<Product_Info> protype2List = ps.type2Select(pro_type1);
		for(Product_Info product_Info2 : protype2List) {
			System.out.println("[ProductController productBoardWrite product_Info2.getPro_type2-->"+product_Info2.getPro_type2());
			System.out.println("[ProductController productBoardWrite product_Info2.getPro_content-->"+product_Info2.getPro_content());
		}
		System.out.println("[ProductController type2 protype2List.size()->]"+protype2List.size());
		return protype2List;
	}
}

	

	

