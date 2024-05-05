package com.book.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDao;
@WebServlet("/deleteById")
public class DeleteBookServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//����ҳ���е�ID
		int id = Integer.parseInt(req.getParameter("id"));
		//�������󣬵���ɾ������
		boolean flag = new BookDao().delById(id);
		//�ж�ɾ�����
		if(flag) {
			req.setAttribute("success", "����ɾ���ɹ���");
			resp.sendRedirect("show");//���½���ȫ���ѯ
		}else {
			req.setAttribute("erro", "����ɾ��ʧ�ܣ�");
			req.getRequestDispatcher("error.jsp").forward(req, resp);
		}
	}

}
