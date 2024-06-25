<script setup>

</script>

<template>

    <ul class="navbar-nav me-auto">
        <li class="nav-item">
            <RouterLink to="/" class="nav-link">首页</RouterLink>
        </li>
        <li class="nav-item dropdown">
            <RouterLink to="/" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">商品分类</RouterLink>
            <ul class="dropdown-menu">
                <li><RouterLink to="/type/美妆个护" class="dropdown-item">美妆 | 个护</RouterLink></li>
                <li><RouterLink to="/type/手机电脑" class="dropdown-item">手机 | 电脑</RouterLink></li>
                <li><RouterLink to="/type/家具厨具" class="dropdown-item">家具 | 厨具</RouterLink></li>
                <li><RouterLink to="/type/礼品鲜花" class="dropdown-item">礼品 | 鲜花</RouterLink></li>
                <li><RouterLink to="/type/食品生鲜" class="dropdown-item">食品 | 生鲜</RouterLink></li>
                <li><RouterLink to="/type/图书文娱" class="dropdown-item">图书 | 文娱</RouterLink></li>
            </ul>
        </li>
        <li class="nav-item">
            <RouterLink to="/" class="nav-link">购物车</RouterLink>
        </li>
        <li class="nav-item">
            <RouterLink to="/" class="nav-link">收藏夹</RouterLink>
        </li>
        <li class="nav-item">
            <RouterLink to="/" class="nav-link">商家服务</RouterLink>
        </li>
    </ul>

</template>

<style scoped>

</style>