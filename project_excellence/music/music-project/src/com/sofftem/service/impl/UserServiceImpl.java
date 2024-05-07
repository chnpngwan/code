package com.sofftem.service.impl;

import com.sofftem.bean.User;
import com.sofftem.dao.UserDao;
import com.sofftem.dao.impl.UserDaoImpl;
import com.sofftem.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao userDao = new UserDaoImpl();

    @Override
    public User queryUserById(Integer uid) {
        return userDao.queryUserByUserId(uid);
    }

    @Override
    public void registUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.queryUserByEmailAndPassword(user.getEmail(), user.getPassword());
    }

    @Override
    public boolean existsEmail(String email) {
        return userDao.querypasswordByEmail(email) == null;
    }

    @Override
    public User getPassword(String email) {
        return userDao.querypasswordByEmail(email);
    }

    @Override
    public int updateInfo(User user, Integer id) {
        return userDao.updateUserById(user, id);
    }

    @Override
    public int updatePass(String password, Integer id) {
        return userDao.updatePasswordById(password, id);
    }
}
