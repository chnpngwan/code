package com.zpark.legou;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@SpringBootApplication
@EnableAsync // 开启异步任务注解支持
public class LegouProApplication {

    public static void main(String[] args) {
        SpringApplication.run(LegouProApplication.class, args);
    }

}
