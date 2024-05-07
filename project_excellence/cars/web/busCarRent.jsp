<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/23
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--引入css样式--%>
<link rel="stylesheet" type="text/css" href="easyui/themes/gray/easyui.css"/>
<%--引入图标css--%>
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css"/>
<%--引入jQuery--%>
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<%--引入jquery.easyui.min.js--%>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
<html>
<head>
    <title>汽车出租页面</title>
    <base href="<%=request.getContextPath()+"/"%>">
</head>
<body>
<div title="租车管理页面" class="easyui-panel" style="width:100%;max-width:400px;padding:30px 60px;">
    <input id="identityid" class="easyui-searchbox" data-options="prompt:'请输入身份证号',searcher:doSearch" style="width:100%">
</div>

<%--响应后台发来的车辆信息--%>
<div id="tab">

</div>
<%--新建一个租车单信息--%>
<div id="dlg" class="easyui-dialog" style="width:500px" data-options="closed:true,modal:true,border:'thin',buttons:'#dlg-buttons'">
    <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
        <h3>新建一个出租单信息</h3>
        <div style="margin-bottom:10px">
            <input id="zcid" name="rentid" class="easyui-textbox" required="true" label="出租单号:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input id="rentpriceid" name="price" class="easyui-textbox" required="true" label="租金:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="begindate" class="easyui-datebox" required="true" label="起租日期:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="returndate" class="easyui-datebox" required="true" label="归还日期:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input id="idt" name="identity" class="easyui-textbox" required="true" label="身份证:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input id="carnumberid" name="carnumber" class="easyui-textbox" required="true" label="车牌号:" style="width:100%">
        </div>
        <div style="margin-bottom:10px">
            <input name="opername" class="easyui-textbox" required="true" label="操作员:" style="width:100%">
        </div>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveCar()" style="width:90px">OK</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
</div>
<script>

    //出租单提交
    function saveCar(){
        $('#fm').form('submit',{
            url: "BusRentsController/addOneCar",
            success: function(result){
                var result = eval('('+result+')');
                if (result>0){
                    $('#dlg').dialog('close');        // close the dialog
                    $('#dg').datagrid('reload');    // reload the user data
                } else {
                    $.messager.show({
                        title: 'Error',
                        msg: "提交失败！"
                    });
                }
            }
        });
    }

    //新建一个出租单
    function newCarRenting(){
        var row = $('#dg').datagrid('getSelected');
        if (row==null || row==''){
            $.messager.alert('警告','请选择需要租的车','warning');
        }else {
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','Edit User');
            /*给出租单内容赋值*/
            //随机生成订单号
            var time = new Date().getTime();
            $("#zcid").textbox("setValue","ZC_"+time);
            //给租金赋值
            $("#rentpriceid").textbox("setValue",row.rentprice);
            //给身份证赋值
            $("#idt").textbox("setValue",$("#identityid").val());
            //给汽车牌号赋值
            $("#carnumberid").textbox("setValue",row.carnumber);

        }
    }

    function doSearch(value){
        if (value==null || value==''){
            $.messager.alert("警告","身份证号不能为空","info")
        }else {
            /*发送Ajax请求*/
            $.post("BusCustomersController/findOne","identity="+value,function (result) {
                if (result){
                    var obj = $("#tab").append('<table id="dg" class="easyui-datagrid" <%--style="width:700px;height:600px"--%>\n' +
                        '       url="BusCarsController/findIsRenting"\n' +
                        '       toolbar="#toolbar" pagination="true"\n' +
                        '       rownumbers="true" fitColumns="true" singleSelect="true">\n' +
                        '    <thead>\n' +
                        '    <tr>\n' +
                        '        <th field="carnumber" width="50">汽车牌号</th>\n' +
                        '        <th field="cartype" width="50">汽车类型</th>\n' +
                        '        <th field="color" width="50">汽车颜色</th>\n' +
                        '        <th field="price" width="50">汽车价格</th>\n' +
                        '        <th data-options="field:\'carimg\',width:100, formatter:showImg" width="50">汽车图片</th>\n' +
                        '    </tr>\n' +
                        '    </thead>\n' +
                        '</table>\n' +
                        '<div id="toolbar">\n' +
                        '    <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newCarRenting()">新建一个出租单</a>\n' +
                        '</div>')
                    //页面渲染
                    $.parser.parse(obj);
                }else {
                    $.messager.alert("提示","该用户不存在","info")
                }
            })
        }
    }
    //图片展示
    function showImg(value){
        return "<img style='width:110px;height:80px;align-content: center' border='1' src='img/"+value+"'/>";
    }

</script>

</body>
</html>
