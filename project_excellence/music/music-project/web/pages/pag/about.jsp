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
                    <li class="breadcrumb__item breadcrumb__item--active">关于</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h1>在线音乐 HTML 模板</h1>
                    <p>许多桌面出版软件包和<a href=''>网页</a>编辑器现在使用 Lorem Ipsum 作为默认模型文本，搜索“lorem
                        ipsum”会发现许多仍处于起步阶段的网站。多年来，各种版本不断发展，有时是偶然的，有时是故意的（注入幽默等）。
                    </p>
                    <p><b>互联网</b>上的所有Lorem
                        Ipsum生成器都倾向于根据需要重复预定义的块，使其成为互联网上第一个真正的生成器。它使用超过200个拉丁单词的字典，结合一些模型句子结构，生成看起来合理的Lorem
                        Ipsum。因此，生成的Lorem Ipsum始终没有重复，注入幽默或非特征词等。</p>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12 col-lg-4">
                <div class="step">
                    <span class="step__number">01</span>
                    <h3 class="step__title">创建一个帐户</h3>
                    <p class="step__text">它制作一个模式标本书。它不仅存活了五个世纪，而且还飞跃进入电子排版，仍然</p>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="step">
                    <span class="step__number">02</span>
                    <h3 class="step__title">选择您的计划</h3>
                    <p class="step__text">互联网上的所有Lorem
                        Ipsum生成器都倾向于根据需要重复预定义的块，使其成为第一个</p>
                </div>
            </div>

            <div class="col-12 col-lg-4">
                <div class="step">
                    <span class="step__number">03</span>
                    <h3 class="step__title">享受沃尔纳音乐</h3>
                    <p class="step__text">它制作一个模式标本书。它不仅存活了五个世纪，而且还飞跃进入电子排版</p>
                </div>
            </div>

            <div class="col-12">
                <a href="pages/user/signup.jsp" class="main__load">登 记</a>
            </div>
        </div>

        <div class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>订阅功能</h2>
                    <p>许多桌面出版软件包和<a href="">网页</a>编辑器现在使用 Lorem Ipsum 作为默认模型文本，搜索“lorem
                        ipsum”会发现许多仍处于起步阶段的网站。多年来，各种版本不断发展，有时是偶然的，有时是故意的（注入幽默等）。
                    </p>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon feature__icon--blue">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M19,7H18V6a3,3,0,0,0-3-3H5A3,3,0,0,0,2,6H2V18a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V10A3,3,0,0,0,19,7ZM5,5H15a1,1,0,0,1,1,1V7H5A1,1,0,0,1,5,5ZM20,15H19a1,1,0,0,1,0-2h1Zm0-4H19a3,3,0,0,0,0,6h1v1a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V8.83A3,3,0,0,0,5,9H19a1,1,0,0,1,1,1Z"/></svg>
						</span>
                    <h3 class="feature__title">即时结论</h3>
                    <p class="feature__text">它制作一个模式标本书。它不仅存活了五个世纪，而且还飞跃进入电子排版，仍然</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon feature__icon--red">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M9,10a1,1,0,0,0-1,1v2a1,1,0,0,0,2,0V11A1,1,0,0,0,9,10Zm12,1a1,1,0,0,0,1-1V6a1,1,0,0,0-1-1H3A1,1,0,0,0,2,6v4a1,1,0,0,0,1,1,1,1,0,0,1,0,2,1,1,0,0,0-1,1v4a1,1,0,0,0,1,1H21a1,1,0,0,0,1-1V14a1,1,0,0,0-1-1,1,1,0,0,1,0-2ZM20,9.18a3,3,0,0,0,0,5.64V17H10a1,1,0,0,0-2,0H4V14.82A3,3,0,0,0,4,9.18V7H8a1,1,0,0,0,2,0H20Z"/></svg>
						</span>
                    <h3 class="feature__title">选择您的计划</h3>
                    <p class="feature__text">如果你打算使用Lorem
                        Ipsum的一段话，你需要确保文本中间没有隐藏任何令人尴尬的东西。</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon feature__icon--purple">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M20,2H10A3,3,0,0,0,7,5v7a3,3,0,0,0,3,3H20a3,3,0,0,0,3-3V5A3,3,0,0,0,20,2Zm1,10a1,1,0,0,1-1,1H10a1,1,0,0,1-1-1V5a1,1,0,0,1,1-1H20a1,1,0,0,1,1,1ZM17.5,8a1.49,1.49,0,0,0-1,.39,1.5,1.5,0,1,0,0,2.22A1.5,1.5,0,1,0,17.5,8ZM16,17a1,1,0,0,0-1,1v1a1,1,0,0,1-1,1H4a1,1,0,0,1-1-1V15H4a1,1,0,0,0,0-2H3V12a1,1,0,0,1,1-1A1,1,0,0,0,4,9a3,3,0,0,0-3,3v7a3,3,0,0,0,3,3H14a3,3,0,0,0,3-3V18A1,1,0,0,0,16,17ZM6,18H7a1,1,0,0,0,0-2H6a1,1,0,0,0,0,2Z"/></svg>
						</span>
                    <h3 class="feature__title">创建一个帐户</h3>
                    <p class="feature__text">它不仅存活了五个世纪，而且还跨越了电子排版，基本上仍然保持着</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M21.65,2.24a1,1,0,0,0-.8-.23l-13,2A1,1,0,0,0,7,5V15.35A3.45,3.45,0,0,0,5.5,15,3.5,3.5,0,1,0,9,18.5V10.86L20,9.17v4.18A3.45,3.45,0,0,0,18.5,13,3.5,3.5,0,1,0,22,16.5V3A1,1,0,0,0,21.65,2.24ZM5.5,20A1.5,1.5,0,1,1,7,18.5,1.5,1.5,0,0,1,5.5,20Zm13-2A1.5,1.5,0,1,1,20,16.5,1.5,1.5,0,0,1,18.5,18ZM20,7.14,9,8.83v-3L20,4.17Z"/></svg>
						</span>
                    <h3 class="feature__title">享受爆炸音乐</h3>
                    <p class="feature__text">多年来，各种版本不断发展，有时是偶然的，有时是故意的</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M20,8.18V3a1,1,0,0,0-2,0V8.18a3,3,0,0,0,0,5.64V21a1,1,0,0,0,2,0V13.82a3,3,0,0,0,0-5.64ZM19,12a1,1,0,1,1,1-1A1,1,0,0,1,19,12Zm-6,2.18V3a1,1,0,0,0-2,0V14.18a3,3,0,0,0,0,5.64V21a1,1,0,0,0,2,0V19.82a3,3,0,0,0,0-5.64ZM12,18a1,1,0,1,1,1-1A1,1,0,0,1,12,18ZM6,6.18V3A1,1,0,0,0,4,3V6.18a3,3,0,0,0,0,5.64V21a1,1,0,0,0,2,0V11.82A3,3,0,0,0,6,6.18ZM5,10A1,1,0,1,1,6,9,1,1,0,0,1,5,10Z"/></svg>
						</span>
                    <h3 class="feature__title">选择您的计划</h3>
                    <p class="feature__text">它不仅存活了五个世纪，而且还跨越了电子排版，基本上仍然保持着</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M19.63,3.65a1,1,0,0,0-.84-.2,8,8,0,0,1-6.22-1.27,1,1,0,0,0-1.14,0A8,8,0,0,1,5.21,3.45a1,1,0,0,0-.84.2A1,1,0,0,0,4,4.43v7.45a9,9,0,0,0,3.77,7.33l3.65,2.6a1,1,0,0,0,1.16,0l3.65-2.6A9,9,0,0,0,20,11.88V4.43A1,1,0,0,0,19.63,3.65ZM18,11.88a7,7,0,0,1-2.93,5.7L12,19.77,8.93,17.58A7,7,0,0,1,6,11.88V5.58a10,10,0,0,0,6-1.39,10,10,0,0,0,6,1.39ZM13.54,9.59l-2.69,2.7-.89-.9a1,1,0,0,0-1.42,1.42l1.6,1.6a1,1,0,0,0,1.42,0L15,11a1,1,0,0,0-1.42-1.42Z"/></svg>
						</span>
                    <h3 class="feature__title">没有合同，没有风险</h3>
                    <p class="feature__text">多年来，各种版本不断发展，有时是偶然的，有时是故意的</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M12,3A10,10,0,0,0,2,13v7a1,1,0,0,0,1,1H6a3,3,0,0,0,3-3V16a3,3,0,0,0-3-3H4a8,8,0,0,1,16,0H18a3,3,0,0,0-3,3v2a3,3,0,0,0,3,3h3a1,1,0,0,0,1-1V13A10,10,0,0,0,12,3ZM6,15a1,1,0,0,1,1,1v2a1,1,0,0,1-1,1H4V15Zm14,4H18a1,1,0,0,1-1-1V16a1,1,0,0,1,1-1h2Z"/></svg>
						</span>
                    <h3 class="feature__title">仅限有效股票</h3>
                    <p class="feature__text">多年来，各种版本不断发展，有时是偶然的，有时是故意的</p>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 col-xl-3">
                <div class="feature feature--last">
						<span class="feature__icon">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path
                                    d="M22,9.67A1,1,0,0,0,21.14,9l-5.69-.83L12.9,3a1,1,0,0,0-1.8,0L8.55,8.16,2.86,9a1,1,0,0,0-.81.68,1,1,0,0,0,.25,1l4.13,4-1,5.68a1,1,0,0,0,.4,1,1,1,0,0,0,1.05.07L12,18.76l5.1,2.68a.93.93,0,0,0,.46.12,1,1,0,0,0,.59-.19,1,1,0,0,0,.4-1l-1-5.68,4.13-4A1,1,0,0,0,22,9.67Zm-6.15,4a1,1,0,0,0-.29.89l.72,4.19-3.76-2a1,1,0,0,0-.94,0l-3.76,2,.72-4.19a1,1,0,0,0-.29-.89l-3-3,4.21-.61a1,1,0,0,0,.76-.55L12,5.7l1.88,3.82a1,1,0,0,0,.76.55l4.21.61Z"/></svg>
						</span>
                    <h3 class="feature__title">选择您的计划</h3>
                    <p class="feature__text">如果你打算使用Lorem
                        Ipsum的一段话，你需要确保文本中间没有隐藏任何令人尴尬的东西。</p>
                </div>
            </div>
        </div>

        <div class="row row--grid">
            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>选择您的计划</h2>
                    <p>没有隐藏费用、设备租赁或安装预约。</p>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12 col-md-6 col-lg-4 order-md-2 order-lg-1">
                <div class="plan plan--green">
                    <h3 class="plan__title">自由</h3>
                    <span class="plan__price">$0<span> /月</span></span>
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
                    <h3 class="plan__title">起动机</h3>
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
                    <button class="plan__btn" type="button">选择计划</button>
                </div>
            </div>

            <div class="col-12 col-md-6 col-lg-4 order-md-3 order-lg-3">
                <div class="plan plan--purple">
                    <h3 class="plan__title">奖赏</h3>
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
                    <button class="plan__btn" type="button">选择计划</button>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- end main content -->
<%@ include file="../common/footer.jsp" %>
</body>
</html>