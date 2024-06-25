package com.example.cinema.annotation;


import java.lang.annotation.*;

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RateLimiter {
    String key() default "rate_limit:";

    int time() default 60;

    int count() default 100;
}
