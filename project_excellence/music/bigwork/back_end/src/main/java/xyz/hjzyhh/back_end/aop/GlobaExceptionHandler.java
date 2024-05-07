package xyz.hjzyhh.back_end.aop;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import xyz.hjzyhh.back_end.utils.Result;
import xyz.hjzyhh.back_end.utils.ResultUtil;

@ControllerAdvice("xyz.hjzyhh.back_end.controller")
public class GlobaExceptionHandler {
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result<Object> errorResult(Exception e) {
        e.printStackTrace();
        return ResultUtil.failure(ResultUtil.GLOBA_EXCEPTION_CODE, e.getMessage());
    }
}
