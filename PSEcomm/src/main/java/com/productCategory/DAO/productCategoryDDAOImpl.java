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

}
