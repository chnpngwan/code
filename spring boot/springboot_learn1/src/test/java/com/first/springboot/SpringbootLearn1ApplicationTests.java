package com.first.springboot;

import com.first.springboot.bean.Customer;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;

@SpringBootTest
class SpringbootLearn1ApplicationTests {

    @Resource
    private Customer customer;
    @Test
    void contextLoads() {
        System.out.println(customer);
    }

}
