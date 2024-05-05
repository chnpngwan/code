package com.student.utils;

import com.sun.mail.util.MailSSLSocketFactory;
import com.swetake.util.Qrcode;

import javax.imageio.ImageIO;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

/**
 * 邮箱发送工具类
 */
public class MailUtils {
	public static String verifyCode;
	
	public static boolean encode(String srcValue, String qrcodePicfilePath){
		int MAX_DATA_LENGTH = 200;
	     byte[] d = srcValue.getBytes();
	     int dataLength = d.length;
	     int imageWidth = 113; 
	     int imageHeight = imageWidth;
	     BufferedImage bi = new BufferedImage(imageWidth, imageHeight,BufferedImage.TYPE_INT_RGB);
	     Graphics2D g = bi.createGraphics();
	     g.setBackground(Color.WHITE);
	     g.clearRect(0, 0, imageWidth, imageHeight);
	     g.setColor(Color.BLACK);
	     if (dataLength > 0 && dataLength <= MAX_DATA_LENGTH) {
	        Qrcode qrcode = new Qrcode();
	        qrcode.setQrcodeErrorCorrect('M'); 
	        qrcode.setQrcodeEncodeMode('B'); 
	        qrcode.setQrcodeVersion(5);
	        boolean[][] b = qrcode.calQrcode(d);
	        int qrcodeDataLen = b.length;
	        for (int i = 0; i < qrcodeDataLen; i++) {
	           for (int j = 0; j < qrcodeDataLen; j++) {
	              if (b[j][i]) {
	                 g.fillRect(j * 3 + 2, i * 3 + 2, 3, 3); 
	              }
	           }
	        }
	        System.out.println("二维码成功生成！！");
	     } else {
	        System.out.println( dataLength +"大于"+ MAX_DATA_LENGTH);
	        return false;
	     }
	     g.dispose();
	     bi.flush();
	     File f = new File(qrcodePicfilePath);
	     String suffix = f.getName().substring(f.getName().indexOf(".")+1, f.getName().length());
	     System.out.println("二维码输出成功！！");
	     try {
	        ImageIO.write(bi, suffix, f);
	     } catch (IOException ioe) {
	        System.out.println("二维码生成失败" + ioe.getMessage());
	        return false;
	     }
	     return true;
	}
	
	/**
	*正则表达式验证邮箱
	*/
	public static boolean isEmail(String email) {
		if (email == null || "".equals(email)) {
			return false;
		} 
	    String regex = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
	    return email.matches(regex);
	}
	
	/**
	*正则表达式验证金额
	*/
	public static boolean isNumber(String num) {
		if (num == null || "".equals(num)) {
			return false;
		} 
	    String regex = "^[0-9]+(.[0-9]{1,2})?$";
	    return num.matches(regex);
	}
	
	
	/**
	*正则表达式验证密码
	*可以包含数字、字母、下划线，并且要同时含有数字和字母，且长度要在6-15位之间
	*/
	public static boolean isPwd(String pwd) {
		if (pwd == null || "".equals(pwd)) {
			return false;
		} 
	    String regex = "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z_]{6,15}$";
	    return pwd.matches(regex);
	}
	 
    /**
     * 发送验证码
     * @param receiveMail
     * @return 
     * @throws Exception
     */
    public static  void sendMail(String receiveMail) {
        Properties prop = new Properties();
        // 开启debug调试，以便在控制台查看
        prop.setProperty("mail.debug", "true");
        // 设置邮件服务器主机名
        prop.setProperty("mail.host", "smtp.163.com");
        // 发送服务器需要身份验证
        prop.setProperty("mail.smtp.auth", "true");
        // 发送邮件协议名称
        prop.setProperty("mail.transport.protocol", "smtp");
        // 开启SSL加密，否则会失败
        try {
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            prop.put("mail.smtp.ssl.enable", "true");
            prop.put("mail.smtp.ssl.socketFactory", sf);
            // 创建session
            Session session = Session.getInstance(prop);
            // 通过session得到transport对象
            Transport ts = session.getTransport();
            // 连接邮件服务器：邮箱类型，帐号，POP3/SMTP协议授权码 163使用：smtp.163.com，qq使用：smtp.qq.com
            ts.connect("smtp.qq.com", "2445222672@qq.com", "mrytpfafclcvebcd");
            // 创建邮件
            Message message = createSimpleMail(session, receiveMail);
            // 发送邮件
            ts.sendMessage(message, message.getAllRecipients());
            ts.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * @Method: createSimpleMail
     * @Description: 创建一封只包含文本的邮件
     */
    public static MimeMessage createSimpleMail(Session session, String receiveMail) throws Exception {
        //  获取6位随机验证码（英文）
      	String[] letters = new String[]{
                "q", "w", "e", "r", "t", "y", "u", "i", "o", "p", "a", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m",
                "A", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Z", "X", "C", "V", "B", "N", "M",
                "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            stringBuilder.append(letters[(int) Math.floor(Math.random() * letters.length)]);
        }
        
		//获取6位随机验证码（中文），根据项目需要选择中英文
        verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);
		
        // 创建邮件对象
        MimeMessage message = new MimeMessage(session);
        // 指明邮件的发件人
        message.setFrom(new InternetAddress("2445222672@qq.com"));
        // 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMail));
        // 邮件的标题
        message.setSubject("验证码");
        // 邮件的文本内容
        message.setContent("您的验证码：" + verifyCode + "，如非本人操作，请忽略！请勿回复此邮箱", "text/html;charset=UTF-8");

        // 返回创建好的邮件对象
        return message;
    }
}
