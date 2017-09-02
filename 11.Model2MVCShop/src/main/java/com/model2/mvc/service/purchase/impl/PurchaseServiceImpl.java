package com.model2.mvc.service.purchase.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseDAO;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.stock.StockService;

@Service("purchaseServiceImpl")
public class PurchaseServiceImpl implements PurchaseService {
	
	@Autowired
	@Qualifier("purchaseDAOImpl")
	PurchaseDAO purchaseDAO;
	
	@Autowired
	@Qualifier("stockServiceImpl")
	StockService stockService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	ProductService productService;
	
	public PurchaseServiceImpl() {
		System.out.println("::"+getClass()+"default constructor");
	}

	@Override
	public Purchase addPurchase(Purchase purchase) throws Exception {
		
		/*Product product = purchase.getPurchaseProd();
		int sale = product.getProdStock() - purchase.getSaleCount();
		product.setProdStock(sale);
		productService.updateProduct(product);
		
		if(sale == 0) {
			purchase.setTranCode("4");
		} else {
			purchase.setTranCode("1");
		}
		*/
		purchaseDAO.addPurchase(purchase);
//		return purchaseDAO.getPurchaseByProdNo(purchase.getPurchaseProd().getProdNo());
		return null;
	}

	@Override
	public Purchase getPurchase(int tranNo) throws Exception {
		return purchaseDAO.getPurchase(tranNo);
	}

//	@Override
//	public Purchase getPurchaseByProdNo(Purchase purchase) throws Exception {
//		return purchaseDAO.getPurchaseByProdNo(purchase);
//	}
	
	@Override
	public Purchase getPurchaseByProdNo(int prodNo) throws Exception {
		List<Purchase> list =  purchaseDAO.getPurchaseByProdNo(prodNo);
		return null;
	}

	@Override
	public Map<String, Object> getPurchaseList(Search search, String buyerId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("purchaseList", purchaseDAO.getPurchaseList(search, buyerId));
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("search", search);
		tempMap.put("userId", buyerId);
		map.put("totalCount", purchaseDAO.getTotalCount(tempMap));
		return map;
	}

	@Override
	public Map<String, Object> getSaleList(Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("saleList", purchaseDAO.getSaleList(search));
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("search", search);
//		tempMap.put("userId", buyerId);
		map.put("totalCount", purchaseDAO.getTotalCount(tempMap));
		return map;
	}

	@Override
	public void updatePurchase(Purchase purchase) throws Exception {
		purchaseDAO.updatePurchase(purchase);
	}

	@Override
	public void updateTranCode(Purchase purchase) throws Exception {
		purchaseDAO.updateTranCode(purchase);
	}

	public void setPurchaseDAO(PurchaseDAO purchaseDAO) {
		this.purchaseDAO = purchaseDAO;
	}

	
}
