<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/22
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>汽车管理页面</title>
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
<table id="dg" class="easyui-datagrid" <%--style="width:700px;height:600px"--%>
       url="BusCarsController/findAll"
       toolbar="#toolbar" pagination="true"
       rownumbers="true" fitColumns="true" singleSelect="true">
    <thead>
    <tr>
        <th field="carnumber" width="50">汽车牌号</th>
        <th field="cartype" width="50">汽车类型</th>
        <th field="color" width="50">汽车颜色</th>
        <th field="price" width="50">汽车价格</th>
        <th data-options="field:'carimg',width:100, formatter:showImg" width="50">汽车图片</th>
    </tr>
    </thead>
</table>
<div id="toolbar">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newUser()">New User</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editUser()">Edit User</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyUser()">Remove User</a>
</div>
<div id="dlg" class="easyui-dialog" style="width:500px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <h3>Car Information</h3>
        <div style="margin-bottom:10px">
            <input name="carnumber" class="easyui-textbox" required="true" label="汽车牌号:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="cartype" class="easyui-textbox" required="true" label="汽车类型:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="color" class="easyui-textbox" required="true" label="汽车颜色:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="price" class="easyui-textbox" required="true" label="汽车价格:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="rentprice" class="easyui-textbox" required="true" label="汽车租金:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="deposit" class="easyui-textbox" required="true" label="汽车押金:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="description" class="easyui-textbox" required="true" label="汽车描述:" style="width:100%">
        </div>
            <input id="carimg" name="carimg" type="hidden">
    </form>

    <form id="fm2" method="post" enctype="multipart/form-data" novalidate style="padding:20px 50px;margin-top: -30px">
        <div style="margin-bottom:10px">
            <input name="fil" class="easyui-filebox" label="汽车图片:" labelPosition="left" data-options="prompt:'选择图片'" style="width:60%">
            <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="upLoad()" style="width:70px">上传</a>
            <span id="sp1"></span>
        </div>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveUser()" style="width:90px">Save</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<script type="text/javascript">
    var url;

    //文件上传方法
    function upLoad(){
        $('#fm2').form('submit',{
            url: "BusCarsController/fileUpload",
            success: function(result){
                var result = eval('('+result+')');
                if (result.success){
                    $("#sp1").html("<img src='img/"+result.success+"'width='80px'/>")
                    /*把路径给隐藏域*/
                    $("#carimg").val(result.success)
                } else {
                    $.messager.show({
                        title: 'Error',
                        msg: "操作失败"
                    });
                }
            }
        });
    }

    function newUser(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','New User');
        $('#fm').form('clear');
        url = 'BusCarsController/addCars';
    }
    function editUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row==null || row==''){
            $.messager.alert('警告','请选择一行数据','warning');
        }else {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
            /*数据回显*/
            $('#fm').form('load',row);
            /*图片回显*/
            $("#sp1").html("<img src='img/"+row.carimg+"'width='80px'/>")
            url = 'BusCarsController/changeCars';
        }
    }
    function saveUser(){
        $('#fm').form('submit',{
            url: url,
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(result){
                var result = eval('('+result+')');
                if (result.errorMsg){
                    $.messager.show({
                        title: 'Error',
                        msg: result.errorMsg
                    });
                } else {
                    $('#dlg').dialog('close');        // close the dialog
                    $('#dg').datagrid('reload');    // reload the user data
                }
            }
        });
    }
    function destroyUser(){
        var row = $('#dg').datagrid('getSelected');
        if (row=='' || row==null){
            $.messager.alert('警告','请选择一行数据','warning');
        }else {
            $.messager.confirm('Confirm','Are you sure you want to destroy this car?',function(r){
                if (r){
                    $.post('BusCarsController/removeCar',{carnumber:row.carnumber},function(result){
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

<script type="text/javascript">

    //图片展示
    function showImg(value){
            return "<img style='width:110px;height:80px;align-content: center' border='1' src='img/"+value+"'/>";
    }

</script>
</body>
</html>
