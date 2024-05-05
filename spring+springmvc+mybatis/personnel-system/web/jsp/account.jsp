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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>人事管理系统</title>
    <style>
        *{
            margin: 0;padding: 0;
        }
        table,td,th{
            border-collapse: collapse;
            border-spacing: 0;
        }
        table{
            text-align:center;
            width: 90%;
            margin: 0 auto;
        }
        td,th{
            padding: 5px 10px;
            border: 1px solid black;
        }
        th{
            background: #a1a4b5;
            font-size: 1.3rem;
            font-weight: 450;
            color: white;
            cursor: pointer;
        }
        .form{
            width:90%;
            padding:10px;
            margin: 0 auto;
        }
        .bottom{
            width:90%;
            padding:10px;
            margin: 0 auto;
        }

        h1{
            text-align:center;
        }
        tr:hover{
            box-shadow: #8f8fff 10px 10px 30px 5px ;
            background: #a1a4b5;
        }
        .form-group{
            padding: 20px;
        }
    </style>
</head>
<body>
<div class="form">
    <h1>人事管理系统</h1><br/>
    <fieldset>
        <legend>
            搜索
        </legend>
        <div class="form-group">
            <form action="selectAll.do">
                <label>职位：</label>
                <select name="empPosition">
                    <option value="">请选择---</option>
                    <option>总裁</option>
                    <option>经理</option>
                    <option>销售人员</option>
                    <option>职员</option>
                </select>
                <label>姓名：</label>
                <input type="text" name="empName" />
                <input type="submit" value="查看结果">
            </form>
        </div>

    </fieldset>
</div>
<table>

    <tr>
        <th>员工编号</th>
        <th>姓名</th>
        <th>职位</th>
        <th>入职日期</th>
        <th>薪资</th>
        <th>部门名称</th>
        <th>部门地址</th>
        <th>操作</th>
    </tr>

    <c:forEach items="${empList }" var="emp">
        <tr>
            <td>${emp.empId }</td>
            <td>${emp.empName }</td>
            <td>${emp.empPosition }</td>
            <td><fmt:formatDate value="${emp.empInDate }" pattern="yyyy-MM-dd"/></td>
            <td>${emp.empSalary }</td>
            <td>${emp.deptName }</td>
            <td>${emp.deptAddress }</td>
            <td>
                <button style="padding: 4px 10px" onclick="del(${emp.empId })" >删除</button>
                    <%-- <a style="color: red" onclick="del(${emp.empId })" >删除</a> --%>
            </td>
        </tr>
    </c:forEach>

</table>
<div class="bottom">
    <a href="addPage.do">添加员工</a>
    共${empList.size() }条数据
</div>
<script type="text/javascript">
    function del(id){

        if(confirm("确认要删除吗？")){
            return window.location.href="delete.do?id="+id;
        }else {
            return false;
        }
    };

</script>

</body>
</html>
