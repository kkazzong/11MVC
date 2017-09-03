package com.model2.mvc.web.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.Review;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.review.ReviewService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	
	@Autowired
	@Qualifier("reviewServiceImpl")
	ReviewService reviewService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	public ReviewController() {
		System.out.println("ReviewController default constuctor");
	}
	
	@RequestMapping(value="addReview", method=RequestMethod.GET)
	public String addReview(@RequestParam int prodNo, @RequestParam String userId, Model model) throws Exception {
		
		System.out.println("addReview[GET]");
		System.out.println(prodNo+","+userId);
		
		model.addAttribute("product", productService.getProduct(prodNo));
		
		return "/review/reviewProductView.jsp";
	}
	
	@RequestMapping(value="addReview", method=RequestMethod.POST)
	public String addReview(@ModelAttribute("review") Review review, @RequestParam("menu") String menu, Model model) throws Exception {
		
		System.out.println("addReview[POST]");
		reviewService.addReview(review);
		System.out.println("reviewNo : "+review.getReviewNo());
		model.addAttribute("menu", menu);
		model.addAttribute("review", reviewService.getReview(review.getReviewProd().getProdNo()));
		return "/review/reviewProduct.jsp";
	}
	
	@RequestMapping(value="getReview", method=RequestMethod.GET)
	public String addReview(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("getReview[POST]");
		model.addAttribute("review", reviewService.getReview(prodNo));
		return "/review/reviewProduct.jsp";
	}
	
	
	@RequestMapping(value="getReviewList", method=RequestMethod.GET)
	public String getReviewList(@RequestParam int prodNo, Model model) throws Exception {
		
		System.out.println("getReviewList[GET]");
		model.addAttribute("reviewList", reviewService.getReviewList(prodNo));
		return "/product/getProduct.jsp";
	}
	
	@RequestMapping(value="updateReview", method=RequestMethod.GET)
	public String updateReview(@RequestParam("prodNo") int prodNo, Model model) throws Exception {
		
		System.out.println("updateReview[GET]");
		model.addAttribute("review", reviewService.getReview(prodNo));
		return "/review/updateReview.jsp";
	}
	
	@RequestMapping(value="updateReview", method=RequestMethod.POST)
	public String updateReview(@ModelAttribute("review") Review review, @RequestParam("menu") String menu, Model model) throws Exception {
		
		System.out.println("updateReview[POST]");
		reviewService.updateReview(review);
		model.addAttribute("menu",menu);
		model.addAttribute("review", reviewService.getReview(review.getReviewProd().getProdNo()));
		return "/review/reviewProduct.jsp";
	}
	
}
