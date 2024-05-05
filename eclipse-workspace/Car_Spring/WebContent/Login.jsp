<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
		<title>登录界面</title>
		<link href="css/Register.css" rel="stylesheet"/>
		<link href="css/layout.css" rel="stylesheet"/>
		<link href="css/reset.css" rel="stylesheet"/>
		<link href="css/Login.css" rel="stylesheet"/>
		
<title>登录</title>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#button1").click(function (){
		var text1 = $("#input1").val();
		if(text1==""){
			alert("请输入您的账号或者号码！");
			return false;
		}
		}
		var text2 = $("#input2").val();
		if(text2==""){
			alert("请输入您的密码！");
			return false;
		}
		}
		var sex = $("#input3:checked").val();
		// 以下是校验；
		if(sex != "确定"){
				alert("请先阅读并勾选用户协议！");
		// 如果检测没有输入姓名就不能提交；校验；
			    return false;
		}
	});
	$("#aniu").click(function (){
		// $(this).toggleClass("#zahnghaop2")
		  if(dj=="手机"){
			  $("#zahnghaop1").show();
			  $("#zahnghaop2").hide();
		  }
		  if(dj=="人头"){
		  	 $("#zahnghaop1").hide();
		  	 $("#zahnghaop2").show();
		  }
	});
});
</script>
</head>
<body>
	<header>
		<div id="bj">
			<!-- 头部 -->
				<div id="logheader_div--div1" class="grid grid-cell-6">
					<div class="grid-cell-3">
						<img src="img/logo.png" style="width: 30%;" />
					</div>
					<div class="grid-cell-3">
						
					</div>
				</div>
				<!-- 以上是div头部 -->
					<hr style="background-color: #999999;opacity: 0.5;"/>
				<!-- 表单验证 -->

			<div id="deluheader_div">
				<!-- 表单验证 -->
				<div id="deluheader_div--div2" class="grid-cell-6 grid " style="background-color:">
					<!-- <div class="grid-cell-3">
						<img class="img1" src="img/theme-pic1.jpg"/>
					</div> -->
					<div class="grid-cell-3">
				<!-- <form id="form" action="LoginDao.do" method="post" style="padding-left: 30px;background-color: white;width:320px;border-radius: 20px;margin-left:-100px;"> -->
				<form id="form" action="LoginDao.do" method="post" >
						 <table>
							 <tr>
								 <td><span class="zhaghao">账号登录</span></td>
								 <td>
									 <p id="zahnghaop1" value="手机" name="dj"><span class="zhaghaoxia" style="margin-left: 125px;">手机动态码登录<img src="img/sj.png" style="width: 6%;"/></span></p>
									 <p id="zahnghaop2" value="人头" name="dj" style="display: none;"><span class="zhaghaoxia" style="margin-left: 100px;">普通方式登录<img src="img/st.png" style="width: 6%;"/></span></p>
								</td>
							 </tr>
							 <tr>
								 <td colspan="2"><input id="input1" class="input" type="text" placeholder="请输入手机号/账号" name="username"/></td>
							 </tr>
							 <tr>
								 <td>&nbsp;</td>
							 </tr>
							 <tr>
							 	<td colspan="2"><input id="input2" class="input" type="password"  placeholder="请输入密码" name="Userpassword"/><br />
								<p style="color:red"><strong>${Message }</strong></p>
								<span style="margin-left: 220px;"><a href="#">忘记密码？</a></span>
								</td>							 
							 </tr>
							 <tr>
		                        <td colspan="2"><input id="button1" type="submit" value="登录"/><br />
								<span>还没有账号？<a href="Register.jsp">免费注册</a></span>
								</td>
							 </tr>
							<tr>
							   <td colspan="2">
							     <span class="text">
								   <p><input id="input3" type="radio" value="确定" style="border-radius: 50%;"/>
								   我已阅读并同意<a href="#">《汽车租赁》《隐私政策》</a> ，
							       <br />授权旅途使用该旅途账号信息（如昵称、头像、<br />收货地址）
							       进行统一管理
									</p><br />
									 —————用合作网站账号登录—————
								  </span>
							    </td>
							</tr>
						 </table>
					</form>
					</div>
				</div>	
				<!-- 以上是表单 -->
				
				<!-- 表单下面的div页脚 -->
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