<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑运单</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
</head>
<body>
<div id="header">
    <span class="wel_word">编辑运单</span>
</div>

<div id="container">
    <form action="client/waybillServlet" method="post">
        <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
        <table>
            <tr>
                <td>运单ID</td>
                <td>发送时间</td>
                <td>送达时间</td>
                <td>最近地址</td>
                <td>下一站地址</td>
                <td>路线</td>
                <td>包裹ID</td>
                <td>员工ID</td>
                <td>收货人ID</td>
            </tr>
            <tr>
                <td><input name="wid" type="text" value="${requestScope.waybills.wid}"></td>
                <td><input name="send_time" type="text" value="${requestScope.waybills.send_time}"></td>
                <td><input name="receipt_time" type="text" value="${requestScope.waybills.receipt_time}"></td>
                <td><input name="current_location" type="text" value="${requestScope.waybills.current_location}"></td>
                <td><input name="next_location" type="text" value="${requestScope.waybills.next_location}"></td>
                <td><input name="route" type="text" value="${requestScope.waybills.route}"></td>
                <td><input name="pid" type="text" value="${requestScope.waybills.pid}"></td>
                <td><input name="sid" type="text" value="${requestScope.waybills.sid}"></td>
                <td><input name="rid" type="text" value="${requestScope.waybills.rid}"></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
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
