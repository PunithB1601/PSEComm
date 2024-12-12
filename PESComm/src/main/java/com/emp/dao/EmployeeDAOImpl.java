package com.emp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.emp.connectors.ConnectionFactory;
import com.emp.dto.Employee;

public class EmployeeDAOImpl implements EmployeeDAO {
	
	private Connection con;
	
	public EmployeeDAOImpl() {
		this.con=ConnectionFactory.requestConnection();
	}

	@Override
	public boolean InsertEmp(Employee e) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		String query="INSERT INTO EMP VALUES (0,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int res=0;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, e.getFname());
			ps.setString(2, e.getLnane());
			ps.setString(3, e.getDOB());
			ps.setString(4,e.getGender());
			ps.setString(5,e.getJob());
			ps.setInt(6,e.getMGR());
			ps.setString(7,e.getDOJ());
			ps.setFloat(8,e.getSal());
			ps.setFloat(9,e.getComm());
			ps.setInt(10,e.getDno());
			ps.setInt(11,e.getCid());
			ps.setString(12,e.getEmailid());
			ps.setLong(13, e.getPhone());
			ps.setString(14,e.getPassword());
			
		    res=ps.executeUpdate();
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(res>0) 
		  { 
		   return true; 
		  } 
		  else 
		  { 
		   return false; 
		  }
	}

	
	
	
	
	
	@Override
	public boolean updateEmp(Employee e) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		String query="UPDATE EMP SET EMAILID=? PHONE=? PASSWORD=? WHERE ID=?";
		int res=0;
		
		try {
			ps=con.prepareStatement(query);
			ps.setString(1, e.getEmailid());
			ps.setLong(2, e.getPhone());
			ps.setString(3, e.getPassword());
			ps.setInt(4, e.getCid());
			res=ps.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(res>0) {
			return true;
		}else {
			return false;
		}
		
	}

	
	
	
	@Override
	public boolean deleteEmp(Employee e) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Employee getEmp(String emailid, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Employee> getEmp() {
		// TODO Auto-generated method stub
		return null;
	}

}
