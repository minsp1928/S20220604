package com.oracle.S20220604.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReadCheck {
	private int room_num;
	private int msg_num;
	private String user_id;
	private int read;
	
}