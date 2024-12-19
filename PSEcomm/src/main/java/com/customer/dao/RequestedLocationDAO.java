package com.customer.dao;

import java.util.List;

import com.customer.dto.Cart;
import com.customer.dto.RequestedLocation;

public interface RequestedLocationDAO {
	public RequestedLocation insertRequested_location(RequestedLocation r);
	public boolean deleteRequested_locationt(RequestedLocation r);
	public RequestedLocation getRequested_location(int req_id);
	public List<RequestedLocation> getRequested_location();

}
