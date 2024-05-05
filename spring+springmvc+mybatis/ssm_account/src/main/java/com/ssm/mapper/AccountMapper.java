package com.ssm.mapper;

import com.ssm.model.Account;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.web.bind.annotation.Mapping;

import java.util.List;



/**
 * ProjectName:   ssm
 * PackageName:   com.ssm.mapper
 * ClassName:     AccountMapper
 *
 * @Author: Chnpng Wng
 * @Date 2023 04 14 15 35
 **/

public interface AccountMapper {
    //保存账户数据
    void save(Account account);
    //查询账户数据
    List<Account> findAll();
}
