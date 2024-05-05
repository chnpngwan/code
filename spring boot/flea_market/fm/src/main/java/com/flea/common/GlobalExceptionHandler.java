package com.flea.common;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.sql.SQLIntegrityConstraintViolationException;

/**
 * 全局异常处理器
 */
@ControllerAdvice(annotations = {RestController.class, Controller.class})
@ResponseBody
@Slf4j
public class GlobalExceptionHandler {

    /**
     * 异常处理器，用户账号不唯一
     * @param e
     * @return
     */
    public Result<String> exceptionHandler(SQLIntegrityConstraintViolationException e) {
        log.error(e.getMessage());

        //判断异常信息是否时账号唯一的冲突
        if (e.getMessage().contains(("Duplicate entry"))) {
            //对异常信息的字符串按照空格进行分解
            String[] split = e.getMessage().split(" ");
            String msg = split[2] + "已存在!";
            Result.error(msg);
        }

        return Result.error("未知错误！");
    }

    /**
     * 删除分类（关联数据）异常
     * @param e
     * @return
     */
    @ExceptionHandler(CustomException.class)
    public Result<String> exceptionHandler(CustomException e) {
        log.error(e.getMessage());

        return Result.error(e.getMessage());
    }

}
