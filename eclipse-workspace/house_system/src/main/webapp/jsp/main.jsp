<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>房源信息登记系统</title>
	<style type="text/css">
		h1, th, td {
            text-align: center;
        }
        p {
            text-align: center;
        }
	</style>
</head>
<body>
	<form action="show.do" method="post">
	<h1 style="text-align: center;">房源信息登记系统</h1><br></br>
	所在区域：<input type="text" name="location">
	面积大小：<input type="text" name="min">---<input type="text" name="max">
	<input type="submit" value="查询">
	</form>
	<table border="1" width="1000px" cellspacing="0">
		<tr>
			<td>编号</td>
			<td>区域</td>
			<td>面积</td>
			<td>详细地址</td>
			<td>户型</td>
			<td>联系电话</td>
			<td>登记时间</td>
			<td>操作</td>
		</tr>
		<c:forEach var="house" items="${houses}">
			<tr>
				<td>${house.id}</td>
				<td>${house.location}</td>
				<td>${house.area}</td>
				<td>${house.address}</td>
				<td>${house.type}</td>
				<td>${house.mobile}</td>
				<td>
					<fmt:formatDate value="${house.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<a href="deteleHouseById.do?id=${house.id}" onclick="return confirm('你确定要删除此数据吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="8">共为您查询到${houses.size()}条房源信息</td>
		</tr>
	</table>
</body>
</html>