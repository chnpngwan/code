<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="entity.About"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>班级回忆录</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<link rel="stylesheet" href="style/index.css">
			<script type="text/javascript" src="js/jquery-3.6.1.js"></script>
			<link rel="stylesheet"
			 type="text/css" 
			 href="style/about.css"/>
	</head>
		<body>
	<% 
	List<About> list =(List<About>) request.getAttribute("list");
	pageContext.setAttribute("list", list);
	%>
			<div class="header">
			        <a href="index.html" class="logo">
			            <h1>班级回忆录</h1>
			        </a>
			        <nav class="navbar">
			            <ul>
			                <li><a href="index2.jsp">首页</a></li>
			                <li><a href="#">简介</a></li>
			                <li><a href="first.jsp">班级成员</a>
			                </li>
			                <li><a href="honour.jsp">获得荣誉</a>
			                </li>
			                <li><a href="experience.jsp">特色经历</a></li>
							    <li><a href="index.jsp">退出登录</a></li>
							</li>
			            </ul>
			        </nav>
							</div>
							    <div class="content">
							       
							    </div>
							<div id="max">
							        <div class="re">	   
				<div class="box03">
							 <div class="bx1">
							 <img src="image/817107611AD3AA9CC5956A8C6D83F66A.jpg"/>
							 <div class="right">
							 <h1>有缘使我们相聚</h1>
							 <p>2021年9月一群朝气蓬勃怀揣梦想与喜悦<br /></p>
							<p>来自五湖四海的40位青年来到了云南农业职业技术学院<br /></p> 
							<p>组建了我们计算机网络技术二班这个大家庭<br /></p>
							<p>从此充实快乐的生活开始了<br /></p>
							 </div>
							 </div>
							 <div class="bx2">
							 </div>
							 <div class="bx1">
							 <div class="right marl60">
							 <h1>我们在一起</h1>
							 <p>这是一个团结奋进温暖和谐的集体<br /></p>
                             <p>在辅导员及各位班干的带领下<br /></p>
							 <p>刻苦努力取得了很大的成绩<br /></p>
							 <p>我们一步步走来我们成长成了<br /></p>
							 <p>一个互帮互助互奋发向上的集体<br /></p>
							</div>
							<img class="mar0" src="image/1677043080654.jpeg"/>
							 </div>
						 
						 </div>
				<script src="js/new_file.js"></script>
	</body>
</html>