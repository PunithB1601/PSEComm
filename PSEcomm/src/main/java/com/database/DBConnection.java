package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection
{
	static String url = "jdbc:mysql://localhost:3306/ecommerce";
	static String username = "root";
	static String password = "sahana1430#$";

	static Connection conn = null;

	public static Connection getConnection() {

		if (conn == null) 
		{
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn = DriverManager.getConnection(url, username, password);
			} catch (ClassNotFoundException | SQLException e) 
			{
				e.printStackTrace();
			}
		}
		return conn;
	}
}
