package com.demo.course.service;

import com.demo.course.entity.Course;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.course.service
 * ClassName:    CourseService
 *
 * @Author chnpngwng
 * @Date 2023 06 09 09 01
 **/


public interface CourseService {
    List<Course> queryCourse(String name, String type);
    int insertCourse(Course course);
    int deleteCourse(String id);
    Course courseById(String id);
    int update(String id);
}
