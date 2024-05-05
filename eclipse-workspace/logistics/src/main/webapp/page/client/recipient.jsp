<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收货人名单</title>
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
                <th>收货人ID</th>
                <th>姓名</th>
                <th>性别</th>
                <th>电话</th>
                <th>地址</th>
                <th colspan="2">操作</th>
            </tr>
            <c:forEach items="${requestScope.recipients}" var="recipients">
                <tr>
                    <td>${recipients.rid}</td>
                    <td>${recipients.rname}</td>
                    <td>${recipients.sex}</td>
                    <td>${recipients.phone}</td>
                    <td>${recipients.address}</td>
                    <td><a href="client/recipientServlet?action=getRecipient&id=${recipients.rid}">修改   </a>
                        <a class="deleteClass" href="client/recipientServlet?action=delete&id=${recipients.rid}">   删除</a></td>
                </tr>
            </c:forEach>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><a href="page/edit/recipient_edit.jsp">添加客户</a></td>
            </tr>

        </table>
    </div>

</div>
<%--静态包含页脚内容--%>
<%@include file="/page/common/footer.jsp"%>
</body>
</html>
