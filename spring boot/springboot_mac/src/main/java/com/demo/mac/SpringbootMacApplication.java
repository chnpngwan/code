package com.demo.mac;

import com.demo.mac.address.MACAddress;
import com.demo.mac.address.MacAddressUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.net.SocketException;
import java.net.UnknownHostException;

@SpringBootApplication
public class SpringbootMacApplication {

    public static void main(String[] args){

        SpringApplication.run(SpringbootMacApplication.class, args);
    }

}
