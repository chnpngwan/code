package com.student.mapper;

import com.student.model.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.student.mapper
 * ClassName:     StudentMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 25 18 15
 **/


public interface StudentMapper {
    @Select("select * from tb_student_info where name like concat('%',#{name},'%')")
    List<Student> selectStudent(@Param("name") String name);
    @Insert("insert into tb_student_info(name,age,classes,birth) values(#{name},#{age},#{classes},#{birth}) ")
    int insert(Student student);
    @Delete("delete from tb_student_info where id=#{id}")
    int delete(@Param("id") int id);
}
