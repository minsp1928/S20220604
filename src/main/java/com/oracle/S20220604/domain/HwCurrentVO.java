package com.oracle.S20220604.domain;

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;

@SuppressWarnings("serial")
@Getter
@Setter
public class HwCurrentVO implements Serializable {

	String user_id;
	int    cp_num;
}
