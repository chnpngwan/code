package servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utile.JDBCUtile;

/**
 * Servlet implementation class JDBCServlet
 */
@WebServlet("/JDBCServlet")
public class JDBCServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn=JDBCUtile.getConnection();
		if(conn != null) {
			System.out.println("连接成功");
		}else {
			System.out.println("连接失败");
		}
		
	}

}
