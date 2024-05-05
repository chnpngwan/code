package com.course.service;

import java.util.List;

import com.course.model.Course;

public interface CourseService {
		//条件查询
		List<Course> select();
		List<Course> selectCourses(String name,String type);
		
		//根据ID删除
		int deleteById(String id);
		
		//根据id查询
		Course selectCoursesById(String id);
		
		//修改
		int updateCourses(Course course);
		
		//添加
		int insertInfo(Course course);
}
