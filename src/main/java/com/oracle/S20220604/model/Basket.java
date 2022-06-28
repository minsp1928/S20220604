package com.oracle.S20220604.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Basket {
	
	private int basket_num; 	private int pro_num;
	private int basket_amount;	private String basket_date;
	
	//조회용
	private int pro_price;
	private String pro_title;
	private String pro_photo;
	private int basketCount;
	private int totalPrice;
	List<Integer> pro_num_list;
	List<Integer> quantity_list;

}
