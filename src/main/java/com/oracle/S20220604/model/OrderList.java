package com.oracle.S20220604.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderList {

	private int pay_tot_num;
	private int pro_num;
	private int quantity;
	private String order_status;
	private String purchase_status;
	private String product_status;
	private String refund_status;
	private String refund_reason;
	
}
