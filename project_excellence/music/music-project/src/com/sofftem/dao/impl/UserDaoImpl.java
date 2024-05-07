package com.sofftem.dao.impl;

import com.sofftem.bean.User;
import com.sofftem.dao.UserDao;
import com.sofftem.utils.BaseDao;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;


public class UserDaoImpl extends BaseDao<User> implements UserDao {
    @Override
    public User queryUserByUserId(Integer uid) {
        return this.getBean("select * from user where id = ?", uid);
    }

    @Override
    public User queryUserByEmailAndPassword(String email, String password) {
        return this.getBean("select * from user where email = ? and password = ?", email, password);
    }

    @Override
    public User querypasswordByEmail(String email) {
        return this.getBean("select * from user where email = ? ", email);
    }

    @Override
    public int saveUser(User user) {
        Integer id = 0;
        try {
            id = this.queryRunner.insert("insert into user values(null,?,?,?,?,?,?)",
                    new ScalarHandler<Long>(),
                    user.getUsername(), user.getPassword(), user.getEmail()).intValue();
            user.setId(id);//将添加数据成功后生成的主键id设置到user对象中
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    @Override
    public int updateUserById(User user, Integer id) {
        return this.update("update user set firstname = ? , lastname = ?,username = ? ,email = ? where id =?",
                user.getFirstname(), user.getLastname(), user.getUsername(), user.getEmail(), id);
    }

    @Override
    public int updatePasswordById(String password, Integer id) {
        return this.update("update user set password = ? where id =?", password, id);
    }
}
