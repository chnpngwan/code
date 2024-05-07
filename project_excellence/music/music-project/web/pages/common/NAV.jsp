<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>NAV</title><link rel="shortcut icon" href="static/img/favicon.ico"/>
--%>
<%--    <!-- CSS -->--%>
<link rel="stylesheet" href="static/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="static/css/bootstrap-grid.min.css">
<link rel="stylesheet" href="static/css/owl.carousel.min.css">
<link rel="stylesheet" href="static/css/magnific-popup.css">
<link rel="stylesheet" href="static/css/select2.min.css">
<link rel="stylesheet" href="static/css/paymentfont.min.css">
<link rel="stylesheet" href="static/css/slider-radio.css">
<link rel="stylesheet" href="static/css/plyr.css">
<link rel="stylesheet" href="static/css/main.css">
<!-- JS -->
<script src="static/js/jquery-3.5.1.min.js"></script>
<script src="static/js/bootstrap.bundle.min.js"></script>
<script src="static/js/owl.carousel.min.js"></script>
<script src="static/js/jquery.magnific-popup.min.js"></script>
<script src="static/js/smooth-scrollbar.js"></script>
<script src="static/js/select2.min.js"></script>
<script src="static/js/slider-radio.js"></script>
<script src="static/js/jquery.inputmask.min.js"></script>
<script src="static/js/plyr.min.js"></script>
<script src="static/js/main.js"></script>
<script src="static/layui/layui.js"></script>
<script src="static/laydate/laydate.js"></script> <!-- 改成你的路径 -->
<style>
    #cart_drop {
        height: 300px;
        overflow: auto;
    }
