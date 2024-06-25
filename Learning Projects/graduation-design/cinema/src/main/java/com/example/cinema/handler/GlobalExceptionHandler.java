package com.example.cinema.handler;

import com.example.cinema.vo.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(RuntimeException.class)
    @ResponseBody
    public Response<?> exceptionHandler(RuntimeException e) {
        log.error(e.getMessage());
        return Response.failure(e.getMessage());
    }
}
