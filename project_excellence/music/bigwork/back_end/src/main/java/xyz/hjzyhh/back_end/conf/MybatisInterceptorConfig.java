package xyz.hjzyhh.back_end.conf;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import xyz.hjzyhh.back_end.interceptor.mybatis.AddContextPathInterceptor;

@Configuration
public class MybatisInterceptorConfig {

//    @Bean
//    public String myInterceptor(SqlSessionFactory sqlSessionFactory) {
//        sqlSessionFactory.getConfiguration().addInterceptor(new AddContextPathInterceptor());
//        return "AddContextPathInterceptor";
//    }
}
