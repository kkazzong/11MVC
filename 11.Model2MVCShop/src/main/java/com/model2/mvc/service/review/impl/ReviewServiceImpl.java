package com.model2.mvc.service.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.product.ProductDAO;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.review.ReviewDAO;
import com.model2.mvc.service.review.ReviewService;

@Service("reviewServiceImpl")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	@Qualifier("reviewDAOImpl")
	ReviewDAO reviewDAO;
	
	@Autowired
	@Qualifier("productDAOImpl")
	ProductDAO productDAO;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	
	public ReviewServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int addReview(Review review) throws Exception {
		Purchase purchase = new Purchase();
		purchase.setPurchaseProd(review.getReviewProd());
		purchase.setTranCode("4");
		purchaseService.updateTranCode(purchase);
		return reviewDAO.addReview(review);
	}

	@Override
	public Review getReview(int prodNo) throws Exception {
		return reviewDAO.getReview(prodNo);
	}

	@Override
	public int updateReview(Review review) throws Exception {
		return reviewDAO.updateReview(review);
	}

	@Override
	public int deleteReview(int reviewNo) throws Exception {
		return 0;
	}

	@Override
	public List<Review> getReviewList(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.getReviewList(prodNo);
	}

}
