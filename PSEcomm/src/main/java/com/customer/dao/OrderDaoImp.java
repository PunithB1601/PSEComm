package com.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.customer.dto.Order;
import com.database.DBConnection;

public class OrderDaoImp implements OrderDao{
	private Connection con;

	public OrderDaoImp() {
		this.con = DBConnection.getConnection();
		
	}
	
	public Order insertOrder(Order o) {
		PreparedStatement ps = null;
		int res=0;
		String query = "INSERT INTO Order(productId,orderDate, deliveryDate,eid,cid)VALUES(?,sysdate(),date_Add(sysdate(),interval 5 day),?,?)";
		try {
			ps = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			
			ps.setInt(1,o.getProductId());
			ps.setTimestamp(2,o.getOrderDate());
			ps.setTimestamp(3,o.getDeliveryDate());
			ps.setInt(4,o.getEid());
			ps.setInt(5, o.getCid());
		 res=ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				ResultSet rs=ps.getGeneratedKeys();
				o.setOrderId(rs.getInt(1));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return o;
		}
		else
			return null;
	}

	@Override
	public boolean deleteOrder(Order o) {
		PreparedStatement ps=null;

		String query="delete from order where orderId=?";
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setLong(1, o.getOrderId());
			
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
	public Order UpdateOrder(Order o) {
		PreparedStatement ps=null;

		String query="update order set productId=?,orderDate=?,deliveryDate=?,eid=?,cid=? where orderId=?";
		
		int res=0;
		
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setInt(1,o.getProductId());
			ps.setTimestamp(2,o.getOrderDate());
			ps.setTimestamp(3,o.getDeliveryDate());
			ps.setInt(4,o.getEid());
			ps.setInt(5, o.getCid());
			ps.setInt(6, o.getOrderId());
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
			return o;
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
	public Order getOrder(int orderId) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Order o=null;
		
		String query="select * from order where orderid=?";
	
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, orderId);
			rs=ps.executeQuery();
			while(rs.next()) {
				o=new Order();
				o.setOrderId(rs.getInt(1));
				o.setProductId(rs.getInt(2));
				o.setOrderDate(rs.getTimestamp(3));
				o.setDeliveryDate(rs.getTimestamp(4));
				o.setEid(rs.getInt(5));
				o.setCid(rs.getInt(6));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return o;
	}
	

	@Override
	public List<Order> getOrder() {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Order o=null;
		ArrayList<Order> al=new ArrayList<Order>();
		
		String query="select * from order order by desc";
	
		try {
			ps=con.prepareStatement(query);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				o=new Order();
				o.setOrderId(rs.getInt(1));
				o.setProductId(rs.getInt(2));
				o.setOrderDate(rs.getTimestamp(3));
				o.setDeliveryDate(rs.getTimestamp(4));
				o.setEid(rs.getInt(5));
				o.setCid(rs.getInt(6));
				al.add(o);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return al;
	}

}
