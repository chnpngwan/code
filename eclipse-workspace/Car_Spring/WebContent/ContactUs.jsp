<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>期初租赁在线预约</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css">
		<script src="./bootstrap/js/jquery.min.js"></script>
		<script src="./bootstrap/js/bootstrap.min.js"></script>
		<!-- 样式 -->
		<link rel="stylesheet" href="css/layout.css" />
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/About.css" />
		<link rel="stylesheet" href="css/home.css" />
		<style>
			#Button_Img img{
				max-width: 100%;
				border: none;
				vertical-align: middle;
				object-fit: contain;
			}    
		</style>
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
     $(function(){
    		/* $("#button_2").click(function () {
				 /* 获取input框输入里面的内容 "trim()" 去空格的意思*/
    			 var name = $("#inputNAme").val();
       		     if(name == null){
					alert("您还未输入姓名！") 
					return false;
				 }else{
					 return true; 
				 } */
       		     
       		/*   var inputmesage = $("#inputmesage").val();
    		     if(inputmesage == null){
    		    	 if(comfirm("您需要留言吗？")){
    		    		 return true;
    	       		  }else{
    	       			return false; 
    	       		  }
				 }else{
					 return true; 
				 }
    		     
    		     
    		     var inputphone = $("#inputphone").val();
       		     if(inputphone == null){
					alert("您还未输入手机号码！") 
					return false;
				 }else{
					 return true; 
				 }
       		     
       		  var email = $("#email").val();
    		     if(email == null){
					alert("您还未输邮箱！") 
					return false;
				 } */
            });
    	  
      });
