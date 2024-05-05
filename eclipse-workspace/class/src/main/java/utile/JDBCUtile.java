package utile;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author ChnpngWng
 *
 * @date   Mar 3, 20238:45:02 AM
 */
public class JDBCUtile {
	private static final String DRIVERNAME="com.mysql.cj.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/db_task?characterEncoding=UTF-8";
	private static final String USER="root";
	private static final String PASSWORD="123456";
	
	private static Connection connection;
	private static PreparedStatement statement;
	private static ResultSet result;
	
	//加载驱动
	static {
		try {
			Class.forName(DRIVERNAME);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	//获得连接
	public static Connection getConnection() {
		if(connection == null) {
			try {
				connection=DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
//	关闭
	public static void close(Connection conn,PreparedStatement statement,ResultSet result) {
			try {
				if (result!=null) {
					result.close();
				}
				if (statement!=null) {
					statement.close();
				}
				if (conn!=null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
	}
	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
