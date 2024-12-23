package com.productCategory.DTO;

public class ProductCategory {
 private int CategoryId;
 private String name;
 private String img;
 
public String getImg() {
	return img;
}
public void setImg(String img) {
	this.img = img;
}
public int getCategoryId() {
	return CategoryId;
}
public void setCategoryId(int categoryId) {
	CategoryId = categoryId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
 }
}
