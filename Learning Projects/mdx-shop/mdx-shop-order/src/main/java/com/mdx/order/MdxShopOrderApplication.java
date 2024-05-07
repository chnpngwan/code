package com.mdx.order;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 11:25
 */
@SpringBootApplication
@EnableFeignClients
//@EnableAutoDataSourceProxy
public class MdxShopOrderApplication {
    public static void main(String[] args) {
        SpringApplication.run(MdxShopOrderApplication.class, args);
    }
}
