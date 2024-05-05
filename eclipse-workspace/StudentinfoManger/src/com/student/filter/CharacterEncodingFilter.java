package com.student.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.utils.StringUtil;



@WebFilter( filterName = "CharacterEncodingFilter", value="/*",
			initParams = @WebInitParam(name="encoding", value="utf-8"))
public class CharacterEncodingFilter implements Filter{

	private String encoding = "utf-8";
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//转换
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		//给请求和响应是对象设置编码集
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);
		//链式调用下一个过滤器千万别漏写否则页面会一直停留在该过滤中后续操作无法进行
		chain.doFilter(req, resp);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//获取初始化参数
		String temp = filterConfig.getInitParameter("encoding");
		//判断
		if( !StringUtil.checkNull( temp )) {
			encoding = temp;
		}
	}
}
