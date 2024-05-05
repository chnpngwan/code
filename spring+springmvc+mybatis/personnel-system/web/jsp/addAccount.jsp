<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/24/2023
  Time: 10:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Insert title here</title>
</head>
<body>

<h1>添加账户</h1>
<form action="add.do">

    <input type="hidden" name="id" />
    <p>
        <label>姓名：</label>
        <input type="text" name="empName"  />
    </p>
    <p>
        <label>职位：</label>
        <select name="empPosition">
            <option></option>
            <option>总裁</option>
            <option>经理</option>
            <option>销售人员</option>
            <option>职员</option>
        </select>
    </p>
    <p>
        <label>入职日期：</label>
        <input type="date" name="empInDate"/>
    </p>
    <p>
        <label>薪资：</label>
        <input type="number" name="empSalary"/>
    </p>
    <p>
        <label>部门：</label>
        <select name="deptId">
            <option></option>
            <option value="1">技术部</option>
            <option value="2">销售部</option>
            <option value="3">市场部</option>
        </select>
    </p>
    <p>
        <button type="submit">提交</button>
        <input type="button" onclick="window.history.back();" value="取消">
    </p>

</form>

</body>
</html>