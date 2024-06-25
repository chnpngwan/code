<script setup>
defineProps({
    goods: {type: Object}
})
</script>

<template>
<div class="card rounded-0">
    <img :src="goods.url" alt="" width="100%">
    <div class="card-body">
        <p class="truncate" v-html="goods.title"></p>
        <p class="fw-lighter">{{goods.type}}</p>
        <p class="text-danger">{{goods.price}} ￥</p>
    </div>
    <!--按钮分出来-->
    <div class="card-footer bg-white">
        <button class="btn btn-outline-danger rounded-0 col-3 me-2"><i class="bi bi-heart"></i></button>
        <button class="btn btn-danger rounded-0 col-3"><i class="bi bi-cart-plus"></i></button>
    </div>
</div>
</template>

<style scoped>
.truncate {
    height: 70px;
    overflow: hidden;
    -webkit-line-clamp: 3;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-box-orient: vertical;
}
</style>