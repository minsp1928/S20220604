package com.oracle.S20220604.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

@Getter
@Setter
@Entity
@Table(name = "coupon")
@Accessors(chain = true)
@IdClass(HwCurrentVO.class)
public class CouponJpa {

	@Id
	private String 	user_id;
	@Id
	private int    	cp_num;
	private String 	cp_name;
	private int		cp_category;
	private int    	cp_price;
	private Date   	st_date;
	private Date   	end_date;
	private int    	cp_status;
	
}
