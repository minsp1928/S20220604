package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Board {
	private int 	board_num;
	private	int		board_category;
	private String	board_subject;
	private String  board_content;
	private String 	user_id;
	private Date    board_reg_date;
	private int		board_hits;
	
	//조회용 
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
}
