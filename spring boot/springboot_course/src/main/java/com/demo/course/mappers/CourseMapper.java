package com.demo.course.mappers;

import com.demo.course.entity.Course;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.demo.course.mappers
 * ClassName:    CourseMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 09 08 44
 **/

@Mapper
public interface CourseMapper {

    List<Course> queryCourse(@Param("name") String name,@Param("type") String type);
    @Insert("insert into tb_course(id,name,type,credit,class_hour) values (id=#{id},name=#{name},type=#{type},credit=#{credit},class_hour=#{classHour})")
    int insertCourse(Course course);
    @Delete("delete from tb_course where id=#{id}")
    int deleteCourse(String id);
    @Select("select * from tb_course where id=#{id}")
    Course courseById(String id);
    @Update("update tb_cource set name=#{name},type=#{type},credit=#{credit},class_hour=#{classHour} where id=#{id}")
    int update(@Param("id") String id);
}
