package com.wng.cache;

import com.wng.cache.bean.Emp;
import com.wng.cache.service.EmpService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class SpringbootCacheApplicationTests {
    @Resource
    public EmpService empService;
    @Test
    void contextLoads1() {
        Emp emp = empService.empById(1);
        System.out.println(emp);
    }

}
