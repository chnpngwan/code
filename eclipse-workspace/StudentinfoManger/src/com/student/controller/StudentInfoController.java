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
import com.student.biz.impl.ClassInfoBizImpl;
import com.student.biz.impl.IClassInfoBiz;
import com.student.biz.impl.IStudnetInfoBiz;
import com.student.biz.impl.StudentInfoBizImpl;
import com.student.dao.IClassInfoDAO;
import com.student.dao.ITeacherInfoDAO;
import com.student.dao.impl.ClassInfoDAOImpl;
import com.student.dao.impl.TeacherInfoDAOImpl;
import com.student.utils.RequestToObject;
import com.student.utils.SessionKeys;

import jdk.internal.org.objectweb.asm.tree.analysis.Value;

/**
 * Servlet implementation class StudentController
 */
@WebServlet("/student/stu/*")
public class StudentInfoController extends BaseServlet {
	private static final long serialVersionUID = 1L;

	protected void getGrade(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		String s_name = request.getParameter("s_name");
		String t_name = request.getParameter("t_name");
		StudentInfo s = (StudentInfo) obj;
		IStudnetInfoBiz biz = new StudentInfoBizImpl();
		List<Map<String, Object>> list = biz.getGrade(String.valueOf(s.getS_id()), s_name, t_name);
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	
	protected void find(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		StudentInfo s = (StudentInfo) obj;
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		String name = request.getParameter("name");
		IClassInfoBiz biz = new ClassInfoBizImpl();
		Map<String, Object> map = biz.findstu(String.valueOf(s.getS_id()), name, page, rows);
		if( null == map || map.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, map);
	}
	
	protected void finds(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		StudentInfo s = (StudentInfo) obj;
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		String name = request.getParameter("name");
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<Map<String, Object>> list = biz.findBystu(String.valueOf(s.getS_id()), name, page, rows);
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
	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		StudentInfo s = (StudentInfo) obj;
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		String name = request.getParameter("name");
		IClassInfoBiz biz = new ClassInfoBizImpl();
		Map<String, Object> map = biz.findAll(String.valueOf(s.getS_id()), name, page, rows);
		if( null == map || map.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, map);
	}
	protected void findAlls(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);//说明未登录
			return;
		}
		StudentInfo s = (StudentInfo) obj;
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		String name = request.getParameter("name");
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		List<Map<String, Object>> list = dao.findAll(String.valueOf(s.getS_id()), name, page, rows);
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	
	public void deleteclass(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if(null == obj) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj;
		String id = request.getParameter("id");
		ITeacherInfoDAO dao = new TeacherInfoDAOImpl();
		int result = dao.delete(String.valueOf(s.getS_id()), id);
		if(result > 0) {
			this.send(response, 200, null);
			return;
		}
		this.send(response, 500, null);
	}
	public void add(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if(null == obj) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj;
		String id = request.getParameter("id");
		ITeacherInfoDAO dao = new TeacherInfoDAOImpl();
		int result = dao.add(String.valueOf(s.getS_id()), id);
		if(result > 0) {
			this.send(response, 200, null);
			return;
		}
		this.send(response, 500, null);
	}
	
	public void baobiaoexam(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		Object obj1 =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if(null == obj || null == obj1) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj;
		ClassInfo c = (ClassInfo)obj1;
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		List<Map<String,Object>> list = dao.baobiao(String.valueOf(s.getS_id()), String.valueOf(c.getId()));
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	
	public void baobiaoword(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		Object obj1 =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if(null == obj || null == obj1) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj;
		ClassInfo c = (ClassInfo)obj1;
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		List<Map<String,Object>> list = dao.baobiao1(String.valueOf(s.getS_id()), String.valueOf(c.getId()));
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
}
