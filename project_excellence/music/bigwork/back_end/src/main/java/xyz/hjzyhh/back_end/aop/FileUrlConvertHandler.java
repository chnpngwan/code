package xyz.hjzyhh.back_end.aop;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import xyz.hjzyhh.back_end.utils.FileUtils;
import xyz.hjzyhh.back_end.utils.Result;

/**
 * 定义AOP切面。将所有的返回值对其属性检测，若为文件Url类型，则添加访问前缀，反之则不添加。
 */
@Aspect
@Component
public class FileUrlConvertHandler {
    // 定义切点，拦截所有带有@RestController或@Controller注解的方法
    @Pointcut("@within(org.springframework.stereotype.Controller) || @within(org.springframework.web.bind.annotation.RestController)")
    public void controllerMethods() {}


    // 定义后置增强逻辑，处理返回对象的特定属性
    @AfterReturning(pointcut = "controllerMethods()", returning = "response")
    public void addPrefixToResponse(Object response) {
        // 为静态资源URL配置目录
        if(response instanceof Result){
            Result response1 = (Result) response;
            FileUtils.addContextPath(response1.getData());
        }

    }
}
