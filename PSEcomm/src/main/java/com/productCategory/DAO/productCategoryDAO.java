package com.productCategory.DAO;

import java.util.List;

import com.productCategory.DTO.ProductCategory;

public interface productCategoryDAO {
 public List getProductCategory();
 public ProductCategory getById(int id);
}
