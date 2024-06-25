<script setup>
import banner1 from "@/assets/imgs/banner01.jpg"
import banner2 from "@/assets/imgs/banner02.jpg"
import banner3 from "@/assets/imgs/banner03.jpg"

const banners = [
    {
        number: 0,
        src: banner2,
        active: false,
        title: '限时七折',
        class: 'text-start',
        description: 'Tata时装限时7折,全场顺丰包邮，上门退换.'
    },
    {
        number: 1,
        src: banner1,
        active: true,
        title: '好物上新',
        class: 'text-center',
        description: 'Pefresh春夏换新季，春季新品第一波，新品买一送一.'
    },
    {
        number: 3,
        src: banner3,
        active: false,
        title: '时尚百搭',
        class: 'text-end',
        description: '百搭贝壳包 黑 白 红 [三色可选] 更多好物等您来拿'
    }
]
</script>

<template>
    <div id="banner" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#banner" data-bs-slide-to="0"></button>
            <button type="button" data-bs-target="#banner" data-bs-slide-to="1" class="active" aria-current="true"></button>
            <button type="button" data-bs-target="#banner" data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item" v-for="banner in banners" :class="{'active': banner.active}" :key="banner.number">
                <img :src="banner.src" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block" :class="banner.class">
                    <h1>{{banner.title}}</h1>
                    <p>{{banner.description}}</p>
                    <p><a class="btn btn-primary btn-lg rounded-0" href="#">了 解 更 多</a></p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#banner" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#banner" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</template>

<style scoped>

</style>