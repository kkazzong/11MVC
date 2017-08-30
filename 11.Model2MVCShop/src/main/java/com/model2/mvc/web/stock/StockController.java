package com.model2.mvc.web.stock;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model2.mvc.service.domain.Stock;

@RequestMapping("/stock/*")
public class StockController {
	
	public StockController() {
		System.out.println("stockController default constructor");
	}
	
	/*@RequestMapping(value="addStock", method=RequestMethod.POST)
	public String addStock(@ModelAttribute("stock") Stock stock) throws Exception {
		
		
		
	}*/

}
