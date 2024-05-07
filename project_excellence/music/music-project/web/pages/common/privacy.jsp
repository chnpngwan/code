<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <link rel="shortcut icon" href="../../static/img/favicon.ico"/>
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
                    <li class="breadcrumb__item"><a href="../../index.jsp">主页</a></li>
                    <li class="breadcrumb__item breadcrumb__item--active">隐私策略</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title">
                    <h1>隐私策略</h1>
                    <p>一个早已确定的事实是，读者在查看页面布局时会被页面的可读内容分散注意力。使用Lorem
                        Ipsum的要点是它具有或多或少的字母正态分布，而不是使用“此处的内容，此处的内容”，使其看起来像可读的英语。</p>
                    <p>许多桌面出版软件包和<a href="">网页</a>编辑器现在使用 Lorem Ipsum 作为默认模型文本，搜索“lorem
                        ipsum”会发现许多仍处于起步阶段的网站。多年来，各种版本不断发展，有时是偶然的，有时是故意的（注入幽默等）。
                    </p>
                    <p><b>互联网</b>上的所有Lorem
                        Ipsum生成器都倾向于根据需要重复预定义的块，使其成为互联网上第一个真正的生成器。它使用超过200个拉丁单词的字典，结合一些模型句子结构，生成看起来合理的Lorem
                        Ipsum。因此，生成的Lorem Ipsum始终没有重复，注入幽默或非特征词等。</p>
                    <ol>
                        <li>
                            <h4>用户个人信息的确定</h4>
                            <ol>
                                <li>如果你打算使用Lorem Ipsum的一段话：
                                    <ol>
                                        <li>互联网上的所有Lorem
                                            Ipsum生成器都倾向于根据需要重复预定义的块，使其成为互联网上第一个真正的生成器。
                                        </li>
                                        <li>它使用超过200个拉丁单词的字典，结合一些模型句子结构，生成看起来合理的Lorem
                                            Ipsum。因此，生成的Lorem Ipsum始终没有重复，注入幽默或非特征词等。
                                        </li>
                                    </ol>
                                </li>
                                <li>Lorem
                                    Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变，通过注入幽默或看起来甚至不可信的随机单词。
                                </li>
                                <li>许多桌面出版软件包和网页编辑器现在使用 Lorem Ipsum 作为默认模型文本，搜索“lorem
                                    ipsum”会发现许多仍处于起步阶段的网站。多年来，各种版本不断发展，有时是偶然的，有时是故意的（注入幽默等）。
                                </li>
                            </ol>
                        </li>

                        <li>
                            <h4>收集和处理用户个人信息的原因</h4>
                            <ol>
                                <li>一个早已确定的事实是，读者在查看页面布局时会被页面的可读内容分散注意力。使用Lorem
                                    Ipsum的要点是它具有或多或少的字母正态分布。
                                </li>
                                <li>互联网上所有的Lorem Ipsum生成器都倾向于根据需要重复预定义的块，使其成为互联网上第一个真正的生成器：
                                    <ol>
                                        <li>它不仅存活了五个世纪，而且还飞跃进入电子排版，基本保持不变;
                                        </li>
                                        <li>它在 1960 年代随着包含 Lorem Ipsum 通道的 Letraset 纸的发布而普及;
                                        </li>
                                        <li>多年来，各种版本不断发展，有时是偶然的，有时是故意的（注入幽默等）;
                                        </li>
                                        <li>许多桌面出版软件包和网页编辑器现在使用 Lorem Ipsum 作为其默认模型文本;</li>
                                    </ol>
                                </li>
                            </ol>
                        </li>
                    </ol>
                    <p><b>互联网</b>上的所有Lorem
                        Ipsum生成器都倾向于根据需要重复预定义的块，使其成为互联网上第一个真正的生成器。它使用超过200个拉丁单词的字典，结合一些模型句子结构，生成看起来合理的Lorem
                        Ipsum。因此，生成的Lorem Ipsum始终没有重复，注入幽默或非特征词等。</p>
                </div>
            </div>
            <!-- end title -->
        </div>
        <%@ include file="partners.jsp" %>
    </div>
</main>
<!-- end main content -->
<%@ include file="footer.jsp" %>
<%@ include file="modal_info.jsp" %>
</body>
</html>