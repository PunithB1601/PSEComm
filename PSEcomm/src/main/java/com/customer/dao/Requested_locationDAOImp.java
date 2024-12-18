package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.customer.dto.Requested_location;
import com.database.DBConnection;

public class Requested_locationDAOImp implements Requested_locationDAO {
	private Connection con;

	public Requested_locationDAOImp() {
		this.con = DBConnection.getConnection();
		
	}
	
	public Requested_location insertRequested_location(Requested_location r) {
		PreparedStatement ps = null;
		int res=0;
		String query = "INSERT INTO Requested_location(requested_location)VALUE(?)";
		try {
			ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			ps.setString(1,r.getRequested_location());
			
		 res=ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				ResultSet rs=ps.getGeneratedKeys();
				r.setReq_id(rs.getInt(1));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return r;
		}
		else
			return null;
	}

	@Override
	public boolean deleteRequested_locationt(Requested_location r) {
		PreparedStatement ps=null;

		String query="delete from Requested_location where req_id=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setInt(1, r.getReq_id());
			
			res=ps.executeUpdate();
			
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
	public Requested_location getRequested_location(int req_id) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Requested_location r=null;
		
		String query="select * from Requested_location where req_id=?";
	
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, req_id);
			rs=ps.executeQuery();
			while(rs.next()) {
				r=new Requested_location();
				r.setReq_id(rs.getInt(1));
				r.setRequested_location(rs.getString(2));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return r;
	}

	@Override
	public List<Requested_location> getRequested_location() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Requested_location r=null;
		ArrayList<Requested_location> a1=new ArrayList<Requested_location>();
		
		String query="select * from Requested_location order by desc";
	
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				r=new Requested_location();
				r.setReq_id(rs.getInt(1));
				r.setRequested_location(rs.getString(2));
				a1.add(r);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a1;
	}

}
