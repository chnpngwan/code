package com.dyuloon.exception;

import com.dyuloon.util.ResultVOUtil;
import com.dyuloon.vo.ResultVO;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalException {
    // 全局系统错误异常处理
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ResultVO globalException(Exception e){
        e.printStackTrace();
        return ResultVOUtil.error("系统错误");
    }
}
