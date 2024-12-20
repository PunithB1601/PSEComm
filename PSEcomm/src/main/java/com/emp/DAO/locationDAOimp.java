package com.emp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.ConnectionFactory;

import com.database.DBConnection;

import com.emp.DTO.Location;

public   class locationDAOimp implements locationDAO {
    private Connection con;

   
    public locationDAOimp() {
    	 this.con=DBConnection.getConnection();
	}
   
    @Override
    public boolean insertlocation(Location l) {
        String query = "INSERT INTO location (LOCATION, CITY, STATE) VALUES (?, ?, ?);"; 
        PreparedStatement ps =null;
		int res = 0;
		
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(query);
			
			ps.setString(1,l.getLocation());
			ps.setString(2,l.getCity());
			ps.setString(3,l.getState());
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
    }
    
    
    @Override
    public boolean updatelocation(Location l) {
    	PreparedStatement ps=null;
    	String query="update location set location=?,city=?,state=? where lid=?";
    	int res=0;
    	try {
    		con.setAutoCommit(false);
    		ps=con.prepareStatement(query);
    		
    		ps.setString(1, l.getLocation());
    		ps.setString(2, l.getCity());
    		ps.setString(3, l.getState());
    		ps.setInt(4, l.getLid());
    		
			res = ps.executeUpdate();
    	}
    	catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return false;
		}
    }


	@Override
	public boolean deletelocation(int lid) {
		
		String query = "DELETE FROM LOCATION WHERE LID=?";
		PreparedStatement ps =null;
		int res = 0;
		
		try {
			con.setAutoCommit(false);
			ps = con.prepareStatement(query);
			ps.setInt(1, lid);
			
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(res>0) {
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
	}
	

	@Override
	public List<Location> getlocation() {
		List<Location> locations = new ArrayList<Location>();
		
		String query = "SELECT * FROM location";
		PreparedStatement ps = null;
		ResultSet rs = null;
		Location l = null;
		
		try {
			ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				l = new Location();
				l.setLid(rs.getInt(1));
				l.setLocation(rs.getString(2));
				l.setCity(rs.getString(3));
				l.setState(rs.getString(4));
				locations.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return locations;
	}

	@Override
	public Location getLocation(int lid) {
		    Location l = null;
		    PreparedStatement ps = null;
		    ResultSet rs = null;
		    String query = "SELECT * FROM location WHERE lid = ?";
		    
		    try {
		        ps = con.prepareStatement(query);
		        ps.setInt(1, lid);
		        rs = ps.executeQuery();
		        
		        if (rs.next()) {
		            l = new Location();
		            l.setLid(rs.getInt(1));
		            l.setLocation(rs.getString(2));
		            l.setCity(rs.getString(3));
		            l.setState(rs.getString(4));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } 
		        
		    
		    return l;
		}

	@Override
	public boolean setlocation(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getCount() {
		String query = "SELECT COUNT(*) FROM LOCATION";
		PreparedStatement ps = null;
	    ResultSet rs = null;
	    int count = 0;
	    
	    try {
			ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
	}

}   

