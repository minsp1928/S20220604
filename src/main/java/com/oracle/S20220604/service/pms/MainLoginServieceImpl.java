package com.oracle.S20220604.service.pms;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.oracle.S20220604.dao.pms.MainLoginDao;
import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;

@Service
public class MainLoginServieceImpl implements MainLoginService {
	
	@Autowired MainLoginDao md;
	
	@Override
	public Member login(Member member) {
		System.out.println("MainLoginServieceImpl login Start");
		return md.selectLogin(member);
	}
//	@Override
//	public void login(Member member, HttpServletResponse response, HttpServletRequest request) throws IOException {
//		System.out.println("MainLoginServieceImpl login Start");
//		member = md.selectLogin(member);
//		if(member == null) {//셀렉된 아이디가 없을때  로그인 실패 아이디 혹은 비번이 없는거
//			response.getWriter().print("0");
//		}else { //셀렉된 아이디가 있음 = 로그인 성공
//			response.getWriter().print("1"); // 이 방법을 사용해서 로그인실패 알러트어케 못만드나?
//			request.getSession().setAttribute("sessionId", member.getUser_id());//로그인 성공시 세션유지
//		}
//	}

	@Override
	public Member findIdCheck(Member member) {
		System.out.println("MainLoginServieceImpl findIdCheck Start");
		return md.findId(member);
	}

	@Override
	public Member findPwCheck(Member member) {
		System.out.println("MainLoginServieceImpl findPwCheck Start");
		return md.findPw(member);
	}

	@Override
	public int updateTempPassword(Member member5) {
		System.out.println("MainLoginServieceImpl updateTempPassword Start..");
		return md.updateTempPw(member5);
	}

	@Override
	public void checkId(String user_id, HttpServletResponse response) throws IOException {
		System.out.println("MainLoginServieceImpl checkId Start");
		Member member = new Member();
		member = md.checkId(user_id);
		if(member == null) {//셀렉된 아이디가 없을때 아이디 사용가능
			response.getWriter().print("1");
		}else { //셀렉된 아이디가 있음 = 아이디 중복
			response.getWriter().print("0"); // 이 방법을 사용해서 로그인실패 알러트어케 못만드나?
		}
		
	}

	@Override
	public void joinInsert(Member member) {
		System.out.println("MainLoginServieceImpl joinInsert Start");
		if (member == null) {
			return ;
		}
		md.joinInsert(member);
		
	}

	@Override
	public void insertMember_NaverID(Member member) {
		System.out.println("MainLoginServieceImpl insertMember_NaverID Start");
		if(member == null) {
			return;
		}
		md.insertMember_NaverID(member);
	}

	@Override
	public List<Product> listBest4Product(Product product) {
		System.out.println("MainLoginServieceImpl listBest4Product Start");
		List<Product> listBest4Product = null;
		listBest4Product = md.productBest4list(product);
		System.out.println("MainLoginServieceImpl listBest4Product productBest4list.size()->" + listBest4Product.size());
		return listBest4Product;
	}

	@Override
    public int total2(Product product) {
      System.out.println("MainLoginServieceImpl total2 Start...");
      int totPro = md.total2(product);
      System.out.println("MainLoginServieceImpl total2 totPro->" + totPro);
      return totPro;
   }

	@Override
	public List<Product> listNew4Product(Product product) {
		System.out.println("MainLoginServieceImpl listNew4Product Start");
		List<Product> listNew4Product = null;
		listNew4Product = md.productNew4list(product);
		System.out.println("MainLoginServieceImpl listNew4Product productBest4list.size()->" + listNew4Product.size());
		return listNew4Product;
	}

	@Override
	public List<Product> BestProductlist(Product product) {
		System.out.println("MainLoginServieceImpl listBest4Product Start");
		List<Product> BestProductlist = null;
		BestProductlist = md.BestProductlist(product);
		System.out.println("MainLoginServieceImpl listBest4Product BestProductlist.size()->" + BestProductlist.size());
		return BestProductlist;
	}

	@Override
	public List<Product> NewProductlist(Product product) {
		System.out.println("MainLoginServieceImpl NewProductlist Start");
		List<Product> NewProductlist = null;
		NewProductlist = md.NewProductlist(product);
		System.out.println("MainLoginServieceImpl listBest4Product NewProductlist.size()->" + NewProductlist.size());
		return NewProductlist;
	}

	@Override
	public List<Product> searchKeyword(Product product) {
		System.out.println("product.getSearch --> " + product.getSearch());
		System.out.println("product.getKeyword --> " + product.getKeyword());
		List<Product> searchKeyword = null;
		System.out.println("MainLoginServieceImpl searchKeyword start");
		searchKeyword = md.searchKeyword(product);
		System.out.println("MainLoginServieceImpl searchKeyword searchKeyword.size()->"+searchKeyword.size());
		return searchKeyword;
}

	@Override
	public List<Banner> bannerList() {
		System.out.println("MainLoginServieceImpl bannerList start");
		List<Banner> bannerList = null;
		bannerList = md.bannerList();
		System.out.println("MainLoginServieceImpl bannerList->"+bannerList);
		return bannerList;
	}

	

}//end
