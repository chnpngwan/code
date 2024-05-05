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
    <form action="client/specialPackageServlet" method="post">
        <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
        <table>
            <tr>
                <td>包裹ID</td>
                <td>名称</td>
                <td>类型</td>
                <td>重量(/kg)</td>
                <td>数量</td>
                <td>预计送达时间</td>
                <td>能否退货</td>
                <td>寄件人ID</td>
                <td>危险性</td>
                <td>价值</td>
            </tr>
            <tr>
                <td><input name="special_pid" type="text" value="${requestScope.specialPackages.special_pid}"></td>
                <td><input name="pname" type="text" value="${requestScope.specialPackages.pname}"></td>
                <td><input name="type" type="text" value="${requestScope.specialPackages.type}"></td>
                <td><input name="weight" type="text" value="${requestScope.specialPackages.weight}"></td>
                <td><input name="number" type="text" value="${requestScope.specialPackages.number}"></td>
                <td><input name="delivery_time" type="text" value="${requestScope.specialPackages.delivery_time}"></td>
                <td><input name="return_orNot" type="text" value="${requestScope.specialPackages.return_orNot}"></td>
                <td><input name="cid" type="text" value="${requestScope.specialPackages.cid}"></td>
                <td><input name="danger" type="text" value="${requestScope.specialPackages.danger}"></td>
                <td><input name="value" type="text" value="${requestScope.specialPackages.value}"></td>
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

