package com.sofftem.utils;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import java.util.Map;

public class WebUtils {
    /**
     *将字符串转换成为int 类型的数据
     *@param strInt 传入的字符
     *@param defaultValue 如果类型转换失败,则返回默认值
     *@return 返回是一个int类型的值
     */
    public static int parseInt(String strInt,int defaultValue) {
        try {
            return Integer.parseInt(strInt);
        } catch (Exception e) {
            System.out.println("有问题:"+strInt+"所以返回默认值:"+defaultValue);
        }
        return defaultValue;
    }

    /**
     *将字符串转换成为double 类型的数据
     *@param strInt 传入的字符
     *@param defaultValue 如果类型转换失败,则返回默认值
     *@return 返回是一个double类型的值
     */
    public static double parseDouble(String strInt,double defaultValue) {
        try {
            return Double.parseDouble(strInt);
        } catch (Exception e) {
            System.out.println("有问题:"+strInt+"所以返回默认值:"+defaultValue);
        }
        return defaultValue;
    }

    /**
     * 把Map 中的值注入到对应的JavaBean 属性中。
     * @param value
     * @param bean
     * @param <T>
     * @return
     */
    public static <T> T copyParamToBean(Map value, T bean) {
        try {
            System.out.println("注入之前：" + bean);
            //把所有请求的参数都注入到user 对象中
            BeanUtils.populate(bean, value);
            System.out.println("注入之后：" + bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }

    /**
     * 把Map 中的值注入到对应的JavaBean 属性中。
     * @param value
     * @param bean
     * @param calxx 这儿可以使用你需要的时间对象
     * @return
     * @param <T>
     */
    public static <T> T copyParamToBean(Map value, T bean,Class calxx) {
        try {
            System.out.println("注入之前：" + bean);
            //创建一个日期转换器
            DateConverter dateConverter = new DateConverter();
            String[] patt = {"yyyy-MM-dd","yyyy-MM-dd HH:mm:ss"};
            //设置格式
            dateConverter.setPatterns(patt);
            //注册格式
            ConvertUtils.register(dateConverter, calxx);
            //把所有请求的参数都注入到user 对象中
            BeanUtils.populate(bean, value);
            System.out.println("注入之后：" + bean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }
}
