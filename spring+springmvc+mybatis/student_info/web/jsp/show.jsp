<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 4/25/2023
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>展示</title>
</head>
<body>
    <h1>学生消息管理系统</h1>
    <fieldset>
        <label>搜索</label>
        <form action="/insert.do" method="post">
            姓名：<input type="text" name="name"/>
                <input type="submit" value="查询"/>
        </form>
        <a href="#">新增</a>
    </fieldset>
    <table border="1" cellspacing="0">
        <tr>
            <td>编号</td>
            <td>姓名</td>
            <td>年龄</td>
            <td>班级名称</td>
            <td>生日</td>
            <td>操作</td>
        </tr>
        <c:forEach var="student" items="studentList">
            <tr>
                <td><c:out value="${ student.id }"/></td>
                <td><c:out value="${ student.name }"/></td>
                <td><c:out value="${ student.age }"/></td>
                <td><c:out value="${ student.classes }"/></td>
                <td>
                    <fmt:formatDate value="${ student.birth }" pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
                <td>
                    <a href="/delete.do?id=${ student.id }" onclick="return confirm('确定删除此数据嘛？')">删除</a>
                </td>
            </tr>
        </c:forEach>
        <tr>共有${student.size}</tr>
    </table>
</body>
</html>
