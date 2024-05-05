<%--
  Created by IntelliJ IDEA.
  User: Chnpng Wng
  Date: 5/10/2023
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
    <link rel="stylesheet" href="static/layui/css/layui.css">
    <script type="text/javascript" src="static/layui/layui.js"></script>
    <style>
        .demo-reg-container{width: 320px; margin: 21px auto 0;}
        .demo-reg-other .layui-icon{position: relative; display: inline-block; margin: 0 2px; top: 2px; font-size: 26px;}
    </style>
</head>
<body>
<h1 style="text-align: center">IT论坛-用户注册界面</h1>
<form class="layui-form" action="/update.do" method="post">
    <input type="hidden" name="cid" value="${customer.cid}">
    <div class="demo-reg-container">
        <div class="layui-form-item">
            <div class="layui-input-wrap">
                <div class="layui-input-prefix">
                    <i class="layui-icon layui-icon-vercode"></i>
                </div>
                <input type="text" name="account" value="${customer.account}" lay-verify="required" placeholder="邮箱" lay-reqtext="请填写邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-wrap">
                <div class="layui-input-prefix">
                    <i class="layui-icon layui-icon-vercode"></i>
                </div>
                <input type="text" name="tel" value="${customer.tel}" lay-verify="required" placeholder="电话" lay-reqtext="请填写电话" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-wrap">
                <div class="layui-input-prefix">
                    <i class="layui-icon layui-icon-password"></i>
                </div>
                <input type="password" name="password" value="${customer.password}" lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input" id="reg-password" lay-affix="eye">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-wrap">
                <div class="layui-input-prefix">
                    <i class="layui-icon layui-icon-username"></i>
                </div>
                <input type="text" name="nickName" value="${customer.nickName}" lay-verify="required" placeholder="昵称" autocomplete="off" class="layui-input" lay-affix="clear">
            </div>
        </div>
        <div class="layui-form-item">
            <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="demo-reg">确认修改</button>
        </div>
    </div>
</form>
<script>
    layui.use(function(){
        var $ = layui.$;
        var form = layui.form;
        var layer = layui.layer;
        var util = layui.util;
        // 提交事件
        form.on('submit(demo-reg)', function(data){
            var field = data.field; // 获取表单字段值
            return true; // 阻止默认 form 跳转
        });

    });
</script>
</body>
</html>
