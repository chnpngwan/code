package com.bank.service;

import com.bank.bean.Account;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.bank.service
 * ClassName:    AccountService
 *
 * @Author chnpngwng
 * @Date 2023 06 13 18 30
 **/


public interface AccountService {
    List<Account> queryByName(String Name);
    int deleteById(int ID);
    int insertAccount(Account account);
}
