package com.oracle.S20220604.service.jsh;

import java.util.List;

import com.oracle.S20220604.model.Review;

public interface ReviewService {

	List<Review> SearchReview(int pro_num);

	String SearchMbPic(String user_id);

	List<Review> DeleteReview(Review review);

}
