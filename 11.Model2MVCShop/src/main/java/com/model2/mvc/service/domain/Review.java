package com.model2.mvc.service.domain;

import java.util.List;

public class Review {

	private int reviewNo;
	private String reviews;
	private Product reviewProd;
	private User reviewUser;
	private List<String> reviewImage;
	
	public Review() {
	}

	public int getReviewNo() {
		return reviewNo;
	}
	public String getReviews() {
		return reviews;
	}
	public Product getReviewProd() {
		return reviewProd;
	}
	public User getReviewUser() {
		return reviewUser;
	}
	public List<String> getReviewImage() {
		return reviewImage;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public void setReviews(String review) {
		this.reviews = review;
	}
	public void setReviewProd(Product reviewProd) {
		this.reviewProd = reviewProd;
	}
	public void setReviewUser(User reviewUser) {
		this.reviewUser = reviewUser;
	}
	public void setReviewImage(List<String> reviewImage) {
		this.reviewImage = reviewImage;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", review=" + reviews + ", reviewProd=" + reviewProd + ", reviewUser="
				+ reviewUser + ", reviewImage=" + reviewImage + "]";
	}
	
}
