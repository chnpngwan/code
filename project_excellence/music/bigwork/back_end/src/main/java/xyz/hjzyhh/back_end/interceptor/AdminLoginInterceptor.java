package xyz.hjzyhh.back_end.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.springframework.web.servlet.HandlerInterceptor;
import xyz.hjzyhh.back_end.utils.ResultUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminLoginInterceptor implements HandlerInterceptor {
    private ObjectWriter jsonWriter = new ObjectMapper().writer();
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(request.getSession().getAttribute("aid") == null){
            String json = jsonWriter.writeValueAsString(ResultUtil.failure(ResultUtil.NO_LOGIN_CODE, ResultUtil.NO_LOGIN_MSG));
            response.getWriter().print(json);
            return false;
        }
        return true;
    }
}
