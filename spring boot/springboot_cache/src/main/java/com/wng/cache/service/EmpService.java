package com.wng.cache.service;

import com.wng.cache.bean.Emp;
import org.springframework.cache.annotation.CacheEvict;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.cache.service
 * ClassName:    EmpService
 *
 * @Author chnpngwng
 * @Date 2023 06 01 18 50
 **/
public interface EmpService {
    public Emp empById(int empId);
    public Emp update(Emp emp);

}
