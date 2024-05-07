package com.entity.vo;

import com.entity.JiaoshixinxiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
 

/**
 * 教室信息
 * 手机端接口返回实体辅助类 
 * （主要作用去除一些不必要的字段）
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public class JiaoshixinxiVO  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 教室名称
	 */
	
	private String jiaoshimingcheng;
		
	/**
	 * 教室图片
	 */
	
	private String jiaoshitupian;
		
	/**
	 * 教室位置
	 */
	
	private String jiaoshiweizhi;
		
	/**
	 * 教室详情
	 */
	
	private String jiaoshixiangqing;
		
	/**
	 * 最近点击时间
	 */
		
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat 
	private Date clicktime;
		
	/**
	 * 点击次数
	 */
	
	private Integer clicknum;
		
	/**
	 * 用户id
	 */
	
	private Long userid;
				
	
	/**
	 * 设置：教室名称
	 */
	 
	public void setJiaoshimingcheng(String jiaoshimingcheng) {
		this.jiaoshimingcheng = jiaoshimingcheng;
	}
	
	/**
	 * 获取：教室名称
	 */
	public String getJiaoshimingcheng() {
		return jiaoshimingcheng;
	}
				
	
	/**
	 * 设置：教室图片
	 */
	 
	public void setJiaoshitupian(String jiaoshitupian) {
		this.jiaoshitupian = jiaoshitupian;
	}
	
	/**
	 * 获取：教室图片
	 */
	public String getJiaoshitupian() {
		return jiaoshitupian;
	}
				
	
	/**
	 * 设置：教室位置
	 */
	 
	public void setJiaoshiweizhi(String jiaoshiweizhi) {
		this.jiaoshiweizhi = jiaoshiweizhi;
	}
	
	/**
	 * 获取：教室位置
	 */
	public String getJiaoshiweizhi() {
		return jiaoshiweizhi;
	}
				
	
	/**
	 * 设置：教室详情
	 */
	 
	public void setJiaoshixiangqing(String jiaoshixiangqing) {
		this.jiaoshixiangqing = jiaoshixiangqing;
	}
	
	/**
	 * 获取：教室详情
	 */
	public String getJiaoshixiangqing() {
		return jiaoshixiangqing;
	}
				
	
	/**
	 * 设置：最近点击时间
	 */
	 
	public void setClicktime(Date clicktime) {
		this.clicktime = clicktime;
	}
	
	/**
	 * 获取：最近点击时间
	 */
	public Date getClicktime() {
		return clicktime;
	}
				
	
	/**
	 * 设置：点击次数
	 */
	 
	public void setClicknum(Integer clicknum) {
		this.clicknum = clicknum;
	}
	
	/**
	 * 获取：点击次数
	 */
	public Integer getClicknum() {
		return clicknum;
	}
				
	
	/**
	 * 设置：用户id
	 */
	 
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	
	/**
	 * 获取：用户id
	 */
	public Long getUserid() {
		return userid;
	}
			
}
