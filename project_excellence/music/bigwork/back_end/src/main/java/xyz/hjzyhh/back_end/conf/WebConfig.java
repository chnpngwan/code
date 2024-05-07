package xyz.hjzyhh.back_end.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import xyz.hjzyhh.back_end.interceptor.AdminLoginInterceptor;
import xyz.hjzyhh.back_end.interceptor.CharsetInterceptor;
import xyz.hjzyhh.back_end.interceptor.LoginInterceptor;
//@EnableWebMvc
@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new CharsetInterceptor()).addPathPatterns("/**").excludePathPatterns("/chat");
        // 注册登录拦截器
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/admin/**","/error",
                        "/user/login","/user/register",
                        "/video/recommend","/videos/**","/covers/**",
                        "/avatars/**","/authimg/**",
                        "/file/**",
                        "/security-questions/**",
                        "/chat"
                        );

        registry.addInterceptor(new AdminLoginInterceptor())
                .addPathPatterns("/admin/**")
                .excludePathPatterns("/admin/login","/chat");
    }

    @Value("${external.folder.path}")
    public String externalFolderPath;

    public String fileAccassPrefix = "/file";

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(fileAccassPrefix+"/**")  // 定义映射的 URL 路径
                .addResourceLocations("file:" + externalFolderPath);  // 指定外部文件夹的路径
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://127.0.0.1:5173", "http://127.0.0.1:8000")
                .allowedMethods("*")
                .allowedHeaders("*")
                .allowCredentials(true)
                .exposedHeaders("Access-Control-Allow-Origin");
    }
}
