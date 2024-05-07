<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <script src="static/js/jquery-1.7.2.js"></script>
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
                    <li class="breadcrumb__item breadcrumb__item--active">购物车</li>
                </ul>
            </div>
            <!-- end breadcrumb -->
            <!-- title -->
            <div class="col-12">
                <div class="main__title main__title--page">
                    <h1>购物车</h1>
                </div>
            </div>
            <!-- end title -->
        </div>
        <div class="row row--grid">
            <!-- cart -->
            <div class="cart">
                <div class="cart__table-wrap">
                    <div class="cart__table-scroll">
                        <table class="cart__table">
                            <thead>
                            <tr>
                                <th>
                                    <label for="selectAll">全选<input id="selectAll" type="checkbox"></label>
                                </th>
                                <th>产品</th>
                                <th>标题</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>价格</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr style="display: none">
                                <td>
                                    <input type="checkbox" class="_checkbox">
                                </td>
                                <td>
                                    <div class="cart__img">
                                        <img src="static/img/store/item2.jpg" alt="">
                                    </div>
                                </td>
                                <td><a href="javascript:void (0)">麦克风 R4</a></td>
                                <td><span class="cart__price cart__danjia">$699<span>$oldprice</span></span></td>
                                <td>
                                    <div class="cart__amount">
                                        <button type="button" class="btn1">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M19,11H5a1,1,0,0,0,0,2H19a1,1,0,0,0,0-2Z"/>
                                            </svg>
                                        </button>
                                        <input type="text" name="count" value="1">
                                        <button type="button" class="btn2">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </td>
                                <td><span class="cart__price cart__totalprice">$699</span></td>
                                <td>
                                    <button class="cart__delete" type="button">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                            <path d="M13.41,12l6.3-6.29a1,1,0,1,0-1.42-1.42L12,10.59,5.71,4.29A1,1,0,0,0,4.29,5.71L10.59,12l-6.3,6.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0L12,13.41l6.29,6.3a1,1,0,0,0,1.42,0,1,1,0,0,0,0-1.42Z"></path>
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="cart__info">
                    <div class="cart__systems" style="float: left !important;font-size: 20px">
                        <span>购物车总共<span id="pageTotalCount"></span>件商品</span>
                    </div>
                    <div class="cart__systems">
                        <i class="pf pf-visa"></i>
                        <i class="pf pf-mastercard"></i>
                        <i class="pf pf-paypal"></i>
                    </div>
                    <div class="cart__total" style="margin-left: 250px">
                        <p>总价:</p>
                        <span>$0.00</span>
                    </div>
                    <!-- promo -->
                    <div class="cart__promo">
                        <button class="sign__btn">去结算</button>
                        <button class="sign__input">清空购物车</button>
                    </div>
                </div>
            </div>
            <script>
                //单选
                $("tbody input._checkbox").click(function () {
                    $(this).toggleClass('checked', this.checked);
                    if (!$(this).prop('checked')) {
                        $("table :checkbox:eq(0)").prop("checked", this.checked).toggleClass('checked', this.checked);
                    }
                });
                //全选/全不选
                $("#selectAll").change(function () {
                    $("table :checkbox").prop("checked", this.checked).toggleClass('checked', this.checked);
                    myCheckTotalPrice = 0.0;
                    if ($("table :checkbox").prop("checked")) {
                        $("table :checkbox:gt(0)").each(function () {
                            let value = $(this).parents("tr").find("span.cart__totalprice").html().slice(1);
                            myCheckTotalPrice += parseFloat(value);
                            $("div.cart__total span").html("$" + myCheckTotalPrice.toFixed(2));
                        })
                    } else {
                        $("div.cart__total span").html("$0.00");
                    }
                })
                //去结算
                $("button.sign__btn").click(function () {
                    let ids = "";
                    var checkedCount = $("input._checkbox:not(:first):checked").parents("tr").each(function () {
                        ids += $(this).attr("cartid") + ",";
                    });
                    if (ids === "") {
                        layer.msg("此少勾选一项", {
                            icon: 2,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        });
                    } else {
                        window.location.href = "OrderServlet?action=createOrder&ids=" + ids;
                    }
                })

                var myCheckTotalPrice = 0;
                var totalpricehtml;
                var pageinfo;
                $(document).on("change", "input._checkbox:not(:first)", function () {
                    if ($(this).parents("table").length > 0 && $(this).parents("tr").length > 0) {
                        var value = $(this).parents("tr").find("span.cart__totalprice").html().slice(1);
                        if (this.checked) {
                            myCheckTotalPrice += parseFloat(value);
                        } else {
                            myCheckTotalPrice -= parseFloat(value);
                        }
                        $("div.cart__total span").html("$" + myCheckTotalPrice.toFixed(2));
                    } else {
                        alert("Checkbox is not in a valid tr element or the checkbox is not in a table");
                    }
                    if ($("input._checkbox:not(:first):checked").length === 0) {
                        $("div.cart__total span").html("$0.00");
                    }
                })


                $(function () {
                    $('input._checkbox').prop('checked', false);
                    var pageNo = 1;
                    mycart(pageNo);
                    //滚动事件.加载新数据
                    $("div.cart__table-wrap").scroll(function () {
                        if (this.scrollTop + this.clientHeight + 1 > this.scrollHeight) {
                            if (pageinfo.pageNo < pageinfo.pageTotal) {
                                pageNo = pageNo + 1;
                                mycart(pageNo);
                            }
                        }
                    })
                });
                //减
                $("button.btn1").click(function () {
                    let count = parseInt($(this).next("input[name=count]").val());
                    if (count > 1) {
                        count -= 1;
                        $(this).next("input[name=count]").val(count);
                        if ($(this).parents("tr").find("input._checkbox").prop('checked')) {
                            let value = $(this).parents("tr").find("span.cart__danjia").html().slice(1);
                            myCheckTotalPrice -= parseFloat(value);
                            $("div.cart__total span").html("$" + myCheckTotalPrice.toFixed(2));
                        }
                    }
                    totalpricehtml = $(this).parents("tr").find("span.cart__totalprice");
                    let id = $(this).parents("tr").attr("cartid");
                    updatetotalprice(id, count, totalpricehtml);
                })
                //加
                $("button.btn2").click(function () {
                    let count = parseInt($(this).prev("input[name=count]").val());
                    count += 1;
                    $(this).prev("input[name=count]").val(count);
                    let id = $(this).parents("tr").attr("cartid");
                    totalpricehtml = $(this).parents("tr").find("span.cart__totalprice");
                    if ($(this).parents("tr").find("input._checkbox").prop('checked')) {
                        let value = $(this).parents("tr").find("span.cart__danjia").html().slice(1);
                        myCheckTotalPrice += parseFloat(value);
                        $("div.cart__total span").html("$" + myCheckTotalPrice.toFixed(2));
                    }
                    updatetotalprice(id, count, totalpricehtml);
                })

                function updatetotalprice(id, count, totalpricehtml) {
                    $.post("CartItemServlet", "action=updateCountTotalPrice&id=" + id + "&count=" + count, function (msg) {
                        totalpricehtml.html("$" + parseFloat(msg).toFixed(2));
                    }, "json");
                }

                function mycart(pageNo) {
                    $.post("CartItemServlet", "action=findCartByUid&pageNo=" + pageNo, function (msg) {
                        for (let i = 0; i < msg.items.length; i++) {
                            let newdiv = $("tbody tr:first").clone(true);
                            newdiv.css("display", "").attr("cartid", msg.items[i].id);
                            newdiv.find("div.cart__img img").attr("src", msg.items[i].faceimg);
                            newdiv.find("td a").html(msg.items[i].pname).attr("pid", msg.items[i].pid);
                            newdiv.find("div.cart__amount input").val(msg.items[i].count);
                            newdiv.find("span.cart__price").html("$" + msg.items[i].price);
                            newdiv.find("span.cart__price span").html("$" + msg.items[i].oldprice);
                            newdiv.find("span.cart__totalprice").html("$" + parseFloat(msg.items[i].totalPrice).toFixed(2));
                            newdiv.appendTo($("tbody"));
                        }
                        pageinfo = msg;
                        $("#pageTotalCount").html(msg.pageTotalCount);
                    }, "json")
                }

                //单个删除
                $("button.cart__delete").click(function () {
                    let tr = $(this).parents("tr");
                    let id = tr.attr("cartid");

                    function deleteByid(id) {
                        $.post("CartItemServlet", "action=deleteById&id=" + id, function (msg) {
                            if (msg == '1') {
                                layer.msg("删除成功", {
                                    icon: 1,
                                    time: 2000
                                });
                                tr.remove();
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
                //清空
                $("button.sign__input").click(function () {
                    function clearAll() {
                        $.get("CartItemServlet", "action=clearCart", function (msg) {
                            layer.msg(msg, {
                                icon: 1,
                                time: 2000
                            })
                        }, "json");
                    }

                    clearAll();
                })
                $("tbody td a").click(function () {
                    window.location.href = "ProduceServlet?action=toProduce&id=" + $(this).attr("pid");
                })
            </script>
            <!-- end cart -->
        </div>
        <%@ include file="../common/partners.jsp" %>
    </div>
</main>
<!-- end main content -->
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/modal_info.jsp" %>
</body>
</html>