</style>
<!-- header -->
<header class="header">
    <div class="header__content">
        <div class="header__logo">
            <a href="pages/first.jsp">
                <img src="static/img/logo.svg" alt="">
            </a>
        </div>

        <nav class="header__nav">
            <a href="pages/pag/profile.jsp">个人账户</a>
            <a href="pages/pag/about.jsp">关于</a>
            <a href="pages/pag/contacts.jsp">留言</a>
        </nav>
        <%--        查询--%>
        <form action="#" class="header__search" style="margin-top: 20px">
            <input type="text" placeholder="艺术家, 曲目或博客">
            <button type="button">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"/>
                </svg>
            </button>
            <button type="button" class="close">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
                </svg>
            </button>
        </form>

        <div class="header__actions">
            <div class="header__action header__action--search">
                <button class="header__action-btn" type="button">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"/>
                    </svg>
                </button>
            </div>
            <%-- 留言--%>
            <div class="header__action header__action--note">
                <span>17</span>
                <a href="#" class="header__action-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M19.05566,2h-14a3.00328,3.00328,0,0,0-3,3V19a3.00328,3.00328,0,0,0,3,3h14a3.00328,3.00328,0,0,0,3-3V5A3.00328,3.00328,0,0,0,19.05566,2Zm-14,2h14a1.001,1.001,0,0,1,1,1v8H17.59082a1.99687,1.99687,0,0,0-1.66406.89062L14.52051,16H9.59082L8.18457,13.89062A1.99687,1.99687,0,0,0,6.52051,13H4.05566V5A1.001,1.001,0,0,1,5.05566,4Zm14,16h-14a1.001,1.001,0,0,1-1-1V15H6.52051l1.40625,2.10938A1.99687,1.99687,0,0,0,9.59082,18h4.92969a1.99687,1.99687,0,0,0,1.66406-.89062L17.59082,15h2.46484v4A1.001,1.001,0,0,1,19.05566,20Z"/>
                    </svg>
                </a>

                <div class="header__drop">
                    <a href="#" class="header__all">查看全部</a>
                    <div class="header__note header__note--succ">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M14.72,8.79l-4.29,4.3L8.78,11.44a1,1,0,1,0-1.41,1.41l2.35,2.36a1,1,0,0,0,.71.29,1,1,0,0,0,.7-.29l5-5a1,1,0,0,0,0-1.42A1,1,0,0,0,14.72,8.79ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                        </svg>
                        <p><a href="#modal-info2" class="open-modal">付款 #51</a> was successful!</p>
                        <span>1小时前</span>
                    </div>
                    <div class="header__note header__note--fail">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M15.71,8.29a1,1,0,0,0-1.42,0L12,10.59,9.71,8.29A1,1,0,0,0,8.29,9.71L10.59,12l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l2.29,2.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L13.41,12l2.3-2.29A1,1,0,0,0,15.71,8.29Zm3.36-3.36A10,10,0,1,0,4.93,19.07,10,10,0,1,0,19.07,4.93ZM17.66,17.66A8,8,0,1,1,20,12,7.95,7.95,0,0,1,17.66,17.66Z"/>
                        </svg>
                        <p><a href="#modal-info3" class="open-modal">付款 #50</a> 失败!</p>
                        <span>2小时前</span>
                    </div>
                    <div class="header__note header__note--info">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20Zm0-8.5a1,1,0,0,0-1,1v3a1,1,0,0,0,2,0v-3A1,1,0,0,0,12,11.5Zm0-4a1.25,1.25,0,1,0,1.25,1.25A1.25,1.25,0,0,0,12,7.5Z"/>
                        </svg>
                        <p>通知<a href="#modal-info4" class="open-modal">示例</a>。</p>
                        <span>2小时前</span>
                    </div>
                    <div class="header__note header__note--gift">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                            <path d="M18,7h-.35A3.45,3.45,0,0,0,18,5.5a3.49,3.49,0,0,0-6-2.44A3.49,3.49,0,0,0,6,5.5,3.45,3.45,0,0,0,6.35,7H6a3,3,0,0,0-3,3v2a1,1,0,0,0,1,1H5v6a3,3,0,0,0,3,3h8a3,3,0,0,0,3-3V13h1a1,1,0,0,0,1-1V10A3,3,0,0,0,18,7ZM11,20H8a1,1,0,0,1-1-1V13h4Zm0-9H5V10A1,1,0,0,1,6,9h5Zm0-4H9.5A1.5,1.5,0,1,1,11,5.5Zm2-1.5A1.5,1.5,0,1,1,14.5,7H13ZM17,19a1,1,0,0,1-1,1H13V13h4Zm2-8H13V9h5a1,1,0,0,1,1,1Z"/>
                        </svg>
                        <p><a href="#modal-info5" class="open-modal">您收到了礼物！</a></p>
                        <span>4小时前</span>
                    </div>
                </div>
            </div>
            <%-- 购物车--%>
            <div class="header__action header__action--cart">
                <span>0</span>
                <a class="header__action-btn" href="pages/pag/cart.jsp">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                        <path d="M8.5,19A1.5,1.5,0,1,0,10,20.5,1.5,1.5,0,0,0,8.5,19ZM19,16H7a1,1,0,0,1,0-2h8.49121A3.0132,3.0132,0,0,0,18.376,11.82422L19.96143,6.2749A1.00009,1.00009,0,0,0,19,5H6.73907A3.00666,3.00666,0,0,0,3.92139,3H3A1,1,0,0,0,3,5h.92139a1.00459,1.00459,0,0,1,.96142.7251l.15552.54474.00024.00506L6.6792,12.01709A3.00006,3.00006,0,0,0,7,18H19a1,1,0,0,0,0-2ZM17.67432,7l-1.2212,4.27441A1.00458,1.00458,0,0,1,15.49121,12H8.75439l-.25494-.89221L7.32642,7ZM16.5,19A1.5,1.5,0,1,0,18,20.5,1.5,1.5,0,0,0,16.5,19Z"/>
                    </svg>
                </a>

                <div class="header__drop" id="cart_drop">
                    <a href="pages/pag/cart.jsp" class="header__all">前往购物车</a>
                    <div class="header__product" style="display: none">
                        <img src="static/img/store/item4.jpg" alt="">
                        <p><a href="pages/pag/product.jsp">耳机 ZR-991</a></p>
                        <span>$199</span>
                        <button class="cart__delete">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"/>
                            </svg>
                        </button>
                    </div>
                </div>
                <script>
                    var pageinfo;

                    function mycartNav(pageNo) {
                        $.post("CartItemServlet", "action=findCartByUid&pageSize=5&pageNo=" + pageNo, function (msg) {
                            if (msg == null || msg.items.length === 0) {
                                $("#cart_drop").css("display", "none");
                            } else {
                                for (let i = 0; i < msg.items.length; i++) {
                                    let newdiv = $("div.header__drop div.header__product:first").clone(true);
                                    newdiv.css("display", "");
                                    newdiv.find("img").attr("src", msg.items[i].faceimg);
                                    newdiv.find("p a").html(msg.items[i].pname).attr("href", "ProduceServlet?action=toProduce&id=" + msg.items[i].pid);
                                    newdiv.find("span").html("$" + msg.items[i].price);
                                    newdiv.find("button").attr("cartid", msg.items[i].id);
                                    newdiv.appendTo($("#cart_drop"));
                                }
                                if ((msg.items.length * 80 + 80) < parseInt($("#cart_drop").css("height"))) {
                                    $("#cart_drop").css("height", 60 + msg.items.length * 80);
                                }
                                pageinfo = msg;
                                $("div.header__action--cart").find("span:first").html(msg.pageTotalCount);
                            }
                        }, "json")
                    }

                    //单个删除
                    $("button.cart__delete").click(function () {
                        var header__product = $(this).parents("div.header__product");
                        let id = $(this).attr("cartid");

                        function deleteByid(id) {
                            $.post("CartItemServlet", "action=deleteById&id=" + id, function (msg) {
                                if (msg == '1') {
                                    // 将消息存储到 sessionStorage
                                    sessionStorage.setItem('message', '删除成功');
                                    sessionStorage.setItem('messageType', 'success');
                                    // 刷新页面
                                    location.reload(true);
                                    // header__product.remove();
                                } else {
                                    layer.msg("删除失败", {
                                        icon: 2,
                                        time: 2000
                                    });
                                }
                            }, "json");
                        }

                        deleteByid(id);
                    })

                    $(function () {
                        var pageNo = 1;
                        mycartNav(pageNo);
                        //滚动事件.加载新数据
                        $("#cart_drop").scroll(function () {
                            if (this.scrollTop + this.clientHeight + 1 > this.scrollHeight) {
                                if (pageinfo.pageNo < pageinfo.pageTotal) {
                                    pageNo = pageNo + 1;
                                    mycartNav(pageNo);
                                }
                            }
                        })
                        // 检查 sessionStorage 是否存在消息
                        if (sessionStorage.getItem('message')) {
                            var message = sessionStorage.getItem('message');
                            var messageType = sessionStorage.getItem('messageType');

                            // 显示 layer.msg
                            layer.msg(message, {
                                icon: messageType === 'success' ? 1 : 2,
                                time: 2000
                            });
                            // 清除消息
                            sessionStorage.removeItem('message');
                            sessionStorage.removeItem('messageType');
                        }
                    })
                </script>
            </div>
            <%-- 用户--%>
            <div class="header__action header__action--signin">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a class="header__action-btn" href="pages/user/signin.jsp">
                            <span>登录</span>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M20,12a1,1,0,0,0-1-1H11.41l2.3-2.29a1,1,0,1,0-1.42-1.42l-4,4a1,1,0,0,0-.21.33,1,1,0,0,0,0,.76,1,1,0,0,0,.21.33l4,4a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42L11.41,13H19A1,1,0,0,0,20,12ZM17,2H7A3,3,0,0,0,4,5V19a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V16a1,1,0,0,0-2,0v3a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V8a1,1,0,0,0,2,0V5A3,3,0,0,0,17,2Z"/>
                            </svg>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <span style="color: white;"><span class="um_span">${sessionScope.user.username}</span></span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <button class="header__btn" type="button">
            <span></span>
            <span></span>
            <span></span>
        </button>
    </div>
