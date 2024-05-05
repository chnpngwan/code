<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Demo</title>
  <link rel="icon" href="favicons/1.png">

  <link rel="stylesheet" href="css/reset.css">
  <link rel="stylesheet" href="css/index.css">
  <link rel="stylesheet" type="text/css" href="css/sgs.css"/>
  <link rel="stylesheet" type="text/css" href="css/iconfont.css">
</head>
<style>
	#musicList{
 	border-collapse: collapse;
     border-spacing: 0; 
	}

	#musicList  td,th{
			
  			border: 1px solid #ddd; 
		    padding: 8px 10px;
		}
</style>
<body>

  <header class="header">
    <div class="header-container" style="width: 100%">
      <div class="header-top">
        <a href="#" class="logo"></a>
        <nav class="header-nav">
          <ul>
            <li><a href="index.do" >音乐馆</a></li>
            <li><a href="MyCenter.do" class="header-nav__cur">我的音乐</a></li>
            <li><a href="https://dldir1.qq.com/music/clntupate/QQMusicSetup.exe">下载客户端</a></li>
            <li><a href="#">VIP</a></li>
          </ul>
        </nav>
        <div class="header-search">
          <input type="text" class="text" id="ssk" placeholder="搜索音乐、MV、歌单、用户">
          <div class="btn"><i class="icon-sprite"></i></div>
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
        <li><a href="#" class="subNav-cur">首页</a></li>
        <li><a href="#">歌手</a></li>
        <li><a href="#">专辑</a></li>
        <li><a href="#">排行榜</a></li>
        <li><a href="#">分类歌单</a></li>
        <li><a href="#">MV</a></li>
      </ul>
    </div>
  </header>
<div id="grid">
		 <div class="cell-12" style="width: 100%;height: 380px;text-align:center; background-image: url(https://y.qq.com/ryqq/static/media/bg_profile.bd497b5a.jpg?max_age=2592000);">
		 		<img src="${user.userHeadimg }" width="110px" style="border-radius: 50%;border: 4px solid #FFFFFF;margin-top: 50px ;" />
		 		<div style="width: 100%;text-align: center;color: white;font-size: 30px;font-weight: bold;">${user.userNike }</div>
		 		<div id="grid" style="position: relative;top: 150px;">
		<div class="cell-12">
			<div style="width: 1200px;margin: 0px auto;">
				<style type="text/css">
					.nav{
						list-style: none;
						color: #31c27c;
						font-size: 18px;
					}
					.nav li{
						float: left;
						width: 150px;	
						text-align: left;
					}
				</style>
				<ul class="nav">
					<li>我的音乐</li>
					<li>个人中心</li>
				</ul>
			</div>
		</div>
		 </div>
		 
</div>
	</div>
	<div id="grid">
		<div style="width: 1200px;height: 88px;margin: 0px auto;display: flex;align-items: center;">
			<a href="MyMusicController.do">
			<button style="
				width: 123px;
				height: 28px;
				background-color: #31C27C;
				color: white;
				display: flex;
				align-items: center;
				padding-left: 18%;
				cursor: inherit;
					">
				<svg t="1653721713574" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4562" width="18" height="18"><path d="M224 938.713333a53.58 53.58 0 0 1-53.333333-53.433333V138.72a53.333333 53.333333 0 0 1 80.886666-45.666667l618.666667 373.28a53.333333 53.333333 0 0 1 0 91.333334l-618.666667 373.28a53.16 53.16 0 0 1-27.553333 7.766666z m0.046667-810.666666a10.98 10.98 0 0 0-5.333334 1.42 10.466667 10.466667 0 0 0-5.38 9.253333v746.56a10.666667 10.666667 0 0 0 16.18 9.133333l618.666667-373.28a10.666667 10.666667 0 0 0 0-18.266666l-618.666667-373.28a10.386667 10.386667 0 0 0-5.446666-1.586667z" fill="#ffffff" p-id="4563"></path></svg>
				播放全部
			</button>
			</a>
			&nbsp;&nbsp;&nbsp;
			<button style="
				width: 123px;
				height: 28px;
				background-color: transparent;
				color: black;
					border: 1px solid grey;
				">
				添加到
			</button>&nbsp;&nbsp;&nbsp;
			<button style="
				width: 123px;
				height: 28px;
				background-color: transparent;
				color: black;
				border: 1px solid grey;
				">
				批量操作
			</button>
		</div>
	</div>
	<style type="text/css">
		#musicList tr:nth-of-type(odd){
			background: #eee;
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
			background: #fff;
		}
		#musicList tr td{
			/* 边框合并 */
			border-collapse: collapse;
			/* 横向纵向间距 */
			border-spacing: 0;
		}
		#musicList{
		}
		@font-face {
		  font-family: 'iconfont';
		  src: url('iconfont.ttf?t=1653720220321') format('truetype');
		}
		.iconfont {
		  font-family: "iconfont" !important;
		  font-size: 16px;
		  font-style: normal;
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;
		}
		iconfont:hover {
			color: red;
		}
		</style>
	<div id="grid">
		<div  style="width: 1200px;margin: 0px auto;">
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
					 	<td class="xh" style="font-size:20px;font-weight: bold;padding-left: 12px;color: #31c27c;">${index1.index+1 }</td>
					 	<td >${music.musicName }
					 	<c:if test="${music.musicVideo ne null }">
					 		<a href="MV.do?musicId=${music.musicId }" style="float:left  ;text-align:center;width: 25px;height: 11px;font-size:1px;border: 1px solid #01e5ff;color: #01e5ff;">
					 		MV
					 		</a>
					 	</c:if>
					 	</td>
					 	<td >${music.musicPeople }</td>
					 	<td style="text-align: center;">
						
					 	<a href="MyMusicController.do?musicXH=${index1.index }">
					 	
					 	<button style="
						width: 70px;
						height: 30px;
						background-color: #31C27C;
						color: white;
						font-size: 14px;
						font-weight: bold;
						padding-left:5%;
