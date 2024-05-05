package com.szpx.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


/**
 * 全局异常处理
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 如果出现异常转到500页面
     * @return
     */
    @ExceptionHandler(Exception.class)
    public String err(){
        return "litianjian/500";
    }

}
