package com.sofftem.dao;

import com.sofftem.bean.User;

public interface UserDao {
    User queryUserByUserId(Integer uid);

    User queryUserByEmailAndPassword(String email, String password);

    User querypasswordByEmail(String email);

    int saveUser(User user);

    int updateUserById(User user, Integer id);

    int updatePasswordById(String password, Integer id);
}
