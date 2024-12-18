package com.customer.dao;

import java.util.List;
import com.customer.dto.Cart;

public interface CartDAO {

	public Cart insertCart(Cart c);
	public boolean deleteCart(Cart c);
	public Cart updateCart(Cart c);
	public Cart getCart(int id);
	public List<Cart> getCart();

}
