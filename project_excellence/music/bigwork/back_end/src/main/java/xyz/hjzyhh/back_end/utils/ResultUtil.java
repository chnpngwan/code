package xyz.hjzyhh.back_end.utils;

public class ResultUtil {
    private static final int SUCCESS_CODE = 200; // 成功代码
    public static final int EXISTS_USERNAME_CODE = 501; // 用户名已存在
    public static final int GLOBA_EXCEPTION_CODE = 500; // 全局异常捕获状态码
    public static final int PASSWORD_ERROR_CODE = 502; // 密码错误
    public static final int UPLOAD_FILE_ERROR = 503; // 文件上传失败


    public static final int LOGIN_FAIL_CODE = 400; // 用户名或密码错误
    public static final int USER_MISS_CODE = 401;
    public static final int ARGS_MISS_CODE = 402; // 参数异常
    public static final int NO_LOGIN_CODE = 403; // 未登录异常


    private static final String SUCCESS_MSG = "OK"; //成功的提示
    public static final String EXISTS_USERNAME_MSG = "用户名已存在"; //
    public static final String GLOBA_EXCEPTION_MSG = "服务器开小差了";
    public static final String LOGIN_FAIL_MSG = "用户名或密码错误";
    public static final String USER_MISS_MSG = "用户不存在";
    public static final String ARGS_MISS_MSG = "参数异常";
    public static final String PASSWORD_ERROR_MSG = "密码有误"; // 全局异常捕获状态码
    public static final String UPLOAD_FILE_MSG = "文件上传失败"; // 全局异常捕获状态码
    public static final String NO_LOGIN_MSG = "未登录"; // 参数异常

    public static <T>Result success(T data){
        return new Result<T>(SUCCESS_CODE,SUCCESS_MSG,data);
    }

    public static <T>Result failure(int code, String msg){
        return new Result<T>(code,msg,null);
    }
}


