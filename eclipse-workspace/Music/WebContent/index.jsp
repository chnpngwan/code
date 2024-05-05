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
</head>
<body>

  <header class="header">
    <div class="header-container" style="width: 100%">
      <div class="header-top">
        <a href="#" class="logo" ></a>
        <nav class="header-nav">
          <ul>
            <li><a href="index.do" class="header-nav__cur">音乐馆</a></li>
            <li><a href="MyCenter.do">我的音乐</a></li>
            <li><a href="https://dldir1.qq.com/music/clntupate/QQMusicSetup.exe">下载客户端</a></li>
            <li><a href="#">VIP</a></li>
          </ul>
        </nav>
        <div class="header-search">
          <input type="text" id="ssk" class="text" placeholder="搜索音乐、MV、歌单、用户">
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

  <!-- 新歌首发 -->
  <div class="main" id="newSong">
    <div class="main-inner">
      <div class="main-title" style="">
        <h2 class="title1" style="text-align: center;height: 40px;font-size: 25px;font-weight: bold;"><i>歌&nbsp;&nbsp;&nbsp;单&nbsp;&nbsp;&nbsp;推&nbsp;&nbsp;&nbsp;荐</i></h2>
        <span class="line line-left"></span>
        <span class="line line-right"></span>
      </div>
      <a href="#" class="readAll">全部<i class="icon-sprite"></i></a>
      <div class="main-tab tab-title" style="font-weight: bold;">
        <a href="javascript:;" class="item item-cur" style="color: #31C27C;">为你推荐</a>
        <a href="javascript:;" style="color: black;" class="item">华语</a>
        <a href="javascript:;" style="color: black;" class="item">欧美</a>
        <a href="javascript:;" style="color: black;" class="item">韩国</a>
        <a href="javascript:;" style="color: black;" class="item">日本</a>
      </div>
      <div class="main-slider tab-cont">
        <ul class="slider-wrapper">
        <c:forEach var="song" items="${songs }">
          <li style="">
            <a href="MusicBySongID.do?songid=${song.songId }" class="img">
              <img style="width: 300px;" src="${song.songImg }" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">${song.songTitle }</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：${song.songBfl }</a>
            </div>
          </li>
          </c:forEach>
          
        </ul>
        <div class="slider-btns">
          <span class="cur"><i></i></span>
          <span><i></i></span>
          <span><i></i></span>
        </div>
      </div>
    </div>
    <div class="main-operate">
      <a href="javascript:;" class="slider-prev"><i class="icon-sprite"></i></a>
      <a href="javascript:;" class="slider-next"><i class="icon-sprite"></i></a>
    </div>
  </div>

  <!-- 精彩推荐 -->
  <div class="main" id="recommend">
    <div class="main-inner">
      <div class="main-title">
        <h2 class="title"><i></i></h2>
        <span class="line line-left"></span>
        <span class="line line-right"></span>
      </div>
      <div class="carousel">
        <div class="carousel-slider">
          <a href="#" class="item item-pic1"><img src="https://y.qq.com/music/common/upload/MUSIC_FOCUS/4331304.jpg?max_age=2592000" alt="#"></a>
          <a href="#" class="item item-pic2"><img src="https://y.qq.com/music/common/upload/MUSIC_FOCUS/4339466.jpg?max_age=2592000" alt="#"></a>
          <a href="#" class="item item-pic3"><img src="https://y.qq.com/music/common/upload/MUSIC_FOCUS/4335433.jpg?max_age=2592000" alt="#"></a>
          <a href="#" class="item item-pic4"><img src="https://y.qq.com/music/common/upload/MUSIC_FOCUS/4339483.jpg?max_age=2592000" alt="#"></a>
          <a href="#" class="item item-pic5"><img src="https://y.qq.com/music/common/upload/MUSIC_FOCUS/4337758.jpg?max_age=2592000" alt="#"></a>
          <a href="#" class="item item-pic6"><img src="https://y.qq.com/music/common/upload/MUSIC_FOCUS/4333325.jpg?max_age=2592000" alt="#"></a>
        </div>
        <div class="slider-btns">
          <span class="cur"><i></i></span>
          <span><i></i></span>
          <span><i></i></span>
          <span><i></i></span>
          <span><i></i></span>
          <span><i></i></span>
        </div>
      </div>
    </div>
    <div class="main-operate">
      <a href="#" class="slider-prev"><i class="icon-sprite"></i></a>
      <a href="#" class="slider-next"><i class="icon-sprite"></i></a>
    </div>
  </div>

  <!-- 排行榜 -->
  <div class="main" id="rank">
    <div class="main-inner">
      <div class="main-title">
        <h2 class="title"><i></i></h2>
        <span class="line line-left"></span>
        <span class="line line-right"></span>
      </div>
      <a href="#" class="readAll">全部<i class="icon-sprite"></i></a>
      <ul class="rank-list">
        <li class="rank-list__item rank-list__1">
          <span class="rank-bg"></span>
          <span class="mask"></span>
          <i class="icon-play"></i>
          <div class="title">
            <i></i>
            <h3>流行指数</h3>
          </div>
          <i class="line"></i>
          <ul class="song-list">
            <li class="song-list__item">
              <a href="#"><span>1</span>默 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>2</span>月亮粑粑 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>3</span>Uptown Funk (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>4</span>你永远不知道 (Live)</a>
              <span>张杰</span>
            </li>
          </ul>
        </li>
        <li class="rank-list__item rank-list__2">
          <span class="rank-bg"></span>
          <span class="mask"></span>
          <i class="icon-play"></i>
          <div class="title">
            <i></i>
            <h3>热歌</h3>
          </div>
          <i class="line"></i>
          <ul class="song-list">
            <li class="song-list__item">
              <a href="#"><span>1</span>默 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>2</span>月亮粑粑 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>3</span>Uptown Funk (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>4</span>你永远不知道 (Live)</a>
              <span>张杰</span>
            </li>
          </ul>
        </li>
        <li class="rank-list__item rank-list__3">
          <span class="rank-bg"></span>
          <span class="mask"></span>
          <i class="icon-play"></i>
          <div class="title">
            <i></i>
            <h3>新歌</h3>
          </div>
          <i class="line"></i>
          <ul class="song-list">
            <li class="song-list__item">
              <a href="#"><span>1</span>默 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>2</span>月亮粑粑 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>3</span>Uptown Funk (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>4</span>你永远不知道 (Live)</a>
              <span>张杰</span>
            </li>
          </ul>
        </li>
        <li class="rank-list__item rank-list__4">
          <span class="rank-bg"></span>
          <span class="mask"></span>
          <i class="icon-play"></i>
          <div class="title">
            <i></i>
            <h3>欧美歌曲</h3>
          </div>
          <i class="line"></i>
          <ul class="song-list">
            <li class="song-list__item">
              <a href="#"><span>1</span>默 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>2</span>月亮粑粑 (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>3</span>Uptown Funk (Live)</a>
              <span>张杰</span>
            </li>
            <li class="song-list__item">
              <a href="#"><span>4</span>你永远不知道 (Live)</a>
              <span>张杰</span>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </div>

  <!-- 热门歌单 -->
  <div class="main" id="hotSong">
    <div class="main-inner">
      <div class="main-title">
        <h2 class="title"><i></i></h2>
        <span class="line line-left"></span>
        <span class="line line-right"></span>
      </div>
      <div class="main-slider">
        <ul class="slider-wrapper">
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img1.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <!-- <a href="#">那个静默的阳光午后</a> -->
                <a href="#">殿堂金钻认证：BIGBANG最热歌曲大合集</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img2.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img3.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img4.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img5.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img6.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img7.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img8.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img9.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img10.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img11.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
          <li>
            <a href="#" class="img">
              <img src="images/cont/slider_img12.jpg" alt="#">
              <span class="mask"></span>
              <i class="icon-play"></i>
            </a>
            <div class="info">
              <div class="title">
                <a href="#">那个静默的阳光午后</a>
                <i class="icon-sprite"></i>
              </div>
              <a href="#" class="author">播放量：179.7万</a>
            </div>
          </li>
        </ul>
        <div class="slider-btns">
          <span class="cur"><i></i></span>
          <span><i></i></span>
          <span><i></i></span>
        </div>
      </div>
    </div>
    <div class="main-operate">
      <a href="javascript:;" class="slider-prev"><i class="icon-sprite"></i></a>
      <a href="javascript:;" class="slider-next"><i class="icon-sprite"></i></a>
    </div>
  </div>


  <!-- MV -->
  <div class="main" id="mv">
    <div class="main-inner">
      <div class="main-title">
        <h2 class="title"><i></i></h2>
        <span class="line line-left"></span>
        <span class="line line-right"></span>
      </div>
      <a href="#" class="readAll">全部<i class="icon-sprite"></i></a>
      <div class="main-tab tab-title">
        <a href="javascript:;" class="item item-cur">全部</a>
        <a href="javascript:;" class="item">华语</a>
        <a href="javascript:;" class="item">欧美</a>
        <a href="javascript:;" class="item">港台</a>
        <a href="javascript:;" class="item">韩国</a>
        <a href="javascript:;" class="item">日本</a>
      </div>
      <ul class="mv-list tab-cont">
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img1.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img2.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img3.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img4.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img5.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img6.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img7.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
        <li class="item">
          <a href="#" class="img"><img src="images/cont/mv_img8.jpg" alt="#"><i class="icon-play"></i></a>
          <div class="info">
            <a href="#" class="title">Let Me Love You</a>
            <a href="#" class="author">刘惜君</a>
            <span class="play-total"><i class="icon-sprite"></i>18.8万</span>
          </div>
        </li>
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

  <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
  <script src="js/script.js"></script>
  <script type="text/javascript" src="js/index.js"></script>
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