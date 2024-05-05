package com.student.utils;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Enumeration;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.jsp.PageContext;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class FileUploadUtil {
	
	public static String uploadPath = "../images";//默认的上传路径
	private static final String ALLOWEDFIIESLIST = "gif,jpg,jpeg,png";//允.上传的文件类型
	private static final String DENIEDFILESLIST = "exe,bat,jsp";//不允许上传的文件类型
	private static final int TOTALIMAXFILESIZE = 100 * 1024 * 1024;//最大总上传文件的最大值
	private static final int MAXFILESIZE = 10 * 1024 * 1024;//单个上传文件的最大值
	
	
	/**
	 * 文件上传  单个文件
	 * @param pageContext
	 * @return map
	 * @throws ServletException
	 * @throws IOException
	 * @throws SQLException
	 * @throws SmartUploadException
	 */
	public Map<String, String> uploads(PageContext pageContext) throws ServletException, IOException, SQLException, SmartUploadException {
		
		Map<String, String> map = new HashMap<String, String>();
		
		//上传工具
		SmartUpload su = new SmartUpload();
		//初始化组件
		su.initialize(pageContext);
		
		//配置参数
		su.setAllowedFilesList( ALLOWEDFIIESLIST );//允许上传的文件类型
		su.setDeniedFilesList(DENIEDFILESLIST ); //丕允许上传的文件类型
		su.setTotalMaxFileSize( TOTALIMAXFILESIZE );//最太总L传文件的最太值
		su .setMaxFileSize (MAXFILESIZE );//单个上传文件的最大值
		
		su. setCharset("UTF-8"); //上传数掘的编码集
		su.upload();  //开始上传
		
		//获取上传的参数信息  非文件参数  注意 此时  的request是com.jspsmaxt.upload.Request而不是ittpServletRequest中
		Request request = su.getRequest();
		System.out.println ( request ) ;
		//获取前端网嚣控件的名称
		Enumeration<String> enums = request.getParameterNames() ;
		//单企控件名称name属性
		String name = null;
		//获取信息
		while(enums.hasMoreElements()) {
			name = enums.nextElement(); //键
			map.put(name, request.getParameter(name)); //值
		}
		
		//TODo :思考问题
		/*
		* 1、如何上传文件
		* 2、文件存储服务器的那个位置?
		* 3、文件如加何存诸到指定的位置?
		* 4、获取存储的文件路在如何处理?
		* 5、如果服务器指定的位置有教张同名图片  如何处理?
		*/

		
		Files files = su.getFiles();
		System.out.println(files);
		
		//如果无文件  就直接返回  普通文本信息  说明用户为上传文件
		if(null == files || files.getCount() <= 0 || files.getSize() <=0 || files.getFile(0).getSize() <= 0) {
			return map;
		}
		//有  则循环取出用户上传到文件
		Collection<File> fls = files.getCollection();
		
		//TODO 文件存储服务器的道细位置
		//获取保存文件的文件夹的绝对路径->Tomcat服务器的绝从路径      c...\webapps\项目名\
		//String basePath = pageContext.getRequest().getRealPath("/");
		String basePath = pageContext.getServletContext().getRealPath("/");//C:\Tomcat\apache-tomcat-9.0.50\webapps\Goods\
		//pageContext.getServletContext()  对应的实倾名就是jsp中内置对象的app1ication
		System.out.println ( basePath ) ;
		
		String fileName = null; // 上传后的文件名称
		String fieldName = null; // 上传文件域的控件name属性名
		String filePath = null; //文件保存路径
		
		String temp = null;
		String pathStr = null;
		
		//循环处理文件
		for(File fl : fls){
			if(!fl.isMissing()) {//文本未丢失  打印相关信息.
			/*
			System.out.println(fl.getFieldName()); //控件名.
			System.out.println(fl.getFileName()) ;
			System.out.println(fl.getContentType());
			System.out.println(fl.getSize());*/
			
			temp = fl.getFieldName(); //file  photo  页面多个文件域控件
			if(StringUtil.checkNull(fieldName)) {
				fieldName = temp;
			}else {
				if(!temp.equals(fieldName)) {
					map.put(fieldName, pathStr);
					pathStr = "";
					fieldName = temp;
				}
			}
			
			
			//为了避免   文件名相同出现的文件覆盖问题   所以自定义上传文件的名字  注意   fileName   l  fieldName
			fieldName = fl.getFieldName () ;
			fileName = uploadPath + "/" + new Date().getTime() + "_" + fl.getFileName(); // images/123_1.jpg
		
			if(StringUtil.checkNull(pathStr)) {
				pathStr = fileName;
			}else {
				pathStr += ";" + fileName;
			}
	
			
			//将上传的文件存储服务器的指定目录   获取上传的服务器路径 ＋ 自定义路径 ＋自定义名
			filePath = basePath + fileName;
			System.out.println(filePath);
			//开始存储文件
			fl.saveAs(filePath, SmartUpload.SAVE_PHYSICAL);
			
			//想象:保存服务器项目目录下images文件下     不能永久性在储    服务器重启消失
			//TODO 如何永久性存储   文件信息
			//方案:webapps\顶目名\images  -> wekagpa\images ->在默认路径前面加  ../
		
			//TODO 1、如果是一个文件域中有多个文件如何处理?.-->提示:3乌众里的拼援1.png;2.mna.
			//TODO 2、如果是多文件域   没一个文件域也可能出现多个文件  又该如何处理?
			}
			
		}
		map.put(fieldName, "../"+pathStr); //控件名 -> 自定义的文件名  存入map->多图拼接路径  数据需要储存的相对路径
		return map; //带有图片的相对路径信息
		
		//TODO 如何以对象的方式返回  而不是map
	}
}
