<template>
  <div class="popup" v-if="show">
    <div class="mask" @click="closePopup"></div>
    <div class="container">
        <div class="top">
            <el-icon size="20" @click="closePopup"><Close /></el-icon>
        </div>
      <slot name="main"></slot>
    </div>
  </div>
</template>

<script>
import {Close} from "@element-plus/icons-vue"
export default {
  data() {
    return {};
  },
  methods: {
    closePopup(){
        this.hidden()
    }
  },
  props: ["show","hidden"],
  components:{Close}
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
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);

    background-color: #fff;
    width: fit-content;
    height: fit-content;
    padding: 10px;
    border-radius: 20px;
    
    .top{
        text-align: right;
    }
  }
}
</style>