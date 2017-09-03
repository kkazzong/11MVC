package com.model2.mvc.web.chart;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;


@RestController
@RequestMapping("/chart/*")
public class ChartRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
		
	public ChartRestController(){
		System.out.println(this.getClass());
	}
	
	
	@RequestMapping("json/getChartData")
	public Map getChartData() throws Exception {
		Search search = new Search();
		search.setCurrentPage(1);
		search.setPageSize(8);
		int userCount = ((Integer)(userService.getUserList(search)).get("totalCount")).intValue();
		int prodCount =  ((Integer)(productService.getProductList(search)).get("totalCount")).intValue();
		
		search.setSearchSoldProd("1");
		int soldCount =  ((Integer)(productService.getProductList(search)).get("totalCount")).intValue();
		
		Map map = new HashMap();
		map.put("userCount", userCount);
		map.put("prodCount", prodCount);
		map.put("soldCount", soldCount);
		
		return map;
	}
}