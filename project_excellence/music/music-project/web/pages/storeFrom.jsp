<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
          <li class="breadcrumb__item breadcrumb__item--active">商店</li>
        </ul>
      </div>
      <!-- end breadcrumb -->
      <!-- title -->
      <div class="col-12">
        <div class="main__title main__title--page">
          <h1>商店</h1>
        </div>
      </div>
      <!-- end title -->
    </div>
    <div class="row row--grid">
      <div class="col-12">
        <form class="main__filter">
          <div class="main__filter-search">
            <input type="hidden" name="action" value="searchProducePage">
            <input type="text" name="pname" placeholder="Search...">
            <button id="searchProduce">
              <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path d="M21.71,20.29,18,16.61A9,9,0,1,0,16.61,18l3.68,3.68a1,1,0,0,0,1.42,0A1,1,0,0,0,21.71,20.29ZM11,18a7,7,0,1,1,7-7A7,7,0,0,1,11,18Z"></path>
              </svg>
            </button>
          </div>
          <div class="main__filter-wrap">
            <select class="main__select" name="genre_id">
              <option value="0">所有流派</option>
              <option value="1">另类</option>
              <option value="2">蓝调</option>
              <option value="3">古典</option>
              <option value="4">国家</option>
            </select>
          </div>
        </form>
      </div>
    </div>
    <div class="row row--grid" id="Produce">
      <div class="col-6 col-sm-4 col-lg-3" style="display: none">
        <div class="product" produceId="">
          <a href="javascript:void (0)" class="product__img">
            <img src="static/img/store/item1.jpg" alt="">
          </a>
          <h3 class="product__title"><a href="javascript:void (0)">黑胶唱片播放器</a></h3>
          <span class="product__price">$1 099</span>
          <span class="product__new">新</span>
        </div>
      </div>
    </div>
    <script>
      var pageinfo;
      var pageNo = 1;

      function mypage(pageNo) {
        $.post("ProduceServlet", $("form.main__filter").serialize() + "&pageNo=" + pageNo, function (msg) {
          pageinfo = msg;
          for (let i = 0; i < msg.items.length; i++) {
            let newdiv = $("#Produce div:first").clone(true);//clone(true)
            newdiv.attr("ddd", "delete");//给这些克隆出来的元素添加一个属性,方便后面删除他们
            newdiv.css("display", "").find(".product").attr("produceId", msg.items[i].id);
            newdiv.find("a.product__img img").attr("src", msg.items[i].imga);
            newdiv.find("h3.product__title a").html(msg.items[i].pname);
            newdiv.find("span.product__price").html("$" + msg.items[i].price);
            newdiv.find("span.product__new").html("库存 : " + msg.items[i].repertory);
            newdiv.appendTo($("#Produce"));
          }
        }, "json")
      }

      $(function () {
        mypage(1);
        $("#searchProduce").click(function () {
          $("div[ddd=delete]").remove();
          mypage(1);
          if (pageNo < pageinfo.pageTotal) {
            $("button.main__load").click();
          }
        })
        $("button.main__load").click(function () {
          if (pageNo < pageinfo.pageTotal) {
            pageNo += 1;
            mypage(pageNo);
            if (pageNo === pageinfo.pageTotal) {
              $(this).remove();
            }
          }
        })
        $("div.product a.product__img").click(function () {
          var id = $(this).parent().attr("produceId");
          window.location.href = "ProduceServlet?action=toProduce&id=" + id;
        })
        $("div.product h3.product__title a").click(function () {
          var id = $(this).parent().parent().attr("produceId");
          window.location.href = "ProduceServlet?action=toProduce&id=" + id;
        })
      })
    </script>
    <button class="main__load" type="button">加载更多</button>
  </div>
</main>
<!-- end main content -->
<%@ include file="common/footer.jsp" %>
<%@ include file="common/modal_info.jsp" %>
</body>
</html>