<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>Demo</title>
		<link rel="icon" href="favicons/1.png">
<!-- 		<link rel="stylesheet" href="https://g.alicdn.com/thx/cube/1.3.2/cube.min.css"> -->
		<link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" type="text/css" href="css/sgs.css" />
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
		<link rel="stylesheet" type="text/css" href="css/aos.css"/>
		<script src="js/aos.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
		#musicList tr:nth-of-type(odd){
			background: #fff;
			transition-duration: 0.7s;
		}
		#musicList tr:nth-of-type(odd):hover{
			background: lightgreen;
			color: white;
		}
		#musicList tr:nth-of-type(even):hover{
			background: lightblue;
			color: white;
		}
		#musicList tr:nth-of-type(even){
		transition-duration: 0.7s;
			background: #eee;
		}
		#musicList{
			/* 边框合并 */
			border-collapse: collapse;
			/* 横向纵向间距 */
			border-spacing: 0;
			
		}
		#musicList  td,th{
		
 			border: 1px solid #ddd;
		    padding: 8px 10px;
		}
		</style>
	</head>

	<body>

		<header class="header">
			<div class="header-container" style="width: 100%">
				<div class="header-top">
					<a href="#" class="logo"></a>
					<nav class="header-nav">
						<ul>
							<li>
								<a href="index.do" class="header-nav__cur">音乐馆</a>
							</li>
							<li>
								<a href="MyCenter.do">我的音乐</a>
							</li>
							<li>
								<a href="https://dldir1.qq.com/music/clntupate/QQMusicSetup.exe">下载客户端</a>
							</li>
							<li>
								<a href="#">VIP</a>
							</li>
						</ul>
					</nav>
					<div class="header-search">
						
						<div class="btn" style="">
							<input type="text" id="ssk" class="text" style="margin-top: -8px;"  placeholder="搜索音乐、MV、歌单、用户">
							<i class="icon-sprite" style="position: relative;bottom: 15px;"></i>
						</div>
						<div class="result">
							<a href="#" class="result-item">
								<span class="rank">1</span>
								<span class="title">默</span>
								<span class="num">3.4万</span>
							</a>
							<a href="#" class="result-item">
								<span class="rank">2</span>
								<span class="title">侧田</span>
								<span class="num">3.4万</span>
							</a>
							<a href="#" class="result-item">
								<span class="rank">3</span>
								<span class="title">让我留在你身边</span>
								<span class="num">3.4万</span>
							</a>
							<a href="#" class="result-item">
								<span class="rank">4</span>
								<span class="title">皮皮虾我们走</span>
								<span class="num">3.4万</span>
							</a>
							<a href="#" class="result-item">
								<span class="rank">5</span>
								<span class="title">欢乐好声音</span>
								<span class="num">3.4万</span>
							</a>
							<div class="history">
								<span>搜索历史</span>
								<i class="icon-sprite"></i>
							</div>
						</div>
					</div>
					        <div class="header-login" style="margin-right: 150px;">
          <a href="MyCenter.do" class="login"><img style="width: 40px;border-radius: 50%;border: 3px solid grey;"  id="userHead"/></a>
          <a href="logout.do" style="position: relative;top: 10px;">
          	<svg t="1653724613407" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2196" width="25" height="25"><path d="M960.512 539.712l-144.768 144.832-48.256-48.256 60.224-60.288H512V512h325.76l-70.272-70.272 48.256-48.256 144.768 144.768-0.704 0.768 0.704 0.704zM704 192a64 64 0 0 0-64-64H192a64 64 0 0 0-64 64v640a64 64 0 0 0 64 64h448a64 64 0 0 0 64-64v-64h64v64a128 128 0 0 1-128 128H192a128 128 0 0 1-128-128V192a128 128 0 0 1 128-128h448a128 128 0 0 1 128 128v128h-64V192z" p-id="2197"></path></svg>
          </a> 
        </div>
				</div>
				<ul class="header-subNav">
					<li>
						<a href="index.do" class="subNav-cur">首页</a>
					</li>
					<li>
						<a href="#">歌手</a>
					</li>
					<li>
						<a href="#">专辑</a>
					</li>
					<li>
						<a href="#">排行榜</a>
					</li>
					<li>
						<a href="#">分类歌单</a>
					</li>
					<li>
						<a href="#">MV</a>
					</li>
				</ul>
			</div>
		</header>