/* 						margin-top: 10px; */
						float: left;
						display: flex;
						align-items: center;
						cursor: inherit;
						">
						<svg t="1653721713574" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="4562" width="18" height="18"><path d="M224 938.713333a53.58 53.58 0 0 1-53.333333-53.433333V138.72a53.333333 53.333333 0 0 1 80.886666-45.666667l618.666667 373.28a53.333333 53.333333 0 0 1 0 91.333334l-618.666667 373.28a53.16 53.16 0 0 1-27.553333 7.766666z m0.046667-810.666666a10.98 10.98 0 0 0-5.333334 1.42 10.466667 10.466667 0 0 0-5.38 9.253333v746.56a10.666667 10.666667 0 0 0 16.18 9.133333l618.666667-373.28a10.666667 10.666667 0 0 0 0-18.266666l-618.666667-373.28a10.386667 10.386667 0 0 0-5.446666-1.586667z" fill="#ffffff" p-id="4563"></path></svg>
						播放
					</button>
					</a>
					
					<a class="delSC">
						<button class="iconfont" style="
						width: 50px;
						height: 30px;
						color: black;
						font-size: 14px;
						font-weight: bold;
/* 						margin-top: 10px; */
						float: left;
						margin-left:10px;
						cursor: inherit;
						">
						<svg t="1653721578763" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2670" width="30" height="30"><path d="M607.897867 768.043004c-17.717453 0-31.994625-14.277171-31.994625-31.994625L575.903242 383.935495c0-17.717453 14.277171-31.994625 31.994625-31.994625s31.994625 14.277171 31.994625 31.994625l0 351.94087C639.892491 753.593818 625.61532 768.043004 607.897867 768.043004z" p-id="2671" fill="#bfbfbf"></path><path d="M415.930119 768.043004c-17.717453 0-31.994625-14.277171-31.994625-31.994625L383.935495 383.935495c0-17.717453 14.277171-31.994625 31.994625-31.994625 17.717453 0 31.994625 14.277171 31.994625 31.994625l0 351.94087C447.924744 753.593818 433.647573 768.043004 415.930119 768.043004z" p-id="2672" fill="#bfbfbf"></path><path d="M928.016126 223.962372l-159.973123 0L768.043004 159.973123c0-52.980346-42.659499-95.983874-95.295817-95.983874L351.94087 63.989249c-52.980346 0-95.983874 43.003528-95.983874 95.983874l0 63.989249-159.973123 0c-17.717453 0-31.994625 14.277171-31.994625 31.994625s14.277171 31.994625 31.994625 31.994625l832.032253 0c17.717453 0 31.994625-14.277171 31.994625-31.994625S945.73358 223.962372 928.016126 223.962372zM319.946246 159.973123c0-17.545439 14.449185-31.994625 31.994625-31.994625l320.806316 0c17.545439 0 31.306568 14.105157 31.306568 31.994625l0 63.989249L319.946246 223.962372 319.946246 159.973123 319.946246 159.973123z" p-id="2673" fill="#bfbfbf"></path><path d="M736.048379 960.010751 288.123635 960.010751c-52.980346 0-95.983874-43.003528-95.983874-95.983874L192.139761 383.591466c0-17.717453 14.277171-31.994625 31.994625-31.994625s31.994625 14.277171 31.994625 31.994625l0 480.435411c0 17.717453 14.449185 31.994625 31.994625 31.994625l448.096758 0c17.717453 0 31.994625-14.277171 31.994625-31.994625L768.215018 384.795565c0-17.717453 14.277171-31.994625 31.994625-31.994625s31.994625 14.277171 31.994625 31.994625l0 479.231312C832.032253 916.835209 789.028725 960.010751 736.048379 960.010751z" p-id="2674" fill="#bfbfbf"></path></svg>
					</button>
					
					</a>
					
					
					<span class="musicId" style="display: none;">${music.musicId }</span>
					</td>
					 	
					 </tr>
					 </c:forEach>
				</table>
		</div>
	</div>
	<div style="height: 100px;"></div>
  <!-- footer -->
  <footer class="footer">
    <div class="footer-inner">
      <div class="footer-info">
        <div class="footer-info__download">
          <h3>下载KK音乐客户端</h3>
          <ul class="list">
            <li><a href="#">
              <i class="footer-icon icon-pc"></i>
              PC版
            </a></li>
            <li><a href="#">
              <i class="footer-icon icon-mac"></i>
              Mac版
            </a></li>
            <li><a href="#">
              <i class="footer-icon icon-android"></i>
              Android版
            </a></li>
            <li><a href="#">
              <i class="footer-icon icon-iphone"></i>
              iPhone版
            </a></li>
          </ul>
        </div>
        <div class="footer-info__product">
          <h3>特色产品</h3>
          <ul class="list">
            <li class="hasPic"><a href="#">
              <i class="footer-icon icon-kg"></i>
              全民K歌
            </a></li>
            <li class="hasPic"><a href="#">
              <i class="footer-icon icon-ss"></i>
              全民K歌
            </a></li>
            <li class="hasPic"><a href="#">
              <i class="footer-icon icon-qp"></i>
              全民K歌
            </a></li>
            <li><a href="#">KK音乐原创音乐平台</a></li>
            <li><a href="#">上传视频</a></li>
            <li><a href="#">上传视频</a></li>
            <li><a href="#">上传视频</a></li>
          </ul>
        </div>
        <div class="footer-info__link">
          <h3>特色产品</h3>
          <ul class="list">
            <li><a href="#">CJ E&M</a></li>
            <li><a href="#">我们视频</a></li>
            <li><a href="#">手机KK空间</a></li>
            <li><a href="#">CJ E&M</a></li>
            <li><a href="#">我们视频</a></li>
            <li><a href="#">手机KK空间</a></li>
            <li><a href="#">CJ E&M</a></li>
            <li><a href="#">我们视频</a></li>
            <li><a href="#">手机KK空间</a></li>
            <li><a href="#">CJ E&M</a></li>
            <li><a href="#">我们视频</a></li>
            <li><a href="#">手机KK空间</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-copyright">
        <p><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a><span>|</span><a href="#">关于我们</a></p>
        <p>Copyright © 1998 - 2017 kk. All Rights Reserved.</p>
        <p>我们公司 版权所有 我们网络文化经营许可证</p>
      </div>
    </div>
  </footer>


  <!-- 分享到 -->
  <ul class="slider-share">
    <li><a href="#">
      <i class="icon-sprite icon-add"></i>
      添加到
      <i class="icon-sprite icon-arrow"></i>
    </a></li>
    <li><a href="#">
      <i class="icon-sprite icon-share"></i>
      分享
      <i class="icon-sprite icon-arrow"></i>
    </a></li>
    <li><a href="#">
      <i class="icon-sprite icon-download"></i>
      下载
    </a></li>
  </ul>

  <script src="js/jquery-3.6.0.min.js"></script>
  <script type="text/javascript" src="js/index.js"></script>
  <script src="https://a1.alicdn.com/oss/uploads/2018/12/26/a3f714d0-08e6-11e9-8a15-ebf944d7534c.js"></script>
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
  		
		$(document).on("click",".delSC",function(){
			if(confirm("确定要取消收藏吗？")){
				var musicId=$(this).parent().children().eq(2).html()
				var id=$(this).parent().parent().children().eq(0).html()
				var h=$(this).parent().parent()
				$.ajax({
						type: "POST",//请求方式（POST/GET）
						url: "delUM.do",//请求的Servlet的地址
						dataType: "json",
						data: { "musicId": musicId},
						beforeSend: function() {
				
						},
						success: function(result) {
							if(result[0].flag.trim()=="true"){
								h.remove()
								$(".xh").each(function () {
									if(parseInt($(this).html())-parseInt(id)>0){
										$(this).html(parseInt($(this).html())-1)
									}
								})
							}
						}
				
					})
			}
		})
		})
  </script>
</body>
</html>