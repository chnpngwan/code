<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
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
        *{
      margin:0px;
      padding:0px;
           }
        body{
            background-color: #2accce;
            text-align: center;
        }
        #bgimg img{
        height:720px;
        width:100%;
        }
        #h1 {
           background-color: rgba(0, 255, 255, 0.5);
        }
        #login {
            height: 400px;
            width: 800px;
            border-radius:10px;
            background-color: rgba(0, 0, 0, 0.5);
            margin-top: 100px;
            position:relative;
            margin-top:-600px;
            
        }
        #user {
            font-size: 20px;
            background-color: #FFFFFF;
            margin-top: 50px;
            text-align: center;
            background-color: rgba(0, 0, 0, 0);
        }
        .errorMsg {
            font-size:32px;
            color:white;
             border-radius:10px 0px 10px 0px;
            background-color: rgba(0, 0, 0, 0.5);
        }
        #sub_btn {
         border-radius:15px;
        width:150px;
        height:30px;
        color: #2fabde;
        }
        label{
        color:white;
        font-width:bolder;
        }
    </style>
</head>
<body>
<div id="bgimg">
<img alt="" src="static/img/wuliu1.png">
    <div id="login">
        <h1 id="h1">物流公司为你服务</h1>
        <div id="user">
            <span class="errorMsg">
            &nbsp;&nbsp;&nbsp;
                ${ empty requestScope.msg ? "Log in":requestScope.msg }
            &nbsp;&nbsp;&nbsp;
            </span>
            <br>
            <br>
            <form action="userServlet?action=login" method="post">
                <label>用户名称：</label>
                <input type="text"
                       autocomplete="off" tabindex="1" name="username"
                       value="${requestScope.username}" placeholder="请输入账号" />
                <br />
                <br />
                <label>用户密码：</label>
                <input type="password"
                       autocomplete="off" tabindex="1" name="password" placeholder="请输入密码" />
                <br />
                <br />
                <input type="submit" value="登录" id="sub_btn" />
            </form>
            <br/>
            <!-- <label><a href="page/user/regist.jsp">注册</a></label> -->
        </div>
    </div>
    <%--静态包含页脚内容--%>
    <%@include file="/page/common/footer.jsp"%>
    </div>
</body>
</html>
