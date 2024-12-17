package com.emp.DAO;

import com.emp.DTO.Product;

public interface ProductDAO 
{
	public boolean addProduct(Product p);
	public boolean deleteProduct(Product p);
}
