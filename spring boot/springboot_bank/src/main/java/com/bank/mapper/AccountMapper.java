package com.bank.mapper;

import com.bank.bean.Account;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * ProjectName:  spring boot
 * PackageName:  com.bank.mapper
 * ClassName:    AccountMapper
 *
 * @Author chnpngwng
 * @Date 2023 06 13 18 23
 **/

@Mapper
public interface AccountMapper {

    List<Account> queryByName(String Name);
    @Delete("delete from tb_account where ID=#{ID}")
    int deleteById(int ID);
    @Insert("insert into tb_account(NUMBER,NAME,MONEY) VALUES (#{NUMBER},#{NAME},#{MONEY})")
    int insertAccount(Account account);
}
