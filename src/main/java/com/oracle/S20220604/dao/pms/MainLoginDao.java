package com.oracle.S20220604.dao.pms;

import java.util.List;

import org.springframework.ui.Model;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;

public interface MainLoginDao {

	Member selectLogin(Member member);

	Member findId(Member member);

	Member findPw(Member member);

	int updateTempPw(Member member5);

	Member checkId(String user_id);

	void joinInsert(Member member);

	void insertMember_NaverID(Member member);

	List<Product> productBest4list(Product product);

	int total2(Product product);

	List<Product> productNew4list(Product product);

	List<Product> BestProductlist(Product product);

	List<Product> NewProductlist(Product product);

	List<Product> searchKeyword(Product product);

	List<Banner> bannerList();

}
