package com.student.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.bean.ClassInfo;
import com.student.bean.StudentInfo;
import com.student.bean.TeacherInfo;
import com.student.biz.impl.ClassInfoBizImpl;
import com.student.biz.impl.IClassInfoBiz;
import com.student.biz.impl.ITeacherInfoBiz;
import com.student.biz.impl.TeacherInfoBizImpl;
import com.student.dao.IClassInfoDAO;
import com.student.dao.ITeacherInfoDAO;
import com.student.dao.impl.ClassInfoDAOImpl;
import com.student.dao.impl.TeacherInfoDAOImpl;
import com.student.utils.SessionKeys;

/**
 * Servlet implementation class TeacherInfoController
 */
@WebServlet("/teacher/tea/*")
public class TeacherInfoController extends BaseServlet {
	private static final long serialVersionUID = 1L;
     
	protected void getGradeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTTEALOGINACCOUNT);
		System.out.println(obj);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		String s_name = request.getParameter("s_name");
		String s_id = request.getParameter("s_id");
		String name = request.getParameter("name");
		String c_name = request.getParameter("c_name");
		String order = request.getParameter("order");
		TeacherInfo t = (TeacherInfo) obj;
		ITeacherInfoBiz biz = new TeacherInfoBizImpl();
		List<Map<String, Object>> list = biz.getGradeList(String.valueOf((t.getT_id())), s_name, s_id, name, c_name, order);
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	
	protected void find(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTTEALOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		String name = request.getParameter("name");
		TeacherInfo t = (TeacherInfo) obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		Map<String, Object> map = biz.findtea(String.valueOf((t.getT_id())), name, page, rows);
		if( null == map || map.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, map);
	}
	
	protected void finds(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTTEALOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		String name = request.getParameter("name");
		TeacherInfo t = (TeacherInfo) obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<Map<String, Object>> list = biz.findBytea(String.valueOf((t.getT_id())), name, page, rows);
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	
	public void getdegree(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if(null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<Map<String, Object>> list = biz.getdegree(String.valueOf(c.getId()));
		System.out.println(list);
		if(list == null || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	public void deletestu(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if(null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		String s_id = request.getParameter("id");
		ITeacherInfoDAO dao = new TeacherInfoDAOImpl();
		int result = dao.delete(s_id, String.valueOf(c.getId()));
		if(result > 0) {
			this.send(response, 200, null);
			return;
		}
		this.send(response, 500, null);
	}
	public void baobiao(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if(null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		ITeacherInfoBiz biz = new TeacherInfoBizImpl();
		Map<String, Object> map = biz.baobiao(String.valueOf(c.getId()));
		if(map == null || map.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, map);
	}
	
	public void addgrade(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if(null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		String s_id = request.getParameter("id");
		String degree = request.getParameter("degree");
		ITeacherInfoDAO dao = new TeacherInfoDAOImpl();
		int result = dao.addgrade(String.valueOf(c.getId()), s_id, degree);
		if(result > 0) {
			this.send(response, 200, null);
			return;
		}
		this.send(response, 500, null);
	}
}
