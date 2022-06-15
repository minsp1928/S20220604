package com.oracle.S20220604.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@SequenceGenerator(name = "seq_faq_generator",
				   sequenceName = "seq_faq_num",
				   initialValue = 10030,
				   allocationSize = 1)
@Table(name = "faq")
public class FaqJpa {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE,	generator = "seq_faq_generator")	
	private int		faq_num;
	private int		faq_category;
	private String	faq_subject;
	private String	faq_content;
	private	String	user_id;
	private String	faq_phone;
	private String	faq_email;
	private int     faq_pass;
	private String  user_date;
	private String	admin_id;
	private String	admin_content;
	private String  admin_date;
	private int		faq_check;
	private int     login_check;
}
