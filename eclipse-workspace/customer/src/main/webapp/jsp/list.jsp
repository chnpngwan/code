<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>数据展示</title>
<style>
	h1{
		text-align: center;
	}
    .body{
        width: 1200px;
        margin: 0 auto;
    }
    th,td{
        text-align: center;
    }
</style>
</head>
<body>
	<h1>客户信息管理系统</h1>
    <div class="body">
    	<a href="insert.do">添加信息</a><br/><br/>
        <form action="list.do" method="post">
            客户编号：
            <input type="text" name="customerId"/>
            客户姓名：
            <input type="text" name="customerName"/>
            <input type="submit" value="查询"/>
        </form>
        <br />
        <table border="1" width="1200px" cellspacing="0">
            <tr>
                <th>客户编号</th>
                <th>客户姓名</th>
                <th>负责人姓名</th>
                <th>客户来源</th>
                <th>客户所属行业</th>
                <th>创建日期</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${listCustomers }" var="cus">
                <tr>
                    <td>${ cus.customerId }</td>
                    <td>${ cus.customerName }</td>
                    <td>${ cus.userName }</td>
                    <td>${ cus.source }</td>
                    <td>${ cus.industry }</td>
                    <td>${ cus.createDate }</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/queryCustomerById.do?customer_id=${cus.customerId }">修改</a>&emsp;
                        <a href="${pageContext.request.contextPath}/delete.do?customer_id=${cus.customerId }"
   							onclick="if(confirm('您确定删除该条数据吗？')==false){return false;}">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>