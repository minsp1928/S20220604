package com.oracle.S20220604.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

 
@Getter
@Setter
@Table(name = "member")
public class Member {
	
	@Id
	private String 	user_id;
	private String 	user_pw;
	private String 	user_name;
	private String 	email;
	private String 	con_tel;
	private String 	user_photo;
	private String 	con_addr;
	private String 	sell_name;
	private String 	sell_tel;
	private String 	sell_photo;
	private String 	sell_num;
	private String 	sell_addr;
	private String 	m_level;
	private Date 	join_date;
	private String 	nickname;
	private String 	nick_photo;
	
	@OneToMany
	@JoinColumn(name = "user_id")
	private ChkLevel chkLevel;
}
