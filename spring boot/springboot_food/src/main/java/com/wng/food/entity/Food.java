package com.wng.food.entity;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * ProjectName:  spring boot
 * PackageName:  com.wng.food.entity
 * ClassName:    Food
 *
 * @Author chnpngwng
 * @Date 2023 06 07 10 11
 **/

@Data
@Component
public class Food {
    private int id;
    private String name;
    private String type;
    private Double price;
    private String buyer;
    private Date buyTime;

    public Food() {
    }

    public Food(int id, String name, String type, Double price, String buyer, Date buyTime) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.price = price;
        this.buyer = buyer;
        this.buyTime = buyTime;
    }
}
