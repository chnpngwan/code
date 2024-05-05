<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑员工名单</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
</head>
<body>
<div id="header">
    <span class="wel_word">编辑员工名单</span>
</div>

<div id="container">
    <form action="client/staffServlet" method="post">
        <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
        <table>
            <tr>
                <td>员工ID</td>
                <td>姓名</td>
                <td>性别</td>
                <td>电话</td>
                <td>工资</td>
            </tr>
            <tr>
                <td><input name="sid" type="text" value="${requestScope.staffs.sid}"></td>
                <td><input name="sname" type="text" value="${requestScope.staffs.sname}"></td>
                <td><input name="sex" type="text" value="${requestScope.staffs.sex}"></td>
                <td><input name="phone" type="text" value="${requestScope.staffs.phone}"></td>
                <td><input name="salary" type="text" value="${requestScope.staffs.salary}"></td>
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
