<template>
  <div id="main">
    <div class="left">
      <leftMenu></leftMenu>
    </div>
    <div class="right">
      <RouterView></RouterView>
    </div>
  </div>
</template>

<script>
import { RouterView } from "vue-router";
import leftMenu from "../components/leftMenu.vue";
export default {
  data() {
    return {};
  },
  components: { leftMenu },
};
</script>

<style lang="less">
#main {
  height: 100vh;
  width: 100vw;
  display: flex;
  .left {
    flex: 1;
    height: 100vh;
    border-right: 2px solid #dcdfe6;
  }
  .right {
    flex: 5;
    height: 100vh;
    .img{
      width: 50px;
      height: 50px; 
      object-fit: cover;
    }
    @title-height: 12vh;
    .manage-main {
      width: 100%;
      height: 100vh-@title-height;
      padding: 0;
      .selector {
        padding-left: 10px;
        height: vh;
      }
    }
    .manage-title {
      width: 100%;
      height: @title-height;
      text-align: center;
      font-size: 36px;
      line-height: @title-height;
    }
  }
}
</style>