<div style="background-color: #EDEDED;width: 100%;">
	
		<div  style="padding-top: 50px;" id="grid">
			<div class="cell-5" style="text-align: right;">
				
				<img data-aos="zoom-out-right" style="width: 250px;" src="${song.songImg }" />
			</div>
			<div class="cell-7" style="padding-left: 50px;" data-aos="zoom-out-left"  >
				<h2 style="font-size: 31px;">${song.songTitle }</h2>
				<p style="width: 400px;height:112px;padding-top: 20px;line-height: 23px;">
					简介 
					${song.songInfo }
				</p>
				<span style="position: relative;top: 25px;">
				<a href="MusicController.do?songId=${song.songId }">
					<button style="
						width: 122px;
						height: 38px;
						background-color: #31C27C;
						color: white;
						font-size: 14px;
						font-weight: bold;
						margin-top: 10px;
						float: left;
						display: flex;
						align-items: center;
						padding-left: 20px;
							">
						<svg t="1653723569909" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2173" width="23" height="23"><path d="M128 138.666667c0-47.232 33.322667-66.666667 74.176-43.562667l663.146667 374.954667c40.96 23.168 40.853333 60.8 0 83.882666L202.176 928.896C161.216 952.064 128 932.565333 128 885.333333v-746.666666z" fill="#ffffff" p-id="2174"></path></svg>
						播放全部
					</button></a>&nbsp;
<!--  				<button style="
						width: 122px;
						height: 38px;
						background-color: transparent;
						color: black;
						border: 1px solid grey;
						font-size: 14px;
						font-weight: bold;
						margin-top: 10px;
						">
						收藏
					</button>-->
					<button style="
						width: 122px;
						height: 38px;
						background-color: transparent;
						color: black;
						border: 1px solid grey;
						font-size: 14px;
						font-weight: bold;
						margin-top: 10px;
						">
						评论
					</button>
				</span>
			</div>
		</div>
		
		<div data-aos="zoom-out-up" style="margin-top: 50px;" id="grid">
			<div class="cell-3"></div>
			<div class="cell-6" style="padding-left: 60px;">
				<table id="musicList" border="0" width="100%" cellpadding="0" cellspacing="0" style="font-size: 18px;">
					 <tr  style="background-color:#42b983;color: white; height:45px; text-align: left;">
					 	<th width="20%" style="margin-left: 12px">序号</th>
					 	<th width="20%">歌曲</th>
					 	<th width="40%">歌手</th>
					 	<th width="20%">操作</th>
					 </tr>
					 <c:forEach var="music" items="${musics }" varStatus="index1">
					 <c:set var="isDone" value="0" scope="page"></c:set>
					 <tr  style="font-size: 14px;height: 45px;"  class="qd">
					 	<td style="font-size:20px;font-weight: bold;padding-left: 12px;color: #31c27c;">${music.index+1 }</td>
					 	<td >${music.musicName }
					 	<c:if test="${music.musicVideo ne null }">
					 		<a href="MV.do?musicId=${music.musicId }" style="float:left  ;text-align:center;width: 25px;height: 16px;font-size:1px;border: 1px solid #01e5ff;color: #01e5ff;">
					 		MV
					 		</a>
					 	</c:if>
					 	</td>
					 	<td >${music.musicPeople }</td>
					 	<td style="text-align: center;">
						
					 	<a href="MusicController.do?songId=${song.songId }&musicXH=${music.index }">
					 	
					 	<button style="
						width: 58px;
						height: 30px;
						background-color: #31C27C;
						color: white;
						font-size: 14px;
						font-weight: bold;
