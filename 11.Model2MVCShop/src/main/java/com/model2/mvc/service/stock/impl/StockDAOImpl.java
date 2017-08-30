package com.model2.mvc.service.stock.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Stock;
import com.model2.mvc.service.stock.StockDAO;

@Repository("stockDAOImpl")
public class StockDAOImpl implements StockDAO {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	public SqlSession sqlSession;
	
	public StockDAOImpl() {
	}

	@Override
	public void addStock(Stock stock) throws Exception {
		sqlSession.insert("StockMapper.addStock", stock);
	}

	@Override
	public Stock getStock(int stockNo) throws Exception {
		return null;
	}

	@Override
	public void updateStock(Stock stock) throws Exception {

	}

	@Override
	public List<Stock> getStockList(Search search) throws Exception {
		return null;
	}

	@Override
	public int getCount(Search search) throws Exception {
		return 0;
	}

}
