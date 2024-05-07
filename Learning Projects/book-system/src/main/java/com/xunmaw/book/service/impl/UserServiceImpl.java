package com.xunmaw.book.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xunmaw.book.entity.User;
import com.xunmaw.book.mapper.UserMapper;
import com.xunmaw.book.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
