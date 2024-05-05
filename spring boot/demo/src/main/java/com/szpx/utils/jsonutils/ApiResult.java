package com.szpx.utils.jsonutils;

/**
 *  json处理工具类，统一返回格式
 */
public class ApiResult {
    //服务端返回的状态码
    private int code = 200;


    //服务端返回状态信息
    private String msg = "success";

    //服务端返回的数据
    private Object data;
    private long count;

    public ApiResult(int code, String msg,Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ApiResult(int code, String msg,Object data, long count) {
        this.code = code;
        this.msg = msg;
        this.data = data;
        this.count= count;
    }
    public ApiResult(Object data, long count) {
        this.data = data;
        this.count= count;
    }

    public static <Object> ApiResult put(Object data,long count){
        ApiResult resp = new ApiResult(data,count);
        return resp;
    }

    public static <Object> ApiResult success(Object data){
        ApiResult resp = new ApiResult(200, "success", data);
        return resp;
    }

    public static <Object> ApiResult error(int code,String msg){
        ApiResult resp = new ApiResult(code,msg, null);
        return resp;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    public Object getData() {
        return data;
    }

    public Object getCount() {
        return count;
    }

    @Override
    public String toString() {
        return "ApiResult{" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                ", count=" + count +
                '}';
    }
}
