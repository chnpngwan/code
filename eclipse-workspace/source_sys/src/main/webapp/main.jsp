<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>乐购资源管理系统</title>
</head>
<body>
	<h1>乐购资源管理系统</h1>
	<form action="show">
		<fieldset>
			名称：<input type="text" name="name">
		<input type="submit" value="搜索">
		</fieldset>
	</form>
	<table border="1" cellspacing="0">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>类型</td>
			<td>采购时间</td>
			<td>价格</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${list }" var="s">
			<tr>
				<td><c:out value="${s.id }"/></td>
				<td><c:out value="${s.name }"/></td>
				<td><c:out value="${s.type }"/></td>
				<td><fmt:formatDate value="${s.buyDate }" pattern="yyyy-MM-dd"/></td>
				<td><c:out value="${s.price }"/></td>
				<td>
					<a href="deleteById?id=${s.id }">删除</a>
				</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6">
				<a href="add.jsp">新增</a>
				<span>共计<c:out value="${list.size() }"/>条数据</span>
			</td>
		</tr>
		<%-- <tr>
			<!--分页条-->
   <div style="text-align: right">
    <div class="pagination">
     <ul>
      <li><a>总⽤户数:${userGrid.total }⼈</a></li>
      <li><a>第${userGrid.current }页</a></li>
      <c:if test="${userGrid.current ne 1 }">
       <li><a 
        href="?pageNum=${userGrid.current-1 }">上⼀页</a>
		</tr> --%>
	</table>
</body>
</html>