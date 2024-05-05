package com.wng.cache.mapper;

import com.wng.cache.bean.Emp;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.cache.mapper
 * ClassName:    EmpMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 01 18 56
 **/

@Mapper
public interface EmpMapper {
    @Select("select * from tb_empe where empId=#{empId}")
    public Emp empById(int id);
    @Update("update tb_empe set empName=#{empName},empAge=#{empAge},empSex=#{empSex},empSalary=#{empSalary} where empId=#{empId}")
    public int update(Emp emp);
    @Delete("delete from tb_empe where empId=#{empId}")
    public Emp delete(int empId);

}
