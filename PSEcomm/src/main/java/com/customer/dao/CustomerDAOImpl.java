package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.customer.dto.Customer;
import com.database.DBConnection;

public class CustomerDAOImpl implements CustomerDAO {
	private Connection con;
	
	public CustomerDAOImpl() {
		this.con=DBConnection.getConnection();
	}

	@Override
	public Customer addCustomer(Customer c) {
		String query = "insert into customer(first_name,last_name,email,password,phone)values(?,?,?,?,?)";
		int res = 0;
		
		PreparedStatement ps=null;
		try{
			ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, c.getFirstName());
			ps.setString(2, c.getLastName());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getPassword());
			ps.setLong(5, c.getPhone());
			res = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.getMessage();
		}
		
		if (res > 0) {
			
			try {
				ResultSet rs = ps.getGeneratedKeys();
				if (rs.next()) { 
					c.setCid(rs.getInt(1));
	            }
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return c;
		} else {
			return null;
		}

	}

	@Override
	public Customer getCustomer(int id) {
		String query = "SELECT * FROM CUSTOMER WHERE ID = ?";
		ResultSet rs = null;
		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer c = new Customer();
				c.setCid(rs.getInt("CID"));
				c.setFirstName(rs.getString("FIRST_NAME"));
				c.setLastName(rs.getString("LAST_NAME"));
				c.setLid(rs.getInt("LID"));
				c.setEmail(rs.getString("EMAIL"));
				c.setPassword(rs.getString("PASSWORD"));
				c.setPhone(rs.getLong("PHONE"));
				return c;
			}

		} catch (SQLException e) {
			e.getMessage();
		}
		return null;
	}

	@Override
	public Customer getCustomer(String email) {
		String query = "SELECT * FROM CUSTOMER WHERE EMAIL = ?";
		ResultSet rs = null;
		try (PreparedStatement ps = con.prepareStatement(query)) {
			ps.setString(1, email);
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer c = new Customer();
				c.setCid(rs.getInt("CID"));
				c.setFirstName(rs.getString("FIRST_NAME"));
				c.setLastName(rs.getString("LAST_NAME"));
				c.setLid(rs.getInt("LID"));
				c.setEmail(rs.getString("EMAIL"));
				c.setPassword(rs.getString("PASSWORD"));
				c.setPhone(rs.getLong("PHONE"));
				return c;
			}

		} catch (SQLException e) {
			e.getMessage();
		}
		return null;
	}

	@Override
	public List<Customer> getAllCustomer() {
		String query = "SELECT * FROM CUSTOMER";
		List<Customer> custList = new ArrayList<Customer>();
		ResultSet rs = null;
		try (PreparedStatement ps = con.prepareStatement(query)) {
			rs = ps.executeQuery();
			while (rs.next()) {
				Customer c = new Customer();
				c.setCid(rs.getInt("CID"));
				c.setFirstName(rs.getString("FIRST_NAME"));
				c.setLastName(rs.getString("LAST_NAME"));
				c.setLid(rs.getInt("LID"));
				c.setEmail(rs.getString("EMAIL"));
				c.setPassword(rs.getString("PASSWORD"));
				c.setPhone(rs.getLong("PHONE"));
				custList.add(c);
			}

		} catch (SQLException e) {
			e.getMessage();
		}
		return custList;
	}

	@Override
	public Customer updateCustomer(Customer c) {
		String query = "UPDATE CUSTOMER SET FIRST_NAME = ?,LAST_NAME=?,EMAIL=?,PASSWORD=?,PHONE=? WHERE CID = ?";
		int count = 0;
		
		try(PreparedStatement ps = con.prepareStatement(query);){
			ps.setString(1, c.getFirstName());
			ps.setString(2, c.getLastName());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getPassword());
			ps.setLong(5, c.getPhone());
			ps.setInt(6, c.getCid());
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.getMessage();
		}
		if(count > 0) {
			return c;
		} else {
			return null;
		}
		
	}

	@Override
	public boolean deleteCustomer(int id) {
		String query = "DELETE FROM CUSTOMER WHERE CID = ?";
		int count = 0;
		
		try(PreparedStatement ps = con.prepareStatement(query)){
			ps.setInt(1, id);
			count = ps.executeUpdate();
		} catch (SQLException e) {
			e.getMessage();
		}
		if(count > 0) {
			return true;
		} else {
			return false;
		}
		
	}

}
