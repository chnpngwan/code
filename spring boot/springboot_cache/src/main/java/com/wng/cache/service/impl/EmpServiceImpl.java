package com.wng.cache.service.impl;

import com.wng.cache.bean.Emp;
import com.wng.cache.mapper.EmpMapper;
import com.wng.cache.service.EmpService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import javax.annotation.Resource;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.cache.service.impl
 * ClassName:    EmpServiceImpl
 *
 * @Author chnpngwng
 * @Date 2023 06 01 18 51
 **/

@Service
public class EmpServiceImpl implements EmpService {

    @Resource
    private EmpMapper empMapper;
    @Cacheable(cacheNames = "emp")
    @Override
    public Emp empById(@PathVariable("empId") int empId) {
        System.out.println("查询编号为"+empId+"的数据！");
        return empMapper.empById(empId);
    }

    @CachePut(value = "emp",key = "#result.id")
    @Override
    public Emp update(Emp emp) {
        System.out.println("update:"+emp);
        empMapper.update(emp);
        return emp;
    }

    @CacheEvict(value = "emp",key = "#empId")
    public void delete(Integer empId){
        System.out.println("清空员工编号为"+empId+"的缓存！");
    }

}
