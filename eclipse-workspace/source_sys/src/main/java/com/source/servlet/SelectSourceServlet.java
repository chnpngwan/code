package com.source.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.source.entity.Source;
import com.source.mapper.SourceMapper;
import com.source.utils.SqlSessionUtils;
@WebServlet("/show")
public class SelectSourceServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//���ñ��뼯
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//����ҳ�����
		String name = req.getParameter("name");
		//���÷���
		SqlSession session = SqlSessionUtils.init();
		SourceMapper sm = session.getMapper(SourceMapper.class);
		List<Source> sList = sm.queryInfo(name);
		//����ѯ������ø����ö���
		req.setAttribute("list", sList);
		//ָ��������ʾ��ҳ��
		req.getRequestDispatcher("main.jsp").forward(req, resp);
	}
}
