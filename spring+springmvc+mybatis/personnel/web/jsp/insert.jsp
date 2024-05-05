<%--
  Created by IntelliJ IDEA.
  User: chnpngwng
  Date: 4/24/2023
  Time: 9:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加</title>
</head>
<body>
<h1>信息添加</h1>
<form action="insertDo.do" method="post">
    <table border="1px" cellpadding="0" style="height: 300px;width: 800px;">
        <tr align="center">
            <td>姓名：</td>
            <td><input type="text" value="empName"/></td>
        </tr>
        <tr align="center">
            <td>职位：</td>
            <td>
                <select name="empPosition">
                    <option value="请选择">请选择</option>
                    <option value="总裁">总裁</option>
                    <option value="经理">经理</option>
                    <option value="销售人员">销售人员</option>
                    <option value="职员">职员</option>
                </select>
            </td>
        </tr>
        <tr align="center">
            <td>入职日期：</td>
            <td><input type="date" value="empInDate"/></td>
        </tr>
        <tr align="center">
            <td>薪资：</td>
            <td><input type="text" value="empSalary"/></td>
        </tr>
        <tr align="center">
            <td>部门：</td>
            <td>
                <select name="deptId">
                    <option value="请选择">请选择</option>
                    <option value="2">销售部</option>
                    <option value="1">技术部</option>
                    <option value="3">市场部</option>
                </select>
            </td>
        </tr>
        <tr align="center" style="height: 50px;width: 200px">
            <td colspan="2"><input type="submit" value="确认添加"/></td>
        </tr>
    </table>
</form>
</body>
</html>
