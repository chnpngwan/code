package com.student.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class BaseServlet
 */
@WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8080/Goods/goods/finds  url
		String uri = request.getRequestURI();  //取得请求资源地址  /Goods/goods/finds
		String path = uri.substring(uri.lastIndexOf("/") + 1); //截取最后的路径  即处理的这个请求的方法
		System.out.println(uri + "--" + path);
		//先获取到这个Servlet中所有方法
		Method[] methods = this.getClass().getDeclaredMethods();
		//根据path找到对应的方法
		for(Method m : methods) {
			if(path.equals(m.getName())) {  //指令和方法名称一致
				//反向激活运行该方法
				try {
					m.invoke(this, request, response);
				} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
					e.printStackTrace();
				}
				return;
			}
		}
		this.error(request, response);
	}

	/**
	 * 资源地址问题的容错界面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void error(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//界面跳转  前端乱码
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		//http://localhost:8080/Goods/goods/finds  url
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
		out.print("");
	}
	
	
	/**
	 * 想要一个int状态码
	 * @param response
	 * @param code
	 * @throws IOException
	 */
	protected void send(HttpServletResponse response, int code) throws IOException {
		//Access-Control-Allow-Origin  解法瞭威
		response.setHeader ( "Access-Control-Allow-Origin", "*");
		//解决前端  XML解析错误  ： 格式不佳  告诉浏览器以普通文本返回
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print( code);
		out.flush();
		out.close();
	}
	
	/**
	 * 想要一个String状态码
	 * @param response
	 * @param code
	 * @throws IOException
	 */
	protected void send(HttpServletResponse response, String code) throws IOException {
		//Access-Control-Allow-Origin  解法瞭威
		response.setHeader ( "Access-Control-Allow-Origin", "*");
		//解决前端  XML解析错误  ： 格式不佳  告诉浏览器以普通文本返回
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print( code);
		out.flush();
		out.close();
	}
	
	/**
	 * 想要一个Object对象数据
	 * @param response
	 * @param obj对象数据
	 * @throws IOException
	 */
	protected void send(HttpServletResponse response, Object obj) throws IOException {
		//Access-Control-Allow-Origin  解法瞭威
		response.setHeader ( "Access-Control-Allow-Origin", "*");
		//解决前端  XML解析错误  ： 格式不佳  告诉浏览器以普通文本返回
		response.setContentType("text/html;charset=utf-8");
		//借助GSON  构建JSON数据
		//Gson gson = new Gson();  //属性值是null  无法显示  导致前台出现undefined
		//当配置了serializeNulls().create()之后 属性值为null 也能传递到前台  方便我们工作的调试
		Gson gson = new GsonBuilder().serializeNulls().create();
		PrintWriter out = response.getWriter();
		out.print( obj);
		out.flush();
		out.close();
	}
	
	protected void send(HttpServletResponse response, int code, Object data) throws IOException {
		//Access-Control-Allow-Origin  解法瞭威
		response.setHeader ( "Access-Control-Allow-Origin", "*");
	
		//解决前端  XML解析错误  ： 格式不佳  告诉浏览器以普通文本返回
		response.setContentType("text/html;charset=utf-8");
		//借助GSON  构建JSON数据
		//Gson gson = new Gson();  //属性值是null  无法显示  导致前台出现undefined
		//当配置了serializeNulls().create()之后 属性值为null 也能传递到前台  方便我们工作的调试
		Gson gson = new GsonBuilder().serializeNulls().create();
		PrintWriter out = response.getWriter();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", code);
		map.put("data", data);
		out.print( gson.toJson(map));
		out.flush();
		out.close();
	}
}
