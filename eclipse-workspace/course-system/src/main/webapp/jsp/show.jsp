<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程信息管理系统</title>
</head>
<body>
	<h1>个课程信息管理系统</h1>
	<a href="insert.do">添加学生信息</a><br/><br/>
	<fieldset>
		<legend>搜索</legend>
		<form action="show.do" method="POST" >
            课程名称：<input type="text" name="name" >
            课程类型：<select name="type">
            	  	<option value="">--请选择--</option>
            	  	<option value="公共课">公共课</option>
            	  	<option value="专业课">专业课</option>
            	  </select>
            	  <input  type="submit" value="搜索"><br>
     </form>
	</fieldset>
	<table border="1" cellspacing="0">
		<tr>
			<td>课程编码</td>
			<td>课程名称</td>
			<td>课程类型</td>
			<td>课程学分</td>
			<td>课程学时</td>
			<td>操作</td>
		</tr>
		<c:forEach var="courses" items="${ courseList }">
		<tr>
			<td><c:out value="${ courses.id }"></c:out></td>
			<td><c:out value="${ courses.name }"></c:out></td>
			<td><c:out value="${ courses.type }"></c:out></td>
			<td><c:out value="${ courses.credit }"></c:out></td>
			<td><c:out value="${ courses.class_hour }"></c:out></td>
			<td>
				<a href="selectById.do?id=${ courses.id }">修改</a>
				<a href="deleteById.do?id=${ courses.id }" onclick="return confirm('确实删除此数据嘛')">删除</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5">共有${ courseList.size() }条</td>
		</tr>
	</table>
</body>
</html>