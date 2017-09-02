package com.model2.mvc.service.stock.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Stock;
import com.model2.mvc.service.stock.StockDAO;
import com.model2.mvc.service.stock.StockService;

@Service("stockServiceImpl")
public class StockServiceImpl implements StockService {

	@Autowired
	@Qualifier("stockDAOImpl")
	StockDAO stockDAO;
	
	public StockServiceImpl() {
	}

	@Override
	public void addStock(Stock stock) throws Exception {
		stockDAO.addStock(stock);
	}

	@Override
	public Stock getStock(int stockNo) throws Exception {
		return null;
	}

	@Override
	public void updateStock(Stock stock) throws Exception {
		stockDAO.updateStock(stock);
	}

	@Override
	public int deleteStock(int prodNo) throws Exception {
		return stockDAO.deleteStock(prodNo);
	}

	

}
