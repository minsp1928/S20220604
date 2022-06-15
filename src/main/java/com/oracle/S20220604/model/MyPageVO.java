package com.oracle.S20220604.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyPageVO {
	private int pay_tot_num;
	private int pro_num;
	private int quantity;
	private String order_status;
	private String purchase_status;
	private String product_status;
	private String refund_status;
	private String refund_reason;

	private String pay_tot;
	private String pay_date;
	
    private String user_id;
	private String pro_title;
}


