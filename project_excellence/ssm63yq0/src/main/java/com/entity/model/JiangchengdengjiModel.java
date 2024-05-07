package com.entity.model;

import com.entity.JiangchengdengjiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
 

/**
 * 奖惩登记
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public class JiangchengdengjiModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 教师姓名
	 */
	
	private String jiaoshixingming;
		
	/**
	 * 学号
	 */
	
	private String xuehao;
		
	/**
	 * 姓名
	 */
	
	private String xingming;
		
	/**
	 * 类型
	 */
	
	private String leixing;
		
	/**
	 * 奖惩原因
	 */
	
	private String jiangchengyuanyin;
		
	/**
	 * 奖惩内容
	 */
	
	private String jiangchengneirong;
		
	/**
	 * 奖惩日期
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date jiangchengriqi;
				
	
	/**
	 * 设置：教师姓名
	 */
	 
	public void setJiaoshixingming(String jiaoshixingming) {
		this.jiaoshixingming = jiaoshixingming;
	}
	
	/**
	 * 获取：教师姓名
	 */
	public String getJiaoshixingming() {
		return jiaoshixingming;
	}
				
	
	/**
	 * 设置：学号
	 */
	 
	public void setXuehao(String xuehao) {
		this.xuehao = xuehao;
	}
	
	/**
	 * 获取：学号
	 */
	public String getXuehao() {
		return xuehao;
	}
				
	
	/**
	 * 设置：姓名
	 */
	 
	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	
	/**
	 * 获取：姓名
	 */
	public String getXingming() {
		return xingming;
	}
				
	
	/**
	 * 设置：类型
	 */
	 
	public void setLeixing(String leixing) {
		this.leixing = leixing;
	}
	
	/**
	 * 获取：类型
	 */
	public String getLeixing() {
		return leixing;
	}
				
	
	/**
	 * 设置：奖惩原因
	 */
	 
	public void setJiangchengyuanyin(String jiangchengyuanyin) {
		this.jiangchengyuanyin = jiangchengyuanyin;
	}
	
	/**
	 * 获取：奖惩原因
	 */
	public String getJiangchengyuanyin() {
		return jiangchengyuanyin;
	}
				
	
	/**
	 * 设置：奖惩内容
	 */
	 
	public void setJiangchengneirong(String jiangchengneirong) {
		this.jiangchengneirong = jiangchengneirong;
	}
	
	/**
	 * 获取：奖惩内容
	 */
	public String getJiangchengneirong() {
		return jiangchengneirong;
	}
				
	
	/**
	 * 设置：奖惩日期
	 */
	 
	public void setJiangchengriqi(Date jiangchengriqi) {
		this.jiangchengriqi = jiangchengriqi;
	}
	
	/**
	 * 获取：奖惩日期
	 */
	public Date getJiangchengriqi() {
		return jiangchengriqi;
	}
			
}
