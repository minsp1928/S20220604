package com.oracle.S20220604.dao.jsh;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentImpl {

	@Autowired
	private Member mb;
	@Autowired 
	private Payment py;
	
	@Override
	public list<Payment> listInfo(Member meb) {
		
	}
	
}
