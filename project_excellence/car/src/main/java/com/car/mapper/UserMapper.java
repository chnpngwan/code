package com.car.mapper;

import com.car.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectName:   project_excellence
 * PackageName:   com.car.mapper
 * ClassName:     UserMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 05 18 10 48
 **/


public interface UserMapper {
    //全表查询
    public List<User> selectAllUser();
    //登录
    User usernameAndPassword(User user);
    //注册
    public int insertUser(User user);

}
