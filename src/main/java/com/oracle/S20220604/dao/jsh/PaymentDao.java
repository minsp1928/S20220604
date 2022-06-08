package com.oracle.S20220604.dao.jsh;

import java.util.List;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Payment;

public interface PaymentDao {

	List<Payment> listInfo(Member meb);

	
}
