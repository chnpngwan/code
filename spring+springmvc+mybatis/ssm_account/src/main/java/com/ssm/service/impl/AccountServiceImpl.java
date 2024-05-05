package com.ssm.service.impl;

import com.ssm.mapper.AccountMapper;
import com.ssm.model.Account;
import com.ssm.service.AccountService;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.annotation.Resources;
import java.io.IOException;
import java.util.List;

/**
 * ProjectName:   ssm
 * PackageName:   com.ssm.service.impl
 * ClassName:     AccountServiceImpl
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 14 15 37
 **/
@Service()
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper accountMapper;

    @Override
    public void save(Account account) throws IOException {

    }

    @Override
    public List<Account> findAll() throws IOException {
        return accountMapper.findAll();
    }
}
