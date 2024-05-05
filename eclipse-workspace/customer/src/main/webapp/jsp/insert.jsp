<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>客户信息新增</title>
        <style>
            .container{
                width: 300px;
                margin: 0 auto;
            }
            h1,th,td{
                text-align: center;
            }
            .insert{
                margin-left: 40%;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>新增客户信息</h1>
            <form action="insertDo.do" method="post">
                客户编号：&emsp;&emsp;
                <input type="text" name="customerId"/>
                <br><br>
                客户姓名：&emsp;&emsp;
                <input type="text" name="customerName"/>
                <br><br>
                负责人姓名：&emsp;
                <input type="text" name="userName"/>
                <br><br>
                客户来源：&emsp;&emsp;
                <input type="text" name="source"/>
                <br><br>
                客户所属行业：
                <input type="text" name="industry"/>
                <br><br>
                创建日期：&emsp;&emsp;
                <input type="text" name="createDate"/>
                <br><br>
                <input type="submit" value="添加" class="insert"/>
            </form>
        </div>
    </body>
</html>