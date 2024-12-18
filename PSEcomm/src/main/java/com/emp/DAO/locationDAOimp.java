package com.emp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.ConnectionFactory;

import com.database.DBConnection;

import com.emp.DTO.Location;






public   class locationDAOimp implements locationDAO {
    private Connection con;

    
    public void EmployeeDAOImp()
    {
        this.con=DBConnection.getConnection();
    }
    @Override
    public boolean insertlocation(Location l) {
        String query = "INSERT INTO location (Location, City, State) VALUES (?, ?, ?);"; 
        PreparedStatement ps = null;
        int res1 = 0;

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, l.getLocation());  // Set location
            ps.setString(2, l.getCity());      // Set city
            ps.setString(3, l.getState());     // Set state
            res1 = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res1 > 0; 
    }
    @Override
    public boolean updatelocation(Location l) {
    	PreparedStatement ps=null;
    	String query="update location set location=?,city=?,state=? where id=?";
    	int res=0;
    	try {
    		con.setAutoCommit(false);
    		ps=con.prepareStatement(query);
    		ps.setString(3, l.getLocation());
			ps.setString(4, l.getCity());
			ps.setString(5, l.getState());
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
	public boolean setlocation(int id) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		Location l=null;
		String query="SELECT * FROM location WHERE id=?  ";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
			l=new Location();
			l.setLocation( rs.getString("Location"));
			l.setCity ( rs.getString("City"));
			l.setState(rs.getString("State"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public boolean deletelocation(Location l) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		ResultSet rs=null;
		String query="delete from location where location=?";
		int res=0;
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, l.getLocation());
			res=ps.executeUpdate();
			if(res>0) {
			return true;
		}else {
			return false;
		}
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return false;
	}

	@Override
	public List<Location> getlocation() {
		// TODO Auto-generated method stub
		return null;
	}

        
            
    }

