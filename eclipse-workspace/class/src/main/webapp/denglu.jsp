<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <style>
        body {
            background: url('image/1677043080654.jpeg') no-repeat;
            background-size: 100% auto;
        }
        
        #login_box {
            width: 20%;
            height: 400px;
            background-color: #00000085;
            margin: auto;
            margin-top: 10%;
            text-align: center;
            border-radius: 10px;
            padding: 50px 50px;
        }
        
        #login_box input,
        #login_box button {
            outline: none;
        }
        
        #login_box h2 {
            color: #ffffff90;
            margin-top: 5%;
        }
        
        #login_box #form #input_box {
            margin-top: 5%;
        }
        
        #login_box #form #input_box input {
            border: 0;
            width: 60%;
            font-size: 15px;
            color: #ffffff;
            background: #ffffff00;
            border-bottom: 2px solid #ffffff;
            padding: 5px 10px;
            margin-top: 10px;
        }
        
        #login_box button {
            margin-top: 50px;
            width: 50%;
            height: 30px;
            border-radius: 10px;
            border: 0;
            color: #fff;
            font-size: 15px;
            background-image: linear-gradient(120deg, #f093fb 0%, #f5576c 100%);
            cursor: pointer;
        }
 
    </style>
</head>
 
<body>
    <div id="login_box">
        <h2><a href="index2.html"></a>登 录</h2>
        <div id="form">
            <div id="input_box">
                <input type="text" placeholder="请输入用户名">
            </div>
            <div id="input_box">
                <input type="password" placeholder="请输入密码">
            </div>
        </div>
        <button id="sign_in"><a href="index2.jsp"  style="text-decoration: none; color: white;" >登录</a></button>
        <br>
        <button id="enroll"><a href="zhuce.jsp"  style="text-decoration: none; color: white;">注册</a></button>
        <!-- 删掉a标签即可-->
    </div>
</body>
 
</html>