<script setup>
defineProps({
    keyword: {type: String}
})
</script>

<template>
<div class="p-5 bg-secondary-subtle">
    <h5>没有搜索结果：<span class="text-danger">{{keyword}}</span> </h5>
</div>
</template>

<style scoped>

</style>