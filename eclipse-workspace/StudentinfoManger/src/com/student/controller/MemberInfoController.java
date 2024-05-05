package com.student.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.student.bean.AdminInfo;
import com.student.bean.ClassInfo;
import com.student.bean.StudentInfo;
import com.student.bean.TeacherInfo;
import com.student.biz.impl.IMemberInfoBiz;
import com.student.biz.impl.MemberInfoBizImpl;
import com.student.dao.ILoginDAO;
import com.student.dao.impl.Loginimpl;
import com.student.utils.MailUtils;
import com.student.utils.RequestToObject;
import com.student.utils.SessionKeys;
import com.student.utils.StringUtil;

/**
 * Servlet implementation class MemerInfoServlet
 */
@WebServlet("/mem/*")
public class MemberInfoController extends BaseServlet {
	private static final long serialVersionUID = 1L;
	ILoginDAO dao = new Loginimpl();
	
	//登录
	protected void login_stu(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String s_name = request.getParameter("s_name");
		StudentInfo s = RequestToObject.getParamesToObject(StudentInfo.class, request);
		if(null == s) {
			this.send(response, 501, null);
		}
		//TODO获取系统的验证验证码验证
		Object obj = request.getSession().getAttribute("vcode");//判断
		if( null == obj) {
			this.send(response, 502, null);//系统验证码存储失败
			return;
		}
		//验证码匹配
		if( !String.valueOf( obj ).equalsIgnoreCase( s.getS_mail() )) {
			this.send(response, 503, null);//验证码匹配失败
			return;
		}
		IMemberInfoBiz biz = new MemberInfoBizImpl();
		StudentInfo stu = biz.login(s);
		//判断
		if( null == stu ) {
			this.send(response,500, null);//登陆失败账号或密码错误
			return;
		}
		//登陆成功会员存储session
		request.getSession().setAttribute( SessionKeys.CURRENTSTULOGINACCOUNT, stu);//响应数据
		this.send(response, 200, null);
	}
	protected void login_tea(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String s_name = request.getParameter("s_name");
		TeacherInfo t = RequestToObject.getParamesToObject(TeacherInfo.class, request);
		if(null == t) {
			this.send(response, 501, null);
		}
		//TODO获取系统的验证验证码验证
		Object obj = request.getSession().getAttribute("vcode");//判断
		if( null == obj) {
			this.send(response, 502, null);//系统验证码存储失败
			return;
		}
		IMemberInfoBiz biz = new MemberInfoBizImpl();
		TeacherInfo tea = biz.login(t);
		//判断
		if( null == tea ) {
			this.send(response,500, null);//登陆失败账号或密码错误
			return;
		}
		//验证码匹配
		if( !String.valueOf( obj ).equalsIgnoreCase( t.getT_mail() )) {
			this.send(response, 503, null);//验证码匹配失败
			return;
		}
		//登陆成功会员存储session
		System.out.println(tea);
		request.getSession().setAttribute( SessionKeys.CURRENTTEALOGINACCOUNT, tea);//响应数据
		this.send(response, 200, null);
	}
	protected void login_adm(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		String s_name = request.getParameter("s_name");
		AdminInfo a = RequestToObject.getParamesToObject(AdminInfo.class, request);
		if(null == a) {
			this.send(response, 501, null);
		}
		//TODO获取系统的验证验证码验证
		Object obj = request.getSession().getAttribute("vcode");//判断
		if( null == obj) {
			this.send(response, 502, null);//系统验证码存储失败
			return;
		}
		IMemberInfoBiz biz = new MemberInfoBizImpl();
		AdminInfo adm = biz.login(a);
		//判断
		if( null == adm ) {
			this.send(response,500, null);//登陆失败账号或密码错误
			return;
		}
		//验证码匹配
		if( !String.valueOf( obj ).equalsIgnoreCase( a.getA_email())) {
			this.send(response, 503, null);//验证码匹配失败
			return;
		}
		//登陆成功会员存储session
		System.out.println(adm);
		request.getSession().setAttribute( SessionKeys.CURRENTADMLOGINACCOUNT, adm);//响应数据
		this.send(response, 200, null);
	}
	
	// 通过请求发送验证码
	public void code(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String eamString = req.getParameter("eamil");
		if(StringUtil.checkNull(eamString)) {
			return ;
		}else {
			MailUtils.sendMail(eamString);
			this.send(resp, 200, MailUtils.verifyCode);
			return ;
		}
	}

	// 登录
	public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String username = req.getParameter("username"); // 用户名
		String eamil = req.getParameter("eamil"); // 邮箱
		String tel = req.getParameter("tel"); // 电话
		String cardid = req.getParameter("cardid"); // 身份证
		String sex = req.getParameter("sex");
		String pwd = req.getParameter("pwd");

