<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑运输名单</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
</head>
<body>
<div id="header">
    <span class="wel_word">编辑运输名单</span>
</div>

<div id="container">
    <form action="client/vehicleServlet" method="post">
        <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
        <table>
            <tr>
                <td>载具ID</td>
                <td>运输种类</td>
                <td>使用金额(￥)</td>
            </tr>
            <tr>
                <td><input name="vid" type="text" value="${requestScope.vehicles.vid}"></td>
                <td><input name="vehicle_model" type="text" value="${requestScope.vehicles.vehicle_model}"></td>
                <td><input name="money" type="text" value="${requestScope.vehicles.money}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="提交"></td>
            </tr>
        </table>
    </form>
</div>
<%--静态包含页脚内容--%>
<%@include file="/page/common/footer.jsp" %>
</body>
</html>
