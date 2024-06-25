<script setup>
</script>

<template>
<RouterView v-slot="{ Component }">
  <keep-alive>
    <component :is="Component"/>
  </keep-alive>
</RouterView>
</template>

<style scoped>
</style>
