package com.oracle.S20220604.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
@Entity
@SequenceGenerator(
		name = "chatroom_SEQ_GENERATOR"
	    , sequenceName = "seq_chatroom_num"
	    , initialValue = 2
	    , allocationSize = 1
	)
public class Chatting {
	@Id
    @GeneratedValue(
    	strategy = GenerationType.SEQUENCE, 
    	generator = "chatroom_SEQ_GENERATOR"
	)
	private int 	room_num;
	private String  room_name;
	private int 	room_type;
	private String 	room_pawd;
	private String	pic_change;
	
	@Transient
	private String search;
	@Transient
	private String keyword;
	@Transient
	private String pageNum;
	@Transient
	private int start;
	@Transient
	private int end;
}
