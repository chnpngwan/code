package com.source.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.source.mapper.SourceMapper;
import com.source.utils.SqlSessionUtils;
@WebServlet("/deleteById")
public class DeleteByIdServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//����ID
		int id = Integer.parseInt(req.getParameter("id"));
		//���÷���ɾ������
		SqlSession session = SqlSessionUtils.init();
		SourceMapper sm = session.getMapper(SourceMapper.class);
		sm.delSourceById(id);
		//�ύ����
		session.commit();
		//������ת
		resp.sendRedirect("show");
		//�ر���
		session.close();
	}
}
