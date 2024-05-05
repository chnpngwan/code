package com.bank.service.impl;

import com.bank.bean.Account;
import com.bank.mapper.AccountMapper;
import com.bank.service.AccountService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.bank.service.impl
 * ClassName:    AccountServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 13 18 31
 **/

@Service
public class AccountServiceImpl implements AccountService {
    @Resource
    private AccountMapper accountMapper;

    @Override
    public List<Account> queryByName(String Name) {
        return accountMapper.queryByName(Name);
    }

    @Override
    public int deleteById(int ID) {
        return accountMapper.deleteById(ID);
    }

    @Override
    public int insertAccount(Account account) {
        return accountMapper.insertAccount(account);
    }
}
