package com.book.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtils {
	static String url = "jdbc:mysql:///book_system?characterEncoding=UTF-8";
	static String user = "root";
	static String password = "root";
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConn() {
		try {
			return DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void closeConn(Connection conn,PreparedStatement smt,ResultSet rs) {
		try {
			if(conn!=null) {
				conn.close();
			}
			if(smt!=null) {
				smt.close();
			}
			if(rs!=null) {
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		System.out.println(DBUtils.getConn());
	}
}
