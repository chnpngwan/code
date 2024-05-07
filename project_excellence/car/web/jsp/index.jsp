<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>期初租赁首页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
		<script src="static/bootstrap/js/jquery.min.js"></script>
		<script src="static/bootstrap/js/bootstrap.min.js"></script>
		<!-- 样式 -->
		<link rel="stylesheet" href="static/css/home.css" />
		<link rel="stylesheet" href="static/css/layout.css" />
		<link rel="stylesheet" href="static/css/reset.css" />
		<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
     $(function(){
    		$("#Userbutton").click(function () {
				 /* 获取input框输入里面的内容 "trim()" 去空格的意思*/
    			 var username = $("#Userinput").val();
       		     if(username == null){
					alert("请输入账号！") 
					return false;
				 }else{
					 return true; 
				 }
   
       		  var pwd = $("#pwd").val();
    		     if(pwd == null){
					alert("请输入密码！") 
					return false;
				 }
            });
    	  
      });
</script>
<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
      $(function(){
    	  /* 模糊查询 */
    	  $("#chax").click(function () {
			 var type = $("#inputName").val();
  		     window.location.href="selectCarAllByName.do?type="+type; 
           }); 
    	   /* 删除 */	  
    	  $(document).on("click",".delete",function(){
  			if(confirm("您确定要删除该信息吗？")){
  				var id = $(this).parent().parent().parent().children().eq(0).html();
  				window.location.href="DeleteCarAllByIdAdmin?id="+id;
  			}
  			/* 修改修改 */
        	$(document).on("click",".update",function(){
        		if(confirm("您确定要修改该信息吗？")){
		            var id = $(this).parent().parent().parent().children().eq(0).html();
		            window.location.href="selectByIdCarall.do?id="+id;
        		}
             });
  		});
    	   /*  */
    	$("#Userbutton").click(function () {
				 /* 获取input框输入里面的内容 "trim()" 去空格的意思*/
 			 var username = $("#Userinput").val();
    		     if(username == null){
					alert("请输入账号！") 
					return false;
				 }else{
					 return true; 
				 }

    		  var pwd = $("#pwd").val();
 		     if(pwd == null){
					alert("请输入密码！") 
					return false;
				 }
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
					    <li><img src="static/img/logo.png" style="width: 90%;" /></li>
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
							    <img src="static/img/Tc.png"  style="width:1.5%;margin-left:-20px;position: absolute;margin-top:30px;"/>
							    <form action=""><button id="but_but" class="btn " type="submit">退出</button></form>
							</form>
						</li>	
					</ul>
				</div>
			</div>
			<!-- 轮播图 -->
			<div id="myCarousel" class="carousel slide">
				<!-- 轮播（Carousel）指标 -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 轮播（Carousel）项目 -->
				<div class="carousel-inner" id="img_lunbo">
					<div class="item active">
						<img src="static/img/home1.jpg" alt="First slide">
					</div>
					<div class="item">
						<img src="static/img/home2.jpg" alt="Second slide">
					</div>
					<div class="item">
						<img src="static/img/home3.jpg" alt="Third slide">
					</div>
				</div>
				<!-- 轮播（Carousel）导航 -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
				<script>
					$(function(){
				        // 初始化轮播
				        $(".start-slide").click(function(){
				            $("#myCarousel").carousel('cycle');
				        });
				        // 停止轮播
				        $(".pause-slide").click(function(){
				            $("#myCarousel").carousel('pause');
				        });
				        // 循环轮播到上一个项目
				        $(".prev-slide").click(function(){
				            $("#myCarousel").carousel('prev');
				        });
				        // 循环轮播到下一个项目
				        $(".next-slide").click(function(){
				            $("#myCarousel").carousel('next');
				        });
				        // 循环轮播到某个特定的帧 
				        $(".slide-one").click(function(){
				            $("#myCarousel").carousel(0);
				        });
				        $(".slide-two").click(function(){
				            $("#myCarousel").carousel(1);
				        });
				        $(".slide-three").click(function(){
				            $("#myCarousel").carousel(2);
				        });
				    });
				</script>
			</div>
			<!-- 车型选择 -->
			<div>
				<div role="navigation" style="background-color: #333;height: 80px;line-height: 60px;">
					<div class="container-fluid" style="width: 0px auto;width: 1100px;">
						<div class="navbar-header grid" style="">
							<ul class=" nav-pills" style="margin-right:80px;margin-top: 5px;">
								<li><img src="static/img/icon_hot.png" /></li>
								<li>
									<p style="color: white;font-size: 20px;">搜索关键词：</p>
								</li>
								<li>
									<ul class="grid" style="width: 300px;">
										<li><form action="selectAllCar.do"><button id="but_but" type="submit"><a href="#">豪华型</a></button></form></li>
										<li><form action="selectAllCar1.do"><button id="but_but" type="submit"><a href="#">舒适型</a></button></form></li>
										<li><form action="selectAllCar3.do"><button id="but_but" type="submit"><a href="#">经济型</a></button></form></li>
										<li><form action="selectAllCar4.do"><button id="but_but" type="submit"><a href="#">越野SUV</a></button></form></li>
										<li><form action="selectAllCar5.do"><button id="but_but" type="submit"><a href="#">客车型</a></button></form></li>
									</ul>
								</li>
							</ul>
						</div>
						<form class="navbar-form navbar-left" role="search" style="margin-left: 100px;">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="请输入关键字" style="border-radius: 25px 0px 0px 25px;height: 50px;border-right: 0px;width: 310px;">
								<button id="button" type="submit" class="btn btn-default" style="border-radius: 0px 25px 25px 0px;height: 50px;position: absolute;margin-top: 6px;border: 0px;background-color: blue;color: white;width: 80px;">搜索</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>


		<!-- 中部-->
		<section>
			<div style="width: 100%;height: 1200px;background-color: #f0f0f0;">
				<!--车辆展示和车型 -->
				<!--车辆展示和车型 -->
				<div style="width: 1180px;margin: 0px auto;">
					<div align="center">
						<h1>车辆展示</h1>
					</div>
					<div align="center" style="margin-top: 30px;">
						<h4>给予客户清晰完美的用车解决方案！</h4>
					</div>
					<div id="button_carShow" align="center" style="margin-top: 50px;">
						<ul class="grid" style="width: 900px;">
							<li>
							    <!-- 标准的按钮 -->
							    <button type="button" class="btn Dyibutton">全部车辆</button>
							</li>
	            		   <li>
	            		      <!-- 提供额外的视觉效果，标识一组按钮中的原始动作 -->
	            		      <form action="selectAllCar.do">
	            		          <button type="submit" class="btn">豪华型</button>
	            		      </form>
	            		   </li>
	            		   <li>
	            		         <!-- 表示一个成功的或积极的动作 -->
	            		         <form action="selectAllCar1.do">
	            		         <button type="submit" class="btn ">舒适型</button>
	            		          </form>
	            		   </li>
	            		   <li>
	            		        <!-- 信息警告消息的上下文按钮 -->
	            		        <form action="selectAllCar3.do">
	            		             <button type="submit" class="btn ">经济型</button>
	            		         </form>
	            		   </li>
	            		   <li>
	            		        <!-- 表示应谨慎采取的动作 -->
	            		        <form action="selectAllCar4.do">
	            		        <button type="submit" class="btn ">越野SUV</button>
	            		         </form>
	            		   </li>
	            		   <li>
	            		        <!-- 表示一个危险的或潜在的负面动作 -->
	            		        <form action="selectAllCar5.do">
	            		        <button type="submit" class="btn ">客车型</button>
	            		         </form>
	            		   </li>
	            		</ul>
					</div>
				</div>
				<!-- 图文结合-->
				<!-- 图文结合-->
				<!-- 图文结合-->
				<!-- 图文结合-->
				<!-- 图文结合-->
				<div style="width: 1180px;margin: 0px auto;background-color: white;margin-top: 50px;">
					<div align="center">
						<div class="container">
							<div class="row clearfix">
								<!-- 图片和右边的文字 -->
								<div class="col-md-6 column">
									<img alt="140x140" src="static/img/car1.jpg"
									 style="width: 100%;float: left;" />
								</div>
								<div class="col-md-6 column">
									<h2>
										迈巴赫
									</h2>
									<p>
										迈巴赫（德文：Maybach）与迈巴赫引擎制造厂（德文：Maybach-Motorenbau GmbH）
										是曾经在1921年到1940年间活跃于欧洲地区的德国超豪华汽车品牌与制造厂。
										车厂创始人卡尔迈巴赫（Karl Maybach）...
									</p>
								</div>
								<!-- 三张图片 -->
								<div style="margin-top: 150px;">
									<div class="container">
										<!-- 三张图片 -->
										<div class="row clearfix grid" id="Sanimg">
											<div class="col-md-4 column">
												<img alt="140x140" src="static/img/car2.jpg" />
											</div>
											<div class="col-md-4 column">
												<img alt="140x140" src="static/img/car3.jpg" />
											</div>
											<div class="col-md-4 column">
												<img alt="140x140" src="static/img/car4.jpg" />
											</div>
										</div>
										<!-- 按钮和价格 -->
										<div style="margin-top: 60px;">
											<div class="row clearfix grid">
												<div class="col-md-6 column" style="margin-left: -100px;" id="ChakAn">
													<button type="button" class="btn-default">查看详情+</button>
												</div>
												<div style="margin-left:100px;">
													<label>
														<strong style="    font-size: 40px;color: #3186E0;">￥1200</strong>/天
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 以上是图文结合的div结尾-->
				<!-- 以上是图文结合的div结尾-->
				<!-- 以上是图文结合的div结尾-->
				<!-- 以上是图文结合的div结尾-->
				<div style="width: 1180px;margin: 0px auto;margin-top: 50px;">
					<div class="container">
						<div class="row clearfix grid grid-cell-3">
							<!-- 第一张图片 -->
							<div class="col-md-4 column" id="Button_Img">
								<img alt="140x140" src="static/img/car5.jpg" />
								<div class="row clearfix" id="Hover_price">
									<div class="col-md-6 column" style="padding-top: 10px;">
										<p>宝马7系</p>
									</div>
									<div style="margin-left:100px;">
										<label>
											<strong style="font-size: 30px;margin-left:50px;">￥800</strong>/天
										</label>
									</div>
								</div>
							</div>
							<!-- 第二张图片 -->
							<div class="col-md-4 column" id="Button_Img">
								<img alt="140x140" src="static/img/car6.jpg" />
								<div class="row clearfix" id="Hover_price">
									<div class="col-md-6 column">
										<p>奔驰S级</p>
									</div>
									<div style="margin-left:100px;">
										<label>
											<strong style="font-size: 30px;margin-left:50px;">￥800</strong>/天
										</label>
									</div>
								</div>
							</div>
							<!-- 第三张图片 -->
							<div class="col-md-4 column" id="Button_Img">
								<img alt="140x140" src="static/img/car7.jpg" />
								<div class="row clearfix" id="Hover_price">
									<div class="col-md-6 column" style="padding-top: 10px;">
										<p>奥迪</p>
									</div>
									<div style="margin-left:100px;">
										<label>
											<strong style="font-size: 30px;margin-left:50px;">￥600</strong>/天
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--关于我们 -->
				<!--关于我们 -->
				<!--关于我们 -->
				<!--关于我们 -->
				<!--关于我们 -->
				<!--关于我们 -->
				<!--关于我们 -->
				<div style="margin-top:50px;">
					<div style="width: 1180px;margin: 0px auto;margin-top: 50px;">
						<div align="center">
							<h1>关于我们</h1>
						</div>
						<div align="center" style="margin-top: 30px;">
							<hr style="width: 500px;height: 3px;background-color: #0E90D2;" />
						</div>
					</div>
					<!-- 图文集合-->
					<div style="width: 1180px;margin: 0px auto;margin-top: 50px;">
						<div align="center">
							<div class="container">
								<div class="row clearfix">
									<div class="col-md-6 column">
										<img alt="140x140" src="static/img/car8.jpg" />
									</div>
									<div class="col-md-6 column">
										<h2>
											通用企业汽车租赁有限公司
										</h2>
										<p>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;汽车租赁业被称为交通运输服务行，它因为无须办理保险、无须年检维修、车型可随意更换等优点，以租车代替买车来控制企业成本，这种在外企中十分流行的管理方式，
											正慢慢受到国内企事业单位和个人用户的青睐。 汽车租赁是指将汽车的资产使用权从拥有权中分开，出租人具有资产所有权，承租人拥有资产使用权，出租人与承租人签订租赁合同，
											以交换使用权利的一种交易形式。 汽车租赁是指在约定时间内，
											租赁经营人将租赁汽车（包括载货汽车和载客汽车）交付承租人使用，不提供驾驶劳务的经营方式。汽车租赁的实质是在将汽车的产权与使用权分开的基础上，通过......
										</p>
									</div>
									<!-- 按钮和价格 -->
									<div style="margin-top: 60px;">
										<div class="row clearfix grid">
											<div class="col-md-6 column" id="ChakAn1">
												<button type="button" class="btn-default">查看详情+</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 以上是图文集合-->
					<!-- 滑动标签-->
					<div style="width: 1180px;margin: 0px auto;margin-top: 50px;height: 500px;" id="gywm">
						<div class="container">
							<div class="row clearfix">
								<table border="1">
									<div class="col-md-8 column">
										<div class="row clearfix">
											<div class="col-md-12 column" style="background-color:#3186E0;;height: 54px;line-height: 54px;width: 640px;margin-left: 15px;">
												<label style="color: white;">公司新闻</label><a href="#" style="color: white;float: right;">更多+</a>
											</div>
										</div>
										<div class="row clearfix" style="height: 300px;">
											<div class="col-md-6 column">
												<img alt="140x140" src="static/img/car9.jpg"/>
												<dl style="margin-top: 20px;">
													<dt>
														<strong><a href="#">冬天柴油汽车被冻住怎么办？柴油...</a></strong>
													</dt>
													<dd>
														在冬天，许多柴油机车主都会有同一个困扰，那就<br />是柴油在低温的情况下会被冻住。造成这种情况的<br />原因主要是柴油
													</dd>
												</dl>
												<div class="row clearfix">
													<div class="col-md-12 column">
													</div>
												</div>
											</div>
											<div class="col-md-6 column">

												<ul style="line-height: 45px;">
													<li>
														<a href="#">汽车AUX IN是什么接......2021-07-29</a>
													</li>
													<li>
														<a href="#">车上仪表盘方框中间......2021-07-29</a>
													</li>
													<li>
														<a href="#">车门卡扣不回弹，车......2021-07-29</a>
													</li>
													<li>
														<a href="#">汽车空调多少度才制......2021-07-29</a>
													</li>
													<li>
														<a href="#">车上的VOL是什么意......2021-07-29</a>
													</li>
													<li>
														<a href="#">车门卡扣不回弹，车......2021-07-29</a>
													</li>
													<li>
														<a href="#">冬天柴油汽车被冻住......2021-07-29</a>
													</li>
													<li>
														<a href="#">汽车正负加减号红......2021-07-29</a>
													</li>
												</ul>
											</div>
										</div>
									</div>

									<div class="col-md-4 column">
										<div class="row clearfix">
											<div class="col-md-12 column" style="background-color:#3186E0; height: 54px;line-height: 54px;margin-left: -75px;width: 450px;">
												<label style="color: white;">技术问题</label><a href="#" style="color: white;float: right;">更多+</a>
											</div>
										</div>
										<div class="row clearfix" style="margin-left: -105px;">
											<div class="col-md-12 column" style="height: 400px;">
												<ul style="line-height: 29px;">
													<marquee direction="up" onMouseOut="this.start()" onMouseOver="this.stop()" scrolldelay="110" >
														<li>
															<a href="#">
															<lable style="color: white;background-color: #0E90D2;width: 20px;height: 20px;font-size: 20px;">问</lable>
															流水转向灯是什么意思？流水转向...<br />
															<lable style="color: white;background-color: orange;width: 20px;height: 20px;font-size: 20px;">答</lable>
															开车门的时候照射在地上的投影灯其实
															</a>
														</li>
														<li>
															<a href="#">
															<lable style="color: white;background-color: #0E90D2;width: 20px;height: 20px;font-size: 20px;">问</lable>
															一开车门地上的投影灯叫什么？迎...<br />
															<lable style="color: white;background-color: orange;width: 20px;height: 20px;font-size: 20px;">答</lable>
															开车门的时候照射在地上的投影灯其实
															</a>
														</li>
														<li>
															<a href="#">
															<lable style="color: white;background-color: #0E90D2;width: 20px;height: 20px;font-size: 20px;">问</lable>
															迎宾灯什么情况下才亮？车门迎宾...<br />
															<lable style="color: white;background-color: orange;width: 20px;height: 20px;font-size: 20px;">答</lable>
															开车门的时候照射在地上的投影灯其实
															</a>
														</li>
														<li>
															<a href="#">
															<lable style="color: white;background-color: #0E90D2;width: 20px;height: 20px;font-size: 20px;">问</lable>
															悬浮式中控屏的优缺点，悬浮中控...<br />
															<lable style="color: white;background-color: orange;width: 20px;height: 20px;font-size: 20px;">答</lable>
															开车门的时候照射在地上的投影灯其实
															</a>
														</li>
														<li>
															<a href="#">
															<lable style="color: white;background-color: #0E90D2;width: 20px;height: 20px;font-size: 20px;">问</lable>
															一开车门地上的投影灯叫什么？迎宾灯...<br />
															<lable style="color: white;background-color: orange;width: 20px;height: 20px;font-size: 20px;">答</lable>
															开车门的时候照射在地上的投影灯其实
															</a>
														</li>
														<li>
															<a href="#">
															<lable style="color: white;background-color: #0E90D2;width: 20px;height: 20px;font-size: 20px;">问</lable>
															为什么大家都不用自动泊车？...<br />
															<lable style="color: white;background-color: orange;width: 20px;height: 20px;font-size: 20px;">答</lable>
															开车门的时候照射在地上的投影灯其实
															</a>
														</li>
														
													</marquee>
												</ul>
											</div>
										</div>
									</div>
							</div>
						</div>
					</div>
					<!-- 以上是关于滑动标签的 -->
				</div>
				<!-- 以上是关于我们 -->
			</div>
			</div>
		</section>
		
		
		<!-- 尾部 -->
<div style="width: 100%;height: 300px;background-color: #000000;margin-top: 500px;">
	<div class="container" id="weibu">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<div class="row clearfix">
							<div class="col-md-4 column" style="margin-top: 50px;">
								<ul class=" nav-pills" style="margin-right:80px;margin-top: 5px;">
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
