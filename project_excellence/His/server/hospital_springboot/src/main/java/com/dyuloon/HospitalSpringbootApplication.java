package com.dyuloon;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
@MapperScan("com.dyuloon.mapper")
public class HospitalSpringbootApplication {

    public static void main(String[] args) {
        SpringApplication.run(HospitalSpringbootApplication.class, args);
    }

}
