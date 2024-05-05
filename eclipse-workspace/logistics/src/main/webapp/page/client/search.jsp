<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>运单表</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
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
                <th>运单ID</th>
                <th>预计送达时间</th>
                <th>发送时间</th>
                <th>送达时间</th>
                <th>最近地址</th>
                <th>下一站地址</th>
                <th>路线</th>
                <th>包裹ID</th>
                <th>员工ID</th>
                <th>收货人ID</th>
            </tr>
                <tr>
                    <td>${requestScope.search.wid}</td>
                    <td>${search.delivery_time}</td>
                    <td>${search.send_time}</td>
                    <td>${search.receipt_time}</td>
                    <td>${search.current_location}</td>
                    <td>${search.next_location}</td>
                    <td>${search.route}</td>
                    <td>${search.pid}</td>
                    <td>${search.sid}</td>
                    <td>${search.rid}</td>
                </tr>
        </table>
    </div>

</div>
<%--静态包含页脚内容--%>
<%@include file="/page/common/footer.jsp" %>
</body>
</html>
