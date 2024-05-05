<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>运单表</title>
    <%-- 静态包含 base标签、css样式、jQuery文件 --%>
    <%@ include file="/page/common/header.jsp" %>
    <script type="text/javascript">
        $(function () {
            // 给删除的a标签绑定单击事件，用于删除的确认提示操作
            $("a.deleteClass1").click(function () {
                // 在事件的function函数中，有一个this对象。这个this对象，是当前正在响应事件的dom对象。
                /**
                 * confirm是确认提示框函数
                 * 参数是它的提示内容
                 * 它有两个按钮，一个确认，一个是取消。
                 * 返回true表示点击了，确认，返回false表示点击取消。
                 */
                return confirm("你确定要删除运单:ID=【" + $(this).parent().parent().find("td:first-child").text()
                     + "】?");
                // return false// 阻止元素的默认行为===不提交请求
            });
        });
    </script>
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
                    <th>发送时间</th>
                    <th>送达时间</th>
                    <th>最近地址</th>
                    <th>下一站地址</th>
                    <th>路线</th>
                    <th>包裹ID</th>
                    <th>员工ID</th>
                    <th>收货人ID</th>
                    <th colspan="2">操作</th>
                </tr>
                <c:forEach items="${requestScope.waybills}" var="waybills">
                    <tr>
                        <td>${waybills.wid}</td>
                        <td>${waybills.send_time}</td>
                        <td>${waybills.receipt_time}</td>
                        <td>${waybills.current_location}</td>
                        <td>${waybills.next_location}</td>
                        <td>${waybills.route}</td>
                        <td>${waybills.pid}</td>
                        <td>${waybills.sid}</td>
                        <td>${waybills.rid}</td>
                        <td><a href="client/waybillServlet?action=getWaybill&id=${waybills.wid}">修改 </a>
                            <a class="deleteClass1" href="client/waybillServlet?action=delete&id=${waybills.wid}"> 删除</a></td>
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
                    <td><a href="page/edit/waybill_edit.jsp">添加运单</a></td>
                </tr>

            </table>
        </div>

    </div>
    <%--静态包含页脚内容--%>
    <%@include file="/page/common/footer.jsp" %>
</body>
</html>