		if(StringUtil.checkNull(username, eamil, tel, cardid, sex, pwd)) {
			this.send(resp, 500, null); // 注册失败： 有参数为空
			return;
		}
		int a = 0;
		a = dao.Login(username, eamil, tel, cardid, sex, pwd);
		System.out.println(a);
		if(a <= 0) { // 添加失败
			this.send(resp, 501, null);
			return ;
		}
		this.send(resp, 200, null);
		return;
	}

	public void loginl(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		List<List<Object>> list = new ArrayList<List<Object>>();
		String a = req.getParameter("arra").substring(0);
		String topic = req.getParameter("topic");  // 考试名称
		String w_name = req.getParameter("w_name");  // 考试时长
		List<Object> list1 = new ArrayList<Object>();
		List<Object> list3 = new ArrayList<Object>();
		int i = 0;
		System.out.println(a);
		for(String list2 : a.split(",")) {
			list1.add(list2);
			if(list1.size() % 6 == 0) {
				list.add(list1);
				list1 = new ArrayList<Object>();
			}
		}
		System.out.println(list);
		int b = dao.addTopic(list, topic, w_name);
		if(b <= 0) { // 添加失败
			this.send(resp, 500, null);
			return ;
		}
		this.send(resp, 200, null);
	}
	public void checkstu(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute(SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj){//说明未登录
			this.send(response,500, null);
			return;
		}
		this.send(response, 200, obj);
	}
	public void checktea(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object obj = request.getSession().getAttribute(SessionKeys.CURRENTTEALOGINACCOUNT);
		if( null == obj){//说明未登录
			this.send(response,500, null);
			return;
		}
		this.send(response, 200, obj);
	}
	
	public void updatestupwd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		int result = dao.updatestupwd(name, oldpwd, newpwd);
		if(result > 0) {
			this.send(response, 200, null);
		}
		this.send(response, 500, null);
	}
	
	public void updateteapwd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		int result = dao.updateteapwd(name, oldpwd, newpwd);
		if(result > 0) {
			this.send(response, 200, null);
		}
		this.send(response, 500, null);
	}
	public void admin(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		String uname = req.getParameter("uname");
		int num = Integer.parseInt(StringUtil.toString(req.getParameter("num")));
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = dao.query(uname, num, 1);
		if(list.isEmpty()) {
			this.send(resp, 501, null);
			return ;
		}
		this.send(resp, 200, list);
	}
	
	public void transform(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		String a_id = req.getParameter("id");
		String a_user = req.getParameter("user");
		String a_email = req.getParameter("email");
		String a_pwd = req.getParameter("pwd");
		String uname = req.getParameter("uname");
		int a = 0;
		a = dao.transform(a_id, a_user, a_email, a_pwd, uname);
		if(a <= 0) {
			this.send(resp, 501, null); // 修改失败
			return ;
		}
		this.send(resp, 200, null);
	}
	
	public void modify(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		
		String a_id = req.getParameter("id");
		String uname = req.getParameter("uname");
		int a = 0;
		a = dao.modify(a_id, uname);
		if(a <= 0) {
			this.send(resp, 501, null); // 删除失败
			return ;
		}
		this.send(resp, 200, null);
	}
	public void discu(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		String d_id = req.getParameter("d_id");
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = dao.discu(d_id);
		if(list.isEmpty() || list == null) {
			this.send(resp, 501, null);
			return ;
		}
		this.send(resp, 200, list);
		
	}
	public void Studentdiscu(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		Object obj = req.getSession().getAttribute(SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj){//说明未登录
			this.send(resp, 502, null);
			return;
		}
		ClassInfo c = (ClassInfo)obj;
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		list = dao.Studentdiscu(String.valueOf(c.getId()));
		if(list.isEmpty() || list == null) {
			this.send(resp, 501, null);
			return ;
		}
		this.send(resp, 200, list);
	}
	
	public void addtaolun(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		Object obj = req.getSession().getAttribute(SessionKeys.CURRENTTEALOGINACCOUNT);
		Object obj1 = req.getSession().getAttribute(SessionKeys.CURRENTSTULOGINACCOUNT);
		Object obj2 = req.getSession().getAttribute(SessionKeys.CURRENTCLASSINFOACCOUNT);
		if( null == obj && null == obj1 && null == obj2){//说明未登录
			this.send(resp, 502, null);
			return;
		}
		TeacherInfo t = (TeacherInfo)obj;
		StudentInfo s = (StudentInfo)obj1;
		ClassInfo c = (ClassInfo)obj2;
		String name = null;
		if( null == obj1) {
			name = String.valueOf(t.getT_name());
		}
		if( null == obj) {
			name = String.valueOf(s.getS_name());
		}
		String d_title = req.getParameter("d_title");
		String d_titl = req.getParameter("d_titl");
		int a = 0;
		a = dao.addtaolun(d_title, d_titl, name, String.valueOf(c.getId()));
		if(a <= 0) {
			this.send(resp, 501, null); // 添加失败
			return ;
		}
		this.send(resp, 200, null);
	}
	
	
	public void addpinglun(HttpServletRequest req, HttpServletResponse resp) throws IOException, SQLException {
		Object obj = req.getSession().getAttribute(SessionKeys.CURRENTTEALOGINACCOUNT);
		Object obj1 = req.getSession().getAttribute(SessionKeys.CURRENTSTULOGINACCOUNT);
		if( null == obj && null == obj1){//说明未登录
			this.send(resp, 502, null);
			return;
		}
		TeacherInfo t = (TeacherInfo)obj;
		StudentInfo s = (StudentInfo)obj1;
		String name = null;
		if( null == obj1) {
			name = String.valueOf(t.getT_name());
		}
		if( null == obj) {
			name = String.valueOf(s.getS_name());
		}
		String d_id = req.getParameter("d_id");
		String s_titl = req.getParameter("s_titl");
		System.out.println(s_titl);
		int a = 0;
		a = dao.addpinglun(d_id, name, s_titl);
		if(a <= 0) {
			this.send(resp, 501, null); // 添加失败
			return ;
		}
		this.send(resp, 200, null);
	}
}
