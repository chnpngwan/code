<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
</head>
<body>
<jsp:include page="/pages/common/NAV.jsp"/>
<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <!-- slider -->
        <section class="row">
            <div class="col-12">
                <div class="hero owl-carousel" id="hero">
                    <div class="hero__slide" data-bg="static/img/home/slide1.jpg">
                        <h1 class="hero__title">唱片公司和网络电台</h1>
                        <p class="hero__text">Lorem
                            Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或随机的单词，看起来甚至不可信</p>
                        <div class="hero__btns">
                            <a href="javascript:void (0)" class="hero__btn hero__btn--green">立即购买</a>
                            <a href="javascript:void (0)" class="hero__btn">了解更多信息</a>
                        </div>
                    </div>

                    <div class="hero__slide" data-bg="static/img/home/slide2.jpg">
                        <h2 class="hero__title">金属乐队和滑结出现在“摇滚万岁”纪录片的预告片中</h2>
                        <p class="hero__text">它还具有对机器的愤怒，枪与玫瑰和其他一些</p>
                        <div class="hero__btns">
                            <a href="javascript:void (0)" class="hero__btn hero__btn--green">Learn more</a>
                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto"
                               class="hero__btn hero__btn--video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                观看视频</a>
                        </div>
                    </div>

                    <div class="hero__slide" data-bg="static/img/home/slide3.jpg">
                        <h2 class="hero__title">我们品牌的新艺术家</h2>
                        <p class="hero__text">Lorem
                            Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或随机的单词，看起来甚至不可信</p>
                        <div class="hero__btns">
                            <a href="javascript:void (0)" class="hero__btn">了解更多</a>
                        </div>
                    </div>
                </div>
                <button class="main__nav main__nav--hero main__nav--prev" data-nav="#hero" type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/>
                    </svg>
                </button>
                <button class="main__nav main__nav--hero main__nav--next" data-nav="#hero" type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                    </svg>
                </button>
            </div>
        </section>
        <!-- end slider -->
        <!-- 专辑 -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>新专辑</h2>
                    <a href="pages/releases.jsp" class="main__link">查看全部
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <!-- end title -->
            <div class="row row--grid" id="Album">
                <div class="col-6 col-sm-4 col-lg-2" style="display: none">
                    <div class="album" albumid="">
                        <div class="album__cover">
                            <img src="static/img/covers/cover2.jpg" alt="">
                            <a href="javascript:void(0)">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"/>
                                </svg>
                            </a>
                            <span class="album__stat">
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M3.71,16.29a1,1,0,0,0-.33-.21,1,1,0,0,0-.76,0,1,1,0,0,0-.33.21,1,1,0,0,0-.21.33,1,1,0,0,0,.21,1.09,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1,1,0,0,0,.21-1.09A1,1,0,0,0,3.71,16.29ZM7,8H21a1,1,0,0,0,0-2H7A1,1,0,0,0,7,8ZM3.71,11.29a1,1,0,0,0-1.09-.21,1.15,1.15,0,0,0-.33.21,1,1,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21.94.94,0,0,0,.76,0,1.15,1.15,0,0,0,.33-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1,1,0,0,0,3.71,11.29ZM21,11H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2ZM3.71,6.29a1,1,0,0,0-.33-.21,1,1,0,0,0-1.09.21,1.15,1.15,0,0,0-.21.33.94.94,0,0,0,0,.76,1.15,1.15,0,0,0,.21.33,1.15,1.15,0,0,0,.33.21,1,1,0,0,0,1.09-.21,1.15,1.15,0,0,0,.21-.33.94.94,0,0,0,0-.76A1.15,1.15,0,0,0,3.71,6.29ZM21,16H7a1,1,0,0,0,0,2H21a1,1,0,0,0,0-2Z"></path></svg>
                                        <span class="count"></span>
                                    </span>
                                    <span>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z"/></svg>
                                        <span class="hate"></span>
                                    </span>
                                </span>
                        </div>
                        <div class="album__title">
                            <h3><a href="javascript:void(0)"></a></h3>
                            <span authorid=""><a href="javascript:void(0)"></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- end releases -->
        <!-- 活动 -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>即将举行的活动</h2>
                    <a href="pages/events.jsp" class="main__link">查看全部
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <!-- end title -->
            <div class="col-12">
                <div class="main__carousel-wrap">
                    <div class="main__carousel main__carousel--events owl-carousel" id="events">
                        <c:forEach var="event" items="${requestScope.Events.items}">
                            <div class="event" data-bg="${event.bgimg}">
                                <c:choose>
                                    <c:when test="${event.state==1}">
                                        <a href="#modal-ticket" class="event__ticket open-modal">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z"/>
                                            </svg>
                                            购票</a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="event__out">脱销</span>
                                    </c:otherwise>
                                </c:choose>
                                <input type="hidden" name="datetime" value="${event.datetime}"/>
                                <span class="event__date">${event.date}</span>
                                <span class="event__time">${event.time}</span>
                                <h3 class="event__title"><a
                                        href="EventsServlet?action=toEvent&id=${event.id}">${event.events_name}</a></h3>
                                <p class="event__address">${event.address}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="main__nav main__nav--prev" data-nav="#events" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/>
                        </svg>
                    </button>
                    <button class="main__nav main__nav--next" data-nav="#events" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </section>
        <!-- end events -->
        <!-- 艺术家 -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>艺术家</h2>
                    <a href="pages/artists.jsp" class="main__link">查看全部
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12">
                <div class="main__carousel-wrap">
                    <div class="main__carousel main__carousel--artists owl-carousel" id="artists">
                        <c:forEach items="${requestScope.Artists.items}" var="artist">
                            <a href="ArtistServlet?action=toArtist&id=${artist.id}" class="artist">
                                <div class="artist__cover">
                                    <img src="${artist.photograph}" alt="">
                                </div>
                                <h3 class="artist__title">${artist.art_name}</h3>
                            </a>
                        </c:forEach>
                    </div>
                    <button class="main__nav main__nav--prev" data-nav="#artists" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/>
                        </svg>
                    </button>
                    <button class="main__nav main__nav--next" data-nav="#artists" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </section>
        <!-- end articts -->
        <!-- 热门单曲 -->
        <section class="row row--grid">
            <div class="col-12 col-md-6 col-xl-4">
                <div class="row row--grid">
                    <!-- title -->
                    <div class="col-12">
                        <div class="main__title">
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z"/>
                                </svg>
                                <a href="javascript:void (0)">热门单曲</a></h2>
                        </div>
                    </div>
                    <!-- end title -->

                    <div class="col-12">
                        <ul class="main__list">
                            <c:forEach var="hotmusic" items="${requestScope.hotmusic}">
                                <li class="single-item">
                                    <span class="single-item__number">${hotmusic.number}</span>
                                    <span class="single-item__rate">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                            d="M12.71,12.54a1,1,0,0,0-1.42,0l-3,3A1,1,0,0,0,9.71,17L12,14.66,14.29,17a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Zm-3-1.08L12,9.16l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Z"/></svg>
                                            ${hotmusic.hot %44}</span>
                                    <a data-link data-title="Cinematic" data-artist="${hotmusic.song_name}"
                                       data-img="${hotmusic.facepath}"
                                       href="${hotmusic.srcpath}" class="single-item__cover">
                                        <img src="${hotmusic.facepath}" alt="">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z"/>
                                        </svg>
                                    </a>
                                    <div class="single-item__title">
                                        <h4><a href="javascript:void (0)">${hotmusic.song_name}</a></h4>
                                        <span><a
                                                href="ArtistServlet?action=toArtist&id=${hotmusic.author_id}">${hotmusic.authorname}</a></span>
                                    </div>
                                    <span class="single-item__time">${Math.round(hotmusic.duration/60)} :
                                        <c:choose>
                                            <c:when test="${hotmusic.duration%60<10}"> 0${hotmusic.duration%60}</c:when>
                                            <c:otherwise>${hotmusic.duration%60}</c:otherwise>
                                        </c:choose></span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-12 col-md-6 col-xl-4">
                <div class="row row--grid">
                    <!-- title -->
                    <div class="col-12">
                        <div class="main__title">
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M19.12,2.21A1,1,0,0,0,18.26,2l-8,2A1,1,0,0,0,9.5,5V15.35A3.45,3.45,0,0,0,8,15a3.5,3.5,0,1,0,3.5,3.5V10.78L18.74,9l.07,0L19,8.85l.15-.1a.93.93,0,0,0,.13-.15.78.78,0,0,0,.1-.15.55.55,0,0,0,.06-.18.58.58,0,0,0,0-.19.24.24,0,0,0,0-.08V3A1,1,0,0,0,19.12,2.21ZM8,20a1.5,1.5,0,1,1,1.5-1.5A1.5,1.5,0,0,1,8,20ZM17.5,7.22l-6,1.5V5.78l6-1.5Z"/>
                                </svg>
                                <a href="javascript:void (0)">新单曲</a></h2>
                        </div>
                    </div>
                    <!-- end title -->

                    <div class="col-12">
                        <ul class="main__list">
                            <c:forEach var="newmusic" items="${requestScope.newmusic}">
                                <li class="single-item">
                                    <a data-link data-title="${newmusic.song_name}" data-artist="${newmusic.authorname}"
                                       data-img="static/img/covers/cover.svg"
                                       href="${newmusic.srcpath}"
                                       class="single-item__cover">
                                        <img src="${newmusic.facepath}" alt="">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z"/>
                                        </svg>
                                    </a>
                                    <div class="single-item__title">
                                        <h4><a href="javascript:void (0)">${newmusic.song_name}</a></h4>
                                        <span><a
                                                href="ArtistServlet?action=toArtist&id=${newmusic.author_id}">${newmusic.authorname}</a></span>
                                    </div>
                                    <span class="single-item__time">${Math.round(newmusic.duration/60)} :
                                        <c:choose>
                                            <c:when test="${newmusic.duration%60<10}"> 0${newmusic.duration%60}</c:when>
                                            <c:otherwise>${newmusic.duration%60}</c:otherwise>
                                        </c:choose></span>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-12 col-md-6 col-xl-4">
                <div class="row row--grid">
                    <!-- title -->
                    <div class="col-12">
                        <div class="main__title">
                            <h2>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M12,15a4,4,0,0,0,4-4V5A4,4,0,0,0,8,5v6A4,4,0,0,0,12,15ZM10,5a2,2,0,0,1,4,0v6a2,2,0,0,1-4,0Zm10,6a1,1,0,0,0-2,0A6,6,0,0,1,6,11a1,1,0,0,0-2,0,8,8,0,0,0,7,7.93V21H9a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2H13V18.93A8,8,0,0,0,20,11Z"/>
                                </svg>
                                <a href="javascript:void (0)">博客</a></h2>
                        </div>
                    </div>
                    <!-- end title -->

                    <div class="col-12">
                        <ul class="main__list">
                            <c:forEach var="live" items="${requestScope.lives.items}">
                                <li class="single-item">
                                    <a data-link data-title="${live.live_name}" data-artist="${live.author}"
                                       data-img="${live.live_faceimg}"
                                       href="https://dmitryvolkov.me/demo/blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
                                       class="single-item__cover">
                                        <img src="${live.live_faceimg}" alt="">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"/>
                                        </svg>
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z"/>
                                        </svg>
                                    </a>
                                    <div class="single-item__title">
                                        <h4><a href="javascript:void(0)">${live.live_name}</a></h4>
                                        <span><a
                                                href="ArtistServlet?action=toArtist&id=${live.art_id}">${live.author}</a></span>
                                    </div>
                                    <c:choose>
                                        <c:when test="${live.genre=='往期'}">
                                            <span class="single-item__time single-item__time--live">${live.genre}</span>
                                        </c:when>
                                        <c:when test="${live.genre=='流行'}">
                                            <span class="single-item__time single-item__time--live"
                                                  style="background-color: #e61e3a">${live.genre}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="single-item__time single-item__time--live"
                                                  style="background-color: #25a56a">${live.genre}</span>
                                        </c:otherwise>
                                    </c:choose>
                                        <%--<span class="single-item__time">59:01</span>&ndash;%&gt;--%>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <!-- end musics -->
        <!-- 播客 -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>播客</h2>
                    <a href="pages/podcasts.jsp" class="main__link">查看全部
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <!-- end title -->
            <div class="col-12">
                <div class="main__carousel-wrap">
                    <div class="main__carousel main__carousel--podcasts owl-carousel" id="podcasts">
                        <c:forEach var="live" items="${requestScope.Lives.items}">
                            <div class="live">
                                <a href="${live.live_srcpath}" class="live__cover open-video">
                                    <img src="${live.live_faceimg}" alt="">
                                    <c:choose>
                                        <c:when test="${live.genre=='往期'}">
                                            <span class="live__status">${live.genre}</span>
                                        </c:when>
                                        <c:when test="${live.genre=='流行'}">
                                            <span class="live__status"
                                                  style="background-color: #e61e3a">${live.genre}</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="live__status"
                                                  style="background-color: #25a56a">${live.genre}</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <span class="live__value">${live.live_phate} 观众</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
                                    </svg>
                                </a>
                                <h3 class="live__title">
                                    <a href="http://www.youtube.com/watch?v=0O2aH4XLbto"
                                       class="open-video">${live.live_name}</a>
                                </h3>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="main__nav main__nav--prev" data-nav="#podcasts" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/>
                        </svg>
                    </button>
                    <button class="main__nav main__nav--next" data-nav="#podcasts" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </section>
        <!-- end podcasts -->
        <!-- 商店 -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>产品</h2>
                    <a href="pages/store.jsp" class="main__link">查看全部
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12">
                <div class="main__carousel-wrap">
                    <div class="main__carousel main__carousel--store owl-carousel" id="store">
                        <c:forEach items="${requestScope.Produces.items}" var="product">
                            <div class="product">
                                <a href="ProduceServlet?action=toProduce&id=${product.id}" class="product__img">
                                    <img src="${product.imga}" alt="">
                                </a>
                                <h3 class="product__title"><a
                                        href="ProduceServlet?action=toProduce&id=${product.id}">${product.pname}</a>
                                </h3>
                                <span class="product__price">$${product.price}</span>
                                <c:choose>
                                    <c:when test="${!empty product.oldprice}">
                                        <span class="product__new"
                                              style="text-decoration: line-through">$${product.oldprice}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="product__new" style="color:#25a56a">新</span>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </div>
                    <button class="main__nav main__nav--prev" data-nav="#store" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17,11H9.41l3.3-3.29a1,1,0,1,0-1.42-1.42l-5,5a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l5,5a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L9.41,13H17a1,1,0,0,0,0-2Z"/>
                        </svg>
                    </button>
                    <button class="main__nav main__nav--next" data-nav="#store" type="button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </section>
        <!-- end store -->
        <!-- 新闻 -->
        <section class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>新闻</h2>
                    <a href="pages/news.jsp" class="main__link">查看全部
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M17.92,11.62a1,1,0,0,0-.21-.33l-5-5a1,1,0,0,0-1.42,1.42L14.59,11H7a1,1,0,0,0,0,2h7.59l-3.3,3.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l5-5a1,1,0,0,0,.21-.33A1,1,0,0,0,17.92,11.62Z"/>
                        </svg>
                    </a>
                </div>
            </div>
            <!-- end title -->

            <!-- video post -->
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="post">
                    <a href="pages/pag/article.jsp" class="post__img">
                        <img src="static/img/posts/1.jpg" alt="">
                    </a>
                    <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                        </svg>
                        观看后台
                    </a>
                    <div class="post__content">
                        <a href="#" class="post__category">Music</a>
                        <h3 class="post__title"><a href="pages/pag/article.jsp">Foo Fighters share new live version of
                            ‘No
                            Son Of
                            Mine’</a></h3>
                        <div class="post__meta">
                                <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 2 小时前</span>
                            <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M13,11H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2Zm4-4H7A1,1,0,0,0,7,9H17a1,1,0,0,0,0-2Zm2-5H5A3,3,0,0,0,2,5V15a3,3,0,0,0,3,3H16.59l3.7,3.71A1,1,0,0,0,21,22a.84.84,0,0,0,.38-.08A1,1,0,0,0,22,21V5A3,3,0,0,0,19,2Zm1,16.59-2.29-2.3A1,1,0,0,0,17,16H5a1,1,0,0,1-1-1V5A1,1,0,0,1,5,4H19a1,1,0,0,1,1,1Z"/></svg> 61</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end video post -->
            <!-- post -->
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="post">
                    <a href="pages/pag/article.jsp" class="post__img">
                        <img src="static/img/posts/2.jpg" alt="">
                    </a>

                    <div class="post__content">
                        <a href="#" class="post__category">Music</a>
                        <h3 class="post__title"><a href="pages/pag/article.jsp">Tom Grennan ‘breaks the internet’ as
                            fans
                            overload
                            servers during virtual gig</a></h3>
                        <div class="post__meta">
                                <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                        d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                            <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M13,11H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2Zm4-4H7A1,1,0,0,0,7,9H17a1,1,0,0,0,0-2Zm2-5H5A3,3,0,0,0,2,5V15a3,3,0,0,0,3,3H16.59l3.7,3.71A1,1,0,0,0,21,22a.84.84,0,0,0,.38-.08A1,1,0,0,0,22,21V5A3,3,0,0,0,19,2Zm1,16.59-2.29-2.3A1,1,0,0,0,17,16H5a1,1,0,0,1-1-1V5A1,1,0,0,1,5,4H19a1,1,0,0,1,1,1Z"/></svg> 18</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end post -->

            <!-- post -->
            <div class="col-12 col-sm-6 col-lg-4">
                <div class="post">
                    <a href="pages/pag/article.jsp" class="post__img">
                        <img src="static/img/posts/3.jpg" alt="">
                    </a>

                    <div class="post__content">
                        <a href="#" class="post__category">Features</a>
                        <h3 class="post__title"><a href="pages/pag/article.jsp">Why do the Golden Globes always get it
                            so
                            wrong?</a></h3>
                        <div class="post__meta">
                                <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                        d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 9 小时前</span>
                            <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M13,11H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2Zm4-4H7A1,1,0,0,0,7,9H17a1,1,0,0,0,0-2Zm2-5H5A3,3,0,0,0,2,5V15a3,3,0,0,0,3,3H16.59l3.7,3.71A1,1,0,0,0,21,22a.84.84,0,0,0,.38-.08A1,1,0,0,0,22,21V5A3,3,0,0,0,19,2Zm1,16.59-2.29-2.3A1,1,0,0,0,17,16H5a1,1,0,0,1-1-1V5A1,1,0,0,1,5,4H19a1,1,0,0,1,1,1Z"/></svg> 54</span>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end post -->
        </section>
        <!-- end news -->
        <%@ include file="common/partners.jsp" %>
    </div>
