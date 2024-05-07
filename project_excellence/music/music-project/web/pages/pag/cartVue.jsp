<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Volta – 唱片公司和音乐流媒体</title>
    <link rel="shortcut icon" href="static/img/favicon.ico"/>
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
    <base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
</head>
<body>
<%@ include file="../common/NAV.jsp" %>
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
            <%--            <div class="col-12 col-lg-8">--%>
            <!-- cart -->
            <div class="cart" id="tapp">
                <div class="cart__table-wrap">
                    <div class="cart__table-scroll">
                        <table class="cart__table" border="1">
                            <thead>
                            <tr>
                                <th><span class="item-check-btn" :class="{'check': checkAllFlag}"
                                          @click="checkAll(true)">
                                    <svg class="icon icon-ok"><use xlink:href="#icon-ok"></use></svg>
                                </span><span @click="checkAll(true)"> 全选 </span></th>
                                <th>产品</th>
                                <th>标题</th>
                                <th>单价</th>
                                <th>数量</th>
                                <th>价格</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>
                                    <a href="javascript:void (0);" class="item-check-btn"
                                       v-bind:class="{'check':item.checked} " @click="selectedProduct(item)">
                                        <svg class="icon icon-ok">
                                            <use xlink:href="#icon-ok"></use>
                                        </svg>
                                    </a>
                                    <%--                                    <input class="cart__check" type="radio"/>--%>
                                </td>
                                <td>
                                    <div class="cart__img">
                                        <img src="static/img/store/item2.jpg" alt="">
                                    </div>
                                </td>
                                <td><a href="pages/pag/product.jsp">麦克风 R4</a></td>
                                <td><span class="cart__price">$699<span>$oldprice</span></span></td>
                                <td>
                                    <div class="cart__amount">
                                        <button type="button" onclick="decreaseCount()">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M19,11H5a1,1,0,0,0,0,2H19a1,1,0,0,0,0-2Z"/>
                                            </svg>
                                        </button>
                                        <input type="text" value="1">
                                        <button type="button" onclick="increaseCount()">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                                <path d="M19,11H13V5a1,1,0,0,0-2,0v6H5a1,1,0,0,0,0,2h6v6a1,1,0,0,0,2,0V13h6a1,1,0,0,0,0-2Z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </td>
                                <td><span class="cart__price">$699</span></td>
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
                    <!-- end promo -->
                    <div class="cart__systems">
                        <i class="pf pf-visa"></i>
                        <i class="pf pf-mastercard"></i>
                        <i class="pf pf-paypal"></i>
                    </div>
                    <div class="cart__total" style="margin-left: 500px">
                        <p>总价:</p>
                        <span>${{totalMoney}}</span>
                    </div>
                    <!-- promo -->
                    <div class="cart__promo">
                        <button class="sign__btn">去结算</button>
                        <button class="sign__input">清空购物车</button>
                    </div>
                </div>
            </div>
            <script>
                var produceList;
                var pageNo = 1;
                var count = parseInt($("input[name=count]").val());
                var produceId = $("input[name=pid]").val();
                $(function () {
                    getproduceList();
                    mycart(pageNo);
                })

                function mycart(pageNo) {
                    $.post("CartItemServlet", "action=&pageNo=" + pageNo, function (msg) {
                        produceList = msg;
                    }, "json")
                }

                var vm = new Vue({
                    el: "#tapp",
                    data: {
                        totalMoney: 0, // 总金额
                        productList: [], // 定义一个数组
                        checkAllFlag: false, // 定义是否全选
                        curProduct: '', // 保存删除的商品信息
                        delFlag: false         // 默认弹出框为false
                    },
                    filters: {
                        // 过滤器 对数据实现转换 可以定义全局的 也可以定义局部的 这个是局部的 只有vue的实例才可以使用
                        formatMoney: function (value) {
                            // 默认接收一个参数
                            return "¥ " + value.toFixed(2) + " 元"; // 返回一个¥ 加上2位小数
                        }
                    },
                    methods: {
                        cartView: function () {
                            // 通过this 来调用这个 http方法
                            // 通过.then 方法来接受回调  res 就是我们最终拿到的结果
                            // 这个也是可以传递参数的
                            var _this = this;
                            this.totalMoney = 0.00;
                            _this.productList = produceList;
                        },
                        // 点击 加减 的方法
                        changeMoney: function (product, way) {
                            if (way > 0) {
                                //当 way>0 就是点击的 +
                                product.productQuentity++; // 数量增加  就相当于 item 的productQuentity
                            } else {
                                product.productQuentity--; // 否则数量减少
                                if (product.productQuentity < 0) {
                                    //
                                    product.productQuentity = 0;
                                }
                            }
                            this.caleTotalPrice();
                        },
                        //如何让Vue 监听一个不存在的变量 单选操作
                        selectedProduct: function (item) {
                            // 接收的参数
                            if (typeof item.checked == 'undefined') {
                                // 怎样判断一个对象的变量存不存在 看他的typeof == undedined
                                /**
                                 * 两种全局注册和局部注册  让vue 来监听
                                 * 第一个参数 要添加的对象
                                 * 第二个参数 添加的变量
                                 * 第三个参数 添加的值是什么
                                 * 意思是我们通过 Vue全局注册 往item变量中注册一个checked 属性 它的值是 true
                                 *
                                 * this.$set(item,"checked",true)  局部注册
                                 */
                                Vue.set(item, "checked", true);
                            } else {
                                item.checked = !item.checked;
                            }
                            this.caleTotalPrice();
                        },
                        // 定义全选 函数
                        checkAll: function (flag) {
                            this.checkAllFlag = flag;
                            var _this = this;
                            this.productList.forEach(function (item, index) {
                                // 用forEach来遍历 productList
                                if (typeof item.checked == 'undefined') {
                                    // 先判断 是否有这个 item.checked
                                    Vue.set(item, "checked", _this.checkAllFlag); // 没有 先注册
                                } else {
                                    item.checked = _this.checkAllFlag;
                                }
                            });
                            this.caleTotalPrice();
                        },
                        // 计算选中商品的总价
                        caleTotalPrice: function () {
                            var _this = this;
                            _this.totalMoney = 0;
                            _this.productList.forEach(function (item, index) {
                                if (item.checked) {
                                    _this.totalMoney += item.productPrice * item.productQuentity;
                                }
                            });
                        },
                        // 点击删除 出现弹框
                        delConfirm: function (item) {
                            this.delFlag = true;
                            this.curProduct = item; // 保存当前删除的对象
                        },
                        // 点击弹框里面的 ok 确认删除
                        delProduct: function () {
                            // 通过indexof 来搜索当前选中的商品 找到索引 index
                            var index = this.productList.indexOf(this.curProduct);
                            // 获取索引 后删除元素 splice(index，1) 两个参数  第一个参数索引 第二个参数 删除个数
                            this.productList.splice(index,
                                1); // 从当前索引开始删，删除一个元素
                            this.delFlag = false; // 删除后 弹框消失
                        }
                    }

                })

                function decreaseCount() {
                    if (count > 1) {
                        count -= 1;
                        $("div.article__content input[name=count]").val(count);
                        $.post("CartItemServlet", "action=&count=" + count + "id" + $("").attr("cartid"), function () {

                        }, "json")
                    }
                }

                function increaseCount() {
                    count += 1;
                    $("div.article__content input[name=count]").val(count);
                }
            </script>
            <!-- end cart -->
            <%--            </div>--%>

            <%--
            <form action="#" class="cart__promo">
                <input type="text" class="sign__input" placeholder="Promo code">
                <button type="button" class="sign__btn">应用</button>
            </form>
            <div class="col-12 col-lg-4">
                <!-- checkout -->
                <form action="#" class="sign__form sign__form--cart">
                    <h4 class="sign__title">Checkout</h4>
                    <div class="sign__group">
                        <input type="text" name="name" class="sign__input" placeholder="John Doe">
                    </div>

                    <div class="sign__group">
                        <input type="text" name="email" class="sign__input" placeholder="JohnDoe@email.com">
                    </div>

                    <div class="sign__group">
                        <input type="text" name="phone" class="sign__input" placeholder="+1 234 567-89-00">
                    </div>
                    <div class="sign__group sign__group--row">
                        <label class="sign__label">Payment method:</label>

                        <ul class="sign__radio">
                            <li>
                                <input id="type1" type="radio" name="type" checked="">
                                <label for="type1">微信</label>
                            </li>
                            <li>
                                <input id="type2" type="radio" name="type">
                                <label for="type2">支付宝</label>
                            </li>
                            <li>
                                <input id="type3" type="radio" name="type">
                                <label for="type3">银行卡</label>
                            </li>
                        </ul>
                    </div>
                    <div class="sign__group sign__group--row">
                        <span class="sign__text sign__text--small">Lorem Ipsum的段落有许多变体，但大多数都遭受了某种形式的改变。</span>
                    </div>
                    <button type="button" class="sign__btn">完成</button>
                </form>
                <!-- end checkout -->
            </div>
            --%>
        </div>
        <%@ include file="../common/partners.jsp" %>
    </div>
</main>
<!-- end main content -->
<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/modal_info.jsp" %>
</body>
</html>