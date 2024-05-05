<%--
  Created by IntelliJ IDEA.
  User: chnpngwng
  Date: 4/23/2023
  Time: 7:05 PM


--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>数据展示</title>
</head>
<body>
<h1>人事管理系统</h1>
<fieldset>
    <legend>搜索</legend>
    <form action="list.do" method="post">
        职位：<select name="empPosition">
                <option value="请选择">请选择</option>
                <option value="总裁">总裁</option>
                <option value="经理">经理</option>
                <option value="销售人员">销售人员</option>
                <option value="职员">职员</option>
            </select>
        名字：<input type="text" name="empName"/>
            <input type="submit" value="查看结果"/>
    </form>
<br/><br/>
<h1>资源列表</h1>
<table border="1" cellspacing="0">
    <tr>
        <td>编号</td>
        <td>姓名</td>
        <td>职位</td>
        <td>入职日期</td>
        <td>薪资</td>
        <td>部门名称</td>
        <td>部门地址</td>
        <td>操作</td>
    </tr>
    <c:forEach var="emp" items="${ list }">
        <tr>
            <td><c:out value="${ emp.empId }"></c:out></td>
            <td><c:out value="${ emp.empName }"></c:out></td>
            <td><c:out value="${ emp.empPosition }"></c:out></td>
            <td>
                <fmt:formatDate value="${ emp.empInDate }" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
            </td>
            <td><c:out value="${ emp.empSalary }"></c:out></td>
            <td><c:out value="${ emp.dept.deptName }"></c:out></td>
            <td><c:out value="${ emp.dept.deptAddress }"></c:out></td>
            <td>
                <a href="delete.do?empId=${ emp.empId }" onclick="return confirm('你确定删除此数据嘛？')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table><br/><br/>
<a href="/insert.do">添加人员信息</a>
</fieldset>
</body>
</html>