</main>
<!-- modal ticket -->
<form action="#" id="modal-ticket" class="zoom-anim-dialog mfp-hide modal modal--form">
    <button class="modal__close" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
            <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
        </svg>
    </button>

    <h4 class="sign__title">购买门票</h4>

    <div class="sign__group sign__group--row">
        <label class="sign__label">您的余额： </label>
        <span class="sign__value" balance="${sessionScope.user.balance}">$${sessionScope.user.balance}</span>
    </div>

    <div class="sign__group sign__group--row">
        <label class="sign__label" for="value">选择门票： </label>
        <select class="sign__select" name="value" id="value">
            <option value="50">常规 - $49</option>
            <option value="100">VIP - $99</option>
            <option value="200">SSVIP - $169</option>
        </select>

        <span class="sign__text sign__text--small">您可以从您的帐户中花钱更新连接的包裹，或在我们的网站上购买商品。</span>
    </div>

    <button class="sign__btn" type="button">购买</button>
</form>
<!-- end modal ticket -->
<!-- end main content -->
<%@ include file="common/modal_info.jsp" %>
<%@ include file="common/footer.jsp" %>
</body>
<script>
    function Album() {
        $.post("AlbumServlet", "action=searchAlbumPage", function (msg) {
            for (let i = 0; i < msg.items.length; i++) {
                let newdiv = $("#Album div:first").clone(true);//clone(true)事件一起复制
                newdiv.css("display", "").find(".album").attr("albumid", msg.items[i].id);
                newdiv.find("div.album__cover img").attr("src", msg.items[i].album_faceimg);
                newdiv.find("span.count").html(msg.items[i].count);
                newdiv.find("span.hate").html(msg.items[i].popularity);
                newdiv.find("div.album__title").find("a:first").html(msg.items[i].album_name);
                newdiv.find("div.album__title span").attr("authorid", msg.items[i].art_id);
                newdiv.find("div.album__title span a").html(msg.items[i].authorname);
                newdiv.appendTo($("#Album"));
            }
        }, "json")
    }

    $(function () {
        Album();
        $("div.album__title a:first").click(function () {
            var id = $(this).parents("div.album").attr("albumid");
            window.location.href = "AlbumServlet?action=toRelease&id=" + id;
        })
        $("div.album__cover a").click(function () {
            var id = $(this).parents("div.album").attr("albumid");
            window.location.href = "AlbumServlet?action=toRelease&id=" + id;
        })
        $("div.album__title span a").click(function () {
            var id = $(this).parent().attr("authorid");
            window.location.href = "AlbumServlet?action=toArtist&id=" + id;
        })

        $("a.open-modal").click(function () {
            if ($("#modal-ticket").find("span.sign__value").attr("balance") === '') {
                window.location.href = "http://localhost:8080/Musicproject/pages/pag/profile.jsp";
            }
        })
    });
</script>
</html>