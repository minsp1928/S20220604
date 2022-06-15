package com.oracle.S20220604.dao.jsh;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.S20220604.model.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Review> SearchReview(int pro_num) {
		System.out.println("pro_num" + pro_num);
		List<Review> SearchReview = null;
		System.out.println("ReviewDaoImpl SearchReview Start ..." );
		
		try {
			SearchReview = session.selectList("jshSearchReview", pro_num);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl SearchReview Exception->"+e.getMessage());
		}
		return SearchReview;
		
	}
	
	@Override
	public String SearchMbPic(String user_id) {
		String SearchMbPic = "";
		System.out.println("ReviewDaoImpl SearchMbPic Start ..." );
		
		try {
			SearchMbPic = session.selectOne("jshSearchReview", user_id);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl SearchMbPic Exception->"+e.getMessage());
		}
		return SearchMbPic;
		
	}
	
	@Override 
	public  List<Review> DeleteReview(Review review) {
		System.out.println("review" + review);
		List<Review> DeleteReview = null;
		System.out.println("ReviewDaoImpl DeleteReview Start ..." );
		
		try {
			DeleteReview = session.selectList("jshReviewDelete", review);
		} catch (Exception e) {
			System.out.println("ReviewDaoImpl DeleteReview Exception->"+e.getMessage());
		}
		return DeleteReview;
		
	}
		
	}
	

