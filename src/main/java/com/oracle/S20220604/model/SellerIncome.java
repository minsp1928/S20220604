package com.oracle.S20220604.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SellerIncome {

	private String 	seller;
	private int   	income;
	private String  user_name;
	private String  sell_name;
	private String  sell_tel;
	private String  sell_num;
	private String  sell_addr1;
	private String  sell_addr2;
	
	//조회
	private int     year; 
	private int 	month;
}
