<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
</head>
<body>
<jsp:include page="/pages/common/NAV.jsp"/>
<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <div class="row row--grid">
            <!-- breadcrumb -->
            <div class="col-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb__item"><a href="index.jsp">主页</a></li>
                    <li class="breadcrumb__item breadcrumb__item--active">播放</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>歌单</h1>
                </div>
            </div>
            <!-- end title -->
        </div>
        <!-- releases -->
        <div class="row row--grid">
            <div class="col-12">
                <div class="main__filter">
                    <div class="main__filter-search">
                        <input type="text" name="albumOrartname" placeholder="按专辑名或歌手名搜索">
                        <button class="searchalbumOrartname">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path>
                            </svg>
                        </button>
                    </div>

                    <div class="main__filter-wrap">
                        <select class="main__select" name="years">
                            <option value="0">所有流派</option>
                            <option value="1">另类</option>
                            <option value="2">蓝调</option>
                            <option value="3">古典</option>
                            <option value="4">国家</option>
                            <option value="5">电子的</option>
                            <option value="6">嘻哈/说唱/Rap</option>
                            <option value="7">独立</option>
                            <option value="8">爵士乐</option>
                            <option value="9">拉丁美洲</option>
                            <option value="10">节奏蓝调/灵魂乐</option>
                            <option value="11">岩石</option>
                            <option value="15">传统艺术家</option>
                            <option value="16">活跃的艺术家</option>
                        </select>
                    </div>
                </div>
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
                <button class="main__load" type="button">加载更多</button>
            </div>
            <!-- end releases -->
            <script>
                var pageinfo;
                var albumOrartname = '';
                var genreid = 0;
                var pageNo = 1;

                function myAlbumPage(pageNo, albumOrartname, genreid) {
                    return new Promise((resolve, reject) => {
                        const albumContainer = $("#Album div:first");
                        $.post("AlbumServlet", {
                            action: "searchAlbumPage",
                            pageNo: pageNo,
                            albumOrartname: albumOrartname,
                            genre_id: genreid
                        }, function (msg) {
                            pageinfo=msg;
                            for (let i = 0; i < msg.items.length; i++) {
                                const newDiv = albumContainer.clone(true);
                                newDiv.attr("ddd", "delete");
                                newDiv.css("display", "");
                                newDiv.find(".album").attr("albumid", msg.items[i].id);
                                newDiv.find("div.album__cover img").attr("src", msg.items[i].album_faceimg);
                                newDiv.find("span.count").html(msg.items[i].count);
                                newDiv.find("span.hate").html(msg.items[i].popularity);
                                newDiv.find("div.album__title").find("a:first").html(msg.items[i].album_name);
                                newDiv.find("div.album__title span").attr("authorid", msg.items[i].art_id);
                                newDiv.find("div.album__title span a").html(msg.items[i].authorname);
                                newDiv.appendTo($("#Album"));
                            }
                            resolve();
                        }, "json").fail(function () {
                            reject();
                        }).catch(error => {
                            console.error("Error occurred:", error);
                            reject();
                        });
                    });
                }

                $(function () {
                    myAlbumPage(pageNo, albumOrartname, genreid);
                    $("button.main__load").click(function () {
                        if (pageNo < pageinfo.pageTotal) {
                            pageNo += 1;
                            myAlbumPage(pageNo, albumOrartname, genreid);
                            if (pageNo === pageinfo.pageTotal) {
                                $("button.main__load").hide();
                            }
                        }
                    })
                    $("button.searchalbumOrartname").click(function () {
                        pageNo = 1;
                        albumOrartname = $("input[name=albumOrartname]").val();
                        genreid = $("select[name=years]").val();
                        $("#Album").children("div[ddd=delete]").remove();

                        function ajaxRequest(callback) {
                            // 异步请求方法
                            myAlbumPage(pageNo, albumOrartname, genreid).then(function () {
                                // 请求完成后执行回调函数
                                callback();
                            });
                        }
                        ajaxRequest(function () {
                            // 后续代码
                            if (pageNo < pageinfo.pageTotal) {
                                $("button.main__load").show();
                            } else {
                                $("button.main__load").hide();
                            }
                        });
                    })

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
                })
            </script>
            <section class="row row--grid">
                <div class="col-12 col-xl-8">
                    <div class="row row--grid">
                        <!-- title -->
                        <div class="col-12">
                            <div class="main__title">
                                <h2><a href="pages/events.jsp">即将举行的活动</a></h2>
                            </div>
                        </div>
                        <!-- end title -->
                        <div class="col-12 col-md-6">
                            <div class="event" data-bg="static/img/events/event1.jpg">
                                <a href="#modal-ticket" class="event__ticket open-modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z"/>
                                    </svg>
                                    Buy ticket</a>
                                <span class="event__date">March 14, 2021</span>
                                <span class="event__time">8:00 pm</span>
                                <h3 class="event__title"><a href="pages/event.jsp">Sorry Babushka</a></h3>
                                <p class="event__address">1 East Plumb Branch St.Saint Petersburg, FL 33702</p>
                            </div>
                        </div>

                        <div class="col-12 col-md-6">
                            <div class="event" data-bg="static/img/events/event2.jpg">
                                <a href="#modal-ticket" class="event__ticket open-modal">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                        <path d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z"/>
                                    </svg>
                                    Buy ticket</a>
                                <span class="event__date">March 16, 2021</span>
                                <span class="event__time">7:00 pm</span>
                                <h3 class="event__title"><a href="pages/pag/event.jsp">Big Daddy</a></h3>
                                <p class="event__address">71 Pilgrim Avenue Chevy Chase, MD 20815</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-xl-4">
                    <div class="row row--grid">
                        <!-- title -->
                        <div class="col-12">
                            <div class="main__title">
                                <h2><a href="javascript:void (0)">新歌曲</a></h2>
                            </div>
                        </div>
                        <!-- end title -->
                        <div class="col-12">
                            <ul class="main__list">
                                <c:forEach items="${requestScope.musicNews}" var="music">
                                    <li class="single-item">
                                        <a data-link data-title="${music.song_name}" data-artist="${music.authorname}"
                                           data-img="static/img/covers/cover.svg"
                                           href="${music.srcpath}"
                                           class="single-item__cover">
                                            <img src="${music.facepath}" alt="">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"/>
                                            </svg>
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M16,2a3,3,0,0,0-3,3V19a3,3,0,0,0,6,0V5A3,3,0,0,0,16,2Zm1,17a1,1,0,0,1-2,0V5a1,1,0,0,1,2,0ZM8,2A3,3,0,0,0,5,5V19a3,3,0,0,0,6,0V5A3,3,0,0,0,8,2ZM9,19a1,1,0,0,1-2,0V5A1,1,0,0,1,9,5Z"/>
                                            </svg>
                                        </a>
                                        <div class="single-item__title">
                                            <h4><a href="javascript:void (0)">${music.song_name}</a></h4>
                                            <span><a
                                                    href="ArtistServlet?action=toArtist&id=${music.author_id}">${music.authorname}</a></span>
                                        </div>
                                        <span class="single-item__time">${Math.round(music.duration/60)} : <c:choose><c:when
                                                test="${music.duration%60<10}">0${music.duration%60}</c:when><c:otherwise>${music.duration%60}</c:otherwise></c:choose></span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main>
<!-- end main content -->

<%@ include file="common/footer.jsp" %>
<%@ include file="common/modal_info.jsp" %>

</body>
</html>