package com.model2.mvc.service.domain;

public class Stock {
	
	private int stockNo;
	private int stocks;
	private Product product;
	
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

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}

	public void setStocks(int stocks) {
		this.stocks = stocks;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Stock [stockNo=" + stockNo + ", stocks=" + stocks + ", product=" + product + "]";
	}

	
	

}
