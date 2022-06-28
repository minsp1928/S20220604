package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Member {

	private String 	user_id;     //아이디
	private String 	user_pw;     //비밀번호
	private String 	user_name;   //이름
	private String 	email;	     //이메일
	private String 	con_tel;     //휴대폰번호
	private String 	user_photo;  //프로필사진
	private String 	con_addr1;   //소비자 주소
	private String 	con_addr2;   //소비자 상세주소
	private String 	sell_name;	 //판매자 상호명
	private String 	sell_tel;	 //판매자 연락처
	private String 	sell_photo;  //판매자 상호사진
	private String 	sell_num;    //판매자 사업자번호
	private String 	sell_addr1;  //판매자 상세주소
	private String 	sell_addr2;  //판매자 상세주소
	private String 	m_level;	 //등급		
	private Date 	join_date;	 //가입일
	private String 	nickname;    //채팅익명이름
	private String 	nick_photo;  //채팅익명프로필사진
	private String  auth_status; //회원가입인증상태(인증:1)
	
	
	//조회용
	private String 	search;
	private String 	keyword;
	private String 	startDate;
	private String	endDate;
	
	//프로필사진 변경용 변수
	private String photoChange;
	
	//마이페이지용
	private int pro_num;
	private String pro_title;
	private int chk;
	private String chk_nm;
	

	
	
}
