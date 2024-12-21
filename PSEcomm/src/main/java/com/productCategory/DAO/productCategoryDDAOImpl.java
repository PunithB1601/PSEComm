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
	public List getProductCategory() {
		String query = "SELECT * FROM PRODUCT_CATEGORY";
		List<ProductCategory> pList = new ArrayList<ProductCategory>();
		ResultSet rs = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			rs = ps.executeQuery();
			while(rs.next()){
				ProductCategory p = new ProductCategory();
				p.setCategoryId(rs.getInt(1));
				p.setName(rs.getString(2));
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

	
}
