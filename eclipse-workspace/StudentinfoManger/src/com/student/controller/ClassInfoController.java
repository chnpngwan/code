package com.student.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;


import com.jspsmart.upload.SmartUploadException;
import com.student.bean.ClassInfo;
import com.student.bean.ExamInfo;
import com.student.bean.StudentInfo;
import com.student.bean.TeacherInfo;
import com.student.bean.WordInfo;
import com.student.biz.impl.ClassInfoBizImpl;
import com.student.biz.impl.IClassInfoBiz;
import com.student.dao.DBHelper;
import com.student.dao.IClassInfoDAO;
import com.student.dao.impl.ClassInfoDAOImpl;
import com.student.utils.FileUploadUtil;
import com.student.utils.SessionKeys;


/**
 * Servlet implementation class StudentController
 */
@WebServlet("/class/*")
public class ClassInfoController extends BaseServlet {
	private static final long serialVersionUID = 1L;

	protected void joinClass(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		IClassInfoBiz biz = new ClassInfoBizImpl();
		ClassInfo c = biz.joinClass(id);
		if( null == c ) {
			this.send(response, 500, null);
			return;
		}
		//登陆成功会员存储session
		request.getSession().setAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT, c);//响应数据
		this.send(response, 200, c);
	}
	
	protected void getExam(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		Object obj1 =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj && null == obj1) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj1;
		ClassInfo c = (ClassInfo)obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<ExamInfo> list = biz.findExam(String.valueOf(c.getId()), String.valueOf(s.getS_id()));
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	

	
	protected void getWord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		Object obj1 =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj && null == obj1) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj1;
		ClassInfo c = (ClassInfo)obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<WordInfo> list = biz.findWord(String.valueOf(c.getId()), String.valueOf(s.getS_id()));
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	

	
	protected void addclass(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute( SessionKeys.CURRENTTEALOGINACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);
			return;
		}
		TeacherInfo t = (TeacherInfo) obj;
		FileUploadUtil uploadUtil = new FileUploadUtil();
		PageContext pageContext = JspFactory.getDefaultFactory().getPageContext(this, request, response, null, true, 2048, true);
		try {
			Map<String, String> map = uploadUtil.uploads(pageContext);
			System.out.println(map);
			IClassInfoBiz biz = new ClassInfoBizImpl();
			int result = biz.addclass(String.valueOf(map.get("name")), String.valueOf(t.getT_id()), String.valueOf(map.get("starttime")), String.valueOf(map.get("endtime")), String.valueOf(map.get("file")));
			if(result > 0) {
				this.send(response, 200);
				return;
			}
			this.send(response, 500);
		} catch (ServletException | IOException | SQLException | SmartUploadException e) {
			e.printStackTrace();
		}
	}
	
	public void addExam(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		String e_name = request.getParameter("e_name");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String time = request.getParameter("time");
		String degree = request.getParameter("degree");
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		int b = dao.addExam(e_name, String.valueOf(c.getId()), starttime, endtime, time, degree);
		if(b <= 0) { // 添加失败
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, null);
	}
	
	public void addWord(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		String w_name = request.getParameter("w_name");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");
		String degree = request.getParameter("degree");
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		int b = dao.addWord(w_name, String.valueOf(c.getId()), starttime, endtime, degree);
		if(b <= 0) { // 添加失败
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, null);
	}
	
	public void loginl(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
		List<List<Object>> list = new ArrayList<List<Object>>();
		String a = request.getParameter("arra");
		String topic = request.getParameter("topic");  // 考试名称
		String w_name = request.getParameter("w_name");  // 考试时长
		List<Object> list1 = new ArrayList<Object>();
		int i = 0;
		System.out.println(a);
		for(String list2 : a.split(",")) {
			list1.add(list2);
			if(list1.size() == 6) {
				list.add(list1);
				list1 = new ArrayList<Object>();
			}
		}
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		System.out.println(list);
		int b = dao.addTopic(list, topic, w_name);
		if(b <= 0) { // 添加失败
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, null);
	}
	
	public void findpro(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String e_name = request.getParameter("e_name");
		IClassInfoBiz biz = new ClassInfoBizImpl();
		Map<String, Object> map = biz.findpro(e_name);
		if( null == map || map.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, map);
	}
	
	public void findpro1(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String w_name = request.getParameter("w_name");
		IClassInfoBiz biz = new ClassInfoBizImpl();
		Map<String, Object> map = biz.findpro1(w_name);
		if( null == map || map.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, map);
	}
	
	public void getexamdegree(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj1 =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj1 && null == obj) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj1;
		ClassInfo c = (ClassInfo)obj;
		String e_name = request.getParameter("e_name");
		String degree = request.getParameter("degree");
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		int result = dao.getexamdegree(String.valueOf(s.getS_id()), e_name, degree, String.valueOf(c.getId()));
		if(result > 0) {
			this.send(response, 200, null);
			return;
		}
		this.send(response, 500, null);
	}
	
	public void getworddegree(HttpServletRequest request, HttpServletResponse response) throws IOException{
		Object obj1 =  request.getSession().getAttribute( SessionKeys.CURRENTSTULOGINACCOUNT);
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj1 && null == obj) {
			this.send(response, 502, null);
			return;
		}
		StudentInfo s = (StudentInfo)obj1;
		ClassInfo c = (ClassInfo)obj;
		String w_name = request.getParameter("w_name");
		String degree = request.getParameter("degree");
		IClassInfoDAO dao = new ClassInfoDAOImpl();
		int result = dao.getworddegree(String.valueOf(s.getS_id()), w_name, degree, String.valueOf(c.getId()));
		if(result > 0) {
			this.send(response, 200, null);
			return;
		}
		this.send(response, 500, null);
	}
	
	protected void getExam1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<Map<String,Object>> list = biz.findExam1(String.valueOf(c.getId()));
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
	

	
	protected void getWord1(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj =  request.getSession().getAttribute( SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj) {
			this.send(response, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		IClassInfoBiz biz = new ClassInfoBizImpl();
		List<Map<String,Object>> list = biz.findWord1(String.valueOf(c.getId()));
		if( null == list || list.isEmpty()) {
			this.send(response, 500, null);
			return;
		}
		this.send(response, 200, list);
	}
}
