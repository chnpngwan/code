package com.Intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.model.User;

public class LoginLntercepter implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String ctxPath = request.getContextPath();
        // 除掉项目名称时访问页面当前路径
		String currentURL = request.getRequestURI();
		String contextPath =currentURL.substring(ctxPath.length());
		if(contextPath.indexOf("/login.do")>=0||contextPath.indexOf("/register.do")>=0)
		{
			return true;
		}
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		if(user!=null) {
			return true;
		}
		System.out.println("2");
		request.setAttribute("loginMsg", "还未登录，请登录！");
		request.getRequestDispatcher("login.jsp").forward(request, response);
		return false;
	}

}
