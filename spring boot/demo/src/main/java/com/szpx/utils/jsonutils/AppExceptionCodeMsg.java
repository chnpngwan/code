package com.szpx.utils.jsonutils;

/**
 *  异常枚举类
 */
public enum AppExceptionCodeMsg {


    GET_DATA_FAIL(1000,"获取数据失败"),
    USER_NOT_EXIST(1001,"用户不存在");

    //异常状态码
    private int code ;

    //异常信息
    private String msg ;

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }


    AppExceptionCodeMsg(int code, String msg){
        this.code = code;
        this.msg = msg;
    }

}
