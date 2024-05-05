<template>
  <el-menu default-active="/Home"
           text-color="#84a2d4"
           active-text-color="#ffd04b"
           style="height: 91vh"
           :collapse="isCollapse"
           :collapse-transition="false"
           router
  >
    <el-menu-item index="/Home">
      <i class="el-icon-s-home"></i>
      <span slot="title">首页</span>
    </el-menu-item>

    <el-menu-item index="/Category">
      <i class="el-icon-menu"></i>
      <span slot="title">分类管理</span>
    </el-menu-item>

    <el-menu-item index="/Commodity">
      <i class="el-icon-s-goods"></i>
      <span slot="title">商品管理</span>
    </el-menu-item>

    <el-menu-item index="/Order">
      <i class="el-icon-s-order"></i>
      <span slot="title">订单管理</span>
    </el-menu-item>

    <el-menu-item index="/User">
      <i class="el-icon-s-custom"></i>
      <span slot="title">用户管理</span>
    </el-menu-item>

  </el-menu>
</template>

<script>
export default {
  name: "Menu",
  data(){
    return{
    }
  },
  props:{
    isCollapse:Boolean
  }
}
</script>

<style scoped>
.el-menu{
  background-color: rgba(43, 56, 105, 0.89);
}
</style>