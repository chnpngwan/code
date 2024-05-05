<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 4/25/2023
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
</head>
<body>
    <h1>新增学生消息</h1>
    <form action="/insertDo.do" method="post">
        <label>
            名称：<input type="text" name="name">
        </label>
        <label>
            年龄：<input type="text" name="age">
        </label>
        <label>
            班级：<input type="text" name="classes">
        </label>
        <label>
            生日：<input type="date" name="birth">
        </label>
        <input type="submit" value="新增">
    </form>
</body>
</html>
