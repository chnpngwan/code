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
		//���ñ��뼯
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//����������ò�ѯ����
		List<Book> bList = new BookDao().queryAllBook();
		//����ѯ�����������ø�jsp���ö���
		req.setAttribute("list", bList);
		//ָ������չʾ��ҳ��
		req.getRequestDispatcher("main.jsp").forward(req, resp);
	}

}
