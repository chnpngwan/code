<template>
  <div class="popup" v-show="show" @click="closePopup">
    <div class="mask"></div>
    <div class="container" @click.stop>
      <div class="top">
        <el-icon size="20" @click="closePopup"><Close /></el-icon>
      </div>
      <slot name="main"></slot>
    </div>
  </div>
</template>

<script>
import { Close } from "@element-plus/icons-vue";

export default {
  props: {
    show: {
      type: Boolean,
      required: true,
    },
    hidden: {
      type: Function,
      required: true,
    },
  },
  methods: {
    closePopup() {
      this.hidden();
    },
  },
  components: {
    Close,
  },
};
</script>

<style scoped lang="less">
.popup {
  position: fixed;
  height: 100%;
  width: 100%;
  left: 0;
  top: 0;
  z-index: 10;

  .mask {
    position: fixed;
    left: 0;
    top: 0;
    height: 100%;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.1);
  }

  .container {
    position: relative;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 10px;
    border-radius: 20px;
    max-width: 90vw;
    max-height: 90vh;
    overflow: auto;
    box-sizing: border-box;
    .top {
      text-align: right;
      display: block; /* 添加此行 */
      margin-bottom: 10px; /* 根据需要调整间距 */
    }
  }
}
</style>