package com.example.cinema.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.example.cinema.entity.User;
import com.example.cinema.mapper.UserMapper;
import com.example.cinema.vo.UserDetailVO;
import com.example.cinema.mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Objects;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RoleMapper roleMapper;
    @Resource
    private HttpServletRequest request;

    @Override
    public UserDetails loadUserByUsername(String username) {
        if (StringUtils.isBlank(username)) {
            throw new RuntimeException("用户名不能为空！");
        }
        // 查询账号是否存在
        User userUsername = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUsername, username));
        User userEmail = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, username));
        if (Objects.isNull(userUsername) && Objects.isNull(userEmail)) {
            throw new RuntimeException("用户名不存在!");
        }
        if (Objects.isNull(userUsername)) {
            return convertUserDetail(userEmail, request);
        }
        // 封装登录信息
        return convertUserDetail(userUsername, request);
    }


    public UserDetailVO convertUserDetail(User user, HttpServletRequest request) {
        // 查询账号角色
        List<String> roleList = roleMapper.getRoleListByUserId(user.getId());
        return UserDetailVO.builder()
                .id(user.getId())
                .username(user.getUsername())
                .password(user.getPassword())
                .nickname(user.getNickname())
                .avatar(user.getAvatar())
                .gender(user.getGender())
                .ableFlag(user.getAbleFlag())
                .email(user.getEmail())
                .telephone(user.getTelephone())
                .intro(user.getIntro())
                .roleList(roleList)
                .build();
    }

}
