<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>音乐播放器</title>
		<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="js/aos.js"></script>
		<link href="css/aos.css" rel="stylesheet" type="text/css">
		<style type="text/css">
			* {
				padding: 0;
				margin: 0
			}

			@font-face {
				font-family: 'iconfont';
				src: url('font/iconfont.eot');
				/* IE9*/
				src: url('font/iconfont.eot?#iefix') format('embedded-opentype'),
					/* IE6-IE8 */
					url('font/iconfont.woff') format('woff'),
					/* chrome、firefox */
					url('font/iconfont.ttf') format('truetype'),
					/* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
					url('font/iconfont.svg#iconfont') format('svg');
				/* iOS 4.1- */
			}

			.clear {}

			.clear::after {
				content: "";
				display: block;
				width: 100%;
				height: 0;
				clear: both;
			}

			.container {
				position: absolute;
				top: 40%;
				left: 26%;
				margin-left: -26%;
				margin-top: -300px;
				/*width: 1000px;*/
				/*height: 700px;*/
				width: 100%;
				height: 100%;
				/*border: 1px solid rgba(255,255,255,0.5);*/
				box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
				/*background: linear-gradient(top,#fb4b4b,#3f3ffb);*/
				/*background: -moz-linear-gradient(top,#fb4b4b,#3f3ffb);*/
				/*background: -webkit-linear-gradient(top,#fb4b4b,#3f3ffb);*/
				/*background: linear-gradient(top,#777979,#222425);
		background: -moz-linear-gradient(top,#777979,#222425);
		background: -webkit-linear-gradient(top,#777979,#222425);*/
				border-left-color: lightsteelblue;
				background: linear-gradient(to left, lightgrey, lightseagreen);
			}

			.music {
				width: 50%;
				height: 100%;
				border-right: 1px solid rgba(255, 255, 255, 0.5);
				box-sizing: border-box;
				float: left;
			}

			.photo {
				width: 100%;
			}

			.photo_pic {
				position: relative;
				width: 210px;
				height: 210px;
				margin: 75px auto 0;
				border-radius: 50%;
				background: url(img/img_no.jpg) no-repeat;
				background-size: 10px;
				box-shadow: 0 0 2px #666, 0 0 10px #666;
			}

			.choose {
				height: 150px;
			}

			.choose_obj {
				width: 50%;
				float: left;
				text-align: center;
				color: #fff
			}

			.icon {
				margin-top: 40px;
				height: 50px;
				font-size: 50px;
				line-height: 50px;
				font-family: "iconfont";
				cursor: pointer;
				text-shadow: 2px 2px 0px #666;
			}

			.icon.yellow+span {
				color: aquamarine;
			}

			.icon.pink+span {
				color: #f7759f;
			}

			.choose_obj span {
				display: block;
				height: 30px;
				line-height: 30px;
				font-family: "微软雅黑";
				font-size: 14px;
			}

			.cd {
				width: 10px;
				height: 10px;
				position: absolute;
				top: 50%;
				left: 50%;
				margin-top: -15px;
				margin-left: -15px;
				background: #666;
				border: 10px solid #fff;
				box-shadow: 0 0 1px #000;
				border-radius: 50%;
			}

			.progress {
				font-family: "iconfont";

			}

			.lyric {
				width: 50%;
				height: 100%;
				float: right;
			}

			time {
				font-size: 12px;
				width: 49px;
				text-align: center;
				color: #fff;
				height: 50px;
				line-height: 50px;
				float: left;
				/*margin-top: 165px;*/
				position: relative;
				top: -23px;
			}

			.progress_bar {
				margin: 0px auto;
				position: relative;
				width: 85%;
				height: 2px;
				/*margin-top: 190px;*/
				background-color: #fff;
				float: left;
				cursor: pointer;
			}

			.progress_cube {
				position: absolute;
				left: 0;
				top: -5px;
				width: 4px;
				height: 4px;
				background-color: #000;
				border: 5px solid #fff;
				border-radius: 50%;
				cursor: pointer;
			}

			.progress_obj {

				line-height: 30px;
				color: #ffffff;
				margin-top: 35px;
			}

			.ctrl_btn {
				text-align: center;
				width: 359px;
				float: left;
			}

			.ctrl_btn .btn {
				width: 33.3%;
				float: left;
				text-align: center;
				cursor: pointer;
			}

			.play_btn {
				font-size: 24px;
			}

			.ctrl_info {
				width: 300px;
				float: left;
			}

			.vol {
				padding-left: 50%;
				width: 100px;
				height: 100%;
				float: left;

			}

			.vol_bar {
				position: relative;
				width: 70px;
				float: right;
				height: 2px;
				background-color: #fff;
				margin-top: 13px;
			}

			.vol_cube {
				position: absolute;
				left: 0;
				top: -4px;
				width: 3px;
				height: 3px;
				background-color: #000;
				border: 4px solid #fff;
				border-radius: 50%;
				cursor: pointer;
			}

			.list {
				width: 20px;
				height: 100%;
				float: right;
				text-align: center;
			}

			.lyric_tit {
				font-size: 25px;
				height: 50px;
				line-height: 50px;
				color: #fff;
				text-align: center;
				font-weight: 700;
				margin-top: 30px;
				color: darkgrey;
				color: aquamarine;
			}

			.lyric_con {
				position: relative;
				line-height: 40px;
				color: #fff;
				font-size: 14px;
				padding: 0px 50px;
				text-align: center;
				height: 340px;
				overflow: hidden;
				/* margin-top: 20px;		 */
			}

			#lyric_txt {
				position: absolute;
				left: 0;
				top: 0;
				width: 100%;
				height: 100%;
			}

			.lyric_con p.played {
				color: aquamarine;
			}

			.lyric_con p.active {
				color: aquamarine;
				font-size: 20px;
				font-weight: 700;
			}

			.audio {
				display: none;
			}

			#list {
				position: relative;
				cursor: pointer;
			}

			#list_con {
				position: absolute;
				bottom: 130px;
				right: -180px;
				width: 150px;
				height: 100px;
				color: #666;
				padding: 10px 0;
				border-radius: 5px;
				background: rgba(255, 255, 255, .8);
				font-family: "微软雅黑";
				font-size: 14px;
				cursor: pointer;
				/*display: none;*/
			}

			p {
				color: darkgrey;
			}
			
		</style>
		<link rel="stylesheet" type="text/css" href="css/sgs.css" />
	</head>
	<body>
	<input type="hidden" value="${musicXH }" id="xh">
		<div class="container" id="container">
			<div class="music">
				<div style="padding-top: 50px;" id="grid">
					<div class="cell-5" style="text-align: right;">
						<img data-aos="zoom-out-right" style="width: 170px;"
							src="${user.userHeadimg }" />
					</div>
					<div class="cell-7" style="padding-left: 50px;" data-aos="zoom-out-left">
						<h2 style="font-size: 31px;color: white;">${user.userNike }</h2>
						<p style="width: 317px;padding-top: 20px;line-height: 23px;color: white;">
							
						</p>

					</div>
				</div>
				
				<div data-aos="zoom-out-up" style="width: 80%;margin: 0px auto;margin-top: 20px;height: 40%;overflow-y: scroll;">
					<table id="musicList" border="0" width="100%" cellpadding="0" cellspacing="10" style="font-size: 14px;">
						<tr bgcolor="transparent" style="color: dimgrey;text-align: left;">
							<th width="20%">序号</th>
							<th width="20%">歌曲</th>
							<th width="40%">歌手</th>
							<th width="20%">操作</th>
						</tr>
						<c:forEach var="music" varStatus="index1" items="${musics }">
						 <c:set var="isDone" value="0" scope="page"></c:set>
						<tr style="font-size: 14px;color: white;font-weight: bold;" class="qd">
							<td>${index1.index+1 }</td>
							<td>${music.musicName }</td>
							<td>${music.musicPeople }</td>
							<td >
							<span class="zzbf" style="display: none;">${index1.index }</span>
							<span class="musicId" style="display: none;">${music.musicId }</span>
