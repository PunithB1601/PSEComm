package com.customer.dao;

import java.util.List;

import com.customer.dto.Cart;
import com.customer.dto.Requested_location;

public interface Requested_locationDAO {
	public Requested_location insertRequested_location(Requested_location r);
	public boolean deleteRequested_locationt(Requested_location r);
	public Requested_location getRequested_location(int req_id);
	public List<Requested_location> getRequested_location();

}
