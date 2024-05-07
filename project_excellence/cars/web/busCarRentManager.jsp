<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/23
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>汽车出租单管理</title>
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
<body onload="SearchCarsRent()">

<div class="easyui-panel" style="width: 900px;height: 300px" title="出租单管理">

<form id="fom">
    <div style="margin-top: 50px;margin-left: 25px">
        <input name="rentid" class="easyui-textbox"   label="出租单号:" style="width:30%">
            &nbsp;&nbsp;&nbsp;
        <input name="carnumber" class="easyui-textbox"  label="汽车牌号:" style="width:30%">
            &nbsp;&nbsp;&nbsp;
        <input name="identity" class="easyui-textbox"  label="客户账号:" style="width:30%">

    </div>


    <div style="margin-left: 25px;margin-top: 30px">

        <input name="begindate" class="easyui-datebox" label="起租日期:" style="width:30%">
            &nbsp;&nbsp;&nbsp;
        <input name="returndate" class="easyui-datebox" label="归还日期:" style="width:30%">

    </div>

    <div style="text-align: center;margin-top: 30px">

        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="SearchCarsRent()" style="width:90px">Search</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
</form>
</div>

<%--展示汽车出租单管理页面--%>
<div id="tab">

</div>

<script type="text/javascript">

    //查询出租单信息
    function  SearchCarsRent() {
        var val = $("form").serialize();
        //清空之前的内容
        $("#tab").empty();
        var obj = $("#tab").append('<table id="dg" class="easyui-datagrid" <%--style="width:700px;height:600px"--%>\n' +
            '       url="BusRentsController/findMoreCars?busRents='+val+'"\n' +
            '       toolbar="#toolbar" pagination="true"\n' +
            '       rownumbers="true" fitColumns="true" singleSelect="true">\n' +
            '    <thead>\n' +
            '    <tr>\n' +
            '        <th field="rentid" width="50">出租单号</th>\n' +
            '        <th field="price" width="50">租金</th>\n' +
            '        <th field="begindate" width="50">起租日期</th>\n' +
            '        <th field="returndate" width="50">归还日期</th>\n' +
            '        <th field="identity" width="50">用户ID</th>\n' +
            '    </tr>\n' +
            '    </thead>\n' +
            '</table>\n')
        //页面渲染
        $.parser.parse(obj);
    }

</script>

</body>
</html>
