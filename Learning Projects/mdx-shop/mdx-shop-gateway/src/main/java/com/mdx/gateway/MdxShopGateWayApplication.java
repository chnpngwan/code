package com.mdx.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 11:25
 */
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@EnableFeignClients
@ComponentScan(basePackages = "com.mdx.*")
public class MdxShopGateWayApplication {
    public static void main(String[] args) {
        SpringApplication.run(MdxShopGateWayApplication.class, args);
    }
}
