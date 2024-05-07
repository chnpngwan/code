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
                    <li class="breadcrumb__item breadcrumb__item--active">播客</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>播客</h1>
                </div>
            </div>
            <!-- end title -->
        </div>

        <div class="row row--grid">
            <div class="col-12">
                <div class="main__filter">
                    <div class="main__filter-search">
                        <input type="text" name="livename" placeholder="搜索...">
                        <button class="searchLivename">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"/>
                            </svg>
                        </button>
                    </div>

                    <div class="main__filter-wrap">
                        <select class="main__select" name="genres">
                            <option value="0">所有</option>
                            <option value="12">往期</option>
                            <option value="13">流行</option>
                            <option value="14">最新</option>
                        </select>
                    </div>
                    <div class="slider-radio">
                        <input type="radio" name="grade" value="12" id="live" checked="checked"><label
                            for="live">往期</label>
                        <input type="radio" name="grade" value="13" id="popular"><label for="popular">流行</label>
                        <input type="radio" name="grade" value="14" id="newest"><label for="newest">最新</label>
                    </div>
                </div>
                <div class="row row--grid" id="Livesflex">
                    <div class="col-12 col-sm-6 col-lg-4" style="display: none">
                        <div class="live">
                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="live__cover open-video">
                                <img src="static/img/live/1.jpg" alt="">
                                <span class="live__status">live</span>
                                <span class="live__value">6.5K 观众</span>
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M18.54,9,8.88,3.46a3.42,3.42,0,0,0-5.13,3V17.58A3.42,3.42,0,0,0,7.17,21a3.43,3.43,0,0,0,1.71-.46L18.54,15a3.42,3.42,0,0,0,0-5.92Zm-1,4.19L7.88,18.81a1.44,1.44,0,0,1-1.42,0,1.42,1.42,0,0,1-.71-1.23V6.42a1.42,1.42,0,0,1,.71-1.23A1.51,1.51,0,0,1,7.17,5a1.54,1.54,0,0,1,.71.19l9.66,5.58a1.42,1.42,0,0,1,0,2.46Z"></path>
                                </svg>
                            </a>
                            <h3 class="live__title">
                                <a href="http://www.youtube.com/watch?v=0O2aH4XLbto"
                                   class="open-video">Beautiful Stories From Anonymous People</a>
                            </h3>
                        </div>
                    </div>
                </div>
                <script>
                    var pageinfo;
                    var pageNo = 1;
                    var livename = '';
                    var genreid = 0;

                    function myproducepage(pageNo, livename, genreid) {
                        return new Promise(function (resolve, reject) {
                            $.post("PodcastsServlet", {
                                action: "searchLivePage",
                                pageNo: pageNo,
                                livename: livename,
                                genre_id: genreid
                            }, function (msg) {
                                pageinfo = msg;
                                for (let i = 0; i < msg.items.length; i++) {
                                    let newdiv = $("#Livesflex div:first").clone(true);//clone(true)事件一起复制
                                    newdiv.css("display", "");
                                    newdiv.attr("ddd", "delete");//给这些克隆出来的元素添加一个属性,方便后面删除他们
                                    newdiv.find("img").attr("src", msg.items[i].live_faceimg);
                                    newdiv.find("span.live__status").html(msg.items[i].genre);
                                    if (msg.items[i].genre === "最新") {
                                        newdiv.find("span.live__status").css("background", "#25a56a");
                                    }
                                    if (msg.items[i].genre === "流行") {
                                        newdiv.find("span.live__status").css("background", "#e61e3a");
                                    }
                                    newdiv.find("span.live__value").html(msg.items[i].live_phate + " 观众");
                                    newdiv.find("h3.live__title a.open-video").html(msg.items[i].live_name);
                                    newdiv.find("div.album__title a.open-video").attr("href", msg.items[i].live_srcpath);
                                    newdiv.find("div.live a.live__cover").attr("href", msg.items[i].live_srcpath);
                                    newdiv.appendTo($("#Livesflex"));
                                }
                                resolve(); // 当请求成功时，调用 resolve 函数
                            }, "json").fail(function () {
                                reject(); // 当请求失败时，调用 reject 函数
                            }).catch(error => {
                                console.error("Error occurred:", error);
                                reject();
                            });
                        })
                    }

                    $(function () {
                        myproducepage(pageNo, livename, genreid);
                        $("button.searchLivename").click(function () {
                            pageNo = 1;
                            livename = $("input[name=livename]").val();
                            genreid = $("select[name=genres]").val();
                            $("div[ddd=delete]").remove();

                            function ajaxRequest(callback) {
                                // 异步请求方法
                                myproducepage(pageNo, livename, genreid).then(function () {
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
                        });
                        $("div.slider-radio input").change(function () {
                            pageNo = 1;
                            livename = $("input[name=livename]").val();
                            genreid = $('input[name="grade"]:checked').val();
                            $("div[ddd=delete]").remove();

                            function ajaxRequest(callback) {
                                // 异步请求方法
                                myproducepage(pageNo, livename, genreid).then(function () {
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
                        });
                        $("button.main__load").click(function () {
                            if (pageNo < pageinfo.pageTotal) {
                                pageNo += 1;
                                myproducepage(pageNo, livename, genreid);
                                if (pageNo === pageinfo.pageTotal) {
                                    $("button.main__load").hide();
                                }
                            }
                        })
                    })
                </script>
                <div class="row row--grid">
                    <div class="col-12">
                        <button class="main__load" type="button">加载更多</button>
                    </div>
                </div>
            </div>
        </div>

        <section class="row row--grid">
            <div class="col-12 col-xl-8">
                <div class="row row--grid" id="Eventslive">
                    <!-- title -->
                    <div class="col-12">
                        <div class="main__title">
                            <h2><a href="pages/events.jsp">即将举行的活动</a></h2>
                        </div>
                    </div>
                    <!-- end title -->
                    <div class="col-12 col-md-6" style="display: none">
                        <div class="event" data-bg="static/img/events/event1.jpg">
                            <a href="#modal-ticket" class="event__ticket open-modal">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z"></path>
                                </svg>
                                购票</a>
                            <span class="event__date">4月, 2021</span>
                            <span class="event__time">8:00 pm</span>
                            <h3 class="event__title"><a href="javascript:void (0)">巴布什卡</a></h3>
                            <p class="event__address">1东铅垂分支圣彼得堡，FL 33702</p>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function myEventsPage() {
                    $.post("EventsServlet", {
                        action: "searchEventsPage",
                        pageNo: 1,
                        genres_val: "upcoming"
                    }, function (msg) {
                        pageinfo = msg;
                        for (let i = 0; i < 2; i++) {
                            let newdiv = $("#Eventslive div:eq(2)").clone(true);//clone(true)事件一起复制
                            newdiv.css("display", "");
                            // newdiv.find("div.event").attr("data-bg", msg.items[i].bgimg);
                            newdiv.find("div.event").css("background", "url(" + msg.items[i].bgimg + ")center center/cover no-repeat");
                            if (msg.items[i].state === 0) {
                                newdiv.find("a.event__ticket").remove();
                                $("<span class='event__out'>脱销</span>").insertBefore(newdiv.find("span.event__date"));
                            }
                            newdiv.find("span.event__date").html(timestampToTime(msg.items[i].datetime).substring(0, 10));
                            newdiv.find("span.event__time").html(timestampToTime(msg.items[i].datetime).substring(12, 19));
                            newdiv.find("h3.event__title").attr("eventid", msg.items[i].id);
                            newdiv.find("h3.event__title a").html(msg.items[i].events_name);
                            newdiv.find("p.event__address").html(msg.items[i].address);
                            newdiv.appendTo($("#Eventslive"));
                        }

                    }, "json")
                }
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
                    Time = y + '年' + m + '月' + d + '日' + h + ' : ' + minute + ' : ' + second;
                    return Time;
                }

                $(function () {
                    myEventsPage();
                })
            </script>

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
        <%@include file="common/partners.jsp" %>
    </div>
</main>
<!-- end main content -->

<%@ include file="common/footer.jsp" %>
<%@ include file="common/modal_info.jsp" %>
</body>
</html>