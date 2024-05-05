<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
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
    <style>
        body{
            overflow: scroll;
            background-color: #2accce;
            text-align: center;
        }
        #h1 {
            background-color: lightseagreen;
            color: #FFFFFF;
        }
        #login {
            height: 600px;
            width: 800px;
            border: 1px cadetblue solid;
            background-color: #FFFFFF;
            margin-top: 80px;
            margin-left: 350px;
        }
        #user {
            font-size: 20px;
            text-align: center;
            padding: 150px;
        }
        .errorMsg {
            font-size: 16px;
            background-color: yellow;
        }
    </style>
</head>
<body>
<div id="login">
    <h1 id="h1">公司为你服务</h1>
    <div id="user">
        <span class="errorMsg">
            ${ requestScope.msg }
        </span>
        <br><br>
        <form action="userServlet?action=register" method="post">
            <label>用户名称：</label>
            <input type="text" placeholder="请输入用户名"
                   value="${requestScope.username}"
                   autocomplete="off" tabindex="1" name="username" id="username"/>
            <br/>
            <br/>
            <label>用户密码：</label>
            <input type="password" placeholder="请输入密码"
                   autocomplete="off" tabindex="1" name="password" id="password"/>
            <br/>
            <br/>
            <label>确认密码：</label>
            <input type="password" placeholder="确认密码"
                   autocomplete="off" tabindex="1" name="repwd" id="repwd"/>
            <br/>
            <br/>
            <input type="submit" value="注册" id="sub_btn"/>
            <br>
            <br>
            <a href="userServlet?action=login">登录</a>
        </form>

    </div>
</div>
<%--静态包含页脚内容--%>
<%@include file="/page/common/footer.jsp"%>
</body>
</html>
