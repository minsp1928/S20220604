package com.oracle.S20220604.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Participant {

	private String user_id;
	private int room_num;
	
	// 버퍼용
	private String con_user_id;
}
