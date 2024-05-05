<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书信息展示</title>
<style type="text/css">
	*{
	margin: 0 auto;
	padding:0px;
	}
	h1{
	text-align: center;
	}
	#th{
	background-color: orange;
	}
</style>
</head>
<body>
	<h1>书籍信息管理系统</h1>
	<table border="1" cellspacing="0" width="800px" height="400px">
		<tr id="th">
			<td>图书编号</td>
			<td>图书名称</td>
			<td>出版社</td>
			<td>作者</td>
			<td>图书价格</td>
			<td>操作</td>
		</tr>
		<c:forEach var="b" items="${list }">
			<tr>
				<td><c:out value="${b.id }"/></td>
				<td><c:out value="${b.name }"/></td>
				<td><c:out value="${b.press }"/></td>
				<td><c:out value="${b.author }"/></td>
				<td><c:out value="${b.price }"/></td>
				<td>
					<a href="deleteById?id=${b.id }" onclick="return confirm('确定要删除此条数据吗？')">删除</a>
				</td>
			</tr>
		
		</c:forEach>
	</table>
</body>
</html>