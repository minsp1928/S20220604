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
	
	
}
