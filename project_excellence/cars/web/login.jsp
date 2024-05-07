<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/26
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <base href="<%=request.getContextPath()+"/"%>">
    <%--引入css样式--%>
    <link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css"/>
    <%--引入图标css--%>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
    <%--引入jQuery--%>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <%--引入jquery.easyui.min.js--%>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<center>
    <div style="margin-top: 160px">
<div id="dlg" class="easyui-panel" title="登录页面" style="width:400px" data-options="closed:false,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">

        <div style="margin-bottom:10px">
            <input id="loginname" name="loginname" class="easyui-textbox" required="true" label="登录名:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input id="pwd" name="pwd" class="easyui-textbox" required="true" label="密码:" style="width:100%">
        </div>
        <div id="dlg-buttons" style="margin-left: 50px;margin-top:30px">
            <a class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="login()" style="width:80px">登录</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重置</a>
        </div>
    </form>
</div>
    </div>
</center>

<script>
    function login() {
        var loginname = $("#loginname").val();
        var pwd = $("#pwd").val();
        $.post("SysUserController/login","loginname="+loginname+"&pwd="+pwd,function (result) {
            if (result==null || result==''){
                $.messager.alert("警告","登录失败","warning");
                return;
            }else {
                window.location.href="main.jsp";
            }
        })
    }
</script>

</body>
</html>
