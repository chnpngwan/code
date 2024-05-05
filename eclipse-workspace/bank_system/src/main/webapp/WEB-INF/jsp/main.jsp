<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>银行卡信息管理系统</h1>
	<table border="1" cellspacing="0">
		<tr>
			<td>银行卡序号</td>
			<td>持卡人姓名</td>
			<td>持卡人性别</td>
			<td>银行卡卡号</td>
			<td>银行卡余额</td>
			<td>银行卡级别</td>
			<td>操作</td>
		</tr>
		<c:forEach var="card" items="${list }">
			<tr>
				<td><c:out value="${card.id }"/></td>
				<td><c:out value="${card.name }"/></td>
				<td><c:out value="${card.sex }"/></td>
				<td><c:out value="${card.cardNo }"/></td>
				<td><c:out value="${card.balance }"/></td>
				<td>
					<c:if test="${card.level==1 }">
						普通卡
					</c:if>
					<c:if test="${card.level==2 }">
						铂金卡
					</c:if>
					<c:if test="${card.level==3 }">
						黑卡
					</c:if>
				</td>
				<td>
					<a href="deleteById.do?id=${card.id }" onclick="return confirm('确定删除此条数据吗？')">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="7">
				<a href="goToAdd.do">添加信息</a>
			</td>
		</tr>
	</table>
</body>
</html>