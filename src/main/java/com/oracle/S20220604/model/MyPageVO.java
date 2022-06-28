package com.oracle.S20220604.model;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyPageVO {
	private int pay_tot_num;
	private int pro_num;
	private int quantity;
	private String prev_order_status;
	private String order_status;
	private String order_status_nm;
	private String purchase_status;
	private String product_status;
	private String refund_status;
	private String refund_reason;
	
	//product
	private int pro_price;
	private String user_id;
	private String pro_title;
	private String pro_photo;
	
	//payment
	private int pay_state;
	private String pay_tot;
	private String pay_date;
	
	//review
	private int re_star;
	private String re_title;
	
	//chk_level
	private int chk;
	
	//시환
	List<Integer> pro_num_list;
	List<Integer> quantity_list;
	
}