/* 						margin-top: 10px; */
						float: left;
						display: flex;
						align-items: center;
						">
						<svg t="1653723748723" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="3054" width="20" height="20"><path d="M732.502883 465.602819c-107.883492-82.3454-215.772403-164.681769-323.652282-247.014525-38.414608-29.327534-93.780555-1.929039-93.780555 46.396277v494.029051c0 48.325316 55.365948 75.725617 93.780555 46.398084 107.87988-82.332757 215.76879-164.669126 323.652282-247.014525 30.61356-23.357989 30.61356-69.436372 0-92.794362z" fill="#ffffff" p-id="3055"></path></svg>
						播放
					</button>
					</a>
					<span class="musicId" style="display: none;">${music.musicId }</span>
				<c:if test="${userMusics.size() eq 0 }">
					<button class="sc" style="
						width: 50px;
						height: 30px;
						border: 1px solid lightgray;
						background-color: transparent;
						color: black;
						font-size: 14px;
						font-weight: bold;
						">
						<svg t="1653723860462" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2171" width="30" height="30"><path d="M910.88 364.8l-1.28-10.08a236.96 236.96 0 0 0-6.24-28 201.44 201.44 0 0 0-42.56-80 46.08 46.08 0 0 0-3.84-4.48 212 212 0 0 0-160-71.68c-75.68 0-146.72 29.76-185.12 74.08-38.4-44.32-109.6-74.08-185.12-74.08a212 212 0 0 0-160 71.68 46.08 46.08 0 0 0-3.84 4.48 201.44 201.44 0 0 0-42.56 80 236.96 236.96 0 0 0-6.24 28l-1.28 10.08A186.4 186.4 0 0 0 112 385.92a205.28 205.28 0 0 0 1.12 21.28c16 194.08 368 423.2 382.88 432.96l16 10.4 16-10.4c15.04-9.6 367.04-238.72 382.88-432.96a205.28 205.28 0 0 0 1.12-21.28 186.4 186.4 0 0 0-1.12-21.12z" fill="lightgrey" p-id="2172"></path></svg>
					</button>
				</c:if>
					<c:forEach var="userMusic" items="${userMusics }" varStatus="index1">
									<c:if test="${userMusic.musicId eq music.musicId}">
										<button class="ysc" style="
												width: 50px;
												height: 30px;
												border: 0;
/* 												background-color: red; */
												color: white;
												font-size: 14px;
												border:0;
												font-weight: bold;
/* 												margin-top: 10px; */
												">
										<svg t="1653723860462" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2171" width="30" height="30"><path d="M910.88 364.8l-1.28-10.08a236.96 236.96 0 0 0-6.24-28 201.44 201.44 0 0 0-42.56-80 46.08 46.08 0 0 0-3.84-4.48 212 212 0 0 0-160-71.68c-75.68 0-146.72 29.76-185.12 74.08-38.4-44.32-109.6-74.08-185.12-74.08a212 212 0 0 0-160 71.68 46.08 46.08 0 0 0-3.84 4.48 201.44 201.44 0 0 0-42.56 80 236.96 236.96 0 0 0-6.24 28l-1.28 10.08A186.4 186.4 0 0 0 112 385.92a205.28 205.28 0 0 0 1.12 21.28c16 194.08 368 423.2 382.88 432.96l16 10.4 16-10.4c15.04-9.6 367.04-238.72 382.88-432.96a205.28 205.28 0 0 0 1.12-21.28 186.4 186.4 0 0 0-1.12-21.12z" fill="red" p-id="2172"></path></svg>
									</button>
									<c:set var="isDone" value="1" scope="page"></c:set>
									</c:if>
									<c:if test="${index1.last }">
										
										<c:if test="${isDone ne 1 }">
										<button class="sc" style="
												width: 50px;
												height: 30px;
												border: 1px solid white;
												background-color: transparent;
												color: black;
												border:0;
												font-size: 14px;
												font-weight: bold;
/* 												margin-top: 10px; */
												">
										<svg t="1653723860462" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2171" width="30" height="30"><path d="M910.88 364.8l-1.28-10.08a236.96 236.96 0 0 0-6.24-28 201.44 201.44 0 0 0-42.56-80 46.08 46.08 0 0 0-3.84-4.48 212 212 0 0 0-160-71.68c-75.68 0-146.72 29.76-185.12 74.08-38.4-44.32-109.6-74.08-185.12-74.08a212 212 0 0 0-160 71.68 46.08 46.08 0 0 0-3.84 4.48 201.44 201.44 0 0 0-42.56 80 236.96 236.96 0 0 0-6.24 28l-1.28 10.08A186.4 186.4 0 0 0 112 385.92a205.28 205.28 0 0 0 1.12 21.28c16 194.08 368 423.2 382.88 432.96l16 10.4 16-10.4c15.04-9.6 367.04-238.72 382.88-432.96a205.28 205.28 0 0 0 1.12-21.28 186.4 186.4 0 0 0-1.12-21.12z" fill="lightgrey" p-id="2172"></path></svg>
									</button>
										</c:if>
									</c:if>
								</c:forEach>
					
					 	</td>
					 	
					 </tr>
					 </c:forEach>
				</table>
			</div>
			<div class="cell-3"></div>
		</div>

