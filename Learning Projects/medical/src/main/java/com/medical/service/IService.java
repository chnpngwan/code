package com.medical.service;

import java.io.Serializable;
import java.util.List;

/**
 * @author XUEW
 * @apiNote 基础服务抽象接口
 */
public interface IService<T> {

    /**
     * 保存
     * @param t 对象
     * @return t
     */
    T save(T t);

    /**
     * 根据主键获取
     * @param id 主键
     * @return t
     */
    T get(Serializable id);

    /**
     * 根据主键删除
     * @param id 主键
     */
    int delete(Serializable id);

    /**
     * 查询
     * @param o 实体对象
     * @return t
     */
    List<T> query(T o);

    /**
     * 查询全部
     * @return t
     */
    List<T> all();
}
