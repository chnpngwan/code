package com.service;

import java.util.List;

import com.po.Student;


public interface Stuservice {
//��ѯȫ��
List selectAllStu();

//����id��ѯ
public List<Student> SelStudentById(String id);

//����idɾ��
public int DelStuId(String id);

//����
public int insertStudent(Student student);

//�޸�
public int updateStuid(Student student);
}
