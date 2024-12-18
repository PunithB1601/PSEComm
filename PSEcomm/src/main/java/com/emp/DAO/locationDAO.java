package com.emp.DAO;


import com.emp.DTO.Location;

import java.util.List;

public interface locationDAO {
	public boolean insertlocation(Location l);
	public boolean updatelocation(Location l);
	public boolean setlocation(int id);
	public boolean deletelocation(Location l);
	public List <Location> getlocation();
	

}
