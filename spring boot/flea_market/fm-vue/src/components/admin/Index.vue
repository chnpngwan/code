<template>
  <el-container style="height: 100%; border: 1px solid #eee">

    <el-header style="text-align: right; font-size: 12px;height: 100%;margin-left: -1px">
      <Header @doCollapse="doCollapse" :icon_fold="icon_fold"></Header>
    </el-header>

    <el-container style="height: 100%">
      <el-aside :width="aside_width" style="height: 100%;margin-left: -1px">
        <Menu :isCollapse="isCollapse"></Menu>
      </el-aside>

      <el-main style="height: 100%">
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script>
import Menu from "@/components/admin/Menu";
import Header from "@/components/admin/Header";
export default {
  name: "Index",
  components: {Header, Menu},
  data() {
    return {
      isCollapse:false,
      aside_width:'200px',
      icon_fold:'el-icon-s-fold'
    }
  },
  methods: {
    doCollapse() {
      // console.log("click...doCollapse")
      this.isCollapse = !this.isCollapse

      if (this.isCollapse) {//折叠
        this.aside_width = '64px';
        this.icon_fold = 'el-icon-s-unfold'
      } else {//展开
        this.aside_width = '200px';
        this.icon_fold = 'el-icon-s-fold'
      }
    }
  }

}
</script>

<style scoped>
  .el-header {
    background-color: rgba(36, 48, 94, 0.89);
    color: #333;
    line-height: 60px;
  }

</style>