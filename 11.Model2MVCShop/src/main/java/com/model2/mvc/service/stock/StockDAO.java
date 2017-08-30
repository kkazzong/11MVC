package com.model2.mvc.service.stock;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Stock;

public interface StockDAO {

	public void addStock(Stock stock) throws Exception;
	
	public Stock getStock(int stockNo) throws Exception;
	
	public void updateStock(Stock stock) throws Exception;
	
	public List<Stock> getStockList(Search search) throws Exception;
	
	public int getCount(Search search) throws Exception;
	
	//public int deleteProduct(int prodNo) throws Exception;
}
