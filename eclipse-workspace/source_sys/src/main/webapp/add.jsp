<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>添加信息</h1>
	<form action="addSourceInfo">
		<table border="1" cellspacing="0">
			<tr>
				<td>名称：</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>类型：</td>
				<td><input type="text" name="type"></td>
			</tr>
			<tr>
				<td>采购时间：</td>
				<td><input type="date" name="buyDate"></td>
			</tr>
			<tr>
				<td>价格：</td>
				<td><input type="text" name="price"></td>
			</tr>
			<tr>
				<td><input type="submit" value="添加"></td>
				<td><input type="reset" value="重置"></td>
			</tr>
		</table>
	</form>
</body>
</html>