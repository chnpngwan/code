<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 5/11/2023
  Time: 8:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
</head>
<body>
    <h1>添加</h1>
    <form method="post" action="/uploadInsert.do" enctype="multipart/form-data">
        <label>
            学号：<input type="text" name="id">
        </label>
        <label>
            姓名：<input type="text" name="name">
        </label>
        <label>
            照片：<input type="file" name="file">
        </label>
        <input type="submit" value="添加">
    </form>
</body>
</html>
