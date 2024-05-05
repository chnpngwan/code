<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
       <form action="">
          <p><input type="text" placeholder="请输入账号" maxlength="11"id="userId"/><span></span></p>
          <p><input type="password" placeholder="请输入密码,长度：6-16位" maxlength="16" id="pwd"pattern="\d{6,16}"/><span></span></p>
          <input type="button" value="登录" id="dl"/>
       </form>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		$("#dl").click(function(){
    			var $userId=$("#userId");//储存文本框的jQ对象
    	        var $pwd=$("#pwd");//储存密码框的jQ对象
    	        if($userId.val()==""){//判断输入的账号是否为空
    	            $userId.next().text("账号为空").css({"font-weight":"bold","color":"red"});
    	            event.preventDefault();//取消提交
    	        }else if($pwd.val()==""){
    	            $pwd.next().text("密码为空").css({"font-weight":"bold","color":"red"});
    	            event.preventDefault();
    	        }else{
    	         //登录的ajax
    	          $.ajax({
    	             url:"login.do",
    	             type:"post",
    	             data:{
    	                  userId:$userId.val(),
    	                  pwd:$pwd.val()
    	             },
    	             success:function(result){
    	                if(result=="no"){
    	                   $userId.next().text("用户名或密码错误").css({"font-weight":"bold","color":"red"});
    	                   $pwd.next().text("用户名或密码错误").css({"font-weight":"bold","color":"red"});
    	                }else{
    	                   alert("登录成功");
    	                   window.location.href = "index.jsp";//跳转到主页
    	                }
    	              }
    	            });
    	         }
    		});
    	});
    </script>
</body>
</html>