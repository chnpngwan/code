<script setup>
import GoodsItem from "@/components/goods/GoodsItem.vue";

defineProps({
    goodsList: {type: Array}
})
</script>

<template>
<div class="row row-cols-xl-5 row-cols-lg-4 row-cols-md-3 row-cols-2 mt-5">
    <div class="col mb-3" v-for="goods in goodsList">
        <GoodsItem :goods="goods"/>
    </div>
</div>
</template>

<style scoped>

</style>