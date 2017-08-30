package com.model2.mvc.service.domain;

public class Stock {
	
	private int stockNo;
	private int stocks;
	private Product product;
	private Purchase purchase;
	
	public Stock() {
		// TODO Auto-generated constructor stub
	}

	public int getStockNo() {
		return stockNo;
	}

	public int getStocks() {
		return stocks;
	}

	public Product getProduct() {
		return product;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	public void setStocks(int stocks) {
		this.stocks = stocks;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	@Override
	public String toString() {
		return "Stock [stockNo=" + stockNo + ", stocks=" + stocks + ", product=" + product + ", purchase=" + purchase
				+ "]";
	}
	
	

}