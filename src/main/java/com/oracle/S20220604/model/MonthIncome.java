package com.oracle.S20220604.model;

import lombok.Data;

@Data
public class MonthIncome {
	
	private int incomedatem;
	private int totm;
	
	//조회용
	private int year;
	private int month;
	private int lastday;

}
