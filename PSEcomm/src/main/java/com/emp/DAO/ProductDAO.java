package com.emp.DAO;

import java.util.List;

import com.emp.DTO.Product;

public interface ProductDAO 
{
	public Product addProduct(Product p);
	public boolean deleteProduct(Product p);
	public Product getProduct(int product_id);
	public List getproducts();
}
