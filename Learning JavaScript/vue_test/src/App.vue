<template>
  <div id="app">
    <TestVews></TestVews>
  </div>
</template>

<script>
import TestVews from './components/TestVews.vue'

export default {
  name: 'App',
  components: {
    TestVews
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
