package com.bank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bank.entity.User;

@Component
public class LoginInterceptor implements HandlerInterceptor{

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
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object obj) throws Exception {
		//获取请求地址
		String url = req.getRequestURI();
		//通过地址判断是否进行登录
		if(url.indexOf("/login")>0) {
			return true;
		}
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("userInfo");
		if(user!=null) {
			return true;
		}
		//不符合登录条件
		req.setAttribute("errMsg", "你还没有登录，请先登录！");
		req.getRequestDispatcher("login.jsp").forward(req, resp);
		return false;
	}

	

}
