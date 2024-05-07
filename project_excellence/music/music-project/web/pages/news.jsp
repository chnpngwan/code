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
                    <li class="breadcrumb__item breadcrumb__item--active">新闻</li>
                </ul>
            </div>
            <!-- end breadcrumb -->

            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>新闻</h1>
                </div>
            </div>
            <!-- end title -->

            <div class="col-12">
                <ul class="nav nav-tabs main__tabs" id="main__tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1"
                           aria-selected="true"><span>#</span>所有</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2"
                           aria-selected="false"><span>#</span>音乐</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3"
                           aria-selected="false"><span>#</span>评论</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4"
                           aria-selected="false"><span>#</span>采访</a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="tab-content">
            <div class="tab-pane fade show active" id="tab-1" role="tabpanel">
                <div class="row row--grid">
                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/2.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <a href="#" class="post__category">Music</a>
                                <h3 class="post__title"><a
                                        href="pages/pag/article.jsp">汤姆·格伦南“打破互联网”，因为粉丝在虚拟演出期间使服务器过载</a>
                                </h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/3.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <a href="#" class="post__category">Features</a>
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Why do the Golden Globes always
                                    get it
                                    so
                                    wrong?</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 9 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 54</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/1.jpg" alt="">
                            </a>

                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                Music video
                            </a>

                            <div class="post__content">
                                <a href="#" class="post__category">Music</a>
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Foo Fighters share new live
                                    version of
                                    ‘No
                                    Son Of Mine’</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 2 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 61</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/4.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <a href="#" class="post__category">Music</a>
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Foo Fighters分享新的现场版“No
                                    Son Of Mine”</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 2 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 61</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/5.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <a href="#" class="post__category">Music</a>
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Tom Grennan ‘breaks the
                                    internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/6.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <a href="#" class="post__category">Features</a>
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Why do the Golden Globes always
                                    get it
                                    so
                                    wrong?</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 9 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 54</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->
                </div>

                <div class="row row--grid">
                    <div class="col-12">
                        <button class="main__load" type="button">Load more</button>
                    </div>
                </div>
            </div>

            <div class="tab-pane fade" id="tab-2" role="tabpanel">
                <div class="row row--grid">
                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/9.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Tom Grennan ‘breaks the
                                    internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/8.jpg" alt="">
                            </a>

                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                Watch video
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Foo Fighters share new live
                                    version of
                                    ‘No
                                    Son Of Mine’</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 2 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 61</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/7.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Why do the Golden Globes always
                                    get it
                                    so
                                    wrong?</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 9 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 54</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/6.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Tom Grennan ‘breaks the
                                    internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->
                </div>
            </div>

            <div class="tab-pane fade" id="tab-3" role="tabpanel">
                <div class="row row--grid">
                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/2.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Tom Grennan ‘breaks the
                                    internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/3.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Foo Fighters share new live
                                    version of
                                    ‘No
                                    Son Of Mine’</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 2 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 61</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/5.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Why do the Golden Globes always
                                    get it
                                    so
                                    wrong?</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 9 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 54</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->

                    <!-- post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pages/pag/article.jsp" class="post__img">
                                <img src="static/img/posts/8.jpg" alt="">
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pages/pag/article.jsp">Tom Grennan ‘breaks the
                                    internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end post -->
                </div>
            </div>

            <div class="tab-pane fade" id="tab-4" role="tabpanel">
                <div class="row row--grid">
                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pag/article.jsp" class="post__img">
                                <img src="static/img/posts/9.jpg" alt="">
                            </a>

                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                Watch interview
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pag/article.jsp">Tom Grennan ‘breaks the internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->

                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pag/article.jsp" class="post__img">
                                <img src="static/img/posts/1.jpg" alt="">
                            </a>

                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                Watch interview
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pag/article.jsp">Foo Fighters share new live version of
                                    ‘No
                                    Son Of Mine’</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 2 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 61</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->

                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pag/article.jsp" class="post__img">
                                <img src="static/img/posts/7.jpg" alt="">
                            </a>

                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                Watch interview
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pag/article.jsp">Why do the Golden Globes always get it
                                    so
                                    wrong?</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 9 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 54</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->

                    <!-- video post -->
                    <div class="col-12 col-sm-6 col-lg-4">
                        <div class="post">
                            <a href="pag/article.jsp" class="post__img">
                                <img src="static/img/posts/4.jpg" alt="">
                            </a>

                            <a href="http://www.youtube.com/watch?v=0O2aH4XLbto" class="post__video open-video">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M16,10.27,11,7.38A2,2,0,0,0,8,9.11v5.78a2,2,0,0,0,1,1.73,2,2,0,0,0,2,0l5-2.89a2,2,0,0,0,0-3.46ZM15,12l-5,2.89V9.11L15,12ZM12,2A10,10,0,1,0,22,12,10,10,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8,8,0,0,1,12,20Z"/>
                                </svg>
                                Watch interview
                            </a>

                            <div class="post__content">
                                <h3 class="post__title"><a href="pag/article.jsp">Tom Grennan ‘breaks the internet’ as
                                    fans
                                    overload servers during virtual gig</a></h3>
                                <div class="post__meta">
                                    <span class="post__date"><svg xmlns="http://www.w3.org/2000/svg"
                                                                  viewBox="0 0 24 24"><path
                                            d="M12,2A10,10,0,1,0,22,12,10.01114,10.01114,0,0,0,12,2Zm0,18a8,8,0,1,1,8-8A8.00917,8.00917,0,0,1,12,20ZM14.09814,9.63379,13,10.26807V7a1,1,0,0,0-2,0v5a1.00025,1.00025,0,0,0,1.5.86621l2.59814-1.5a1.00016,1.00016,0,1,0-1-1.73242Z"/></svg> 3 小时前</span>
                                    <span class="post__comments"><svg xmlns="http://www.w3.org/2000/svg"
                                                                      viewBox="0 0 24 24"><path
                                            d="M17,9H7a1,1,0,0,0,0,2H17a1,1,0,0,0,0-2Zm-4,4H7a1,1,0,0,0,0,2h6a1,1,0,0,0,0-2ZM12,2A10,10,0,0,0,2,12a9.89,9.89,0,0,0,2.26,6.33l-2,2a1,1,0,0,0-.21,1.09A1,1,0,0,0,3,22h9A10,10,0,0,0,12,2Zm0,18H5.41l.93-.93a1,1,0,0,0,0-1.41A8,8,0,1,1,12,20Z"/></svg> 18</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end video post -->
                </div>
            </div>
        </div>
    </div>
</main>
<!-- end main content -->

<%@ include file="common/footer.jsp" %>
<%@ include file="common/modal_info.jsp" %>
</body>
</html>