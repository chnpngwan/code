package com.demo.course.service.impl;

import com.demo.course.entity.Course;
import com.demo.course.mappers.CourseMapper;
import com.demo.course.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.course.service.impl
 * ClassName:    CourseServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 09 09 02
 **/

@Service
public class CourseServiceImpl implements CourseService {

    @Resource
    private CourseMapper courseMapper;
    @Override
    public List<Course> queryCourse(String name, String type) {
        return courseMapper.queryCourse(name,type);
    }

    @Override
    public int insertCourse(Course course) {
        return courseMapper.insertCourse(course);
    }

    @Override
    public int deleteCourse(String id) {
        return courseMapper.deleteCourse(id);
    }

    @Override
    public Course courseById(String id) {
        return courseMapper.courseById(id);
    }

    @Override
    public int update(String id) {
        return courseMapper.update(id);
    }
}
