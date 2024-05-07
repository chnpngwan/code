package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 教室信息
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
@TableName("jiaoshixinxi")
public class JiaoshixinxiEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public JiaoshixinxiEntity() {
		
	}
	
	public JiaoshixinxiEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 教室编号
	 */
					
	private String jiaoshibianhao;
	
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
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：教室编号
	 */
	public void setJiaoshibianhao(String jiaoshibianhao) {
		this.jiaoshibianhao = jiaoshibianhao;
	}
	/**
	 * 获取：教室编号
	 */
	public String getJiaoshibianhao() {
		return jiaoshibianhao;
	}
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
