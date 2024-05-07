package xyz.hjzyhh.back_end.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Objects;

// 登录拦截器
public class LoginInterceptor implements HandlerInterceptor {
    private   ObjectWriter  jsonWriter = new ObjectMapper().writer();
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (HttpMethod.OPTIONS.matches(request.getMethod())) {
            return true; // 放行 OPTIONS 请求
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("uid") == null){
            PrintWriter writer = response.getWriter();

            String json = jsonWriter.writeValueAsString(ResultUtil.failure(ResultUtil.NO_LOGIN_CODE, ResultUtil.NO_LOGIN_MSG));
            writer.print(json);
            System.out.println("登录拦截器，未登录");
            return false;
        }
        return true;

    }
}
