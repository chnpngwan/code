<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>期初租赁客户案例</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
		<script src="static/bootstrap/js/jquery.min.js"></script>
		<script src="static/bootstrap/js/bootstrap.min.js"></script>
		<!-- 样式 -->
		<link rel="stylesheet" href="static/css/layout.css" />
		<link rel="stylesheet" href="static/css/reset.css" />
		<link rel="stylesheet" href="static/css/About.css" />
		<link rel="stylesheet" href="static/css/home.css" />
		
<script type="text/javascript" src="static/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
      $(function(){
    		$("#chax").click(function () {
				   /* 获取input框输入里面的内容 "trim()" 去空格的意思*/
    			 var name = $("#inputtext").val();
       		     window.location.href="SelectByName?name="+name;
            });
    	  
      });
</script>

    
    <style type="text/css">
		body, html {
			width: 100%;
			height: 100%; 
			margin:0;
			font-family:"微软雅黑";
		}
        #l-map{
            height:100%;
            width:100%;
		}
		#driving_way{
			position: fixed;
            top: 250px;
            left: 20px;
            width: 270px;
            height: 500px;
            background: #fff;
            box-shadow: 0 2px 6px 6px rgba(27, 142, 236, 0.5);
            border-radius: 7px;
			z-index: 99;
			padding: 10px
		}
		#result{
			height: 400px;
            overflow-y: auto;
		}
		#allmap2 {
			width: 100%;
			height: 100%;
			overflow: hidden;
			margin: 0;
			font-family: "微软雅黑";
		}
		#search{
			width: 100%;
			font-size: 20px;
			font-weight: bold;
			border: 0px;
		}
		#IMG{
      width:60%;
    }
	</style>
	<script src="https://api.map.baidu.com/api?type=webgl&v=1.0&ak=0bCCHuhQjOrFIpRWqwYSOBSCj0eCzFFe"></script>
	<script src="https://code.bdstatic.com/npm/jquery@1.12.4/dist/jquery.min.js"></script>
	<title>根据起终点经纬度查询公交换乘</title>
</style>
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
		<!-- 背景图片 -->
			<div style="width: 100%;">
				<div class="carousel-inner" id="img_lunbo">
					<div class="item active">
						<img src="static/img/inb.jpg" alt="First slide" style="height: 80%;">
					</div>
				</div>
			</div>
	<!-- 地图 -->
		<div style="height:600px;">
				<div id="l-map"></div>
				<div id="allmap2"></div>
				<div id="driving_way">
					<h3 align="center" >查找方案</h3>
					<select id="search">
			            <option value="0">推荐方案</option>
						<option value="1">最少时间</option>
						<option value="2">最少换乘</option>
						<option value="3">最少步行</option>
						<option value="4">不乘地铁</option>
			            <option value='5'>优先地铁</option>
					</select>
			        <p id='result'></p>
				</div>
		</div>
	<!-- 地图 -->
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
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMapGL.Map("l-map");      
	map.enableScrollWheelZoom(true);
	map.centerAndZoom('昆明市', 12);
	var navi3DCtrl = new BMapGL.NavigationControl3D(); // 添加3D控件
	map.addControl(navi3DCtrl);
    //当前位置开始
	var start = new BMapGL.Point(102.694457,25.056237)    //"云南农业职业技术学院";
	//终点
	var end = new BMapGL.Point(105.18837287494,23.637934158037);               //"北京邮电大学西门";
	
	var routePolicy = [BMAP_TRANSIT_POLICY_RECOMMEND,BMAP_TRANSIT_POLICY_LEAST_TIME,BMAP_TRANSIT_POLICY_LEAST_TRANSFER,BMAP_TRANSIT_POLICY_LEAST_WALKING,BMAP_TRANSIT_POLICY_AVOID_SUBWAYS,BMAP_TRANSIT_POLICY_FIRST_SUBWAYS];
	var transit = new BMapGL.TransitRoute(map, {
			renderOptions: {map: map, panel: 'result'},
            policy: 0,
            
	});
	$("#search").change(function(){
		map.clearOverlays(); 
		var i= $("#driving_way select").val();
		search(start,end,routePolicy[i]); 
		function search(start,end,route){ 
			transit.setPolicy(route);
            transit.search(start,end);
		}
	});
</script>
