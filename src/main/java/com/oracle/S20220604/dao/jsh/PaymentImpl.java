package com.oracle.S20220604.dao.jsh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.model.Member;
import com.oracle.S20220604.model.Payment;

@Service
public class PaymentImpl implements PaymentDao{

	private Member mb;
	private Payment py;
	
	@Override
	public List<Payment> listInfo(Member meb) {
		List<Payment> sample = null;
		
		return sample;
	}
	
}
