<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<link rel="stylesheet" href="static/bootstrap/css/bootstrap.min.css">
		<script src="static/bootstrap/js/jquery.min.js"></script>
		<script src="static/bootstrap/js/bootstrap.min.js"></script>
		<!-- 样式 -->
		<link rel="stylesheet" href="static/css/home.css" />
		<link rel="stylesheet" href="static/css/layout.css" />
		<link rel="stylesheet" href="static/css/reset.css" />


<style>
	#input_update input{
	     width:300px;
	     height:40px;
	}
    
</style>
	</head>
	<body>
		<header>
			<!-- 导航栏 -->
			<div style="position: initial;width: 100%;">
				<div align="center" id="header_div" class="grid" style="background-color: #000000;height:80px;line-height:80px;">
					<ul class="nav-pills">
						<li><img src="static/img/logo.png" style="width: 90%;" /></li>
						<li>
							<h1 style="color:white;">车辆修改数据资源管理系统</h1>
						</li>
						<!-- 管理员登录 -->
						<li><a href="index.html" style="float:right;">退出</a></li>
					</ul>
				</div>
			</div>

		</header>


		<!-- 中部-->
		<section>
			<div class="container" style="width: 100%;">
				<div class="row clearfix">
					<!--管理员的界面-->
					<div class="col-md-4 column" style="background-color: grey;height:665px;width: 150px;color: white;">
						<ul style="line-height: 40px;">
							<li>
								<img src="" />
								<h4>管理员登录</h4>
							</li>
							<li>
								<form action="QueryAllCarAll"><button id="but_but1" class="btn " type="submit"><a href="#">车辆管理</a></button></form>
							</li>
							<li>
								<form action="QueryAllDriverAdmin"><button id="but_but1" class="btn " type="submit"><a href="#">专车司机</a></button></form>
							</li>
							<li>
								<form action="QueryAllClientAdmin"><button id="but_but1" class="btn " type="submit"><a href="#">客户案例</a></button></form>
							</li>
							<li>
								<form action="QueryAllCont"><button id="but_but1" class="btn " type="submit"><a href="#">客户管理</a></button></form>
							</li>
						</ul>
					</div>
					<div class="col-md-8 column">
						<h2>车辆修改数据资源管理系统</h2>
					</div>
					<div class="col-md-8 column">
						<!-- <button type="button" class="btn btn-primary">添加</button> -->
					</div>
					<!-- 获取数据库的表格 -->
					<div style="width: 1535px;margin: 0px auto;background-color: white;height: 620px;">
						<div class="col-md-8 column">
							<form action="updateByIDCarAll.do" id="input_update">
								<!-- 获取表格的数据库的内容 -->
								<c:forEach var="carAlltList" items="${carAlltList }">
									<input type="text" name="id" value="${carAlltList.id }" style="display: none">
									 <p>
										<h3>车辆图片：</h3><img id="img_car" src="${carAlltList.img }" name="img" style="width:11%;" />
									</p> 
									<p>
										<h3>车辆名称：</h3><input type="text" name="carName" value="${carAlltList.carName }" />
									</p>
									<p>
										<h3>车辆类型：</h3><input type="text" name="type" value="${carAlltList.type }" />
									</p>
									<p>
										<h3>车辆费用：</h3><input type="text" name="price" value="${carAlltList.price }" />
									</p>
								</c:forEach>
								<p>
									<button type="rest" class="btn btn-success">取消修改</button>
						            <button type="submit" class="btn btn-info">确认修改</button>
								</p>
								<!-- 以上是获取表格的数据库的内容 -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>

	</body>
</html>
