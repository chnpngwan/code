<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据展示</title>
</head>
<body>
	<h1>学生信息管理系统</h1>
	<a href="insert.do">添加学生信息</a>
	<table border="1" cellspacing="0">
		<tr>
			<td>学号</td>
			<td>姓名</td>
			<td>性别</td>
			<td>年龄</td>
			<td>操作</td>
		</tr>
		<c:forEach var="student" items="${ studentList }">
		<tr>
			<td><c:out value="${ student.id }"></c:out></td>
			<td><c:out value="${ student.name }"></c:out></td>
			<td><c:out value="${ student.sex }"></c:out></td>
			<td><c:out value="${ student.age }"></c:out></td>
			<td>
				<a href="update.do">修改</a>
				<a href="${pageContext.request.contextPath }/delete.do?id=${ student.id }" onclick="return confirm('确实删除此数据嘛')">删除</a>
			</td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="5">共有${ studentList.size() }条</td>
		</tr>
	</table>
</body>
</html>