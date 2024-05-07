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
                    <li class="breadcrumb__item breadcrumb__item--active">活动</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>活动</h1>
                </div>
            </div>
            <!-- end title -->
        </div>


        <div class="row row--grid">
            <div class="col-12">
                <div class="main__filter">
                    <form action="#" class="main__filter-search">
                        <input type="text" name="events_name" placeholder="搜索活动名称...">
                        <button type="button" class="searchEvents">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path>
                            </svg>
                        </button>
                    </form>

                    <div class="main__filter-wrap">
                        <select class="main__select" name="genres">
                            <option value="upcoming">即将举行的活动</option>
                            <option value="past">往期</option>
                            <option value="free">免费活动</option>
                        </select>
                    </div>

                    <div class="slider-radio">
                        <input type="radio" name="grade" id="upcoming" checked><label for="upcoming">即将到来</label>
                        <input type="radio" name="grade" id="past"><label for="past">过去</label>
                        <input type="radio" name="grade" id="free"><label for="free">免费</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row--grid" id="Events">
            <div class="col-12 col-md-6 col-xl-4" style="display: none">
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
        <button class="main__load" type="button">加载更多</button>
        <script>
            var pageinfo;
            var pageNo = 1;
            var event_name = "";
            var genre_val = "";

            function myEventsPage(pageNo, event_name, genre_val) {
                return new Promise((resolve, reject) => {
                    $.post("EventsServlet", {
                        action: "searchEventsPage",
                        pageNo: pageNo,
                        events_name: event_name,
                        genres_val: genre_val
                    }, function (msg) {
                        pageinfo = msg;
                        for (let i = 0; i < msg.items.length; i++) {
                            let newdiv = $("#Events div:first").clone(true);//clone(true)事件一起复制
                            newdiv.css("display", "").attr("ddd", "delete");
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
                            newdiv.appendTo($("#Events"));
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
                myEventsPage(pageNo, event_name, genre_val);

                $("button.searchEvents").click(function () {
                    pageNo = 1;
                    event_name = $("input[name=events_name]").val();
                    genre_val = $("select[name=genres]").val();
                    $("#Events").children("div[ddd=delete]").remove();

                    function ajaxRequest(callback) {
                        // 异步请求方法
                        myEventsPage(pageNo, event_name, genre_val).then(function () {
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
                    event_name = $("input[name=events_name]").val();
                    genre_val = id = $('input[name="grade"]:checked').attr('id');
                    $("#Events").children("div[ddd=delete]").remove();

                    function ajaxRequest(callback) {
                        // 异步请求方法
                        myEventsPage(pageNo, event_name, genre_val).then(function () {
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
                        myEventsPage(pageNo, event_name, genre_val);
                        if (pageNo === pageinfo.pageTotal) {
                            $(this).remove();
                        }
                    }
                })
                $("#Events h3.event__title a").click(function () {
                    var id = $(this).parent().attr("eventid");
                    window.location.href = "EventsServlet?action=toEvent&id=" + id;
                })
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
                Time = y + '年' + m + '月' + d + '日' + h + ' : ' + minute + ' : ' + second;
                return Time;
            }
        </script>
        <%@ include file="common/partners.jsp" %>
    </div>
</main>
<!-- end main content -->
<%@ include file="common/footer.jsp" %>
<%@ include file="common/modal_info.jsp" %>
</body>
</html>