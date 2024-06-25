package com.example.cinema.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.example.cinema.dto.*;
import com.example.cinema.entity.User;
import com.example.cinema.vo.PageResult;
import com.example.cinema.vo.UserBackVO;
import com.example.cinema.vo.UserInfoVO;
import com.example.cinema.vo.UserOnlineVO;

import java.util.List;

public interface UserService extends IService<User> {
    PageResult<UserBackVO> getUserList(String keywords);
    UserInfoVO getUserInfo(Integer userId);
    Boolean saveOrUpdateUser(UserDTO userDTO);
    PageResult<UserOnlineVO> onlineUserList(String keywords);
    Boolean removeOnlineUser(List<Integer> userIdList);
    Boolean updateUserAble(UserAbleDTO userAbleDTO);
    Boolean updatePassword(UserPasswordDTO userPasswordDTO);
    Boolean register(UserRegisterDTO userRegisterDTO);
    Boolean forget(ForgetPasswordDTO forgetPasswordDTO);
}
