<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工名单</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp"%>

</head>
<body>
    <div id="container">
        <div id="table">
            <div class="left" style="background-color: rgba(128,128,128,0.1);">
                <p>你想查询？</p>
                <p><a href="client/complexServlet?action=list">去年发货最多客户</a></p>
                <p><a href="client/complexServlet?action=showCustomers">客户最多的街道</a></p>
                <p><a href="client/complexServlet?action=late">未按时送达的包裹</a></p>
                <p>...</p>
            </div>
            <table class="right">
                <tr>
                    <th>员工ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>电话</th>
                    <th>工资(￥)</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${requestScope.staffs}" var="staffs">
                    <tr>
                        <td>${staffs.sid}</td>
                        <td>${staffs.sname}</td>
                        <td>${staffs.sex}</td>
                        <td>${staffs.phone}</td>
                        <td>${staffs.salary}</td>
                        <td><a href="client/staffServlet?action=getStaff&id=${staffs.sid}">修改   </a>
                            <a class="deleteClass" href="client/staffServlet?action=delete&id=${staffs.sid}">   删除</a></td>
                    </tr>
                </c:forEach>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><a href="page/edit/staff_edit.jsp">添加员工</a></td>
                </tr>

            </table>
        </div>

    </div>
    <%--静态包含页脚内容--%>
    <%@include file="/page/common/footer.jsp"%>
</body>
</html>
