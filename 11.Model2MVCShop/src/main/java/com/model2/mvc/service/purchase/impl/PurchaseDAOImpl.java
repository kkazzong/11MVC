package com.model2.mvc.service.purchase.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseDAO;

@Repository("purchaseDAOImpl")
public class PurchaseDAOImpl implements PurchaseDAO {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	SqlSession sqlSession;
	
	public PurchaseDAOImpl() {
		System.out.println("::"+getClass()+"default constructor");
	}

	@Override
	public void addPurchase(Purchase purchase) throws Exception {
		sqlSession.insert("PurchaseMapper.addPurchase", purchase);
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		 List  list = sqlSession.selectList("PurchaseMapper.getPurchase", tranNo);
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 System.out.println(list);
		 return null;
	}

	@Override
	public List getPurchaseByProdNo(int prodNo) throws Exception {
		 List  list =  sqlSession.selectList("PurchaseMapper.getPurchaseByProdNo", prodNo);
		 System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		 System.out.println(list);
		 return list;
	}

//	@Override
//	public Purchase getPurchaseByProdNo(Purchase purchase) throws Exception {
//		return sqlSession.selectOne("PurchaseMapper.getPurchaseByProdNo", purchase);
//	}
	
	@Override
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", buyerId);
		return sqlSession.selectList("PurchaseMapper.getPurchaseList", map);
	}

	@Override
	public List<Purchase> getSaleList(Search search) throws Exception {
		return sqlSession.selectList("PurchaseMapper.getSaleList", search);
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updatePurchase", purchase);
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		sqlSession.update("PurchaseMapper.updateTranCode", purchase);
	}
	
	@Override
//	public int getTotalCount(Search search,String buyerId) throws Exception {
	public int getTotalCount(Map<String, Object> map) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("search", search);
//		map.put("userId", buyerId);
		return sqlSession.selectOne("PurchaseMapper.getTotalCount", map);
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

}
