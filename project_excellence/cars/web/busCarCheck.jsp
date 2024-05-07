<%--
  Created by IntelliJ IDEA.
  User: JZJ
  Date: 2019/10/24
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>汽车入库单</title>
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

<%--顶部的搜索框--%>
<div id="p1" title="汽车入库" class="easyui-panel" style="width:900px;height:150px;">
    <div style="margin-top: 30px;margin-left: 20px">
        出租单编号:<input id="idt" class="easyui-searchbox" data-options="prompt:'输入出租单编号',searcher:doSearch" style="width:55%">
    </div>
</div>
<%--中间检查单管理--%>
<div id="p2">
    <div class="easyui-panel" style="width: 900px;height: 400px" title="检查单管理">
        <form id="fom">
            <div style="margin-top: 50px;margin-left: 25px">
                <input id="checkid" name="checkid" class="easyui-textbox"   label="检查单编号:" style="width:30%">

                <input name="checkdate" class="easyui-datebox" label="检查日期:" style="width:30%">

                <input name="checkdesc" class="easyui-textbox"  label="检查问题:" style="width:30%">

            </div>

            <div style="margin-left: 25px;margin-top: 30px">

                <input name="paymoney" class="easyui-textbox"  label="赔付金额:" style="width:30%">

                <input name="opername" class="easyui-textbox"  label="经办人:" style="width:30%">

                <input id="rentid" name="rentid" class="easyui-textbox"  label="出租单号:" style="width:30%">
            </div>

            <div style="margin-left: 25px;margin-top: 30px">

                <input class="easyui-textbox" name="problem" label="问题描述:" labelPosition="left" multiline="true" style="width:70%;height:120px">

            </div>

            <div style="text-align: center;margin-top: 30px">

                <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="SaveCars()" style="width:90px">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
            </div>

            <input type="hidden" id="carnumber" name="carnumber"/>
        </form>
    </div>
</div>
<%--底部租车信息展示页面--%>
<div id="p3">

</div>

<script type="text/javascript">
    $(function () {
        //隐藏检查单和出租单
        $("#p2").hide();
        $("#p3").hide();
    })

    function SaveCars(){
        //获取表单中的name值
        var val = $("form").serialize();

        $('#fom').form('submit',{
            url: "BusChecksController/addBusCheck?busChecks="+val,
            success: function(result){
                var result = eval('('+result+')');
                if (result<=0){
                    $.messager.show({
                        title: 'Error',
                        msg: "添加失败！"
                    });
                } else {
                    $.messager.alert("提示","添加成功","info");
                }
            }
        });
    }

    function doSearch(val) {
        if(val==null || val==""){
            $.messager.alert("警告！","出租单号不能为空","warning")
            return;
        }

        //发送Ajax验证出租单编号
        $.post("BusRentsController/findOneBusRents","rentid="+val,function (result) {
            if (result){
                $("#p2").show();
                $("#p3").show();

                //生成随机检查单号
                var id = new Date().getTime();
                $("#checkid").textbox("setValue","JC_"+id);
                //给出租单号赋值
                $("#rentid").textbox("setValue",result.rentid)
                //给出牌号赋值
                $("#carnumber").val(result.carnumber);

                //出租单信息
                var obj = $("#p3").append('<div style="float: left">\n' +
                    '        <div class="easyui-panel" style="width: 300px;height: 300px" title="出租单信息">\n' +
                    '\n' +
                    '            <div style="margin-left: 20px">\n' +
                    '                <h4>出租单号:'+result.rentid+'</h4>\n' +
                    '                <h4>租金:'+result.price+'</h4>\n' +
                    '                <h4>起租日期:'+result.begindate+'</h4>\n' +
                    '                <h4>归还日期:'+result.returndate+'</h4>\n' +
                    '                <h4>经办人:'+result.opername+'</h4>\n' +
                    '            </div>\n' +
                    '        </div>\n' +
                    '    </div>')
                //页面渲染
                $.parser.parse(obj);

                //汽车信息
                $.post("BusCarsController/findOneCar","carnumber="+result.carnumber,function (result2) {
                    var  obj2= $("#p3").append('    <div style="float: left">\n' +
                        '        <div class="easyui-panel" style="width: 300px;height: 300px" title="汽车信息">\n' +
                        '            <div style="margin-left: 20px">\n' +
                        '                <h4>汽车牌号:'+result2.carnumber+'</h4>\n' +
                        '                <h4>汽车类型:'+result2.cartype+'</h4>\n' +
                        '                <h4>汽车颜色:'+result2.color+'</h4>\n' +
                        '                <h4>汽车描述:'+result2.description+'</h4>\n' +
                        '                <h4>汽车图片:<img src="img/'+result2.carimg+'" width="60px"/></h4>\n' +
                        '            </div>\n' +
                        '        </div>\n' +
                        '    </div>')

                    $.parser.parse(obj2);
                })

                //客户信息
                $.post("BusCustomersController/findOne","identity="+result.identity,function (result3) {
                       var obj = $("#p3").append(' <div style="float: left">\n' +
                            '        <div class="easyui-panel" style="width: 300px;height: 300px" title="客户信息">\n' +
                            '            <div style="margin-left: 20px">\n' +
                            '                <h4>客户身份证:'+result3.identity+'</h4>\n' +
                            '                <h4>客户名称:'+result3.custname+'</h4>\n' +
                            '                <h4>客户住址:'+result3.address+'</h4>\n' +
                            '                <h4>客户手机号:'+result3.phone+'</h4>\n' +
                            '            </div>\n' +
                            '        </div>\n' +
                            '    </div>')
                    $.parser.parse(obj);
                })
            }else {
                $.messager.alert("警告","该订单号不存在",'waring')
            }
        })
    }

</script>
</body>
</html>
