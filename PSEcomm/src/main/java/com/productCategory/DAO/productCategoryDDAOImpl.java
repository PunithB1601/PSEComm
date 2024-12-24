package com.productCategory.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.customer.dto.Customer;
import com.database.DBConnection;
import com.productCategory.DTO.ProductCategory;

public class productCategoryDDAOImpl implements productCategoryDAO  {

private Connection con;
	
	public productCategoryDDAOImpl() {
		this.con=DBConnection.getConnection();
	}
	
	@Override
		public ProductCategory getById(int id) {
			String query="SELECT * FROM PRODUCT_CATEGORY WHERE CATEGORYID=?";
			try {
				PreparedStatement preparedStatement= con.prepareStatement(query);
				preparedStatement.setInt(1, id);
				ResultSet resultSet= preparedStatement.executeQuery();
				if(resultSet.next())
				{
					ProductCategory productCategory= new ProductCategory();
					productCategory.setCategoryId(resultSet.getInt(1));
					productCategory.setName(resultSet.getString(2));
					productCategory.setImg(resultSet.getString(3));
					return productCategory;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
	

	@Override
	public List getProductCategory() {
		String query = "SELECT * FROM PRODUCT_CATEGORY ORDER BY CATEGORYID DESC";
		List<ProductCategory> pList = new ArrayList<ProductCategory>();
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()){
				ProductCategory p = new ProductCategory();
				p.setCategoryId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setImg(rs.getString(3));
				pList.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return pList;
	}

	@Override
	public List getProductCategoryById(int categoryId) {
		List<ProductCategory> categories = new ArrayList<>();
	    String sql = "SELECT name FROM product_category WHERE CATEGORYID = ?";
	    PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			 ps.setInt(1, categoryId);
			    ResultSet rs = ps.executeQuery();

			    while (rs.next()) {
			        ProductCategory category = new ProductCategory();
			        category.setName(rs.getString("name"));
			        categories.add(category);
			    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
	    return categories;
	}

	@Override
	public boolean insertCategory(ProductCategory p) {
		String query = "INSERT INTO product_category (name,product_image) VALUES(?,?)";
		int res = 0;
		PreparedStatement ps;
		
		
        try {
        	con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1,p.getName());
			ps.setString(2, p.getImg());
			
			res=ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        if(res>0) {
        	try {
				con.commit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	return true;
        }
        else {
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
	public List getImage(int categoryId) {
		List<ProductCategory> images = new ArrayList<>();
		String sql = "SELECT product_image FROM product_category WHERE CATEGORYID = ?";
	    PreparedStatement ps = null;
	    
	    
	    try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, categoryId);
		    ResultSet rs = ps.executeQuery();
		    
		    while(rs.next()) {
		    	ProductCategory p = new ProductCategory();
		    	p.setImg(rs.getString("product_image"));
		    	images.add(p); 	
		    }
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return images;
	}

	@Override
	public ProductCategory AddCategory(ProductCategory p) {
		PreparedStatement ps=null;
		int res=0;

		String query="INSERT INTO product_category (NAME,PRODUCT_IMAGE) VALUES(?,?)";
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1, p.getName());
			ps.setString(2, p.getImg());
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
	
	
}
