package com.entity.view;

import com.entity.XinlibaogaoEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 心理报告
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
@TableName("xinlibaogao")
public class XinlibaogaoView  extends XinlibaogaoEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XinlibaogaoView(){
	}
 
 	public XinlibaogaoView(XinlibaogaoEntity xinlibaogaoEntity){
 	try {
			BeanUtils.copyProperties(this, xinlibaogaoEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