</script>
	</head>
	<body>
		<header>
			<!-- 导航栏 -->
			<div style="position: initial;width: 100%;">
				<div id="header_div" class="grid" style="background-color: #000000;height:80px;line-height:80px;">
					<ul style="margin-left:px;">
						<!-- <li><img src="img/logo.png" style="width: 90%;" /></li> -->
					</ul>
					<ul class="nav-pills" style="margin-left: 30px;">
					    <li><img src="img/logo.png" style="width: 90%;" /></li>
						<li><form action=""><button id="but_but" class="btn " type="submit"><a href="index.jsp">首页</a></button></form></li>
						<li><form action=""><button id="but_but" class="btn " type="submit"><a href="AboutUs.jsp">关于我们</a></button></form></li>
						<li><form action="selectAllCar.do"><button id="but_but" class="btn " type="submit"><a href="#">车辆展示</a></button></form></li>
						<li><form action=""><button id="but_but" class="btn " type="submit"><a href="XingWeng.html">新闻资讯</a></button></form></li>
						<li><form action="selectSllClient.do"><button id="but_but" class="btn " type="submit">客户案例</button></form></li>
					    <li><form action="selectSAllDriver.do"><button id="but_but" class="btn " type="submit">专车司机</button></form></li>
						<li><form action=""><button id="but_but" class="btn " type="submit"><a href="ContactUs.jsp">在线预约</a></button></form></li>
						<li><form action=""><button id="but_but" class="btn " type="submit"><a href="ContUs.jsp">联系我们</a></button></form></li>
						<li>
							<div class="col-md-12 column">
								<a id="modal-458872" href="#modal-container-458872" role="button" class="btn" data-toggle="modal">管理员登录</a>
								<div class="modal fade" id="modal-container-458872" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<!-- 登录表 -->
										<div class="modal-content" style=" opacity:0.9;margin-top: 150px;">
											<div class="modal-header"  align="center">
												<!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button> -->
												<h4 class="modal-title" id="myModalLabel">
													管理员登录
												</h4>
											</div>
											<div class="modal-body">
														<div class="col-md-12 column" align="center">
															<form action="AdminLoginDao.do">
																<div class="form-group">
																	 账号：<input type="text"  id="Userinput" placeholder="请输入账号" name="username"/><br />
																	 密码：<input type="password" id="Userinput" placeholder="请输入密码" name="password"/>
																</div>
																<button type="button" class="btn btn-default" data-dismiss="modal" id="Userbutton">取消登录</button>
																<button type="submit" class="btn btn-default" id="Userbutton">&nbsp;&nbsp;&nbsp;&nbsp;登录&nbsp;&nbsp;&nbsp;&nbsp;</button>
															</form>
														</div>
											</div>
											<div class="modal-footer">
												<!-- 空白 -->
											</div>
										</div>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<ul>
					  	<li>
							<form action="LogOut.do">
							    <img src="img/Tc.png"  style="width:1.5%;margin-left:-20px;position: absolute;margin-top:30px;"/>
							    <form action=""><button id="but_but" class="btn " type="submit">退出</button></form>
							</form>
						</li>	
					</ul>
				</div>
			</div>	
			<!-- 背景图片 -->
			<div style="width: 100%;">
				<div class="carousel-inner" id="img_lunbo">
					<div class="item active">
						<img src="img/inb.jpg" alt="First slide" style="height: 80%;">
					</div>
				</div>
			</div>
			<!-- 搜索框 -->
			<div class="container-fluid" style="width: 0px auto;margin-top: 50px;">
				<div class="navbar-header grid" style="margin-top: 15px;">
					<ul class="grid nav-pills" style="margin-top: 5px;margin-left:180px;">
						<li><img src="img/icon_hot.png" /></li>
						<li>
							<p style="color: black;font-size: 20px;">当前位置:</p>
						</li>
						<li style="padding-top: 5px;">主页>在线预约></li>
					</ul>
				</div>
				<form class="navbar-form navbar-left" role="search" style="margin-left: 400px;">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="请输入产品名称" style="border-radius: 25px 0px 0px 25px;height: 50px;border-right: 0px;width: 310px;">
						<button id="button" type="submit" class="btn btn-default" style="border-radius: 0px 25px 25px 0px;height: 50px;position: absolute;margin-top: px;border: 0px;background-color: blue;color: white;width: 80px;">搜索</button>
					</div>
				</form>
			</div>
			</div>
			<hr style="height: 1px;background-color: gray;"/>
			<!-- 文本 -->
            <!--车辆展示和车型 -->
            <!--车辆展示和车型 -->
            <div class="container">
				<div align="center">
					<h3>立即在线预约，客服会尽快与您联系</h3>
				</div><br />
            	<div class="row clearfix">
            		<div class="col-md-12 column">
				<form class="form-horizontal" role="form" action="insertINtoCont.do">
            			<div class="row clearfix" id="INPUT_LX">
							<!-- 提交表单 -->
            				<div class="col-md-6 column">
            						<div class="form-group">
            							 <label for="inputEmail3" class="col-sm-2 control-label">姓名：</label>
            							<div class="col-sm-10">
            								<input type="text" class="form-control" id="inputEmail3 inputNAme" placeholder="姓名" name="name"/>
            							</div>
            						</div>
            						<div class="form-group">
            							 <label for="inputPassword3" class="col-sm-2 control-label">邮箱：</label>
            							<div class="col-sm-10">
            								<input type="email" class="form-control" id="inputPassword3 inputemail" placeholder="邮箱" name="eamli"/>
            							</div>
            						</div>
            				</div>
            				<div class="col-md-6 column">
            						<div class="form-group">
            							 <label for="inputEmail3" class="col-sm-2 control-label">电话：</label>
            							<div class="col-sm-10">
            								<input type="number" class="form-control" id="inputEmail3 inputphone" placeholder="号码"  name="phone"/>
            							</div>
            						</div>
            						<div class="form-group">
            							 <label for="inputPassword3" class="col-sm-2 control-label">车型：</label>
            							<div class="col-sm-10">
            								<input type="text" class="form-control" id="inputPassword3 inputcar" placeholder="车型"  name="car"/>
            							</div>
            						</div>
            				</div>
            			</div><br />
						
						<div style="width: 1180px;margin: 0px auto;">
							<div style="margin-left: 20px;">
								<div class="row clearfix">
									<div class="col-md-12 column">
										<label>留言：</label><input type="text"  class="form-control" id="inputmesage" style="width: 950px;height: 200px;margin-left: 70px;"  name="message"/>
									</div>
								</div><br /><br />
								<div class="row clearfix" style="margin-left: 790px;">
									<div class="col-md-12 column" id="button_Form_Qk">
										<p>
										  <button type="reset" class="btn btn-default btn-lg" id="button_1">重置信息</button>
										  <button type="submit" class="btn btn-default btn-lg" id="button_2">立即预约</button>
										</p>
									</div>
								</div>
							</div>
						</div>
            		</div>
            	</div>
			</form>
            </div>
		</header>
		<!-- 尾部 -->
		<div style="width: 100%;height: 300px;background-color: #000000;margin-top: 200px;">
			<div class="container" id="weibu">
						<div class="row clearfix">
							<div class="col-md-12 column">
								<div class="row clearfix">
									<div class="col-md-4 column" style="margin-top: 50px;">
										<ul class="grid nav-pills" style="margin-right:80px;margin-top: 5px;">
											<li><img src="http://skk-0817-31.demo.mxyhn.xyz:8020/demo1039/style/images/icon_link.png" /></li>
											<li>
												<p style="color: white;font-size: 20px;">友情链接：<a href="#">百度</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">腾讯</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">网易</a></p>
											</li>
										</ul>
										<img alt="140x140" src="http://skk-0817-31.demo.mxyhn.xyz:8020/demo1039/style/images/logo.png" />
									</div>
									<div class="col-md-4 column" style="margin-top: 50px;">
										<ul style="line-height: 40px;height: 20px;">
											<li>
												通用企业汽车租赁有限公司
											</li>
											<li>
												电话：400-888-8888
											</li>
											<li>
												手机：13588888888
											</li>
											<li>
												邮箱：admin@admin.com
											</li>
											<li>
												地址：江苏省南京市玄武区玄武湖
											</li>	
										</ul>
									</div>
									<div class="col-md-4 column" id="footer_input" style="margin-top: 40px;">
										<form role="form">
											<h2>在线预约</h2>
											<div class="form-group">
												<input type="text" placeholder="&nbsp;&nbsp;&nbsp;姓名" />
											</div>
											<div class="form-group">
												<input type="phone" placeholder="&nbsp;&nbsp;&nbsp;手机"/>
											</div>
											<div class="checkbox">
											</div> <button type="submit" class="btn btn-default" id="LjiTiji">立即预约</button>
										</form>
									</div>
								</div>
								<div class="row clearfix">
									<div class="col-md-12 column">
									</div>
								</div>
							</div>
						</div>
					</div>
			<!-- 尾部 -->
		</div>				
	</body>
</html>
