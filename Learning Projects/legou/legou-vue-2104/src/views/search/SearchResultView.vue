<script setup>

import {getGoodsListBySearchApi} from "@/apis/goods.js";
import {usePaginationStore} from "@/stores/pagination.js";
import {storeToRefs} from "pinia";
import {watchEffect} from "vue";
import SearchDataRender from "@/components/search/SearchDataRender.vue";
import SearchNoData from "@/components/search/SearchNoData.vue";

const paginationStore = usePaginationStore();
const {keyword, page, size, dataList, total} = storeToRefs(paginationStore)

watchEffect(() => {
    getGoodsListBySearchApi(keyword.value, page.value, size.value)
        .then(resp => resp.data)
        .then(data => {
            dataList.value = data.goodsList
            total.value = data.totalGoods
        })
    window.scrollTo({top: 0, left: 0, behavior: "smooth"})
})


</script>

<template>
    <div class="container mt-5 py-5">
        <!--有商品组件-->
        <SearchDataRender v-if="total > 0"/>
        <!--无商品组件-->
        <SearchNoData v-else :keyword="keyword"/>
    </div>

</template>

<style scoped>

</style>