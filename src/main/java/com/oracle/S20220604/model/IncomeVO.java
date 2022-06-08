package com.oracle.S20220604.model;

import lombok.Data;

@Data
public class IncomeVO {
	
	private int incomedate;
	private int tot;
	
	//조회용
	private int year;
	private int month;
	private int lastday;

}
