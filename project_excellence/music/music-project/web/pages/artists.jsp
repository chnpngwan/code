<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
</head>
<body>
<%--<%@include file="/pages/common/NAV.jsp" %>--%>
<jsp:include page="/pages/common/NAV.jsp"></jsp:include>
<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <!-- artists -->
        <div class="row row--grid">
            <!-- breadcrumb -->
            <div class="col-12">
                <ul class="breadcrumb">
                    <li class="breadcrumb__item"><a href="index.jsp">主页</a></li>
                    <li class="breadcrumb__item breadcrumb__item--active">艺术家</li>
                </ul>
            </div>
            <!-- end breadcrumb -->
            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>艺术家</h1>
                </div>
            </div>
            <!-- end title -->
        </div>

        <div class="row row--grid">
            <div class="col-12">
                <div class="main__filter">
                    <div class="main__filter-search">
                        <input type="text" name="art_name" placeholder="搜索...">
                        <button class="SearchArt_name">
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
                            <option value="9">拉丁美洲人</option>
                            <option value="10">节奏蓝调/灵魂乐</option>
                            <option value="11">岩石</option>
                        </select>
                    </div>
                </div>

                <div class="row row--grid" id="artRow">
                    <div class="col-6 col-sm-4 col-md-3 col-xl-2" style="display: none">
                        <a href="javascript:void(0)" class="artist" artId="">
                            <div class="artist__cover">
                                <img src="static/img/artists/artist1.jpg" alt="">
                            </div>
                            <h3 class="artist__title">贝尼特色</h3>
                        </a>
                    </div>
                </div>
                <button class="main__load" type="button">加载更多</button>
            </div>
        </div>
        <!-- end artists -->
    </div>
</main>
<!-- end main content -->
<script>
    var pageinfo;
    var pageNo = 1;
    var genreid = 0;
    var art_name = "";

    function myartispage(pageNo, genreid, art_name) {
        return new Promise(function (resolve, reject) {
            $.post("ArtistServlet", {
                action: "searchPage",
                pageNo: pageNo,
                genre_id: genreid,
                art_name: art_name
            }, function (msg) {
                // 将返回的数据存储到全局变量 pageinfo 中
                pageinfo = msg;
                for (let i = 0; i < msg.items.length; i++) {
                    let newdiv = $("#artRow div:first").clone(true); //clone(true)事件一起复制
                    newdiv.attr("ddd", "delete");//给这些克隆出来的元素添加一个属性,方便后面删除他们
                    newdiv.css("display", "").find(".artist").attr("artId", msg.items[i].id);
                    newdiv.find("div.artist__cover img").attr("src", msg.items[i].photograph);
                    newdiv.find("h3.artist__title").html(msg.items[i].art_name);
                    newdiv.appendTo($("#artRow"));
                }
                resolve(); // 当请求成功时，调用 resolve 函数
            }, "json").fail(function() {
                reject(); // 当请求失败时，调用 reject 函数
            });
        });
    }

    $(function () {
        myartispage(pageNo, genreid, art_name);
        $("button.SearchArt_name").click(function () {
            pageNo = 1;
            art_name = $("input[name=art_name]").val();
            genreid = $("select[name=years]").val();
            $("#artRow").children("div[ddd=delete]").remove();
            function ajaxRequest(callback) {
                // 异步请求方法
                myartispage(pageNo, genreid, art_name).then(function () {
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
        //加载更多按钮
        $("button.main__load").click(function () {
            if (pageNo < pageinfo.pageTotal) {
                pageNo += 1;
                myartispage(pageNo, genreid, art_name);
                if (pageNo === pageinfo.pageTotal) {
                    $(this).hide();
                }
            }
        })
        // 绑定点击事件到 #Artist 中的 a 元素
        $("a.artist").click(function (e) {
            // 在父元素上获取 artId 属性值
            var id = $(this).attr("artId");
            // 这里可以执行其他操作，例如跳转到其他页面或打开艺术家详情页面等
            window.location.href = "ArtistServlet?action=toArtist&id=" + id;
        });
    });
</script>
<%@ include file="common/footer.jsp" %>
<%@ include file="common/modal_info.jsp" %>
</body>
</html>