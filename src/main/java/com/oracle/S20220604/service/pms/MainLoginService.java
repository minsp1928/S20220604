package com.oracle.S20220604.service.pms;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.S20220604.model.Banner;
import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Product;

public interface MainLoginService {
	//로그인
	Member login(Member member);
//	void login(Member member, HttpServletResponse response, HttpServletRequest request) throws IOException;
	//아이디 찾기
	Member findIdCheck(Member member);
	//비밀번호 찾기
	Member findPwCheck(Member member);
	//임시비밀번호 메일보내기
	int updateTempPassword(Member member5);
	//아이디중복체크
	void checkId(String user_id, HttpServletResponse response) throws IOException;
	//회원가입
	void joinInsert(Member member);
	//네이버 회원가입
	void insertMember_NaverID(Member member);
	//베스트4상품리스트
	List<Product> listBest4Product(Product product);
	//전체 상품 갯수
	int total2(Product product);
	//신상품4 리스트
	List<Product> listNew4Product(Product product);
	//베스트전체 상품리스트
	List<Product> BestProductlist(Product product);
	//신상품 전체 리스트
	List<Product> NewProductlist(Product product);
	//검색 리스트
	List<Product> searchKeyword(Product product);
	//메인 배너리스트
	List<Banner> bannerList();

	

}
