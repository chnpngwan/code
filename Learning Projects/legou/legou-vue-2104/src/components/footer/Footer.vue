<script setup>
const footerItem = [
    {
        title: '配送方式',
        context: ['上门自提','24小时达','配送服务查询','配送费用标准','联系客服']
    },
    {
        title: '支付方式',
        context: ['货到付款','在线支付','分期付款','公司转账']
    },
    {
        title: '售后服务',
        context: ['售后政策','价格保护','退款说明','返修|退换货','取消订单']
    }
]
</script>

<template>
    <div class="container">

        <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 my-5 py-5 border-top">
            <div class="col">
                <a href="#" class="d-flex mb-3">
                    <i class="bi bi-shop-window display-5 text-danger"></i>
                </a>
                <p class="text-muted">© 2024</p>
            </div>
            <div class="col"></div>
            <div class="col" v-for="item in footerItem">
                <h5 class="text-danger">{{item.title}}</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2" v-for="c in item.context">
                        <a href="#" class="nav-link p-0 text-muted">{{c}}</a>
                    </li>
                </ul>
            </div>
        </footer>

    </div>
</template>

<style scoped>

</style>