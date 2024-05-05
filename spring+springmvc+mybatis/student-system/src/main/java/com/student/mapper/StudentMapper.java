/**
 * @author Chnpng Wng
 * @data Apr 17, 2023
 * @time 3:34:40 PM
 */
package com.student.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.student.model.Student;

public interface StudentMapper {
	//全表查询
	@Select("select * from student")
	List<Student> selectByAll();
	//根据ID删除
	@Delete("delete from student where id =#{id}")
	int deleteById(@Param("id") String id);
	//添加学生信息
	@Insert("insert into student(id,name,sex,age) values(#{id},#{name},#{sex},#{age})")
	int insertInfo(Student student);
	//修改学生信息
	@Update("update tb_student set name=#{name},sex=#{sex},age=#{age} where id=#{id}")
	int updateStudent(Student student);
}
