<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";

    pageContext.setAttribute("basePath",basePath);
%>

<!--写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">
<link type="text/css" rel="stylesheet" href="static/css/style.css" >
<script type="text/javascript" src="static/script/jquery-1.7.2.js"></script>
<script type="text/javascript">
    $(function () {
        $("a.deleteClass").click(function () {
            return confirm("你确定要删除【" + $(this).parent().parent().find("td:first-child").text() + " " +
                $(this).parent().parent().find("td:nth-child(2)").text() + "】?");
        });
    });

</script>
<style type="text/css">
    .left{
        float:left;
        margin-top: 50px;
        margin-left: 50px;
        border: 1px cadetblue solid;
        padding: 10px;
    }
    .right{
        float:left;
    }
    #header{
    	background-color: #2accce;
    	background-image： url("static/img/wuliu1.png"),
    
    }
    
</style>
<div id="header">
    <h1>四加一公司为你服务</h1>
   <a   href="userServlet?action=login" ><input type="button" value = "退  出" style="float: right;  color:grey;"  /></a>
   
   <div class="toolbar">
        <ul>
            <li><a href="client/packageServlet?action=list">仓库</a></li>
            <li><a href="client/specialPackageServlet?action=list">特殊包裹</a></li>
            <li><a href="client/waybillServlet?action=list">运单</a> </li>
            <li><a href="client/customerServlet?action=list">客户</a></li>
            <li><a href="client/recipientServlet?action=list">收货人</a> </li>
            <li><a href="client/staffServlet?action=list">员工</a></li>
            <li><a href="client/vehicleServlet?action=list">运输</a></li>
        </ul>
    </div>
    <form class="form" action="client/complexServlet?action=search" method="post">
        <input type="text" name="search">
        <input type="submit" value="search">

    </form>
</div>
