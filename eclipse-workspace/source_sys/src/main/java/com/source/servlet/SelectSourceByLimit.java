package com.source.servlet;

import java.io.IOException;
import java.util.HashMap;
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
@WebServlet("/limitShow")
public class SelectSourceByLimit extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码集
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//接收页码数据
		int start = Integer.parseInt(req.getParameter("index"));
		//调用方法
		SqlSession session = SqlSessionUtils.init();
		SourceMapper sc = session.getMapper(SourceMapper.class);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("startIndex", start);
        map.put("pageSize", 2);
		List<Source> list = sc.getSourceLimit(map);
		//设置值并指定显示页面
		req.setAttribute("list", list);
		req.getRequestDispatcher("main.jsp").forward(req, resp);
		//关闭流
		session.close();
	}

}
