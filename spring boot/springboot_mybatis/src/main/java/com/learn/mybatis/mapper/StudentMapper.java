package com.learn.mybatis.mapper;

import com.learn.mybatis.model.Student;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * ProjectName:   spring boot
 * PackageName:   com.learn.mybatis.mapper
 * ClassName:     StudentMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 25 19 20
 **/

@Mapper
public interface StudentMapper {
/*    @Select("select * from tb_student")*/
    public List<Student> queryAll(@Param("name") String name,@Param("age") String age);
    @Delete("delete from tb_student where id=#{id}")
    public int deleteById(int id);
    @Insert("insert into tb_student(name,age,sex,address) values(#{name},#{age},#{sex},#{address})")
    public int insert(Student student);
    @Select("select * from tb_student where id=#{id}")
    public Student queryAllById(int id);
    @Update("update tb_student set name=#{name},age=#{age},sex=#{sex},address=#{address} where id=#{id}")
    public int updateById(Student student);
}
