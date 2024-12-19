package com.customer.dao;

import java.util.List;

import com.customer.dto.Order;

public interface OrderDao {
	public Order insertOrder(Order o);
	public boolean deleteOrder(Order o);
	public Order UpdateOrder(Order o);
	public Order getOrder(int orderId);
	public List<Order> getOrder();
	

}
