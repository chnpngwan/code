<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
</head>
<body>
<jsp:include page="/pages/common/NAV.jsp"></jsp:include>
<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <div class="row row--grid">
            <!-- breadcrumb -->
            <div class="col-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb__item"><a href="index.jsp">主页</a></li>
                    <li class="breadcrumb__item breadcrumb__item--active">个人账户</li>
                </ul>
            </div>
            <!-- end breadcrumb -->
            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>个人账户</h1>
                </div>
            </div>
            <!-- end title -->
        </div>

        <div class="row row--grid">
            <div class="col-12">
                <div class="profile">
                    <div class="profile__user">
                        <div class="profile__avatar">
                            <img src="static/img/avatar.svg" alt="">
                        </div>
                        <div class="profile__meta">
                            <h3>${sessionScope.user.username}</h3>
                            <span>沃尔纳  ID: ${sessionScope.user.id}</span>
                        </div>
                    </div>

                    <!-- tabs nav -->
                    <ul class="nav nav-tabs profile__tabs" id="profile__tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1"
                               aria-selected="true">个人账户</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2"
                               aria-selected="false">订单</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3"
                               aria-selected="false">定价计划</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4"
                               aria-selected="false">设置</a>
                        </li>
                    </ul>
                    <!-- end tabs nav -->

                    <button class="profile__logout" type="button"
                            onclick="window.location.href='UserServlet?action=logout'">
                        <span>登出</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M4,12a1,1,0,0,0,1,1h7.59l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l4-4a1,1,0,0,0,.21-.33,1,1,0,0,0,0-.76,1,1,0,0,0-.21-.33l-4-4a1,1,0,1,0-1.42,1.42L12.59,11H5A1,1,0,0,0,4,12ZM17,2H7A3,3,0,0,0,4,5V8A1,1,0,0,0,6,8V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V19a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V16a1,1,0,0,0-2,0v3a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V5A3,3,0,0,0,17,2Z"/>
                        </svg>
                    </button>
                </div>
                <!-- content tabs -->
                <div class="tab-content">
                    <div class="tab-pane fade" id="tab-1" role="tabpanel">
                        <div class="row row--grid">
                            <div class="col-12 col-lg-6 col-xl-3">
                                <div class="stats">
                                    <span>我的余额 <a href="#modal-topup" class="open-modal">充值</a></span>
                                    <p><b>${sessionScope.user.balance}</b></p>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M6,11a1,1,0,1,0,1,1A1,1,0,0,0,6,11Zm12,0a1,1,0,1,0,1,1A1,1,0,0,0,18,11Zm2-6H4A3,3,0,0,0,1,8v8a3,3,0,0,0,3,3H20a3,3,0,0,0,3-3V8A3,3,0,0,0,20,5Zm1,11a1,1,0,0,1-1,1H4a1,1,0,0,1-1-1V8A1,1,0,0,1,4,7H20a1,1,0,0,1,1,1ZM12,9a3,3,0,1,0,3,3A3,3,0,0,0,12,9Zm0,4a1,1,0,1,1,1-1A1,1,0,0,1,12,13Z"/>
                                    </svg>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-3">
                                <div class="stats">
                                    <span>高级计划</span>
                                    <p><b>$39.99</b>/月</p>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z"/>
                                    </svg>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-3">
                                <div class="stats">
                                    <span>已听分钟数</span>
                                    <p><b>${sessionScope.user.listenedtime}</b></p>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M20,13.18V11A8,8,0,0,0,4,11v2.18A3,3,0,0,0,2,16v2a3,3,0,0,0,3,3H8a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1H6V11a6,6,0,0,1,12,0v2H16a1,1,0,0,0-1,1v6a1,1,0,0,0,1,1h3a3,3,0,0,0,3-3V16A3,3,0,0,0,20,13.18ZM7,15v4H5a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1Zm13,3a1,1,0,0,1-1,1H17V15h2a1,1,0,0,1,1,1Z"/>
                                    </svg>
                                </div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-3">
                                <div class="stats">
                                    <span>促销代码</span>
                                    <form action="#" class="stats__form">
                                        <input type="text" placeholder="__-__-__-__">
                                        <button type="button">发送</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="row row--grid">
                            <!-- dashbox -->
                            <div class="col-12 col-lg-6">
                                <div class="dashbox">
                                    <div class="dashbox__title">
                                        <h3>
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M19.05566,2h-14a3.00328,3.00328,0,0,0-3,3V19a3.00328,3.00328,0,0,0,3,3h14a3.00328,3.00328,0,0,0,3-3V5A3.00328,3.00328,0,0,0,19.05566,2Zm-14,2h14a1.001,1.001,0,0,1,1,1v8H17.59082a1.99687,1.99687,0,0,0-1.66406.89062L14.52051,16H9.59082L8.18457,13.89062A1.99687,1.99687,0,0,0,6.52051,13H4.05566V5A1.001,1.001,0,0,1,5.05566,4Zm14,16h-14a1.001,1.001,0,0,1-1-1V15H6.52051l1.40625,2.10938A1.99687,1.99687,0,0,0,9.59082,18h4.92969a1.99687,1.99687,0,0,0,1.66406-.89062L17.59082,15h2.46484v4A1.001,1.001,0,0,1,19.05566,20Z"/>
                                            </svg>
                                            通知<span>17</span></h3>
                                        <div class="dashbox__wrap">
                                            <a class="dashbox__refresh" href="#">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path d="M12,2A10,10,0,0,0,5.12,4.77V3a1,1,0,0,0-2,0V7.5a1,1,0,0,0,1,1H8.62a1,1,0,0,0,0-2H6.22A8,8,0,1,1,4,12a1,1,0,0,0-2,0A10,10,0,1,0,12,2Zm0,6a1,1,0,0,0-1,1v3a1,1,0,0,0,1,1h2a1,1,0,0,0,0-2H13V9A1,1,0,0,0,12,8Z"/>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="dashbox__list-wrap">
                                        <div class="dashbox__scroll">
                                            <div class="dashbox__note dashbox__note--succ">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                                </svg>
                                                <p><a href="#modal-info2" class="open-modal">付款#51</a> was
                                                    成功！</p>
                                                <span>1 小时前</span>
                                            </div>
                                            <div class="dashbox__note dashbox__note--fail">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path d="M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z"/>
                                                </svg>
                                                <p><a href="#modal-info3" class="open-modal">付款#50</a> 失败！</p>
                                                <span>2 小时前</span>
                                            </div>
                                            <div class="dashbox__note dashbox__note--info">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20Zm0-8.5a1,1,0,0,0-1,1v3a1,1,0,0,0,2,0v-3A1,1,0,0,0,12,11.5Zm0-4a1.25,1.25,0,1,0,1.25,1.25A1.25,1.25,0,0,0,12,7.5Z"/>
                                                </svg>
                                                <p>通知<a href="#modal-info4" class="open-modal">示例</a>。</p>
                                                <span>2 小时前</span>
                                            </div>
                                            <div class="dashbox__note dashbox__note--gift">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z"/>
                                                </svg>
                                                <p><a href="#modal-info5" class="open-modal">您收到了礼物！</a></p>
                                                <span>4 小时前</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- end dashbox -->

                            <!-- dashbox -->
                            <div class="col-12 col-lg-6">
                                <div class="dashbox">
                                    <div class="dashbox__title">
                                        <h3>
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z"/>
                                            </svg>
                                            喜欢的歌曲
                                        </h3>

                                        <div class="dashbox__wrap">
                                            <a class="dashbox__refresh" href="#">
                                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                    <path d="M12,2A10,10,0,0,0,5.12,4.77V3a1,1,0,0,0-2,0V7.5a1,1,0,0,0,1,1H8.62a1,1,0,0,0,0-2H6.22A8,8,0,1,1,4,12a1,1,0,0,0-2,0A10,10,0,1,0,12,2Zm0,6a1,1,0,0,0-1,1v3a1,1,0,0,0,1,1h2a1,1,0,0,0,0-2H13V9A1,1,0,0,0,12,8Z"/>
                                                </svg>
                                            </a>
                                            <a class="dashbox__more" href="javascript:void(0)">查看全部</a>
                                        </div>
                                    </div>

                                    <div class="dashbox__list-wrap">
                                        <ul class="main__list main__list--dashbox">
                                            <li class="single-item" style="display: none">
                                                <a data-link data-title="Got What I Got" data-artist="Jason Aldean"
                                                   data-img="static/img/covers/cover.svg"
                                                   href="https://dmitryvolkov.me/demo/blast2.0/audio/12071151_epic-cinematic-trailer_by_audiopizza_preview.mp3"
                                                   class="single-item__cover">
                                                    <img src="static/img/covers/cover.svg" alt="">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                        <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"/>
                                                    </svg>
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                        <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z"/>
                                                    </svg>
                                                </a>
                                                <div class="single-item__title">
                                                    <h4><a href="javascript:void (0)">得到了我得到的</a></h4>
                                                    <span><a href="javascript:void(0)">杰森·奥尔丁</a></span>
                                                </div>
                                                <a href="javascript:void (0)" class="single-item__add">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                        <path d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
                                                    </svg>
                                                </a>
                                                <a href="javascript:void (0)" class="single-item__export">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                        <path d="M21,14a1,1,0,0,0-1,1v4a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V15a1,1,0,0,0-2,0v4a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V15A1,1,0,0,0,21,14Zm-9.71,1.71a1,1,0,0,0,.33.21.94.94,0,0,0,.76,0,1,1,0,0,0,.33-.21l4-4a1,1,0,0,0-1.42-1.42L13,12.59V3a1,1,0,0,0-2,0v9.59l-2.29-2.3a1,1,0,1,0-1.42,1.42Z"/>
                                                    </svg>
                                                </a>
                                                <span class="single-item__time">4.15</span>
                                            </li>
                                        </ul>
                                        <script>
                                            var pageinfo;

                                            function myLovemusic(pageNo) {
                                                $.post("MyloveServlet", "action=searchMyLovepage&pageNo=" + pageNo, function (msg) {
                                                    pageinfo = msg;
                                                    for (let i = 0; i < msg.items.length; i++) {
                                                        let newdiv = $("ul.main__list li.single-item:first").clone(true);
                                                        newdiv.css("display", "");
                                                        newdiv.find("a:first").attr({
                                                            "data-title": msg.items[i].music.song_name,
                                                            "data-artist": msg.items[i].music.authorname,
                                                            "href": msg.items[i].music.srcpath
                                                        });
                                                        newdiv.find("a:first").css("background", "url(" + msg.items[i].music.facepath + ")center center/cover no-repeat");
                                                        newdiv.find("a:first img").attr("src", msg.items[i].music.facepath);
                                                        newdiv.find("div.single-item__title h4 a").html(msg.items[i].music.song_name);
                                                        newdiv.find("div.single-item__title span a").html(msg.items[i].music.authorname);
                                                        newdiv.find("div.single-item__title span a").attr("href", "ArtistServlet?action=toArtist&id=" + msg.items[i].music.author_id);
                                                        newdiv.find("a.single-item__add").attr("myloveid", msg.items[i].id)
                                                        if (msg.items[i].music.duration % 60 < 10) {
                                                            newdiv.find("span.single-item__time").html(parseInt(msg.items[i].music.duration / 60) + " : 0" + msg.items[i].music.duration % 60);
                                                        } else newdiv.find("span.single-item__time").html(parseInt(msg.items[i].music.duration / 60) + " : " + msg.items[i].music.duration % 60);
                                                        newdiv.appendTo($("ul.main__list"));
                                                    }
                                                }, "json")
                                            }

                                            $("a.single-item__add").click(function () {
                                                let li = $(this).parents("li");
                                                let id = $(this).attr("myloveid");
                                                $.post("MyloveServlet", "action=deleteMyloveById&id=" + id, function (msg) {
                                                    layer.msg("删除成功", {
                                                        icon: msg,
                                                        time: 200
                                                    })
                                                    li.remove();
                                                }, "json")
                                            })

                                            $(function () {
                                                var pageNo = 1;
                                                myLovemusic(pageNo);
                                                //滚动事件.加载新数据
                                                $("div.dashbox__list-wrap").scroll(function () {
                                                    if (this.scrollTop + this.clientHeight + 1 > this.scrollHeight) {
                                                        if (pageinfo.pageNo < pageinfo.pageTotal) {
                                                            pageNo = pageNo + 1;
                                                            myLovemusic(pageNo);
                                                        }
                                                    }
                                                })
                                            })

                                        </script>
                                    </div>
                                </div>
                            </div>
                            <!-- end dashbox -->
                        </div>
                    </div>

                    <div class="tab-pane fade show active" id="tab-2" role="tabpanel">
                        <div class="row row--grid">
                            <div class="col-12">
                                <div class="dashbox">
                                    <div class="dashbox__table-wrap">
                                        <div class="dashbox__table-scroll">
                                            <table class="main__table">
                                                <thead>
                                                <tr>
                                                    <th>订单编号</th>
                                                    <th><a href="javascript:void (0)" class="active">下单日期
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                            <path d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z"/>
                                                        </svg>
                                                    </a></th>
                                                    <th><a href="javascript:void (0)">数量
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                            <path d="M9.71,10.21,12,7.91l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Zm4.58,4.58L12,17.09l-2.29-2.3a1,1,0,0,0-1.42,1.42l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z"/>
                                                        </svg>
                                                    </a></th>
                                                    <th><a href="javascript:void (0)">总价
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                            <path d="M9.71,10.21,12,7.91l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Zm4.58,4.58L12,17.09l-2.29-2.3a1,1,0,0,0-1.42,1.42l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z"/>
                                                        </svg>
                                                    </a></th>
                                                    <th><a href="javascript:void (0)">状态
                                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                            <path d="M9.71,10.21,12,7.91l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42l-3-3a1,1,0,0,0-1.42,0l-3,3a1,1,0,0,0,1.42,1.42Zm4.58,4.58L12,17.09l-2.29-2.3a1,1,0,0,0-1.42,1.42l3,3a1,1,0,0,0,1.42,0l3-3a1,1,0,0,0-1.42-1.42Z"/>
                                                        </svg>
                                                    </a></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr style="display: none">
                                                    <td>
                                                        <div class="main__table-text main__table-text--number">
                                                            <a href="#modal-info" class="open-modal">631</a>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="main__table-text">Aug 21, 2021</div>
                                                    </td>
                                                    <td>
                                                        <div class="main__table-text">17</div>
                                                    </td>
                                                    <td>
                                                        <div class="main__table-text main__table-text--price">$67.83
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <script>
                                                function myorder(pageNo) {
                                                    $.post("OrderServlet", "action=toOrder&pageNo=" + pageNo, function (msg) {
                                                        for (let i = 0; i < msg.items.length; i++) {
                                                            let newdiv = $("tbody tr:first").clone(true);
                                                            newdiv.css("display", "");
                                                            newdiv.find("td:eq(0) div a").html(msg.items[i].order_id);
                                                            newdiv.find("td:eq(1) div").html(timestampToTime(msg.items[i].create_time));
                                                            newdiv.find("td:eq(2) div").html(msg.items[i].count);
                                                            newdiv.find("td:eq(3) div").html("$" + parseInt(msg.items[i].total_price).toFixed(2));
                                                            if (msg.items[i].status == '0') {
                                                                newdiv.find("td:eq(4)").append("<div class='main__table-text main__table-text--green'>" +
                                                                    "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'>" +
                                                                    "<path d='M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z'/>" +
                                                                    "</svg>交付 </div>");
                                                            } else if (msg.items[i].status == '1') {
                                                                newdiv.find("td:eq(4)").append("<div class='main__table-text main__table-text--red'><svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'>" +
                                                                    "<path d='M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z'/> " +
                                                                    "</svg>取消支付</div>");
                                                            } else {
                                                                newdiv.find("td:eq(4)").append("<div class='main__table-text main__table-text--grey'><svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'>" +
                                                                    "<path d='M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z'/>" +
                                                                    "</svg>在路上</div>");
                                                            }
                                                            newdiv.appendTo("tbody");
                                                        }
                                                    }, "json");
                                                }

                                                $(function () {
                                                    var pageNo = 1;
                                                    myorder(pageNo);
                                                })

                                                // 时间格式化
                                                function timestampToTime(timestamp) {
                                                    var date = new Date(timestamp);
                                                    var y = date.getFullYear();
                                                    var m = date.getMonth() + 1;
                                                    m = m < 10 ? ('0' + m) : m;
                                                    var d = date.getDate();
                                                    d = d < 10 ? ('0' + d) : d;
                                                    var h = date.getHours();
                                                    var minute = date.getMinutes();
                                                    minute = minute < 10 ? ('0' + minute) : minute;
                                                    var second = date.getSeconds();
                                                    second = second < 10 ? ('0' + second) : second;
                                                    Time = y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
                                                    return Time;
                                                }

                                                //取得的值 2021-07-19 11:11:55

                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-3" role="tabpanel">
                        <div class="row row--grid">
                            <div class="col-12 col-md-6 col-lg-4 order-md-2 order-lg-1">
                                <div class="plan plan--green">
                                    <h3 class="plan__title">豪华绿钻</h3>
                                    <span class="plan__price">$0<span>/月</span></span>
                                    <ul class="plan__list">
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            沃尔纳原创
                                        </li>
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            随时切换计划或取消
                                        </li>
                                        <li class="red">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
                                            </svg>
                                            直播 65+ 顶级直播
                                        </li>
                                        <li class="red">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
                                            </svg>
                                            音乐频道

                                        </li>
                                    </ul>
                                    <button class="plan__btn" type="button">选择计划</button>
                                </div>
                            </div>

                            <div class="col-12 col-lg-4 order-md-1 order-lg-2">
                                <div class="plan plan--red">
                                    <h3 class="plan__title">选择计划</h3>
                                    <span class="plan__price">$14.99<span>/月</span></span>
                                    <ul class="plan__list">
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            沃尔纳原创
                                        </li>
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            随时切换计划或取消
                                        </li>
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            直播 65+ 顶级直播
                                        </li>
                                        <li class="red">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M13.41,12l4.3-4.29a1,1,0,1,0-1.42-1.42L12,10.59,7.71,6.29A1,1,0,0,0,6.29,7.71L10.59,12l-4.3,4.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l4.29,4.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
                                            </svg>
                                            音乐频道
                                        </li>
                                    </ul>
                                    <button class="plan__btn" type="button">选择计划</button>
                                </div>
                            </div>

                            <div class="col-12 col-md-6 col-lg-4 order-md-3 order-lg-3">
                                <div class="plan plan--purple">
                                    <h3 class="plan__title">奖赏</h3>
                                    <span class="plan__price">$39.99<span>/月</span></span>
                                    <ul class="plan__list">
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            沃尔纳原创
                                        </li>
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            随时切换计划或取消
                                        </li>
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            直播 65+ 顶级直播
                                        </li>
                                        <li class="green">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.71,7.21a1,1,0,0,0-1.42,0L9.84,14.67,6.71,11.53A1,1,0,1,0,5.29,13l3.84,3.84a1,1,0,0,0,1.42,0l8.16-8.16A1,1,0,0,0,18.71,7.21Z"/>
                                            </svg>
                                            音乐频道
                                        </li>
                                    </ul>
                                    <button class="plan__btn" type="button">选择计划</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="tab-4" role="tabpanel">
                        <div class="row row--grid">
                            <!-- details form -->
                            <div class="col-12 col-lg-6">
                                <form action="UserServlet?action=updateUser" class="sign__form sign__form--profile">
                                    <div class="row">
                                        <div class="col-12">
                                            <h4 class="sign__title">个人资料详细信息</h4>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="username">登录</label>
                                                <input id="username" type="text" name="username" class="sign__input"
                                                       placeholder="${sessionScope.user.username}">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="email">邮箱</label>
                                                <input id="email" type="text" name="email" class="sign__input"
                                                       placeholder="${sessionScope.user.email}">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="firstname">姓</label>
                                                <input id="firstname" type="text" name="firstname" class="sign__input"
                                                       placeholder="${sessionScope.user.firstname}">
                                            </div>
                                        </div>

                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="lastname">名字</label>
                                                <input id="lastname" type="text" name="lastname" class="sign__input"
                                                       placeholder="${sessionScope.user.lastname}">
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <button class="sign__btn" id="btn1" type="submit">保存</button>
                                        </div>
                                        <span class="errorMsg1" style="display:inline-block;height: 30px;color: red;">
                                            <c:out value="${requestScope.msg}" default=" "></c:out>
                                        </span>
                                    </div>
                                </form>
                                <script>
                                    $(function () {
                                        // 给注册绑定单击事件
                                        $("#btn1").click(function () {
                                            // 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
                                            //1 获取用户名输入框里的内容
                                            var usernameText = $("#username").val();
                                            //2 创建正则表达式对象
                                            var usernamePatt = /^\w{5,12}$/;
                                            //3 使用test方法验证
                                            if (!usernamePatt.test(usernameText)) {
                                                //4 提示用户结果
                                                $("span.errorMsg1").text("用户名不合法！");
                                                return false;
                                            }
                                            // 邮箱验证：xxxxx@xxx.com
                                            //1 获取邮箱里的内容
                                            var emailText = $("#email").val();
                                            //2 创建正则表达式对象
                                            var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                                            //3 使用test方法验证是否合法
                                            if (!emailPatt.test(emailText)) {
                                                //4 提示用户
                                                $("span.errorMsg1").text("邮箱格式不合法！");
                                                return false;
                                            }
                                        })
                                    })
                                </script>
                            </div>
                            <!-- end details form -->

                            <!-- password form -->
                            <div class="col-12 col-lg-6">
                                <form action="UserServlet?action=updateUserpassword"
                                      class="sign__form sign__form--profile">
                                    <input type="hidden" name="email" value="${sessionScope.user.email}">
                                    <input type="hidden" name="id" value="${sessionScope.user.id}">
                                    <div class="row">
                                        <div class="col-12">
                                            <h4 class="sign__title">更改密码</h4>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="oldpass">旧密码</label>
                                                <input id="oldpass" type="password" name="oldpass" class="sign__input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="newpass">新密码</label>
                                                <input id="newpass" type="password" name="newpass" class="sign__input">
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="confirmpass">确认新密码</label>
                                                <input id="confirmpass" type="password" name="confirmpass"
                                                       class="sign__input">
                                            </div>
                                        </div>
                                        <!--<div class="col-12 col-md-6 col-lg-12 col-xl-6">
                                            <div class="sign__group">
                                                <label class="sign__label" for="select">Select</label>
                                                <select name="select" id="select" class="sign__select">
                                                    <option value="0">Option</option>
                                                    <option value="1">Option 2</option>
                                                    <option value="2">Option 3</option>
                                                    <option value="3">Option 4</option>
                                                </select>
                                            </div>
                                        </div>-->
                                        <div class="col-12">
                                            <button class="sign__btn" id="btn2" type="button">更改</button>
                                        </div>
                                        <span class="errorMsg2" style="display:inline-block;height: 30px;color: red;">
                                            <c:out value="${requestScope.msg}" default=" "></c:out>
                                        </span>
                                    </div>
                                </form>
                                <script>
                                    $(function () {
                                        // 给注册绑定单击事件
                                        $("#btn2").click(function () {
                                            // 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
                                            //1 获取用户名输入框里的内容
                                            var passwordText = $("#oldpass").val();
                                            //2 创建正则表达式对象
                                            var passwordPatt = /^\w{5,12}$/;
                                            //3 使用test方法验证
                                            if (!passwordPatt.test(passwordText)) {
                                                //4 提示用户结果
                                                $("span.errorMsg2").text("密码不合法！");
                                                return false;
                                            }
                                            // 验证确认密码：和密码相同
                                            //1 获取确认密码内容
                                            var confirmpass = $("#confirmpass").val();
                                            //2 和密码相比较
                                            if (confirmpass != passwordText) {
                                                //3 提示用户
                                                $("span.errorMsg2").text("确认密码和密码不一致！");
                                                return false;
                                            }
                                        })
                                    });
                                </script>
                            </div>
                            <!-- end password form -->
                        </div>
                    </div>
                </div>
                <!-- end content tabs -->
            </div>
        </div>
    </div>
</main>
<!-- end main content -->
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/modal_info.jsp" %>
</body>
</html>