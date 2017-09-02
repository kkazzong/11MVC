package com.model2.mvc.service.product.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Stock;
import com.model2.mvc.service.product.ProductDAO;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.stock.StockDAO;
import com.model2.mvc.service.stock.StockService;

@Service("productServiceImpl")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	@Qualifier("productDAOImpl")
	ProductDAO productDAO;
	
	@Autowired
	@Qualifier("stockServiceImpl")
	StockService stockService;
	
	public ProductServiceImpl() {
		System.out.println(":::"+getClass()+" default constr");
	}

	@Override
	public void addProduct(Product product) throws Exception {
		productDAO.addProduct(product);
		Stock stock = new Stock();
		stock.setStocks(product.getProdStock());
		stock.setProduct(product);
		stockService.addStock(stock);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDAO.getProduct(prodNo);
	}

	@Override
	public void updateProduct(Product product) throws Exception {
		productDAO.updateProduct(product);
		Stock stock = new Stock();
		stock.setStocks(product.getProdStock());
		stock.setProduct(product);
		stockService.updateStock(stock);
	}

	@Override
	public Map<String, Object> getProductList(Search search) throws Exception {
		int totalCount = productDAO.getCount(search);
		List<Product> list = productDAO.getProductList(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("totalCount", new Integer(totalCount));
		map.put("productList", list);

		return map;
	}
	
	@Override
	public int deleteProduct(int prodNo) throws Exception {
		
		stockService.deleteStock(prodNo);
		return productDAO.deleteProduct(prodNo);
	}
	
	public void setProductDAO(ProductDAO productDAO) {
		this.productDAO = productDAO;
	}

	
	
}
