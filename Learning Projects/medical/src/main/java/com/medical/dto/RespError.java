package com.medical.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @apiNote 响应异常类
 * @author 莫提
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespError extends RespResult{

    /**
     * 请求地址（发生异常时返回）
     */
    private String requestUrl;

    /**
     * 异常类（发生异常时返回）
     */
    private String exception;
}
