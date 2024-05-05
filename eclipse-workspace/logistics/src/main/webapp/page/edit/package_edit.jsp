<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑订单</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
</head>
<body>
    <div id="header">
        <span class="wel_word">编辑订单</span>
    </div>

    <div id="container">
        <form action="client/packageServlet" method="post">
            <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
            <table>
                <tr>
                    <td>包裹ID</td>
                    <td>名称</td>
                    <td>类型</td>
                    <td>重量(/kg)</td>
                    <td>数量</td>
                    <td>预计到达时间</td>
                    <td>能否退货</td>
                    <td>寄件人ID</td>
                </tr>
                <tr>
                    <td><input name="pid" type="text" value="${requestScope.packages.pid}"></td>
                    <td><input name="pname" type="text" value="${requestScope.packages.pname}"></td>
                    <td><input name="type" type="text" value="${requestScope.packages.type}"></td>
                    <td><input name="weight" type="text" value="${requestScope.packages.weight}"></td>
                    <td><input name="number" type="text" value="${requestScope.packages.number}"></td>
                    <td><input name="delivery_time" type="text" value="${requestScope.packages.delivery_time}"></td>
                    <td><input name="return_orNot" type="text" value="${requestScope.packages.return_orNot}"></td>
                    <td><input name="cid" type="text" value="${requestScope.packages.cid}"></td>
                </tr>
                <tr>
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
