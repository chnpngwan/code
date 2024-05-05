package com.ssm.service;

import com.ssm.model.Account;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;


/**
 * ProjectName:   ssm
 * PackageName:   com.ssm.service
 * ClassName:     AccountService
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 14 15 36
 **/
public interface AccountService {
    void save(Account account) throws IOException; //保存账户数据
    List<Account> findAll() throws IOException; //查询账户数据
}