</header>
<!-- end header -->

<!-- sidebar -->
<div class="sidebar">
    <!-- sidebar logo -->
    <div class="sidebar__logo">
        <img src="static/img/logo.svg" alt="">
    </div>
    <!-- end sidebar logo -->

    <!-- sidebar nav -->
    <ul class="sidebar__nav">
        <li class="sidebar__nav-item">
            <a href="index.jsp" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M20,8h0L14,2.74a3,3,0,0,0-4,0L4,8a3,3,0,0,0-1,2.26V19a3,3,0,0,0,3,3H18a3,3,0,0,0,3-3V10.25A3,3,0,0,0,20,8ZM14,20H10V15a1,1,0,0,1,1-1h2a1,1,0,0,1,1,1Zm5-1a1,1,0,0,1-1,1H16V15a3,3,0,0,0-3-3H11a3,3,0,0,0-3,3v5H6a1,1,0,0,1-1-1V10.25a1,1,0,0,1,.34-.75l6-5.25a1,1,0,0,1,1.32,0l6,5.25a1,1,0,0,1,.34.75Z"></path>
                </svg>
                <span>主页</span></a>
        </li>

        <li class="sidebar__nav-item">
            <a href="pages/artists.jsp" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M12.3,12.22A4.92,4.92,0,0,0,14,8.5a5,5,0,0,0-10,0,4.92,4.92,0,0,0,1.7,3.72A8,8,0,0,0,1,19.5a1,1,0,0,0,2,0,6,6,0,0,1,12,0,1,1,0,0,0,2,0A8,8,0,0,0,12.3,12.22ZM9,11.5a3,3,0,1,1,3-3A3,3,0,0,1,9,11.5Zm9.74.32A5,5,0,0,0,15,3.5a1,1,0,0,0,0,2,3,3,0,0,1,3,3,3,3,0,0,1-1.5,2.59,1,1,0,0,0-.5.84,1,1,0,0,0,.45.86l.39.26.13.07a7,7,0,0,1,4,6.38,1,1,0,0,0,2,0A9,9,0,0,0,18.74,11.82Z"/>
                </svg>
                <span>艺术家</span></a>
        </li>

        <li class="sidebar__nav-item">
            <a href="AlbumServlet?action=toReleases" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z"/>
                </svg>
                <span>专辑</span></a>
        </li>

        <li class="sidebar__nav-item">
            <a href="pages/events.jsp" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M12,19a1,1,0,1,0-1-1A1,1,0,0,0,12,19Zm5,0a1,1,0,1,0-1-1A1,1,0,0,0,17,19Zm0-4a1,1,0,1,0-1-1A1,1,0,0,0,17,15Zm-5,0a1,1,0,1,0-1-1A1,1,0,0,0,12,15ZM19,3H18V2a1,1,0,0,0-2,0V3H8V2A1,1,0,0,0,6,2V3H5A3,3,0,0,0,2,6V20a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V6A3,3,0,0,0,19,3Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V11H20ZM20,9H4V6A1,1,0,0,1,5,5H6V6A1,1,0,0,0,8,6V5h8V6a1,1,0,0,0,2,0V5h1a1,1,0,0,1,1,1ZM7,15a1,1,0,1,0-1-1A1,1,0,0,0,7,15Zm0,4a1,1,0,1,0-1-1A1,1,0,0,0,7,19Z"/>
                </svg>
                <span>活动</span></a>
        </li>

        <li class="sidebar__nav-item">
            <a href="PodcastsServlet?action=toPodcasts" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M12,15a4,4,0,0,0,4-4V5A4,4,0,0,0,8,5v6A4,4,0,0,0,12,15ZM10,5a2,2,0,0,1,4,0v6a2,2,0,0,1-4,0Zm10,6a1,1,0,0,0-2,0A6,6,0,0,1,6,11a1,1,0,0,0-2,0,8,8,0,0,0,7,7.93V21H9a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2H13V18.93A8,8,0,0,0,20,11Z"/>
                </svg>
                <span>播客</span>
            </a>
        </li>

        <!-- collapse -->
        <li class="sidebar__nav-item">
            <a class="sidebar__nav-link" data-toggle="collapse" href="#collapseMenu1" role="button"
               aria-expanded="false" aria-controls="collapseMenu1">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M19,5.5H12.72l-.32-1a3,3,0,0,0-2.84-2H5a3,3,0,0,0-3,3v13a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V8.5A3,3,0,0,0,19,5.5Zm1,13a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V5.5a1,1,0,0,1,1-1H9.56a1,1,0,0,1,.95.68l.54,1.64A1,1,0,0,0,12,7.5h7a1,1,0,0,1,1,1Z"/>
                </svg>
                <span>页面</span>
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M17,9.17a1,1,0,0,0-1.41,0L12,12.71,8.46,9.17a1,1,0,0,0-1.41,0,1,1,0,0,0,0,1.42l4.24,4.24a1,1,0,0,0,1.42,0L17,10.59A1,1,0,0,0,17,9.17Z"/>
                </svg>
            </a>
            <div class="collapse" id="collapseMenu1">
                <ul class="sidebar__menu sidebar__menu--scroll ">
                    <li><a href="pages/pag/cart.jsp">购物车</a></li>
                    <li><a href="pages/pag/pricing.jsp">定价计划</a></li>
                    <li><a href="pages/privacy.jsp">隐私策略</a></li>
                    <li><a href="pages/pag/404.jsp">404页面</a></li>
                </ul>
            </div>
        </li>
        <!-- end collapse -->

        <li class="sidebar__nav-item">
            <a href="pages/store.jsp" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M8.5,19A1.5,1.5,0,1,0,10,20.5,1.5,1.5,0,0,0,8.5,19ZM19,16H7a1,1,0,0,1,0-2h8.49121A3.0132,3.0132,0,0,0,18.376,11.82422L19.96143,6.2749A1.00009,1.00009,0,0,0,19,5H6.73907A3.00666,3.00666,0,0,0,3.92139,3H3A1,1,0,0,0,3,5h.92139a1.00459,1.00459,0,0,1,.96142.7251l.15552.54474.00024.00506L6.6792,12.01709A3.00006,3.00006,0,0,0,7,18H19a1,1,0,0,0,0-2ZM17.67432,7l-1.2212,4.27441A1.00458,1.00458,0,0,1,15.49121,12H8.75439l-.25494-.89221L7.32642,7ZM16.5,19A1.5,1.5,0,1,0,18,20.5,1.5,1.5,0,0,0,16.5,19Z"/>
                </svg>
                <span>商店</span></a>
        </li>

        <li class="sidebar__nav-item">
            <a href="pages/news.jsp" class="sidebar__nav-link">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path d="M16,14H8a1,1,0,0,0,0,2h8a1,1,0,0,0,0-2Zm0-4H10a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2Zm4-6H17V3a1,1,0,0,0-2,0V4H13V3a1,1,0,0,0-2,0V4H9V3A1,1,0,0,0,7,3V4H4A1,1,0,0,0,3,5V19a3,3,0,0,0,3,3H18a3,3,0,0,0,3-3V5A1,1,0,0,0,20,4ZM19,19a1,1,0,0,1-1,1H6a1,1,0,0,1-1-1V6H7V7A1,1,0,0,0,9,7V6h2V7a1,1,0,0,0,2,0V6h2V7a1,1,0,0,0,2,0V6h2Z"/>
                </svg>
                <span>新闻</span></a>
        </li>
    </ul>
    <!-- end sidebar nav -->
</div>
<!-- end sidebar -->
<!-- player -->
<div class="player">
    <div class="player__cover">
        <img src="static/img/covers/cover.svg" alt="">
    </div>

    <div class="player__content">
        <span class="player__track"><b class="player__title">史诗般的电影</b> – <span
                class="player__artist">AudioPizza</span></span>
        <audio src="http://music.163.com/song/media/outer/url?id=29152631.mp3" id="audio" controls></audio>
    </div>
</div>
<button class="player__btn" type="button">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z"/>
    </svg>
    歌手
</button>
<!-- end player -->
