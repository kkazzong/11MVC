package com.model2.mvc.service.review.test;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.review.ReviewDAO;
import com.model2.mvc.service.user.UserService;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration	(locations = {	"classpath:config/context-common.xml",
																	"classpath:config/context-aspect.xml",
																	"classpath:config/context-mybatis.xml",
																	"classpath:config/context-transaction.xml" })
public class ReviewServiceTest {

	@Autowired
	@Qualifier("reviewDAOImpl")
	private ReviewDAO reviewDAOImpl;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userServiceImpl;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productServiceImpl;
	
	public ReviewServiceTest() {
		// TODO Auto-generated constructor stub
	}

	//@Test
	public void addReviewTest() throws Exception {
		
		System.out.println("===========================");
		
		User user = userServiceImpl.getUser("user01");
		Product product = productServiceImpl.getProduct(10015);
		
		List<String> reviewImage = new ArrayList<String>();
		reviewImage.add("a.jpg");
		reviewImage.add("b.jpg");
		
		Review review = new Review();
		review.setReviewNo(10000);
		review.setReviews("리뷰를 남겨본다");
//		review.setReviewImage(reviewImage);
		review.setReviewUser(user);
		review.setReviewProd(product);
		
		int complete = reviewDAOImpl.addReview(review);
		
		Assert.assertEquals(1, complete);
		
		System.out.println("===========================");
		
	}
	
	//@Test
	public void getReviewTest() throws Exception {
		
		System.out.println("===========================");
		
		int reviewNo = 10000;
		
		Review review = reviewDAOImpl.getReview(reviewNo);
		System.out.println(review);
		Review getReview = reviewDAOImpl.getReview(review.getReviewNo());
		
		Assert.assertEquals(review.getReviews(), getReview.getReviews());
		
		System.out.println("===========================");
		
	}
	
	//@Test
	public void updateReviewTest() throws Exception {
		
		System.out.println("===========================");
		
		int reviewNo = 10001;
		
		Review review = reviewDAOImpl.getReview(reviewNo);
		System.out.println(review);
		review.setReviews("리뷰변경중");
		//int complete = reviewDAOImpl.updateReview(reviewNo);
		
		//Assert.assertEquals(1, complete);
		
		System.out.println("===========================");
		
	}
	
	@Test
		public void getReviewListTest() throws Exception {
			
			System.out.println("===========================");
			
			int prodNo = 10015;
			
			List<Review> list = reviewDAOImpl.getReviewList(prodNo);
			System.out.println(list);
			//int complete = reviewDAOImpl.updateReview(reviewNo);
			
			Assert.assertEquals(2, list.size());
			
			System.out.println("===========================");
			
		}
}
