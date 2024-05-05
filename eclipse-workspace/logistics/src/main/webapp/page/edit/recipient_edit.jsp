<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑收货人名单</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
</head>
<body>
<div id="header">
    <span class="wel_word">编辑收货人名单</span>
</div>

<div id="container">
    <form action="client/recipientServlet" method="post">
        <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
        <table>
            <tr>
                <td>收货人ID</td>
                <td>姓名</td>
                <td>性别</td>
                <td>电话</td>
                <td>地址</td>
            </tr>
            <tr>
                <td><input name="rid" type="text" value="${requestScope.recipients.rid}"></td>
                <td><input name="rname" type="text" value="${requestScope.recipients.rname}"></td>
                <td><input name="sex" type="text" value="${requestScope.recipients.sex}"></td>
                <td><input name="phone" type="text" value="${requestScope.recipients.phone}"></td>
                <td><input name="address" type="text" value="${requestScope.recipients.address}"></td>
            </tr>
            <tr>
                <td></td>
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