<!-- 								<a href="#"> -->
									<button class="bf" style="
												width: 50px;
												height: 30px;
												background-color: #31C27C;
												color: white;
												font-size: 14px;
												font-weight: bold;
												margin-top: 10px;
												border: 1px solid white;
												">
										播放
									</button>
									<!-- </a> -->
									<c:if test="${userMusics.size() eq 0 }">
									<button class="sc" style="
												width: 50px;
												height: 30px;
												border: 1px solid white;
												background-color: transparent;
												color: white;
												font-size: 14px;
												font-weight: bold;
												margin-top: 10px;
												">
										收藏
									</button>
									</c:if>
									
									<c:forEach var="userMusic" items="${userMusics }" varStatus="index1">
									<c:if test="${userMusic.musicId eq music.musicId}">
										<button class="ysc" style="
												width: 50px;
												height: 30px;
												border: 0;
												background-color: red;
												color: white;
												font-size: 14px;
												font-weight: bold;
												margin-top: 10px;
												">
										已收藏
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
												color: white;
												font-size: 14px;
												font-weight: bold;
												margin-top: 10px;
												">
										收藏
									</button>
										</c:if>
									</c:if>
								</c:forEach>
							</td>

						</tr>
						</c:forEach>
					</table>
				</div>

				<div data-aos="zoom-out-left" class="progress">

					<div class="progress_obj clear">
						<time class="start">00:00</time>
						<div class="progress_bar" id="progress_bar" style="">
							<div class="progress_cube" id="progress_cube"></div>
						</div>
						<time class="">00:00</time>
					</div>
					<div class="progress_obj clear">
						<div class="ctrl_btn">
							<div id="prev_btn" class="prev_btn btn">&#xe60d;</div>
							<div id="play_btn" class="play_btn btn">&#xe60e;</div>
							<div id="next_btn" class="next_btn btn">&#xe60b;</div>
						</div>
						<div class="ctrl_info">
												<div class="vol">&#xe979;<div class="vol_bar" id="vol_bar"><div class="vol_cube" id="vol_cube"></div></div></div>
												<div class="list" id="list">&#xe908;<div id="list_con" style="width: 400px;background-color: lightblue;"><p>fffffffff</p><p>fffffffff</p><p>fffffffff</p></div></div>
											</div>
						<audio autoplay="autoplay" id="music"
							src="http://dl.stream.qqmusic.qq.com/C400002Ib0i73MVSxF.m4a?guid=8198267712&vkey=D35B74296A37CF56EF202C6CD3BE1D3576A8B9E21FD4A6FC85B33FA9096C6A5847ED3C9E904AAECD29BB7DA335BC521956EC2FD18FDA8836&uin=&fromtag=120002"></audio>
					</div>
				</div>
			</div>
			<div class="lyric">
			<div style="width: 95%;text-align: right;position: relative;top: 40px;">
				<a href="ss.do?text=${text }" style="color: white;text-decoration: none;">返回</a>
			</div>
				<div class="photo" data-aos="zoom-out-up">
					<div class="photo_pic" id="photo_pic">
