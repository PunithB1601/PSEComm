package com.customer.dao;

import java.util.List;

import com.customer.dto.Customer;

public interface CustomerDAO {
	public Customer addCustomer(Customer c);
	public Customer getCustomer(int id);
	public Customer getCustomer(String email);
	public List<Customer> getAllCustomer();
	public Customer updateCustomer(Customer c);
	public boolean deleteCustomer(int id);
}
