<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title><link rel="shortcut icon" href="static/img/favicon.ico"/>

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
                    <li class="breadcrumb__item breadcrumb__item--active">恢复密码</li>
                </ul>
            </div>
            <!-- end breadcrumb -->
            <!-- authorization form -->
            <div class="col-12">
                <div class="sign">
                    <div class="sign__content">
                        <form class="sign__form">
                            <a href="index.jsp" class="sign__logo">
                                <img src="static/img/logo.svg" alt="">
                            </a>
                            <div class="sign__group">
                                <input type="text" class="sign__input" id="email" placeholder="电子邮箱">
                            </div>
                            <%-- <div class="sign__group sign__group--checkbox">--%>
                            <%--    <input id="remember" name="remember" type="checkbox" checked="checked">--%>
                            <%--        <label for="remember">我同意<a href="pages/pag/privacy.jsp">隐私策略</a></label>--%>
                            <%-- </div>--%>
                            <button class="sign__btn" type="button">发送</button>
                            <span class="sign__text">我们将会把密码发送至您的邮箱</span>
                        </form>
                        <script>
                            $(function () {
                                $("button.sign__btn").click(function () {
                                    var emailText = $("#email").val();
                                    //2 创建正则表达式对象
                                    // var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                                    var emailPatt = /^[0-9a-zA-Z]+([.-_]*[0-9a-zA-Z]+)*@([0-9a-zA-Z]+[-_]*[0-9a-zA-Z]+.)+[0-9a-zA-Z]{2,6}$/;
                                    if (!emailPatt.test(emailText) || emailText == "") {
                                        layer.msg("邮箱为空或格式不合法", {
                                            icon: 2,
                                            time: 2000
                                        })
                                        return false;
                                    } else {
                                        $.get("UserServlet", "action=forgotpassword&email=" + emailText, function (msg) {
                                            if (msg == null) {
                                                layer.msg("您输入的邮箱并没有被注册,请先注册!", {
                                                    icon: 2,
                                                    time: 2000
                                                })
                                            } else {
                                                layer.msg("您的密码为: " + msg.password, {
                                                    icon: 1,
                                                    time: 4000
                                                })
                                            }
                                        }, "json");
                                    }
                                })
                            })
                        </script>
                    </div>
                </div>
            </div>
            <!-- end authorization form -->
        </div>
    </div>
</main>
<!-- end main content -->
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/modal_info.jsp" %>
</body>
</html>