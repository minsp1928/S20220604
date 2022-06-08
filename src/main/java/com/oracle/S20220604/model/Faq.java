package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class Faq {

	private int		faq_num;
	private int		faq_category;
	private String	faq_subject;
	private String	faq_content;
	private	String	user_id;
	private String	faq_phone;
	private String	faq_email;
	private int     faq_pass;
	private Date    user_date;
	private String	admin_id;
	private String	admin_content;
	private Date    admin_date;
	private int		faq_check;
	private int     login_check;
	
	//조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;
}
