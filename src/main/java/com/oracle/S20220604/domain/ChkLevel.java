package com.oracle.S20220604.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.Setter;

 
@Getter
@Setter
@Table(name = "chk_level")
public class ChkLevel {

	@Id
	private String user_id;
	private int    chk;
}
