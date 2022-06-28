package com.oracle.S20220604.model;

import java.util.Date;
import java.util.List;

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
	private String re_pic;
	
	List<Integer> user_pic;
	/*
	 * private String search; private String keyword; private String pageNum;
	 * private int start; private int end;
	 */
}
