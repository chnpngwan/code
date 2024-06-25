package com.zpark.legou.conf;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SpringWebContextConfig implements WebMvcConfigurer {

    // http://127.0.0.1:8080/anonymous/data/legou-y48325425943593-a.png
    // anonymous/data  ->  d:\data-2104


    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("http://localhost:5173")
                .allowedHeaders("*")
                .allowedMethods("*")
                .allowCredentials(true);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/anonymous/data/**")
                .addResourceLocations("file:D:\\data-2104\\");
    }
}
