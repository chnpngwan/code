<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>Demo</title>
		<link rel="icon" href="favicons/1.png">
		<link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" type="text/css" href="css/sgs.css" />
		<link rel="stylesheet" type="text/css" href="css/aos.css"/>
		<script src="js/aos.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-3.6.0.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
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
						<a href="index.do">首页</a>
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
						<a class="subNav-cur" href="#">MV</a>
					</li>
				</ul>
			</div>
		</header>

		<div style="width: 100%;">
			<div style="width: 100%;height: 675px;text-align: center;">
				<video src="${music.musicVideo }" autoplay="autoplay" style="height: 675px;" controls="controls"></video>
			</div>
			<div style="height: 78px;width: 1200px;display: flex;align-items: center;margin:0px auto;color: black;font-size: 22px;font-weight: bold;">
				${music.musicPeople } - ${music.musicName }
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
		<script src="js/script.js"></script>
		<script type="text/javascript">
  	$(function () {
		$(document).on("click",".icon-sprite",function(){
			var text=$("#ssk").val().trim()
			if(text==""){
				alert("请输入要搜索的歌曲或音乐人！")
			}
			window.location.href="ss.do?text="+text
		})
	})
  </script>
	</body>

</html>