package com.book.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDao;
import com.book.model.Book;
@WebServlet("/show")
public class ShowBookServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码集
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//创建对象调用查询方法
		List<Book> bList = new BookDao().queryAllBook();
		//将查询到的数据设置给jsp内置对象
		req.setAttribute("list", bList);
		//指定数据展示的页面
		req.getRequestDispatcher("main.jsp").forward(req, resp);
	}

}
