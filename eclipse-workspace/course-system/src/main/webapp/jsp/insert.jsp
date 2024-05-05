<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加</title>
</head>
<body>
	<h1>添加课程信息</h1>
	<form action="insertDo.do" method="post">
		<label>
			课程编码：<input type="text" name="id">
		</label>
		<label>
			课程名称：<input type="text" name="name">
		</label>
		<label>
			课程类型：<input type="radio" class="type" name="type" value="公共课">公共课
				  <input type="radio" class="type" name="type" value="专业课">专业课
		</label>
		<label>
			课程学分：<input type="text" name="credit">
		</label>
		<label>
			课程学时：<input type="text" name="class_hour">
		</label>
		<input type="submit" value="添加">
	</form>
</body>
</html>