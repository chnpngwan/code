<template>
  <el-container>
    <el-aside width="200px" style="margin-top: 50px">
      <h1>个人中心</h1>
      <el-menu
        :default-active="$route.path"
        class="el-menu-vertical-demo"
        :router="true"
      >
        <el-menu-item
          :index="item.path"
          v-for="item in menuList"
          :key="item.id"
        >
          {{ item.name }}
        </el-menu-item>
      </el-menu>
    </el-aside>
    <el-main>
      <router-view></router-view>
    </el-main>
  </el-container>
</template>
<script>
export default {
  data() {
    return {
      url: "",
      menuList: [
        {
          id: 1,
          name: "我的订单",
          path: "/user/order",
        },
        {
          id: 2,
          name: "基本信息",
          path: "/user/info",
        },
        {
          id: 3,
          name: "修改密码",
          path: "/user/password",
        },
      ],
    };
  },
};
</script>

<style scoped>
.el-container {
  border: 1px solid #e1e1e1;
  width: 1200px;
  margin: 0 auto;
}

.el-aside h1 {
  margin-left: 25%;
  font-size: 24px;
}
</style>
