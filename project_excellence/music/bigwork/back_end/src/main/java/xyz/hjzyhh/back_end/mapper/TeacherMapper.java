package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;

// 教师相关接口
@Mapper
public interface TeacherMapper {
    int send2Check(@Param("teacher") AuthTeacherPO authTeacher);
    Integer getStatus(@Param("uid") long uid);
    AuthTeacherPO getByUid(@Param("uid") long uid);
    AuthTeacherPO getById(@Param("id") long id);
    int dropAuth(@Param("uid")long uid);
    int dropTeacherRole(@Param("uid") long uid);
    int modifyAuth(@Param("teacher") AuthTeacherPO authTeacher);
}
