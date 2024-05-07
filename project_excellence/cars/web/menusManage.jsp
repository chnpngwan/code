<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/24
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单管理页面</title>
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
<table id="dg" class="easyui-datagrid"
       url="MenusController/findAllMenus"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="id" width="50">菜单ID</th>
        <th field="pid" width="50">父节点ID</th>
        <th field="name" width="50">菜单名称</th>
        <th field="url" width="50">菜单路径</th>
        <th field="open" width="50">是否打开</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newMenus()">New Menus</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editMenus()">Edit Menus</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyMenu()">Remove Menus</a>
</div>

<div id="dlg" class="easyui-dialog" style="width:400px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <h3>Menu Information</h3>
        <div style="margin-bottom:10px">
            选择父节点：<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="selectFather()" style="width:90px">选择节点</a>
            <span id="menu_name"></span>
        </div>
        <div style="margin-bottom:10px">
            <input id="pid" name="pid" class="easyui-textbox" required="true" label="父节点ID:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="name" class="easyui-textbox" required="true" label="菜单名称:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="url" class="easyui-textbox" required="true" label="菜单路径:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="open" class="easyui-textbox" required="true" label="是否打开:" style="width:100%">
        </div>
    </form>
</div>
<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveMenu()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>

<div id="menu_dlg" class="easyui-dialog" style="width:400px;height: 500px" data-options="closed:true,modal:true,border:'thin'">
        <%--展示菜单--%>
    <ul id="tt" class="easyui-tree"
        url="MenusController/findMore">
    </ul>
</div>

<script type="text/javascript">
    var url;

    function saveMenu() {

        var  val=$("form").serialize();

        $.post(url,val,function (result) {

            if(result>0){
                //关闭当前对话框
                $("#dlg").dialog("close");
                //刷新后面的表格
                $("#dg").datagrid("reload");
            }else {
                $.messager.alert("提示","操作失败","error");
            }
        })

    }

    function editMenus() {
        var row = $('#dg').datagrid('getSelected');
        if (row==null || row==''){
            $.messager.alert("提示","请选择要修改的数据","info")
        }else {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit Menus');
            $('#fm').form('load',row);
            url="MenusController/changeMenus?id="+row.id;
        }
    }

    function newMenus(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
        $('#fm').form('clear');
        var val = $("form").serialize();
        url="MenusController/addMenus?menus="+val;
    }
    function selectFather() {
        $('#menu_dlg').dialog('open').dialog('center').dialog('setTitle','选择父节点');
        $('#tt').tree({
            onDblClick: function(node){
                $('#menu_dlg').dialog('close');
                /*获取选中的值*/
                $("#pid").textbox("setValue",node.id);
                $("#menu_name").html(node.text);
            }
        });

    }

    function destroyMenu(){
        var row = $('#dg').datagrid('getSelected');
        if (row==null || row==''){
            $.messager.alert("提示","请选择要删除的数据","info")
        }else {
            $.messager.confirm('Confirm','Are you sure you want to destroy this menu?',function(r){
                if (r){
                    $.post('MenusController/removeMenu',{id:row.id},function(result){
                        if (result>0){
                            $('#dg').datagrid('reload');    // reload the user data
                        } else if(result=-10){
                            $.messager.alert("警告","该节点拥有子节点，不可删除","warning")
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
