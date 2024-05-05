<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户名单</title>
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
                    <th>客户ID</th>
                    <th>姓名</th>
                    <th>发货数</th>
                </tr>
                <c:forEach items="${requestScope.complex}" var="complex">
                    <tr>
                        <td>${complex.cid}</td>
                        <td>${complex.cname}</td>
                        <td>${complex.number}</td>
                    </tr>
                </c:forEach>

            </table>
        </div>

    </div>
    <%--静态包含页脚内容--%>
    <%@include file="/page/common/footer.jsp"%>
</body>
</html>
