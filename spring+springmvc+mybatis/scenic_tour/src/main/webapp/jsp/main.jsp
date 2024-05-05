<%--
  Created by IntelliJ IDEA.
  User: chnpngwng
  Date: 2023/6/19
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>景区预约登记管理系统</title>
    <link rel="stylesheet" href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
<h1>景区预约登记管理系统</h1>
<form action="/show" method="post">
    游客姓名：<input type="text" name="name">
    游客性别：<input type="text" name="sex">
    游客类别：<select name="type">
    <option value="-1">--不限--</option>
    <option value="0">非会员</option>
    <option value="1">普通会员</option>
    <option value="2">VIP会员</option>
    <option value="3">钻石会员</option>
    <option value="4">年卡会员</option>
</select>
    <input type="submit" value="查询">
    <a href="/insert"><input type="button" value="预约"></a>
</form>
<table>
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>性别</td>
        <td>身份证号</td>
        <td>年龄</td>
        <td>类型</td>
        <td>预约进入日期</td>
        <td>状态</td>
        <td>登记时间</td>
        <td>操作</td>
    </tr>
    <c:forEach var="tour" items="${tourList}">
        <c:if test="${tour.visitState==0}">
        <tr>
            <td>${tour.id}</td>
            <td>${tour.name}</td>
            <td>${tour.sex}</td>
            <td>${tour.idNo}</td>
            <td>${tour.age}</td>
            <td>
                <c:if test="${tour.type==0}">非会员</c:if>
                <c:if test="${tour.type==1}">普通会员</c:if>
                <c:if test="${tour.type==2}">VIP会员</c:if>
                <c:if test="${tour.type==3}">钻石会员</c:if>
                <c:if test="${tour.type==3}">年卡会员</c:if>
            </td>
            <td><fmt:formatDate value="${tour.visitDate}" pattern="yyyy-MM-dd"/></td>
            <td>未使用</td>
            <td><fmt:formatDate value="${tour.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>
                <a href="deleteById?id=#{tour.id}" onclick="return confirm('确定要删除该数据吗？')">删除</a>
            </td>
        </tr>
        </c:if>
        <c:if test="${tour.visitState==1}">
            <tr style="background-color: bisque">
                <td>${tour.id}</td>
                <td>${tour.name}</td>
                <td>${tour.sex}</td>
                <td>${tour.idNo}</td>
                <td>${tour.age}</td>
                <td>
                    <c:if test="${tour.type==0}">非会员</c:if>
                    <c:if test="${tour.type==1}">普通会员</c:if>
                    <c:if test="${tour.type==2}">VIP会员</c:if>
                    <c:if test="${tour.type==3}">钻石会员</c:if>
                    <c:if test="${tour.type==3}">年卡会员</c:if>
                </td>
                <td><fmt:formatDate value="${tour.visitDate}" pattern="yyyy-MM-dd"/></td>
                <td>已使用</td>
                <td><fmt:formatDate value="${tour.registerTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <a href="deleteById?id=#{tour.id}" onclick="return confirm('确定要删除该数据吗？')">删除</a>
                </td>
            </tr>
        </c:if>
    </c:forEach>
    <tr id="all">
        <td colspan="10" >共有${tourList.size()}条数据</td>
    </tr>
</table>
</body>
</html>
