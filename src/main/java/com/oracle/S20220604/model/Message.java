package com.oracle.S20220604.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Message {

	private int room_num;
	private int msg_num;
	private int msg_type;
	private String send_user_id;
	private String content;
	private Date msg_time;
	private String msg_file;
	private String msg_pic;
	private String mmsg_time;
}
