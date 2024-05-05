<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 5/11/2023
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>展示</title>
</head>
<body>
    <div class="container">
        <h1>学生信息管理系统</h1>
        <a href="/insert.do">新增学生信息</a>
        <table border="1" width="1500px" cellspacing="0"><tr>
            <th>学号</th>
            <th>姓名</th>
            <th>照片</th>
            <th>操作</th>
        </tr>
            <c:forEach items="${uploadList }" var="upload">
                <tr>
                    <td>${ upload.id }</td>
                    <td>${ upload.name }</td>
                    <td>
                        <!-- 保存图片的命名-->
                        <a href="${ upload.imgPath }"
                           download="${ upload.name.concat('.').concat(fn:substringAfter(upload.imgPath,'.'))}">
                            <img src="${ upload.imgPath }" width="100px">
                        </a>
                    </td>
                    <td>
                        <a href="#">修改</a>&emsp;
                        <a href="#" onclick="return confirm('确认删除此数据？')">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
