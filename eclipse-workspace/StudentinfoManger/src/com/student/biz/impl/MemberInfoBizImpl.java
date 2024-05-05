package com.student.biz.impl;

import com.student.bean.AdminInfo;
import com.student.bean.StudentInfo;
import com.student.bean.TeacherInfo;
import com.student.dao.IMemberInfoDAO;
import com.student.dao.impl.MemberInfoDAOImpl;
import com.student.utils.StringUtil;

public class MemberInfoBizImpl implements IMemberInfoBiz {

	@Override
	public StudentInfo login(StudentInfo s) {
		//数据验证
		if( null == s || StringUtil.checkNull( s.getS_tel(), s.getS_pwd())) {
			return null;
		}
		IMemberInfoDAO dao = new MemberInfoDAOImpl();
		return dao.login(s);
	}

	@Override
	public TeacherInfo login(TeacherInfo t) {
		//数据验证
		if( null == t || StringUtil.checkNull( t.getT_tel(), t.getT_pwd())) {
			return null;
		}
		IMemberInfoDAO dao = new MemberInfoDAOImpl();
		return dao.login(t);
	}

	@Override
	public AdminInfo login(AdminInfo a) {
		//数据验证
		if( null == a || StringUtil.checkNull( a.getA_user(), a.getA_pwd())) {
			return null;
		}
		IMemberInfoDAO dao = new MemberInfoDAOImpl();
		return dao.login(a);
	}

}
