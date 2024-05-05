<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>期初租赁关于我们</title>
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
						<li><form action=""><button id="but_but" class="btn " type="submit"><a href="#">联系我们</a></button></form></li>
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
						<li style="padding-top: 5px;">主页>关于我们</li>
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
			<div class="container">
				
				<div class="row clearfix">
					<div class="col-md-12 column">
						<dl>
							<dd>
								汽车租赁业被称为交通运输服务行，它因为无须办理保险、无须年检维修、车型可随意更换等优点，以租车代替买车来控制企业成本，这种在外企中十分流行的管理方式，正慢慢受到国内企事业单位和个人用户的青睐。
								汽车租赁是指将汽车的资产使用权从拥有权中分开，出租人具有资产所有权，承租人拥有资产使用权，出租人与承租人签订租赁合同，以交换使用权利的一种交易形式。
							</dd>
							<dd>&nbsp;</dd>
							<dd>
								汽车租赁是指在约定时间内，租赁经营人将租赁汽车（包括载货汽车和载客汽车）交付承租人使用，不提供驾驶劳务的经营方式。汽车租赁的实质是在将汽车的产权与使用权分开的基础上，通过出租汽车的使用权而获取收益的一种经营行为，其出租标的除了实物汽车以外，还包含保证该车辆正常、合法上路行驶的所有手续与相关价值。不同于一般汽车出租业务的是，在租赁期间，承租人自行承担驾驶职责。汽车租赁业的核心思想是资源共享，服务社会。
							</dd>
							<dd>&nbsp;</dd>
							<dd>
								按照不同的分类标准，汽车租赁具有不同的分类方法，常见的有按照租赁期长短划分和按照经营目的划分两类。汽车租赁具有租赁期短，租用方便，由出租方提供维修保养等租后服务等特点。中国汽车租赁企业由于经营时间短，规模和实力有限，多采取分散独立经营的模式，但随着中国经济的发展和租赁市场的成长，这种模式难以为顾客提供方便快捷的服务，限制了企业的市场开拓和经营规模的扩大，难以为企业提供持续健康发展的空间。汽车租赁企业在经历了最初的市场培育之后，经营模式必将走上连锁经营和与生产厂商合作的道路。
							</dd>
							<dd>&nbsp;</dd>
							<dd>
								汽车租赁作为中国新兴的交通运输服务业，是满足人民群众个性化出行、商务活动需求和保障重大社会活动的重要交通方式，是综合运输体系的重要组成部分。促进汽车租赁业健康发展，是转变交通运输发展方式、推进现代交通运输业发展的重要举措，对完善综合运输体系，转变道路运输发展方式，提高车辆、道路、停车场地等社会资源的利用效率，带动旅游业、汽车工业、金融保险业的发展，提高人民群众生活质量，都具有重要的现实意义。
							</dd>
						</dl>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-12 column">
					</div>
				</div>
			</div>
		</header>
		<!-- 尾部 -->
		<div style="width: 100%;height: 300px;background-color: #000000;">
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
