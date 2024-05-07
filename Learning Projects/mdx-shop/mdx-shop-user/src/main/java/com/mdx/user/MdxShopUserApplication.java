package com.mdx.user;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * @author : jiagang
 * @date : Created in 2022/7/1 11:25
 */
@SpringBootApplication
@EnableFeignClients
@ComponentScan(basePackages = {"com.mdx.*"})
public class MdxShopUserApplication {
    public static void main(String[] args) {
        SpringApplication.run(MdxShopUserApplication.class, args);
    }
}
