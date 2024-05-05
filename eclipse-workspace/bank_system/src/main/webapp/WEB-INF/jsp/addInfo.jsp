<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>添加银行卡信息</h1>
	<form action="addCardInfo.do" method="post">
		<table border="1" cellspacing="0">
			<tr>
				<td>办卡人姓名</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>办卡人性别</td>
				<td>
					<input type="radio" name="sex" checked="checked" value="男">男
					<input type="radio" name="sex" value="女">女
				</td>
			</tr>
			<tr>
				<td>银行卡号</td>
				<td><input type="text" name="cardNo"></td>
			</tr>
			<tr>
				<td>账户余额</td>
				<td><input type="text" name="balance"></td>
			</tr>
			<tr>
				<td>银行卡级别</td>
				<td>
					<select name="level">
						<option value="1">普通卡</option>
						<option value="2">铂金卡</option>
						<option value="3">黑卡</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="添加">
				</td>
			</tr>
		</table>
		
	</form>
</body>
</html>