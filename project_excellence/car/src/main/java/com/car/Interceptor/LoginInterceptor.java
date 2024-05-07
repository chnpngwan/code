package com.car.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.car.model.User;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception exception)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView exception)
			throws Exception {
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse  response,Object obj) throws Exception {
		// 获取请求的RUI地址:去除http:localhost:8080这部分剩下的
		String uri = request.getRequestURI();
		System.out.println(uri);
		System.out.println("错误信息"+uri.indexOf("/Login"));
		//必须大于0；否则直接跳了
		if (uri.indexOf("/Login") >= 0) {
			return true;
		}
		// 获取session
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if (user != null) {
			//判断是否登录
			return true;
		}
		System.out.println("3");
		// 不符合条件的给出提示信息，并转发到登录页面
		String Message ="您还没有登录，请先登录！";
		request.setAttribute("Message",Message );
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		return false;
	}
	}

