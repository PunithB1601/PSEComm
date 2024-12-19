package com.emp.DTO;

public class Product 
{
	private int product_Id;
	private String producr_Name;
	private double price;
	private String img;
	private int category_Id;
	public Product(int product_Id, String producr_Name, double price, String img, int category_Id) {
		super();
		this.product_Id = product_Id;
		this.producr_Name = producr_Name;
		this.price = price;
		this.img = img;
		this.category_Id = category_Id;
	}
	
	public Product() {
		super();
	}

	public int getProduct_Id() {
		return product_Id;
	}
	public void setProduct_Id(int product_Id) {
		this.product_Id = product_Id;
	}
	public String getProducr_Name() {
		return producr_Name;
	}
	public void setProducr_Name(String producr_Name) {
		this.producr_Name = producr_Name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getCategory_Id() {
		return category_Id;
	}
	public void setCategory_Id(int category_Id) {
		this.category_Id = category_Id;
	}

	@Override
	public String toString() {
		return "Product [product_Id=" + product_Id + ", producr_Name=" + producr_Name + ", price=" + price + ", img="
				+ img + ", category_Id=" + category_Id + "]";
	}
	
}
