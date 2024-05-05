package com.student.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 验证码图片
 * company 源辰信息
 * @author 38929
 * @date 2021年8月6日
 * @version 1.0
 * Email 1198865589@qq.com
 */
@WebServlet("/code")
public class CreateCodeController extends HttpServlet{

	private static final long serialVersionUID = -2873663381503301297L;

	//获取后台生成的验证码图片
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//处理浏览器的缓存页面
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cachen-Control", "no-cache");//指定请求与和响应遵循的缓存机制
		//Expiree 实体报头给响应过期时间  日期和时间 HTTP1.1 的客户端和缓存必须将其非法的时间格式 包括0看着已经过期
		response.setDateHeader("Expiree", 0);
		
		//生成验证码
		String code = getRandomCode();
	
		//将生成的验证码存储在session 以便登陆校验
		request.getSession().setAttribute("vcode", code);
		
		//创建验证码图片并返回
		BufferedImage image = getCodeImage( code, 110, 38);
		
		//响应图片给页面
		ImageIO.write(image, "JPG", response.getOutputStream());
	}

	/**
	 * 获取验证码图片
	 * @param code 验证码
	 * @param width  图片宽度
	 * @param height 图片高度
	 * @return
	 */
	private BufferedImage getCodeImage(String code, int width, int height) {
		BufferedImage image = new BufferedImage( width, height, BufferedImage.TYPE_INT_RGB);//宽 高 类型 三原色
		
		//获取绘制图片的绘画对象
		Graphics graphics = image.getGraphics();
		
		//设置画笔颜色
		graphics.setColor( getRandomColor(215, 40) );
		
		//绘制 
		graphics.fillRect(0, 0, width, height);
		
		//制作干扰线
		int x1, y1, x2, y2;//两点一线 起点 重点 坐标
		Random rd = new Random();
		for(int i = 0; i  < 30; i++) {
			//设置干扰线
			graphics.setColor( getRandomColor(150, 40));
			x1 = rd.nextInt( width );
			y1 = rd.nextInt( height );
			x2 = rd.nextInt( width );
			y2 = rd.nextInt( height );
			graphics.drawLine(x1, y1, x2, y2);
		}
		
		
		//设置字体
		graphics.setFont(new Font("Coriew New", Font.ITALIC, 24));//字体 斜体 大小
		
		//绘制验证码
		char[] codes = code.toCharArray();
		//循环绘制
		for(int i = 0, len = codes.length; i < len; i++) {
			graphics.setColor( getRandomColor(40, 80));
			graphics.drawString(String.valueOf(codes[i]),  10 + 24 * i, 28);
		}
		//销毁绘画对象
		graphics.dispose();
		return image;
	}
	
	/**
	 * 获取随机颜色 0~255
	 * @param start  
	 * @param bound
	 * @return
	 */
	private Color getRandomColor(int start, int bound) {
		Random rd = new Random();
		//获取三原色
		int r = start + rd.nextInt( bound );
		int g = start + rd.nextInt( bound );
		int b = start + rd.nextInt( bound );
		return new Color(r, g, b);
	}

	//随机生成4位验证码
	private String getRandomCode() {
		Random rd = new Random();
		StringBuffer sb = new StringBuffer();
		int flag = 0; //控制 字母大小写 数 
		for(int i = 0; i <= 3; i++) {
			flag = rd.nextInt(3); // 0 1 2
			switch( flag ) {
			  case 0 : sb.append( rd.nextInt( 10 )); break; //0-9
			  case 1 : sb.append( (char)(rd.nextInt( 26 ) + 65)); break; //A-
			  case 2 : sb.append( (char)(rd.nextInt( 10 ) + 97)); break; //a-
			}
		}
		return sb.toString();
	}
	
}
