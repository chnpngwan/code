<%@page import="entity.Main"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>班级回忆录</title>
		 <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link type="text/css" rel="stylesheet" href="style/index.css">
		<script type="text/javascript" src="js/jquery-3.6.1.js"></script>
	</head>
	<body>
	<% 
	List<Main> list =(List<Main>) request.getAttribute("list");
	pageContext.setAttribute("list", list);
	%>
		<div class="header">
		        <a href="index.html" class="logo">
		            <h1>班级回忆录</h1>
		        </a>
		        <nav class="navbar">
		            <ul>
		                <li><a href="">首页</a></li>
		                <li><a href="#">班级成员</a>
		                </li>
		                <li><a href="#">获得荣誉</a>
		                </li>
		                <li><a href="#">特色经历</a></li>
		                <li><a href="denglu.jsp">登录</a>
						</li>
		            </ul>
		        </nav>
		    </div>
		    <div class="content">
		        <h1></h1>
		    </div>
		<div id="max">
		        <div class="re">
		            <ul>
		                <li><img src="image/1677043080654.jpeg" alt=""></li>
		                <li><img src="image/1677043083931.jpeg" alt=""></li>
		                <li><img src="image/1677043170773.jpeg" alt=""></li>
		                <li><img src="image/1677043180193.jpeg" alt=""></li>
		                <li><img src="image/1677043080654.jpeg" alt=""></li>
		            </ul>
		            <ol>
		                <li></li>
		                <li></li>
		                <li></li>
		                <li></li>   <li></li>
		            </ol>
		        </div>
		    </div>
			<script src="js/new_file.js"></script>
	</body>
</html>