<template>
  <div id="app">
    <bigScreen />
  </div>
</template>

<script>
import bigScreen from "./bigScreen/index.vue";

export default {
  name: "app",
  components: {
    bigScreen,
  },
};
</script>

<style lang="less">
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  width: 100%;
  height: 100%;
}
</style>
