package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Review {
	private String user_id; 		 
	private String re_title;
	private String re_content;
	private int pro_num;
	private int re_star;
	
	
}
