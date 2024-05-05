package com.flea.common;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.flea.entity.User;
import com.flea.util.JwtUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * 公共字段自动填充，自定义元数据对象处理器
 */
@Component
@Slf4j
public class MyMetaObjectHandler implements MetaObjectHandler {
    /**
     * 插入操作，自动填充
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info("公共字段自动填充[insert]...");
//        log.info(metaObject.toString());

        metaObject.setValue("createTime", LocalDateTime.now());
        metaObject.setValue("updateTime", LocalDateTime.now());

        User currentUser = JwtUtil.getCurrentUser();
//        log.info("当前用户信息：{}", currentUser.toString());

        metaObject.setValue("createUser", currentUser.getId());
        metaObject.setValue("updateUser", currentUser.getId());
    }

    /**
     * 更新操作，自动填充
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info("公共字段自动填充[update]...");
//        log.info(metaObject.toString());

        User currentUser = JwtUtil.getCurrentUser();
//        log.info("当前用户信息：{}", currentUser.toString());

        metaObject.setValue("updateTime", LocalDateTime.now());
        metaObject.setValue("updateUser", currentUser.getId());
    }
}