<script type="text/javascript">
$(function () {
		var page=$("#page").val().trim()
		$(".pagination li").each(function () {
			$(this).removeClass("active")
			if($(this).children().html().trim()==page){
				$(this).addClass("active")
			}
		})
})
</script>
<%
String page1=request.getParameter("page");
if(page1==null){
	page1="1";
}
%>
	<input type="hidden" id="page" value="<%=page1%>">
	<div style="height: 100px;width: 100%;text-align: center;display: flex;align-items: center;">
		<ul class="pagination" style="margin: 0px auto;">
			<li><a href="MusicBySongID.do?songid=2&page=${pageInfo.pageNum-1 }">&laquo;</a></li>
			<li><a href="MusicBySongID.do?songid=2">1</a></li>
			<li><a href="MusicBySongID.do?songid=2&page=2">2</a></li>
			<li><a href="MusicBySongID.do?songid=2&page=3">3</a></li>
			<li><a href="MusicBySongID.do?songid=2&page=4">4</a></li>
			<li><a href="MusicBySongID.do?songid=2&page=5">5</a></li>
			<li><a href="MusicBySongID.do?songid=2&page=${pageInfo.pageNum+1 }">&raquo;</a></li>
		</ul>
	</div>
</div>

		
		<!-- footer -->
		<footer class="footer">
			<div class="footer-inner">
				<div class="footer-info">
					<div class="footer-info__download">
						<h3>下载KK音乐客户端</h3>
						<ul class="list">
							<li>
								<a href="#">
									<i class="footer-icon icon-pc"></i> PC版
								</a>
							</li>
							<li>
								<a href="#">
									<i class="footer-icon icon-mac"></i> Mac版
								</a>
							</li>
							<li>
								<a href="#">
									<i class="footer-icon icon-android"></i> Android版
								</a>
							</li>
							<li>
								<a href="#">
									<i class="footer-icon icon-iphone"></i> iPhone版
								</a>
							</li>
						</ul>
					</div>
					<div class="footer-info__product">
						<h3>特色产品</h3>
						<ul class="list">
							<li class="hasPic">
								<a href="#">
									<i class="footer-icon icon-kg"></i> 全民K歌
								</a>
							</li>
							<li class="hasPic">
								<a href="#">
									<i class="footer-icon icon-ss"></i> 全民K歌
								</a>
							</li>
							<li class="hasPic">
								<a href="#">
									<i class="footer-icon icon-qp"></i> 全民K歌
								</a>
							</li>
							<li>
								<a href="#">KK音乐原创音乐平台</a>
							</li>
							<li>
								<a href="#">上传视频</a>
							</li>
							<li>
								<a href="#">上传视频</a>
							</li>
							<li>
								<a href="#">上传视频</a>
							</li>
						</ul>
					</div>
					<div class="footer-info__link">
						<h3>特色产品</h3>
						<ul class="list">
							<li>
								<a href="#">CJ E&M</a>
							</li>
							<li>
								<a href="#">我们视频</a>
							</li>
							<li>
								<a href="#">手机KK空间</a>
							</li>
							<li>
								<a href="#">CJ E&M</a>
							</li>
							<li>
								<a href="#">我们视频</a>
							</li>
							<li>
								<a href="#">手机KK空间</a>
							</li>
							<li>
								<a href="#">CJ E&M</a>
							</li>
							<li>
								<a href="#">我们视频</a>
							</li>
							<li>
								<a href="#">手机KK空间</a>
							</li>
							<li>
								<a href="#">CJ E&M</a>
							</li>
							<li>
								<a href="#">我们视频</a>
							</li>
							<li>
								<a href="#">手机KK空间</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="footer-copyright">
					<p>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a><span>|</span>
						<a href="#">关于我们</a>
					</p>
					<p>Copyright © 1998 - 2017 kk. All Rights Reserved.</p>
					<p>我们公司 版权所有 我们网络文化经营许可证</p>
				</div>
			</div>
		</footer>

		<!-- 分享到 -->
		<ul class="slider-share">
			<li>
				<a href="#">
					<i class="icon-sprite icon-add"></i> 添加到
					<i class="icon-sprite icon-arrow"></i>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-sprite icon-share"></i> 分享
					<i class="icon-sprite icon-arrow"></i>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="icon-sprite icon-download"></i> 下载
				</a>
			</li>
		</ul>

		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="js/script.js"></script>
		<script type="text/javascript">
			$(function(){
				AOS.init();
				
				$(document).on("click",".icon-sprite",function(){
	  				var text=$("#ssk").val().trim()
	  				if(text==""){
	  					alert("请输入要搜索的歌曲或音乐人！")
	  				}
	  				window.location.href="ss.do?text="+text
	  			})
				$(document).on("click",".ysc",function(){
					var btn=$(this)
					var musicId=$(this).parent().children().eq(1).html()
					$.ajax({
						type: "POST",//请求方式（POST/GET）
						url: "delUM.do",//请求的Servlet的地址
						dataType: "json",
						data: { "musicId": musicId},
						beforeSend: function() {
				
						},
						success: function(result) {
							if(result[0].flag.trim()=="true"){
								btn.css({
									"background-color":"transparent",
									"boder":"1px solid black",
									"color":"black"
								})
								var b=$("<svg t='1653723860462' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='2171' width='30' height='30'><path d='M910.88 364.8l-1.28-10.08a236.96 236.96 0 0 0-6.24-28 201.44 201.44 0 0 0-42.56-80 46.08 46.08 0 0 0-3.84-4.48 212 212 0 0 0-160-71.68c-75.68 0-146.72 29.76-185.12 74.08-38.4-44.32-109.6-74.08-185.12-74.08a212 212 0 0 0-160 71.68 46.08 46.08 0 0 0-3.84 4.48 201.44 201.44 0 0 0-42.56 80 236.96 236.96 0 0 0-6.24 28l-1.28 10.08A186.4 186.4 0 0 0 112 385.92a205.28 205.28 0 0 0 1.12 21.28c16 194.08 368 423.2 382.88 432.96l16 10.4 16-10.4c15.04-9.6 367.04-238.72 382.88-432.96a205.28 205.28 0 0 0 1.12-21.28 186.4 186.4 0 0 0-1.12-21.12z' fill='lightgrey' p-id='2172'></path></svg>")
								btn.html(b)
								btn.removeClass("ysc")
								btn.addClass("sc")
							}
						}
				
					})
				})
				$(document).on("click",".sc",function(){
					var btn=$(this)
					var musicId=$(this).parent().children().eq(1).html()
					$.ajax({
						type: "POST",//请求方式（POST/GET）
						url: "addUM.do",//请求的Servlet的地址
						dataType: "json",
						data: { "musicId": musicId},
						beforeSend: function() {
				
						},
						success: function(result) {
							if(result[0].flag.trim()=="true"){
								btn.css({
									"boder":"0",
									"color":"white"
								})
								var b=$("<svg t='1653723860462' class='icon' viewBox='0 0 1024 1024' version='1.1' xmlns='http://www.w3.org/2000/svg' p-id='2171' width='30' height='30'><path d='M910.88 364.8l-1.28-10.08a236.96 236.96 0 0 0-6.24-28 201.44 201.44 0 0 0-42.56-80 46.08 46.08 0 0 0-3.84-4.48 212 212 0 0 0-160-71.68c-75.68 0-146.72 29.76-185.12 74.08-38.4-44.32-109.6-74.08-185.12-74.08a212 212 0 0 0-160 71.68 46.08 46.08 0 0 0-3.84 4.48 201.44 201.44 0 0 0-42.56 80 236.96 236.96 0 0 0-6.24 28l-1.28 10.08A186.4 186.4 0 0 0 112 385.92a205.28 205.28 0 0 0 1.12 21.28c16 194.08 368 423.2 382.88 432.96l16 10.4 16-10.4c15.04-9.6 367.04-238.72 382.88-432.96a205.28 205.28 0 0 0 1.12-21.28 186.4 186.4 0 0 0-1.12-21.12z' fill='red' p-id='2172'></path></svg>")
								btn.html(b)
								btn.removeClass("sc")
								btn.addClass("ysc")
							}
						}
				
					})
				})
			})
		</script>
	</body>

</html>