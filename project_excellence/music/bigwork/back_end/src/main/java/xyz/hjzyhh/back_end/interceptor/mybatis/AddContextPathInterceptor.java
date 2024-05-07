package xyz.hjzyhh.back_end.interceptor.mybatis;


import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.*;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import xyz.hjzyhh.back_end.utils.FileUtils;

import java.util.ArrayList;
import java.util.Properties;

@Intercepts({
        @Signature(type = Executor.class, method = "query",
                args = { MappedStatement.class,
                        Object.class,
                        RowBounds.class,
                        ResultHandler.class
                })
})
public class AddContextPathInterceptor implements Interceptor {
    @Override
    public Object intercept(Invocation invocation) throws Throwable {
        //执行请求方法，并将所得结果保存到result中
        Object result = invocation.proceed();
        if (result instanceof ArrayList) {
            ArrayList resultList = (ArrayList) result;
            for (int i = 0; i < resultList.size(); i++) {
                FileUtils.addContextPath(resultList.get(i));
            }
        }else{
            FileUtils.addContextPath(result);
        }
        return result;
    }

    @Override
    public Object plugin(Object target) {
        return Plugin.wrap(target, this);
    }

    @Override
    public void setProperties(Properties properties) {
    }
}
