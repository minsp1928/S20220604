package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Coupon {

	private String 	user_id;
	private int		cp_num;
	private String 	cp_name;
	private int     cp_category;
	private int		cp_price;
	private Date	st_date;
	private Date  	end_date;
	private int		cp_status;
}
