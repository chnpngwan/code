package com.course.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.course.model.Course;

public interface CourseMapper {
	//条件查询
	@Select("select * from tb_course")
	List<Course> select();
	List<Course> selectCourses(@Param("name") String name,@Param("type") String type);
	
	//根据ID删除
	@Delete("delete from tb_course where id=#{id}")
	int deleteById(@Param("id") String id);
	
	//根据id查询
	@Select("select * from tb_course where id=#{id}")
	Course selectCoursesById(@Param("id") String id);
	
	//修改
	@Update("update tb_course set name=#{name},type=#{type},credit=#{credit},class_hour=#{class_hour} where id=#{id}")
	int updateCourses(Course course);
	
	//添加
	@Insert("insert into tb_course(id,name,type,credit,class_hour) values(#{id},#{name},#{type},#{credit},#{class_hour})")
	int insertInfo(Course course);
	
}
