<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>注册界面</title>
		
		<link href="css/layout.css" rel="stylesheet"/>
		<link href="css/reset.css" rel="stylesheet"/>
		<link href="css/Register.css" rel="stylesheet"/>
		
		<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#button1").click(function (){
					var text1 = $("#input1").val();
					if(text1==""){
						alert("请输入您号码！");
						return false;
					}
					if(text1.length != 11){
						alert("号码格式输入错误，请输入正确的格式！");
						return false;
					}
					var text3 = $("#input3").val();
					if(text3==""){
						alert("输您创建一个密码！");
						return false;
					}
					var text4 = $("#input4").val();
					if(text4 != text3){
						alert("你的密码跟创建的不一致，请您再次确认您的密码！");
						return false;
					}
					/* 复选框 */
					var sex = $("#input5:checked").val();
					// 以下是校验；
					if(sex != "确定"){
						alert("请先阅读并勾选用户协议！");
					    // 如果检测没有选择就不能提交；校验；
					     return false;
					}
				});
				//鼠标聚焦事件
				$("#input1").focus(function (){
					var text1 = $(this).val();
					if(text1 == "+86"){
						$(this).val("");
					}
				});
				//移入移除
				$("#input1").blur(function (){
					var text1 = $(this).val();
					if(text1 ==""){
						$(this).val("+86");
					}
				});
			});
			//页面加载时，生成随机验证码
			window.onload=function(){
			 createCode(4);    
			}
				
			//生成验证码的方法
			function createCode(length) {
			    var code = "";
			    var codeLength = parseInt(length); //验证码的长度
			    var checkCode = document.getElementById("checkCode");
			    ////所有候选组成验证码的字符，当然也可以用中文的
			    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
			    'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
			    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); 
			    //循环组成验证码的字符串
			    for (var i = 0; i < codeLength; i++)
			    {
			        //获取随机验证码下标
			        var charNum = Math.floor(Math.random() * 62);
			        //组合成指定字符验证码
			        code += codeChars[charNum];
			    }
			    if (checkCode)
			    {
			        //为验证码区域添加样式名
			        checkCode.className = "code";
			        //将生成验证码赋值到显示区
			        checkCode.innerHTML = code;
			    }
			}
			
			//检查验证码是否正确
			function validateCode()
			{
			    //获取显示区生成的验证码
			    var checkCode = document.getElementById("checkCode").innerHTML;
			    //获取输入的验证码
			    var inputCode = document.getElementById("inputCode").value;
			    console.log(checkCode);
			    console.log(inputCode);
			    if (inputCode.length <= 0)
			           {
			        alert("请输入验证码！");
					return false;
			    }
			    else if (inputCode.toUpperCase() != checkCode.toUpperCase())
			    {
			        alert("验证码输入有误！");
			        createCode(4);
			    }
			    else
			    {
			        alert("验证码正确！");
			    }       
			}  
		</script>
	</head>
	<body>
		<header>
		<div id="bj">
			<div id="logheader_div">
				<!-- 头部 -->
				<div id="logheader_div--div1" class="grid grid-cell-6">
					<div class="grid-cell-3">
						<img src="img/logo.png" style="width: 60%;" />
					</div>
					<div class="grid-cell-3">
						<p id="logheader_div--div1--p"><span>已有梦里账号？</span><a href="Login.jsp"><input type="button" value="登录"/></a></p>
					</div>
				</div>
				<!-- 以上是div头部 -->
					<hr style="background-color: #999999;opacity: 0.5;"/>
				<!-- 表单验证 -->
				<div id="logheader_div--div2" class="grid-cell-6">
					<form id="form1" action="InsertUser.do" method="post">
						 <table>
							 <tr>
								 <td><label>手&nbsp;&nbsp;机&nbsp;&nbsp;号</label></td>
								 <td><input id="input1" class="input" type="text"  name="username"/></td>
							 </tr>
							 <tr>
								 <td> <label>创建密码</label></td>
								 <td><input id="input3" class="input" type="password" name="Userpassword"/></td>
							 </tr>
							 <tr>
	                            <td><label>确认密码</label></td>
	                            <td><input id="input4" class="input" type="password" name="telephone"/></td>
							 </tr>
							 <tr>
							 	<td><label>动&nbsp;&nbsp;态&nbsp;&nbsp;码</label></td>
							 	<td>
									<div style="margin-left: 25px;" class="grid">								       
									       <input type="text" id="inputCode" placeholder="验证码" style="width:30%;"/>
									       <div id="checkCode" class="code"  onclick="createCode(4)" style="width: 100px;height: 42px;"></div>
									       <span onclick="createCode(4)">换一张</span> 
									 </div>
								</td>							 
							 </tr>
							 <tr>
                                <td></td>
                                <td><a href=""><input id="button1" type="submit" value="注册"/></a></td>
							 </tr>
							<tr>
							   <td></td>
							   <td>
							   <span class="text">
								   <p><input id="input5" type="radio" value="确定" style="border-radius: 50%;"/>
								   我已阅读并同意<a href="#">《旅途用户协议》《隐私<br/>政策》</a> ，
							       并授权梦里使用该旅途账号信息<br/>（如昵称、头像、收货地址）进行统一管理
									</p>
								</span>
							    </td>
							</tr>
						 </table>
					</form>
				</div>	
				<!-- 以上是表单 -->
				<hr style="background-color: #f8f8f8;opacity: 0.3;"/>
				<!-- 表单下面的div -->
				<div id="logheader_div--div3" class="grid-cell-6">
				    <span><a href="#">©mengli.com  京ICP证070791号  京公网安备11010502025511号</a></span>
				</div>
			</div>
			</div>
		</header>
	</body>
</html>
