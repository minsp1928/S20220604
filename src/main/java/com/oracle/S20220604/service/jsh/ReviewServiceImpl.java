package com.oracle.S20220604.service.jsh;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.S20220604.dao.jsh.ReviewDao;
import com.oracle.S20220604.model.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDao rd;
	
	@Override
	public List<Review> SearchReview(int pro_num) {
		System.out.println("ReviewServiceImpl SearchReview ...");
		List<Review> SearchReview = null;
		SearchReview = rd.SearchReview(pro_num);
		
		
		return SearchReview;
	}
	
	@Override
	public String SearchMbPic(String user_id) {
		System.out.println("ReviewServiceImpl SearchMbPic ...");
		String SearchMbPic = "";
		SearchMbPic = rd.SearchMbPic(user_id);
		
		
		return SearchMbPic;
	}
	
	@Override
	public List<Review> DeleteReview(Review review) {
		System.out.println("ReviewServiceImpl SearchReview ...");
		List<Review> DeleteReview = null;
		DeleteReview = rd.DeleteReview(review);
		
		
		return DeleteReview;
	}
	
}
