<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>快递公司</title>
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
                    <thead>
                    <tr>
                        <th>包裹ID</th>
                        <th>名称</th>
                        <th>类型</th>
                        <th>重量(/kg)</th>
                        <th>数量</th>
                        <th>预计到达时间</th>
                        <th>能否退货</th>
                        <th>寄件人ID</th>
                        <th colspan="2">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.packages}" var="packages">
                        <tr>
                            <td>${packages.pid}</td>
                            <td>${packages.pname}</td>
                            <td>${packages.type}</td>
                            <td>${packages.weight}</td>
                            <td>${packages.number}</td>
                            <td>${packages.delivery_time}</td>
                            <td>${packages.return_orNot}</td>
                            <td>${packages.cid}</td>
                            <td><a href="client/packageServlet?action=getPackage&id=${packages.pid}">修改   </a>
                                <a class="deleteClass" href="client/packageServlet?action=delete&id=${packages.pid}">   删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><a href="page/edit/package_edit.jsp">添加订单</a></td>
                    </tr>

                </table>
            </div>

        </div>
        <%--静态包含页脚内容--%>
        <%@include file="/page/common/footer.jsp"%>





</body>
</html>
