package com.example.cinema.utils;

import java.util.Random;

public class CommonUtil {
    public static String getCode() {
        StringBuilder builder = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 5; i++) {
            builder.append(random.nextInt(10));
        }
        return builder.toString();
    }
}
