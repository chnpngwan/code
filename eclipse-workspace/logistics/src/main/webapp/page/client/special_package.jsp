<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>特殊订单</title>
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
                    <th>特殊包裹ID</th>
                    <th>名称</th>
                    <th>类型</th>
                    <th>重量(/kg)</th>
                    <th>数量</th>
                    <th>预计送达时间</th>
                    <th>能否退货</th>
                    <th>寄件人ID</th>
                    <th>危险性</th>
                    <th>价值(￥)</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${requestScope.specialPackages}" var="specialPackages">
                    <tr>
                        <td>${specialPackages.special_pid}</td>
                        <td>${specialPackages.pname}</td>
                        <td>${specialPackages.type}</td>
                        <td>${specialPackages.weight}</td>
                        <td>${specialPackages.number}</td>
                        <td>${specialPackages.delivery_time}</td>
                        <td>${specialPackages.return_orNot}</td>
                        <td>${specialPackages.cid}</td>
                        <td>${specialPackages.danger}</td>
                        <td>${specialPackages.value}</td>
                        <td><a href="client/specialPackageServlet?action=getSpecialPackage&id=${specialPackages.special_pid}">修改   </a>
                            <a class="deleteClass" href="client/specialPackageServlet?action=delete&id=${specialPackages.special_pid}">   删除</a></td>
                    </tr>
                </c:forEach>

                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><a href="page/edit/specialPackage_edit.jsp">添加订单</a></td>
                </tr>

            </table>
        </div>

    </div>
    <%--静态包含页脚内容--%>
    <%@include file="/page/common/footer.jsp"%>



</body>
</html>
