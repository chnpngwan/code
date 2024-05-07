package xyz.hjzyhh.back_end.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import xyz.hjzyhh.back_end.pojo.SecurityQuestion;

@Mapper
public interface SecurityQuestionMapper {
    SecurityQuestion getSecurityQuestionByUsername(@Param("username") String username);
    SecurityQuestion getSecurityQuestionByUserid(@Param("id")long id);
    int insertSecurityQuestion(@Param("sq") SecurityQuestion securityQuestion);
}