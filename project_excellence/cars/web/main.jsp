<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/22
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>水暖器件连锁线下管理系统主页面</title>
    <base href="<%=request.getContextPath()+"/"%>">
    <%--引入css样式--%>
    <link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css"/>
    <%--引入图标css--%>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
    <%--引入jQuery--%>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <%--引入jquery.easyui.min.js--%>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $('#tt').tree({
                onClick: function(node){

                    if(node.url=='' || node.url==null){
                        return;
                    }
                    //创建选项卡
                    var flag = $('#tab').tabs('exists',node.text);

                    if (flag){
                        $('#tab').tabs('select',node.text);
                    }else{
                        // add a new tab panel
                        $('#tab').tabs('add',{
                            title:node.text,
                            //用content引入页面是两个页面，id值无关，用href引入页面是一个页面，id值不能重复
                            content:'<iframe src="'+node.url+'" width="99%" height="99%"/>',
                            // href:node.url,
                            closable:true,
                        });
                    }
                }
            });


        })
    </script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',split:true" style="height:70px;background-image: url('img/layout-browser-hd-bg.gif')">

        <div style="margin-top: 6px;margin-left: 93px" >
            <img src='img/blocks.gif'>
            <span style="font-size: 26px;font-family: 仿宋;font-weight: bold;color: #ffffff">水暖器件连锁线下管理系统</span>
        </div>
        <div style="float: right;margin-top: -6px;margin-right: 35px">
            <span style="font-size: 14px;color: #f5f5f5">欢迎${sysUser.realname}用户</span>|
            <a style="font-size: 14px;color: #f5f5f5;text-decoration: none" href="MenusController/logOut">注销</a>
        </div>

    </div>
    <div data-options="region:'south',split:true" style="height:100px;background-image: url('img/b2.png');background-repeat: no-repeat;background-position: center;background-color: #F4F4F4"></div>

    <div data-options="region:'east',iconCls:'icon-reload',title:'每日安排',split:true" style="width:200px;">
        <div class="easyui-panel" title="备忘录" style="width:193px;height: 200px">
            <h4>[1]今天上午9点,和张总见面</h4>
            <h4>[2]今天下午2点,和李总见面</h4>
            <h4>[3]和王经理谈论合同事宜</h4>
        </div>
        <div id="cc" class="easyui-calendar" style="width:193px;height:240px;"></div>
    </div>

    <div data-options="region:'west',title:'West',split:true" style="width:200px;">
        <div class="easyui-accordion" data-options="fit:true">
            <div title="菜单一">
                <ul id="tt" class="easyui-tree"
                    url="MenusController/findMore2">
                </ul>
            </div>

            <div title="菜单二"></div>
            <div title="菜单三"></div>
        </div>
    </div>
    <div data-options="region:'center'" style="background:#eee;">
            <div id="tab" class="easyui-tabs" data-options="fit:true"></div>
    </div>
</body>
</html>
