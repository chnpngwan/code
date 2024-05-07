<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/25
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>角色管理</title>
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
<table id="dg" title="Role Manage" class="easyui-datagrid" style="height: 600px"
       url="SysRolesController/findAll"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="roleid" width="50">角色ID</th>
        <th field="rolename" width="50">角色名称</th>
        <th field="roledesc" width="50">角色描述</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newRole()">New Role</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit Role</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove Role</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px;height: 600px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <h3>Role Information</h3>
        <div style="margin-bottom:10px">
            <input name="rolename" class="easyui-textbox" required="true" label="角色名称:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="roledesc" class="easyui-textbox" required="true" label="角色描述:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            菜单展示:
            <ul id="tt" class="easyui-tree" data-options="url:'MenusController/findAll',method:'post',animate:true,checkbox:true,cascadeCheck:false"></ul>
        </div>
        <input type="hidden" id="roleid" name="roleid">
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<script type="text/javascript">
    var url;

    function newRole(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','New Role');
        $('#fm').form('clear');
        $("#roleid").val("0");
        url = "SysRolesController/addRole";
    }

    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row==null || row==''){
            $.messager.alert("提示","请选择一行数据","info");
        }else {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
            $('#fm').form('load',row);

            $("#roleid").val(row.roleid);

            //发送Ajax获取菜单id
            $.post("RmController/findMid","rid="+row.roleid,function (result) {
                for (var i in result){
                    var node = $('#tt').tree('find', result[i]);
                    $('#tt').tree('check', node.target);
                }
            })

            url = "SysRolesController/changeRoles";
        }
    }
    function saveUser(){

        //获取菜单节点的值
        var nodes = $('#tt').tree('getChecked');
        var s = '';
        for(var i=0; i<nodes.length; i++){
            if (s != '') s += ',';
            s += nodes[i].id;
        }

        var val = $("form").serialize();
        //SysRolesController/saveRoles ?mids=s
        $.post(url+"?mids="+s,val,function (result) {
            if(result>0){
                $("#dg").datagrid("reload");
                $("#dlg").dialog("close");
            }else {
                $.messager.alert("提示","操作失败","error");
            }
        })

    }
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');

        if (row==null || row==''){
            $.messager.alert("提示","请选择一行数据","info");
        }else {
            $.messager.confirm('Confirm','Are you sure you want to destroy this Role?',function(r){
                if (r){
                    $.post('SysRolesController/remove',{roleid:row.roleid},function(result){
                        if (result>0){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else {
                            $.messager.show({    // show error message
                                title: 'Error',
                                msg: "删除失败"
                            });
                        }
                    },'json');
                }
            });
        }
    }
</script>
</body>
</html>
