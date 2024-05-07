<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
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
                    <li class="breadcrumb__item breadcrumb__item--active">错误 404</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- error -->
            <div class="col-12">
                <div class="page-404">
                    <div class="page-404__wrap">
                        <div class="page-404__content">
                            <h1 class="page-404__title">404</h1>
                            <p class="page-404__text">请登录后再访问!</p>
                            <a href="index.jsp" class="page-404__btn">返回主页</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end error -->
        </div>
    </div>
</main>
<!-- end main content -->

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/modal_info.jsp" %>
</body>
</html>