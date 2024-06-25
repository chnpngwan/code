<script setup>

import GoodsResponsiveRow from "@/components/goods/GoodsResponsiveRow.vue";
import {usePaginationStore} from "@/stores/pagination.js";
import {storeToRefs} from "pinia";
import SearchPaginationButtons from "@/components/search/SearchPaginationButtons.vue";

const paginationStore = usePaginationStore();
const {dataList} = storeToRefs(paginationStore)

</script>

<template>
<!--商品列表-->
    <GoodsResponsiveRow :goods-list="dataList"/>
<!--分页-->
    <SearchPaginationButtons/>
</template>

<style scoped>

</style>