package com.model2.mvc.service.purchase;


import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface PurchaseDAO {
	
	public Purchase addPurchase(Purchase purchase) throws Exception;
	
	public Purchase getPurchase(int tranNo) throws Exception;
	
	public Purchase getPurchaseByProdNo(int prodNo) throws Exception;
//	public Purchase getPurchaseByProdNo(Purchase purchase) throws Exception;
	
	public List<Purchase> getPurchaseList(Search search,String buyerId) throws Exception;
	
	public List<Purchase> getSaleList(Search search) throws Exception;
	
	public void updatePurchase(Purchase purchase) throws Exception;
	
	public void updateTranCode(Purchase purchase) throws Exception;
	
//	public int getTotalCount(Search search,String buyerId) throws Exception;
	public int getTotalCount(Map<String,Object> map) throws Exception;
}
