package com.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.dao.Studao;
import com.po.Student;
@Service
public class StuseviceImpl implements Stuservice {
@Resource
private Studao studao;
//ȫ���ѯ
	@Override
	public List selectAllStu() {
		List students = studao.selectAllStu();
		return students;
	}
	
	//����id��ѯ
	@Override
	public List<Student> SelStudentById(String id) {
		List<Student> students = studao.SelStudentById(id);
		return students;
	}

	//����idɾ��
	@Override
	public int DelStuId(String id) {
		int a = studao.DelStuId(id);
		return a;
	}

	//����
	@Override
	public int insertStudent(Student student) {
		int i = studao.insertStudent(student);
		return i;
	}

	//�޸�
	@Override
	public int updateStuid(Student student) {
		int i  = studao.updateStuid(student);
		return i;
	}

}
