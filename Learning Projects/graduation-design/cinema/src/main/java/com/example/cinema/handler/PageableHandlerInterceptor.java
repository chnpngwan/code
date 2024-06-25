package com.example.cinema.handler;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.cinema.utils.PageUtil;
import com.mysql.cj.util.StringUtils;
import org.jetbrains.annotations.NotNull;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Optional;

import static com.example.cinema.constant.PageConstant.*;

public class PageableHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             @NotNull HttpServletResponse response,
                             @NotNull Object handler) {
        String currentPage = request.getParameter(CURRENT);
        String pageSize = Optional.ofNullable(request.getParameter(SIZE)).orElse(DEFAULT_SIZE);
        if (!StringUtils.isNullOrEmpty(currentPage)) {
            PageUtil.setCurrentPage(new Page<>(Long.parseLong(currentPage), Long.parseLong(pageSize)));
        }
        return true;
    }

    @Override
    public void afterCompletion(@NotNull HttpServletRequest request,
                                @NotNull HttpServletResponse response,
                                @NotNull Object handler,
                                Exception ex) {
        PageUtil.remove();
    }
}
