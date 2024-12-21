package com.emp.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.database.DBConnection;
import com.emp.DTO.Product;
import com.productCategory.DAO.productCategoryDAO;
import com.productCategory.DAO.productCategoryDDAOImpl;
import com.productCategory.DAO.productCategoryDDAOImpl;
import com.productCategory.DTO.ProductCategory;

public class ProductDAOImp implements ProductDAO
{
	private Connection con=null;
	
	public ProductDAOImp() {
		this.con=DBConnection.getConnection();
	}
	
	@Override
	public Product addProduct(Product p) 
	{
		PreparedStatement ps=null;
		int res=0;
		String query="INSERT INTO PRODUCT (PNAME,PRICE,IMG,CATEGORYID) VALUES(?,?,?,?)";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, p.getProducr_Name());
			ps.setDouble(2, p.getPrice());
			ps.setString(3, p.getImg());
			ps.setInt(4, p.getCategory_Id());
			res=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(res>0)
		{
			try {
				con.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return p;
		}
		else
		{
			try {
				con.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
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

	@Override
	public Product getProduct(int product_id) {
		// TODO Auto-generated method stub
		PreparedStatement ps=null;
		Product p=null;
		ResultSet rs=null;
		String query="SELECT * FROM PRODUCT WHERE PRODUCT_ID=?";
		try {
			ps=con.prepareStatement(query);
			ps.setInt(1, product_id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				p=new Product();
				p.setProduct_Id(rs.getInt(1));
				p.setProducr_Name(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setImg(rs.getString(4));
				p.setCategory_Id(rs.getInt(5));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public List getproducts() {
		// TODO Auto-generated method stub
		ArrayList<Product>products=new ArrayList<Product>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		Product p=null;
		String query="SELECT * FROM PRODUCT";
		try 
		{
			ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				p=new Product();
				p.setProduct_Id(rs.getInt(1));
				p.setProducr_Name(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setImg(rs.getString(4));
				p.setCategory_Id(rs.getInt(5));
				products.add(p);
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}
	
	
	@Override
	public List<Product> getProductAndCategorys() {
	    ArrayList<Product> products = new ArrayList<Product>();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Product p = null;
	    // Modify the query to join PRODUCT table with product_category table
	    String query = "SELECT p.PRODUCT_ID, p.PNAME, p.PRICE, p.IMG, p.categoryId, c.name AS category_name FROM PRODUCT p JOIN product_category c ON p.categoryId = c.categoryId";
;
	    try {
	        ps = con.prepareStatement(query);
	        rs = ps.executeQuery();
	        while (rs.next()) {
	            p = new Product();
	            p.setProduct_Id(rs.getInt("PRODUCT_ID"));
	            p.setProducr_Name(rs.getString("PNAME"));
	            p.setPrice(rs.getDouble("PRICE"));
	            p.setImg(rs.getString("IMG"));
	            p.setCategory_Id(rs.getInt("categoryId"));
	            p.setCategory_Name(rs.getString("category_name")); // Directly get the category name from the query

	            products.add(p);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return products;
	}

	
}
