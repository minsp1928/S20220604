package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Product {
	private int pro_num;
	private int pro_type1;
	private int pro_type2;
	private String user_id;
	private int pro_price;
	private String pro_title;
	private String pro_write;
	private String pro_photo;
	private String pro_pic;
	private Date pro_date;
	private int amount;
	private int sell_amount;
	
	// 제품 상세 페이지에서 장바구니,구매하기 버튼 눌렀을 때 몇 개 구매할 건지 던져주는 값 
	//(Model 이용해서 product이름으로 보낼 예정)
	private int quantity;
	private int basket_num;
	
	// 결제하기 
	private int pay_tot;
	
	// 조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
	
	// 조인트 용
	private String sell_name;
	private String sell_photo;
	
	// 로그인유저아이디 프로시저용
	private String login_user_id; 
	
}
