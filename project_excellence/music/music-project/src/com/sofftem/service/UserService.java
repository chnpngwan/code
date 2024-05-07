package com.sofftem.service;

import com.sofftem.bean.User;

public interface UserService {
    User queryUserById(Integer uid);
    void registUser(User user);
    User login(User user);
    boolean existsEmail(String email);
    User getPassword(String email);
    int updateInfo(User user, Integer id);
    int updatePass(String password, Integer id);
}

