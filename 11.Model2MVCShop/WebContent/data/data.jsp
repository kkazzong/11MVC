<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	
	Product product = new Product();
	product.setProdName("ÇÏ´Ãº¸¸®");
	product.setProdDetail("ÇÏ´Ã ÇÏ´Ã º¸¸®");
	product.setManuDate("20170909");
	product.setPrice(15000);
	
	/* List<String> list = new ArrayList<String>();
	list.add("AHlbAAAAtBqyWAAA.jpg");
	list.add("AHlbAAAAvewfegAB.jpg");
	list.add("150418.JPG");
	list.add("150909.JPG");
	list.add("131221.JPG");
	list.add("150418.JPG");
	
	product.setFileName(list); */
	
	Review review = new Review();
	review.setReviewProd(product);
	review.setReviewNo(10011);
	review.setReviews("Å×½ºÆ®");
	
	//request.setAttribute("product",product);
	request.setAttribute("review",review);
	
%>