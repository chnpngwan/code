package com.entity.view;

import com.entity.JiaoxuefankuiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
 

/**
 * 教学反馈
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
@TableName("jiaoxuefankui")
public class JiaoxuefankuiView  extends JiaoxuefankuiEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JiaoxuefankuiView(){
	}
 
 	public JiaoxuefankuiView(JiaoxuefankuiEntity jiaoxuefankuiEntity){
 	try {
			BeanUtils.copyProperties(this, jiaoxuefankuiEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}
}