<!-- 						<div class="cd"></div> -->
					</div>
					<div class="choose" style="display: none">
						<div class="choose_obj choose_like">
							<div class="icon" id="icon1">
								&#xe607;
							</div>
							<!--						<span>喜欢</span>-->
						</div>
						<div class="choose_obj choose_share">
							<div class="icon" id="icon2">
								&#xe675;
							</div>
							<!--						<span>收藏</span>-->
						</div>
					</div>
				</div>
				<div class="lyric_tit" id="lyric_tit"></div>
				<div data-aos="zoom-out-left" class="lyric_con" id="lyric_con">
					<div id="lyric_txt"></div>
				</div>
			</div>
		</div>
		
		<input type="hidden" id="text" value="${text }"> 
	</body>
</html>
<script type="text/javascript">
	//data
	var lyric = [


	]
	var starttime=00;
	var songIndex = 0;
	$(function() {
		AOS.init()
		var text=$("#text").val()
		$.ajax({
			type: "POST",//请求方式（POST/GET）
			url: "getMusicByText.do",//请求的Servlet的地址
			dataType: "json",
			data: { "text": text},
			beforeSend: function() {

			},
			success: function(result) {
				for(var i=0;i<result.length;i++){
					var newMusic={
							'name': result[i].musicName,
							'img': result[i].musicImg,
							'audio_src': result[i].musicSrc,
							'content': result[i].musicLyric
						}
					lyric.push(newMusic)
				}
			}

		})
		
		
	
	})
	window.onload = function() {
		var play_btn = document.getElementById("play_btn");
		var prev_btn = document.getElementById("prev_btn");
		var next_btn = document.getElementById("next_btn");
		var audio = document.getElementsByTagName("audio")[0];
		var initTime = document.getElementsByTagName("time")[0];
		var time = document.getElementsByTagName("time")[1];
		var progress_bar = document.getElementById("progress_bar");
		var progress_cube = document.getElementById("progress_cube");
		var vol_bar = document.getElementById("vol_bar");
		var vol_cube = document.getElementById("vol_cube");
		var lyric_con = document.getElementById("lyric_con");
		var lyric_txt = document.getElementById("lyric_txt");
		var photo_pic = document.getElementById("photo_pic");
		var icon1 = document.getElementById("icon1");
		var icon2 = document.getElementById("icon2");
		var lyric_tit = document.getElementById("lyric_tit");
		var list_con = document.getElementById("list_con");
		var list_item = list_con.getElementsByTagName("p");
		
		var xh=$("#xh").val();
		if(xh!=''){
			songIndex=xh
		}
		var container = document.getElementById("container");
		var obj;

		
		
		function config() {
			this.play_mark = true;
			this.duration = audio.duration;
			this.play_btn = "&#xe60e;";
			this.vol = audio.volume;
			this.timer = null;
			this.rotateSum = 0;
			this.icon1 = icon1.innerHTML;
			this.icon2 = icon2.innerHTML;
			this.icon1_co = icon1.style.color;
			this.endplay_btn = "&#xe60c;";
			this.endicon1 = icon1.innerHTML;
			this.endicon2 = "&#xe674;";
		}

		obj = new config();
		
		//列表控制

		var allSong = "";
		for (var song = 0; song < lyric.length; song++) {
			allSong += "<p>" + lyric[song].name + "</p>"
		}
		list_con.innerHTML = allSong;
		list_con.style.height = lyric.length * 60 + "px";
		for (var listIndex = 0; listIndex < list_item.length; listIndex++) {
			list_item[listIndex].index = listIndex;
			list_item[listIndex].onclick = function(ev) {
				var ev = ev || window.event;
				ev.stopPropagation();
				songIndex = this.index;
				change_music();
			}
		}
				list_con.style.display="none";
		list.onclick = function() {
			if (list_con.style.display == "none") {
				list_con.style.display = "block";
			} else {
				list_con.style.display = "none";
			}
		}
		//下一首
		next_btn.onclick = function() {
			
			songIndex++;
			change_music();
			if (obj.play_mark) {
				audio.play();
				obj.timer = setInterval(function() {
					obj.rotateSum = obj.rotateSum + 1;
					photo_pic.style.transform = "rotate(" + obj.rotateSum + "deg)";
				}, 30)
			} else {
				audio.pause();
			}
			obj.play_mark = !obj.play_mark;
		}
		prev_btn.onclick = function() {
			songIndex--;
			change_music();
			if (obj.play_mark) {
				audio.play();
				obj.timer = setInterval(function() {
					obj.rotateSum = obj.rotateSum + 1;
					photo_pic.style.transform = "rotate(" + obj.rotateSum + "deg)";
				}, 30)
			} else {
				audio.pause();
			}
			obj.play_mark = !obj.play_mark;
		}

		function change_music() {
			
			clearInterval(obj.timer);
			
			if (songIndex >= lyric.length) {
				songIndex = 0
			} else if (songIndex < 0) {
				songIndex = lyric.length
			}
			
			obj = new config();
			
			iconinit();
			playedTime();
			audioInit();
			
			$("#play_btn").html("&#xe60c;")
			lyric_ctrl();
			
		}
		//初始化总时长、音量等
		function audioInit() {

			time.innerHTML=format(audio.duration);
			
			audio.src = lyric[songIndex].audio_src;
			audio.volume = 0.5;
			play_btn.innerHTML = obj.play_btn;
			
			vol_cube.style.left = audio.volume * vol_bar.offsetWidth + "px";
			lyric_tit.innerText = lyric[songIndex].name;
			photo_pic.style.background = "url(" + lyric[songIndex].img + ")";
			photo_pic.style.backgroundSize = "210px";

			progress_cube.style.left = 0;
		}
		audioInit();
		
		play_btn.innerHTML = obj.play_btn;
		$("#play_btn").html("&#xe60c;")
		clearInterval(obj.timer);
			if (obj.play_mark) {
				this.innerHTML = obj.endplay_btn;
				audio.play();
				
				obj.timer = setInterval(function() {
					obj.rotateSum = obj.rotateSum + 1;
					photo_pic.style.transform = "rotate(" + obj.rotateSum + "deg)";
				}, 30)
			} else {
				this.innerHTML = obj.play_btn;
				audio.pause();
			}
			obj.play_mark = !obj.play_mark;
		//播放时间
		audio.addEventListener("timeupdate", function() {
			playedTime();
		})

		function playedTime() {
			time.innerHTML=format(audio.duration);
			if (audio.currentTime > audio.duration-2) {
				audio.currentTime=0;
				next_btn.onclick();
				play_btn.onclick();
			}
			var n = audio.currentTime / audio.duration;
			progress_cube.style.left = n * progress_bar.offsetWidth + "px";
			initTime.innerHTML = format(audio.currentTime);
			var id_num = parseInt(audio.currentTime);
			var lyric_p = document.getElementsByTagName("p");
			for (var i = 0; i < lyric_p.length; i++) {
				lyric_p[i].index = i;
			}
			if (document.getElementById("lyric" + id_num)) {
				var obj = document.getElementById("lyric" + id_num);
				for (var i = 0; i < obj.index; i++) {
					lyric_p[i].className = "played";
				}
				for (var j = obj.index; j < lyric_p.length; j++) {
					lyric_p[j].className = "";
				}
				obj.className = "aquamarine active";
				lyric_txt.style.top = lyric_con.offsetHeight / 2 - obj.offsetTop + "px";
			}
		}

		function format(time) {
			var time = parseInt(time);
			var m = parseInt(time / 60);
			var s = parseInt(time % 60);
			m = zero(m);
			s = zero(s);

			function zero(num) {
				if (num < 10) {
					num = "0" + num;
				}
				return num;
			}
			return m + ":" + s;
		}
		//拖拽进度条
		progress_cube.onmousedown = function(ev) {
			var ev = ev || window.event;
			var initX = ev.clientX - this.offsetLeft;
			this.onmousemove = function(ev) {
				var ev = ev || window.event;
				var x = ev.clientX - initX;
				if (x < 0) {
					x = 0
				}
				if (x > progress_bar.offsetWidth - 14) {
					x = progress_bar.offsetWidth - 14
				}
				play_ctrl(x);
			}
			document.onmouseup = function() {
				document.onmousemove = null;
				progress_cube.onmousemove = null;
			}
		}

		function play_ctrl(x) {
			var timego = x / progress_bar.offsetWidth * audio.duration;
			progress_cube.style.left = x + "px";
			audio.currentTime = timego;
			playedTime();
		}
		//点击进度条位置
		progress_bar.onclick = function(ev) {
			var ev = ev || window.event;
			var dis = ev.clientX - (container.offsetLeft + progress_bar.offsetLeft) - 7;
			progress_cube.style.left = dis + "px";
			play_ctrl(dis);
		} /**/
		//拖动音量键
		vol_cube.onmousedown = function(ev) {
			var ev = ev || window.event;
			var initX = ev.clientX - vol_cube.offsetLeft;
			this.onmousemove = function(ev) {
				var ev = ev || window.event;
				var x = ev.clientX - initX;
				if (x < 0) {
					x = 0
				}
				if (x > vol_bar.offsetWidth - 11) {
					x = vol_bar.offsetWidth - 11
				}
				var volresult = x / vol_bar.offsetWidth;
				this.style.left = x + "px";
				audio.volume = volresult;
			}
			document.onmouseup = function() {
				document.onmousemove = null;
				vol_cube.onmousemove = null;
			}
		}
		//点击播放
		play_btn.onclick = function() {
			clearInterval(obj.timer);
			if (obj.play_mark) {
				this.innerHTML = obj.endplay_btn;
				audio.play();
				obj.timer = setInterval(function() {
					obj.rotateSum = obj.rotateSum + 1;
					photo_pic.style.transform = "rotate(" + obj.rotateSum + "deg)";
				}, 30)
			} else {
				this.innerHTML = obj.play_btn;
				audio.pause();
			}
			obj.play_mark = !obj.play_mark;
		}
		//歌词处理
		function lyric_ctrl() {
			var lyricObj = lyric[songIndex].content;
			var temp = lyricObj.split("[");
			var html = "";
			for (var i = 0; i < temp.length; i++) {
				var arr = temp[i].split("]");
				var text = (arr[1]);
				var time = arr[0].split(",");
				var temp2 = time[0].split(".");
				var ms = temp2[1]; //毫秒
				var temp3 = temp2[0].split(":");
				var s = temp3[1]; //秒
				var m = temp3[0]; //分
				var s_sum = parseInt(m * 60) + parseInt(s);
				if (text) {
					html += "<p id='lyric" + s_sum + "'>" + text + "</p>";
				}
			}
			lyric_txt.innerHTML = html;
		}
		lyric_ctrl();

		function iconinit() {
			icon1.className = "icon";
			icon1.innerHTML = obj.icon1;
			icon1.style.color = "#fff";
			icon2.className = "icon";
			icon2.style.color = "#fff";
		}
		//喜欢 收藏
		icon2.onclick = function() {
			if (this.innerHTML == obj.icon2) {
				this.innerHTML = obj.endicon2;
				this.style.color = "aquamarine";
				this.className = "icon yellow";
			} else {
				this.innerHTML = obj.icon2;
				this.style.color = "#fff";
				this.className = "icon";
			}
		}
		icon1.onclick = function() {
			if (this.style.color == obj.icon1_co) {
				this.innerHTML = obj.endicon1;
				this.style.color = "#f7759f";
				this.className = "icon pink";
			} else {
				this.innerHTML = obj.icon1;
				this.style.color = obj.icon1_co;
				this.className = "icon";
			}
		}
		$(document).on("click",".bf",function(){
			var xh=$(this).parent().children().eq(0).html()
			songIndex = xh
			change_music();
			clearInterval(obj.timer);
			if (obj.play_mark) {
				audio.play();
				obj.timer = setInterval(function() {
					obj.rotateSum = obj.rotateSum + 1;
					photo_pic.style.transform = "rotate(" + obj.rotateSum + "deg)";
				}, 30)
			} else {
				audio.pause();
			}
			obj.play_mark = !obj.play_mark;
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
							"boder":"1px solid white"
						})
						btn.html("收藏")
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
							"background-color":"red",
							"boder":"0"
						})
						btn.html("已收藏")
						btn.removeClass("sc")
						btn.addClass("ysc")
					}
				}
		
			})
		})
		setInterval("zzbf()","100")
// 		setInterval("zdbfxys()","1000")
	}
	function zdbfxys() {
		var start1=$(".start").html()
		if(starttime<start1){
			starttime=start1
		}else{
			songIndex++;
			change_music();
		}
		
	}
	
	function zzbf() {
		$(".zzbf").each(function () {
			var xh=$(this).html()
			if(xh==songIndex){
				$(this).parent().parent().css("color","aquamarine")
				
			}else{
				$(this).parent().parent().css("color","white")
			}
		})
	}
</script>
