package com.course.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.course.mapper.CourseMapper;
import com.course.model.Course;
import com.course.service.CourseService;
@Service
public class CourseServiceImpl implements CourseService{

	@Autowired
	private CourseMapper courseMapper;
	
	@Override
	public List<Course> selectCourses(String name, String type) {
		return courseMapper.selectCourses(name, type);
	}

	@Override
	public int deleteById(String id) {
		return courseMapper.deleteById(id);
	}

	@Override
	public Course selectCoursesById(String id) {
		return courseMapper.selectCoursesById(id);
	}

	@Override
	public int updateCourses(Course course) {
		return courseMapper.updateCourses(course);
	}

	@Override
	public int insertInfo(Course course) {
		return courseMapper.insertInfo(course);
	}

	@Override
	public List<Course> select() {
		return courseMapper.select();
	}

}
