package com.xunmaw.book.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xunmaw.book.entity.LendList;
import com.xunmaw.book.mapper.LendListMapper;
import com.xunmaw.book.service.LendListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class LendListServiceImpl extends ServiceImpl<LendListMapper, LendList> implements LendListService {

    @Autowired
    private LendListMapper lendListMapper;


    @Override
    public List<LendList> selectByReader(int id) {
        return lendListMapper.selectByReader(id);
    }

    @Override
    public List<LendList> selectByReader2(int id) {
        return lendListMapper.selectByReader2(id);
    }

    @Override
    public void update1(int serNum, Date date) {
        lendListMapper.update1(serNum,date);
    }

    @Override
    public List<LendList> selectByReader3(int id) {
        return lendListMapper.selectByReader3(id);
    }

    @Override
    public void update2(int serNum) {
        lendListMapper.update2(serNum);
    }

    @Override
    public void update3(int serNum, Date date) {
        lendListMapper.update3(serNum,date);
    }

    @Override
    public void update4(int serNum, Date date) {
        lendListMapper.update4(serNum,date);
    }

    @Override
    public Date getDate(int serNum) {
        return lendListMapper.getDate(serNum);
    }

    @Override
    public void updateDate(int serNum, Date date1) {
        lendListMapper.updateDate(serNum,date1);
    }

    @Override
    public void updateFlag(int serNum) {
        lendListMapper.updateFlag(serNum);
    }

    @Override
    public void updateFlag2(int serNum) {
        lendListMapper.updateFlag2(serNum);
    }

    @Override
    public List<LendList> select1() {
        return lendListMapper.select1();
    }

    @Override
    public List<LendList> select2(int x) {
        return lendListMapper.select2(x);
    }

    @Override
    public List<LendList> select3(String y) {
        return lendListMapper.select3(y);
    }

    @Override
    public List<LendList> select4(int x, String y) {
        return lendListMapper.select4(x,y);
    }

    @Override
    public void updateOne(int serNum) {
        lendListMapper.updateOne(serNum);
    }
}
