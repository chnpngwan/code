package com.entity.model;

import com.entity.JiaoshishenqingjiaoshiEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;
import java.io.Serializable;
 

/**
 * 教师申请教室
 * 接收传参的实体类  
 *（实际开发中配合移动端接口开发手动去掉些没用的字段， 后端一般用entity就够用了） 
 * 取自ModelAndView 的model名称
 * @author 
 * @email 
 * @date 2022-04-27 23:22:15
 */
public class JiaoshishenqingjiaoshiModel  implements Serializable {
	private static final long serialVersionUID = 1L;

	 			
	/**
	 * 教室名称
	 */
	
	private String jiaoshimingcheng;
		
	/**
	 * 使用时间
	 */
	
	private String shiyongshijian;
		
	/**
	 * 用途
	 */
	
	private String yongtu;
		
	/**
	 * 教师账号
	 */
	
	private String jiaoshizhanghao;
		
	/**
	 * 教师姓名
	 */
	
	private String jiaoshixingming;
		
	/**
	 * 是否审核
	 */
	
	private String sfsh;
		
	/**
	 * 审核回复
	 */
	
	private String shhf;
				
	
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
	 * 设置：使用时间
	 */
	 
	public void setShiyongshijian(String shiyongshijian) {
		this.shiyongshijian = shiyongshijian;
	}
	
	/**
	 * 获取：使用时间
	 */
	public String getShiyongshijian() {
		return shiyongshijian;
	}
				
	
	/**
	 * 设置：用途
	 */
	 
	public void setYongtu(String yongtu) {
		this.yongtu = yongtu;
	}
	
	/**
	 * 获取：用途
	 */
	public String getYongtu() {
		return yongtu;
	}
				
	
	/**
	 * 设置：教师账号
	 */
	 
	public void setJiaoshizhanghao(String jiaoshizhanghao) {
		this.jiaoshizhanghao = jiaoshizhanghao;
	}
	
	/**
	 * 获取：教师账号
	 */
	public String getJiaoshizhanghao() {
		return jiaoshizhanghao;
	}
				
	
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
	 * 设置：是否审核
	 */
	 
	public void setSfsh(String sfsh) {
		this.sfsh = sfsh;
	}
	
	/**
	 * 获取：是否审核
	 */
	public String getSfsh() {
		return sfsh;
	}
				
	
	/**
	 * 设置：审核回复
	 */
	 
	public void setShhf(String shhf) {
		this.shhf = shhf;
	}
	
	/**
	 * 获取：审核回复
	 */
	public String getShhf() {
		return shhf;
	}
			
}
