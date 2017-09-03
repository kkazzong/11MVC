package com.model2.mvc.service.review.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.review.ReviewDAO;

@Repository("reviewDAOImpl")
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	public ReviewDAOImpl() {
		System.out.println(":::"+getClass()+" default constr");
	}

	@Override
	public int addReview(Review review) throws Exception {
		return sqlSession.insert("ReviewMapper.addReview", review);
	}

	@Override
	public Review getReview(int prodNo) throws Exception {
		return sqlSession.selectOne("ReviewMapper.getReview", prodNo);
	}

	@Override
	public int updateReview(Review review) throws Exception {
		return sqlSession.update("ReviewMapper.updateReview", review);
	}

	@Override
	public int deleteReview(int reviewNo) throws Exception {
		return sqlSession.update("ReviewMapper.deleteReview", reviewNo);
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Review> getReviewList(int prodNo) throws Exception {
		List<Review> reviewList = new  ArrayList<Review>();
		reviewList = sqlSession.selectList("ReviewMapper.getReviewList", prodNo);
		return reviewList;
	}
}
