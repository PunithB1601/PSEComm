package com.emp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.database.DBConnection;
import com.emp.DTO.Product;

public class ProductDAOImp implements ProductDAO
{
	private Connection con=null;
	
	public ProductDAOImp() {
		this.con=DBConnection.getConnection();
	}
	
	@Override
	public boolean addProduct(Product p) 
	{
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO PRODUCT VALUES(?,?,?,?,?)";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setInt(1, p.getProduct_Id());
			ps.setString(2, p.getProducr_Name());
			ps.setDouble(3, p.getPrice());
			ps.setString(4, p.getImg());
			ps.setInt(5, p.getCategory_Id());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		else
		{
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	}

	@Override
	public boolean deleteProduct(Product p) 
	{
		PreparedStatement ps=null;
		int res=0;
		String query="DELETE FROM PRODUCT WHERE PRODUCT_ID=?";
		try 
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setInt(1, p.getProduct_Id());
			res=ps.executeUpdate();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}
		else
		{
			try {
				con.rollback();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return false;
		}
	}

}
