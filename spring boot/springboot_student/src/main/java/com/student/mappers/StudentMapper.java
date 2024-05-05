package com.student.mappers;

import com.student.bean.Student;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.student.mappers
 * ClassName:    StudentMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 12 15 36
 **/

@Mapper
public interface StudentMapper {

    List<Student> queryByName(@Param("studentName") String studentName);
    @Delete("delete from tb_students where id=#{id}")
    int deleteById(@Param("id") int id);
    @Insert("insert into tb_students(studentName,studentNo,age,gender,major,grade) values (#{studentName},#{studentNo},#{age},#{gender},#{major},#{grade})")
    int insert(Student student);
}
