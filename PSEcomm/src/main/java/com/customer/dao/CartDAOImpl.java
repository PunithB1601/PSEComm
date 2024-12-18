package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.customer.dto.Cart;
import com.database.DBConnection;


public class CartDAOImpl implements CartDAO{
		
	private Connection con;
	public CartDAOImpl() {
		this.con=DBConnection.getConnection();
	}
	
	@Override
	public Cart insertCart(Cart c) {
		PreparedStatement ps=null;

		String query="insert into cart(cid,productid)values(?,?)";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			ps.setInt(1, c.getCid());
			ps.setInt(2, c.getProductId());
			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				ResultSet rs=ps.getGeneratedKeys();
				if (rs.next()) { // Ensure there's a key to retrieve
	                c.setCartId(rs.getInt(1));
	            }
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return c;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	}

	@Override
	public boolean deleteCart(Cart c) {
		PreparedStatement ps=null;

		String query="delete from cart where cartid=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			
			ps.setInt(1, c.getCartId());
			
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
	public Cart updateCart(Cart c) {
		PreparedStatement ps=null;

		String query="update cart set cid=?,productid=? where cartid=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			
			ps.setInt(1,c.getCid());
			ps.setInt(2,c.getProductId());
			ps.setInt(3,c.getCartId());
			
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
			return c;
		}
		else {
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
		
	

	@Override
	public Cart getCart(int id) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Cart c=null;
		
		String query="select * from cart where cartid=?";
	
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCartId(rs.getInt(1));
				c.setCid(rs.getInt(2));
				c.setProductId(rs.getInt(3));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public List<Cart> getCart() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Cart c=null;
		List<Cart> li=new ArrayList<Cart>();
		
		String query="select * from cart order by desc";
	
		try {
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next()) {
				c=new Cart();
				c.setCartId(rs.getInt(1));
				c.setCid(rs.getInt(2));
				c.setProductId(rs.getInt(3));
				li.add(c);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

}
