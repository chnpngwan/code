package com.flea.common;

/**
 * 自定义的业务异常类
 */
public class CustomException extends RuntimeException{
    public CustomException(String message) {
        super(message);
    }
}
