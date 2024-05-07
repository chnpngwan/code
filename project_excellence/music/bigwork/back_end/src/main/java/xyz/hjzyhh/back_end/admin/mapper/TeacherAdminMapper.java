package xyz.hjzyhh.back_end.admin.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.AuthTeacherPO;

import java.util.List;


@Mapper
public interface TeacherAdminMapper{
    List<AuthTeacherPO> get(@Param("limit")int limit);
    AuthTeacherPO getById(@Param("id")long id);
    List<AuthTeacherPO> getChecking(@Param("aid")int aid);
    int changeChecking(@Param("id")long id,@Param("aid") int aid);
    int changeUnchecking(@Param("aid")int aid);
    int pass(@Param("id")long id);
    int unpass(@Param("id")long id);
    int changeUserRole2Teacher(@Param("uid") long uid);

}
