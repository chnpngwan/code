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
                    <li class="breadcrumb__item breadcrumb__item--active">定价计划</li>
                </ul>
            </div>
            <!-- end breadcrumb -->
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h1>定价计划</h1>
                    <p>许多桌面出版软件包和<a href="javascript:void (0)">网页</a>编辑器现在使用 Lorem Ipsum
                        作为他们的默认模型文本，以及搜索“Lorem Ipsum”将发现许多网站仍在 他们的婴儿期。多年来，各种版本不断发展，有时是偶然的，有时是
                        目的（注入幽默等）。</p>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                <path d="M19,7H18V6a3,3,0,0,0-3-3H5A3,3,0,0,0,2,6H2V18a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V10A3,3,0,0,0,19,7ZM5,5H15a1,1,0,0,1,1,1V7H5A1,1,0,0,1,5,5ZM20,15H19a1,1,0,0,1,0-2h1Zm0-4H19a3,3,0,0,0,0,6h1v1a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V8.83A3,3,0,0,0,5,9H19a1,1,0,0,1,1,1Z"/></svg>
						</span>
                    <h3 class="feature__title">即时结论</h3>
                    <p class="feature__text">它制作一个模式标本书。它不仅存活了五个世纪，而且还飞跃进入电子排版。</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" data-name="Layer 1" viewBox="0 0 24 24"><path
                                    d="M19,4.5H5a3,3,0,0,0-3,3v9a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3v-9A3,3,0,0,0,19,4.5Zm1,12a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1v-9a1,1,0,0,1,1-1H19a1,1,0,0,1,1,1Zm-4-6a3,3,0,0,0-1.51.42,3,3,0,1,0,0,5.16A3,3,0,1,0,16,10.5Zm-2.83,4a1,1,0,0,1-.17,0,1,1,0,0,1,0-2,1,1,0,0,1,.17,0,2.8,2.8,0,0,0,0,1.92Zm2.83,0a1,1,0,1,1,1-1A1,1,0,0,1,16,14.5Z"/></svg>
						</span>
                    <h3 class="feature__title">选择您的计划</h3>
                    <p class="feature__text">如果你打算使用Lorem Ipsum的段落，你需要确保那里
                        文字中间隐藏着什么尴尬的东西吗</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M20,2H10A3,3,0,0,0,7,5v7a3,3,0,0,0,3,3H20a3,3,0,0,0,3-3V5A3,3,0,0,0,20,2Zm1,10a1,1,0,0,1-1,1H10a1,1,0,0,1-1-1V5a1,1,0,0,1,1-1H20a1,1,0,0,1,1,1ZM17.5,8a1.49,1.49,0,0,0-1,.39,1.5,1.5,0,1,0,0,2.22A1.5,1.5,0,1,0,17.5,8ZM16,17a1,1,0,0,0-1,1v1a1,1,0,0,1-1,1H4a1,1,0,0,1-1-1V15H4a1,1,0,0,0,0-2H3V12a1,1,0,0,1,1-1A1,1,0,0,0,4,9a3,3,0,0,0-3,3v7a3,3,0,0,0,3,3H14a3,3,0,0,0,3-3V18A1,1,0,0,0,16,17ZM6,18H7a1,1,0,0,0,0-2H6a1,1,0,0,0,0,2Z"/></svg>
						</span>
                    <h3 class="feature__title">创建一个帐户</h3>
                    <p class="feature__text">它不仅存活了五个世纪，而且还跨越了电子领域 排版，基本保留</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature feature--last">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z"/></svg>
						</span>
                    <h3 class="feature__title">享受爆炸音乐</h3>
                    <p class="feature__text">多年来，各种版本不断发展，有时是偶然的， 有时是故意的</p>
                </div>
            </div>
        </div>

        <div class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>选择您的计划</h2>
                </div>
            </div>
            <!-- end title -->
            <div class="col-12 col-md-6 col-lg-4 order-md-2 order-lg-1">
                <div class="plan plan--green">
                    <h3 class="plan__title">豪华绿钻</h3>
                    <span class="plan__price">$1.99<span> /月</span></span>
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
                    <button class="plan__btn" type="button">确认协议以开通</button>
                </div>
            </div>
            <div class="col-12 col-lg-4 order-md-1 order-lg-2">
                <div class="plan plan--red">
                    <h3 class="plan__title">视听会员</h3>
                    <span class="plan__price">$14.99<span> /月</span></span>
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
                    <button class="plan__btn" type="button">确认协议以开通</button>
                </div>
            </div>
            <div class="col-12 col-md-6 col-lg-4 order-md-3 order-lg-3">
                <div class="plan plan--purple">
                    <h3 class="plan__title">Premium</h3>
                    <span class="plan__price">$39.99<span> /月</span></span>
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
                    <button class="plan__btn" type="button">确认协议以开通</button>
                </div>
            </div>
        </div>
        <%@ include file="../common/partners.jsp" %>
    </div>
</main>
<!-- end main content -->

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/modal_info.jsp" %>

</body>
</html>