package com.mdx.pay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 11:25
 */
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@EnableFeignClients
public class MdxShopPayApplication {
    public static void main(String[] args) {
        SpringApplication.run(MdxShopPayApplication.class, args);
    }
}
