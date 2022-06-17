package com.oracle.S20220604.model;

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
	private String	st_date;
	private String	end_date;
	private int		cp_status;
	
	//조회용
	private String pageNum;
	private int start;
	private int end;
	
	//시환님 조회용
	private String to_date;
}
