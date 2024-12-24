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

		String query="INSERT INTO PRODUCT (PNAME,PRICE,IMG,CATEGORYID,DESCRIPTION) VALUES(?,?,?,?,?)";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, p.getProducr_Name());
			ps.setDouble(2, p.getPrice());
			ps.setString(3, p.getImg());
			ps.setInt(4, p.getCategory_Id());
			ps.setString(5, p.getDescription());
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
				p.setDescription(rs.getString(6));
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
		String query="SELECT * FROM PRODUCT ORDER BY PRODUCT_ID DESC";
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
				p.setDescription(rs.getString(6));
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
	public List getAllProducts(int categoryId, int page, int limit) {
		List<Product>products=new ArrayList<Product>();
		ResultSet rs=null;
		Product p=null;
		String query=null;
		int skip =  (page -1 ) * limit;
		if(categoryId !=-1)
		{
			query = "select * from product where categoryId = ? order by product_id desc limit ? offset ?";
		}else {
			query = "select * from product  order by product_id desc limit ? offset ?";
		}
		try 
		{
			PreparedStatement ps=con.prepareStatement(query);
			
			if(categoryId==-1)
			{
				ps.setInt(1, limit);
				ps.setInt(2, skip);
			}else {
				ps.setInt(1, categoryId);
				ps.setInt(2, limit);
				ps.setInt(3, skip);
			}
			
			rs=ps.executeQuery();
			while(rs.next())
			{
				p=new Product();
				p.setProduct_Id(rs.getInt(1));
				p.setProducr_Name(rs.getString(2));
				p.setPrice(rs.getDouble(3));
				p.setImg(rs.getString(4));
				p.setCategory_Id(rs.getInt(5));
				p.setDescription(rs.getString(6));
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
	public int getAllProductsCount(int categoryId) {
		ResultSet rs=null;
		Product p=null;
		String query=null;
		if(categoryId !=-1)
		{
			query = "select COUNT(*) from product where categoryId = ? ";
		}else {
			query = "select COUNT(*) from product  ";
		}
		try 
		{
			PreparedStatement ps=con.prepareStatement(query);
			
			if(categoryId!=-1)
			{
				ps.setInt(1, categoryId);
			}
			rs=ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt(1);
			}
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	@Override
	public List<Product> getSimilarProducts(Product p) {
		String query = "SELECT * FROM PRODUCT WHERE CATEGORYID=? AND PRODUCT_ID!=? ORDER BY PRODUCT_ID DESC LIMIT 10";
		List<Product> similarProducts = new ArrayList<Product>();
		
		try {
			PreparedStatement preparedStatement = con.prepareStatement(query);
			preparedStatement.setInt(1, p.getCategory_Id());
			preparedStatement.setInt(2, p.getProduct_Id());
			ResultSet resultSet =  preparedStatement.executeQuery();
			while(resultSet.next())
			{
				Product newProduct = getProduct(resultSet.getInt(1));
				similarProducts.add(newProduct);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return similarProducts;
	}
	
	public List<Product> getProductAndCategorys() {
	    ArrayList<Product> products = new ArrayList<Product>();
	    PreparedStatement ps = null;
	    ResultSet rs = null;
	    Product p = null;
	    // Modify the query to join PRODUCT table with product_category table
	    String query = "SELECT p.PRODUCT_ID, p.PNAME, p.PRICE, p.IMG, p.categoryId,p.description ,c.name AS category_name FROM PRODUCT p JOIN product_category c ON p.categoryId = c.categoryId";;
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
	            p.setDescription("description");
	            products.add(p);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return products;
	}

	
}
