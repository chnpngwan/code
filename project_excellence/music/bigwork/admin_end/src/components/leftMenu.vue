<template>
  <div class="username">{{ $store.state.admin.username }}</div>
  <el-menu
    default-active="1"
    class="el-menu-vertical-demo"
    @open="handleOpen"
    @close="handleClose"
  >
    <RouterLink to="/manage/userManage">
      <el-menu-item index="1">
        <template #title>
          <el-icon><location /></el-icon>
          <span>用户管理</span>
        </template>
      </el-menu-item>
    </RouterLink>
    <RouterLink to="/manage/videoManage">
      <el-menu-item index="2">
        <template #title>
          <el-icon><icon-menu /></el-icon>
          <span>视频管理</span>
        </template>
      </el-menu-item>
    </RouterLink>
    <el-sub-menu index="3">
      <template #title>
        <el-icon><setting /></el-icon>
        <span>审核</span>
      </template>
      <el-menu-item-group>
        <RouterLink to="/manage/check/video">
          <el-menu-item index="1-1">视频审核</el-menu-item>
        </RouterLink>
        <RouterLink to="/manage/check/teacher">
          <el-menu-item index="1-2">教师审核</el-menu-item>
        </RouterLink>
      </el-menu-item-group>
    </el-sub-menu>
  </el-menu>
</template>

<script>
import { RouterLink } from "vue-router";
export default {};
</script>

<style>
.el-menu{
  border: 0 !important;
}
.username {
  width: 100%;
  text-align: center;
  font-size: 24px;
  margin: 30px 0 10px 0;
}
</style>