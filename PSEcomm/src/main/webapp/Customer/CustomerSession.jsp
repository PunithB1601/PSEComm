<%@page import="com.customer.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 
 Customer customer = (Customer) session.getAttribute("user");
 
%>

