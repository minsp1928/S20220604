package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberDetail {

	private String 	user_id;
	private String 	user_pw;
	private String 	user_name;
	private String 	email;
	private String 	con_tel;
	private String 	user_photo;
	private String 	con_addr;
	private String 	sell_name;
	private String 	sell_tel;
	private String 	sell_photo;
	private String 	sell_num;
	private String 	sell_addr;
	private String 	m_level;
	private Date 	join_date;
	private String 	nickname;
	private String 	nick_photo;
	
	//회원관리 상세페이지
	//주문건수
	private int orders;
	//총주문금액
	private int orderamount;
	
}