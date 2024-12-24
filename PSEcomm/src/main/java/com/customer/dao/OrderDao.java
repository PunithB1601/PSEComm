package com.customer.dao;

import java.util.List;

import com.customer.dto.Order;

public interface OrderDao {
	public Order insertOrder(Order o);
	public boolean deleteOrder(Order o);
	public Order UpdateOrder(Order o);
	public Order getOrder(int orderId);
	public List<Order> getOrder();
	
	//To get all Order for specific customer
	
	public List<Order> getAllOrders (int page ,int limit , int cid);
	public int getAllOrdersCount ( int cid);
	
	
	//To get orders of specific emp;
	
	public List<Order> getDispatcherOrders (int empId);
	public List<Order> getAllUnAssignedOrders ();
	

}
