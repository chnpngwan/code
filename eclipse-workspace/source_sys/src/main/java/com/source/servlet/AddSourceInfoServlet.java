package com.source.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.source.entity.Source;
import com.source.mapper.SourceMapper;
import com.source.utils.SqlSessionUtils;
@WebServlet("/addSourceInfo")
public class AddSourceInfoServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//设置编码集
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		//接收页面信息
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		String buyDates = req.getParameter("buyDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date buyDate = null;
		try {
			buyDate = sdf.parse(buyDates);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		int price = Integer.parseInt(req.getParameter("price"));
		//封装数据
		Source source = new Source(0, name, type, buyDate, price);
		//调用方法
		SqlSession session = SqlSessionUtils.init();
		SourceMapper sm = session.getMapper(SourceMapper.class);
		sm.addSourceInfo(source);
		//提交数据
		session.commit();
		//跳转页面
		resp.sendRedirect("show");
		//关闭流
		session.close();
	}

}
